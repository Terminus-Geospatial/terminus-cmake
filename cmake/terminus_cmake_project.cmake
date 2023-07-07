#    File:    terminus_cmake_project.cmake
#    Author:  Marvin Smith
#    Date:    7/5/2023
#
#    Purpose:  Create CMake settings automatically
cmake_minimum_required( VERSION 3.15 FATAL_ERROR )

message( STATUS "Loading Terminus CMake - Project Init" )

#  Terminus C++ Warning Flags
#
#  General C++ Warning Flags
set( TERMINUS_CXX_WARNING_FLAGS -Wall -Wextra -pendantic
      -Wcast-align -Wcast-qual -Wctor-dtor-policy )

#  Terminus CXX Flags
set( TERMINUS_CXX_FLAGS ${TERMINUS_CXX_WARNING_FLAGS} )

