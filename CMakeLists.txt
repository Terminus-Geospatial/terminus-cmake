#    File:    CMakeLists.txt
#    Author:  Marvin Smith
#    Date:    7/5/2023
#

cmake_minimum_required( VERSION 3.0 FATAL_ERROR )

project( ${CONAN_PKG_NAME}
            VERSION ${CONAN_PKG_VERSION}
            HOMEPAGE_URL ${CONAN_PKG_URL}
            DESCRIPTION ${CONAN_PKG_DESCRIPTION}
            LANGUAGES CXX )

set( CMAKE_CXX_STANDARD 20 )
set( CMAKE_CXX_STANDARD_REQUIRED TRUE )

include( "cmake/terminus_cmake.cmake" )

enable_testing()
add_subdirectory( test/unit )

install( DIRECTORY cmake/ DESTINATION cmake )
