#    File:    terminus_cmake.cmake
#    Author:  Marvin Smith
#    Date:    7/5/2023
#
#    Purpose:  Tie in all utility scripts
cmake_minimum_required( VERSION 3.15 FATAL_ERROR )

message( STATUS "Loading Terminus CMake - All" )

include( "${CMAKE_CURRENT_LIST_DIR}/terminus_cmake_colors.cmake" )
include( "${CMAKE_CURRENT_LIST_DIR}/terminus_cmake_coverage.cmake" )
include( "${CMAKE_CURRENT_LIST_DIR}/terminus_cmake_util.cmake" )
include( "${CMAKE_CURRENT_LIST_DIR}/terminus_cmake_project.cmake" )