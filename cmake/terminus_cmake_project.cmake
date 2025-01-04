#
############################# INTELLECTUAL PROPERTY RIGHTS #############################
##                                                                                    ##
##                           Copyright (c) 2024 Terminus LLC                          ##
##                                All Rights Reserved.                                ##
##                                                                                    ##
##          Use of this source code is governed by LICENSE in the repo root.          ##
##                                                                                    ##
############################# INTELLECTUAL PROPERTY RIGHTS #############################
#
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
set( TERMINUS_CXX_WARNING_FLAGS -Wall -Wextra )

#  Terminus CXX Flags
set( TERMINUS_CXX_FLAGS ${TERMINUS_CXX_WARNING_FLAGS} )

