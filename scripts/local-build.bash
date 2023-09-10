#!/usr/bin/env bash
#
#    File:    local-build.bash
#    Author:  Marvin Smith
#    Date:    7/21/2023
#

set -e

function usage()
{
    echo "usage: $(basename $0) [-h,--help]"
}

function details()
{
    echo 'Builds the project using local packages rather than Conan.'
}

function show_help()
{
    echo 'Terminus Integrated Build Process - Build Script'
    echo
    usage
    echo
    details
    echo
}

#  Bring utility scripts within scope
dir_scripts="$(cd "$(dirname "$0")" && pwd)"
source "$dir_scripts/log.bash"

#  Configurable Options
build_type='Debug'
clean_build='false'
source_root=''
build_root=''
force_clean='false'
deploy_location="${HOME}/terminus"
options=()

while [ $# -gt 0 ]; do

    case $1 in

        -h | --help)
            show_help
            exit 0
            ;;

        -r | --release)
            build_type='Release'
            ;;

        -c | --clean)
            clean_build='true'
            ;;

        -f | --force)
            force_clean='true'
            ;;

        -s | --source-root)
            shift
            source_root="$(cd "$1" && pwd)"
            ;;
        -b | --build-root)
            shift
            mkdir -p "$1"
            build_root="$(cd "$1" && pwd)"
            ;;

         -o | --option)
            shift
            options+=("-o $1")
            ;;
        -x | --no-deploy)
            no_deploy='true'
            ;;

        *)
            log_error "Unrecognized option: '$1'"
            exit 1
            ;;
    esac
    shift
done

#--------------------------------#
#-        Prep Build Root       -#
#--------------------------------#
if [ -z "${source_root}" ]; then
    source_root="$(pwd)"
fi

if [ -z "${build_root}" ]; then
    if [ "$source_root" == "$(pwd)" ]; then
        build_root="$(pwd)/build"
        mkdir -p "${build_root}"
    else
        build_root="$(pwd)"
    fi
fi

log_info "Source Root: ${source_root}"
log_info "Build Root:  ${build_root}"

#------------------------------------------#
#-       Check if we need to clean        -#
#------------------------------------------#
if [ "${clean_build}" == 'true' ]; then
    log_info "Cleaning build root"
    if [ "$build_root" == "$HOME" ]; then
        log_error "Will not clean build root as it is your home directory."
        exit 1
    fi
    if [ "${build_root}" != "$(pwd)" ]; then
        rm -rf "${build_root}"/*
    else
        choice='y'
        if [ "$force_clean" == 'false' ]; then
            read -p "wrn: The current directory is the build root.  Are you sure you want to clean it? [y/N] " choice
            choice="${choice:-n}"
        fi
        if [ "$choice" == 'y' ] || [ "$choice" == 'Y' ]; then
            rm -rf *
        else
            log_info "Stopping build"
            exit 1
        fi
    fi
fi

#-----------------------------------------------#
#-        Define the CMake Command to Use      -#
#-----------------------------------------------#
export cmd_cmake="${CONAN_CMAKE_PROGRAM:-cmake}"
if [ -z "$(command -v ${cmd_cmake})" ]; then
    log_error "CMake command '$cmd_cmake' not found."
    log_error ''
    log_error 'CMake is required for the Integrated Build Process, but may not be installed.'
    log_error 'If CMake is installed, set the CONAN_CMAKE_PROGRAM environment variable to'
    log_error 'either (1) the full path of the CMake executable or (2) the name of the CMake'
    log_error 'program discoverable on the ${PATH}.'
    exit 1
fi
log_info "Using CMake $("${cmd_cmake}" --version | head -1 | awk '{print $3}' )"

#----------------------------------------------#
#-            Run the CMake Command           -#
#----------------------------------------------#
pushd ${build_root}

cmake -DCMAKE_BUILD_TYPE=${build_type} ..


