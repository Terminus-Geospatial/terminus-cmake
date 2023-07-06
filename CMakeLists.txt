#    File:    CMakeLists.txt
#    Author:  Marvin Smith
#    Date:    7/5/2023
#

cmake_minimum_required( VERSION 3.0 FATAL_ERROR )

project( ${NAME_FROM_CONANFILE}
            VERSION ${VERSION_FROM_CONANFILE}
            HOMEPAGE_URL ${URL_FROM_CONANFILE}
            DESCRIPTION ${DESC_FROM_CONANFILE} )

set( CMAKE_CXX_STANDARD 17 )
set( CMAKE_CXX_STANDARD_REQUIRED TRUE )

include( "cmake/terminus_cmake.cmake" )

enable_testing()
add_subdirectory( test/unit )

install( DIRECTORY cmake/ DESTINATION cmake )
