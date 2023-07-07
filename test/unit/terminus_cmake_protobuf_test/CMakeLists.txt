#    File:    CMakeLists.txt
#    Author:  Marvin Smith
#    Date:    7/6/2023
#
#    Purpose:  Build the Protobuf test
#

#  Setup the test
execute_process(
    COMMAND conan install "${CMAKE_CURRENT_SOURCE_DIR}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

message( "${CMAKE_BINARY_DIR}")
include( "${CMAKE_BINARY_DIR}/conan_toolchain.cmake" )
set( CMAKE_FIND_PACKAGE_PREFER_CONFIG TRUE )

find_package( Protobuf REQUIRED )
find_package( gRPC CONFIG REQUIRED )

#  Run function under test
terminus_protobuf_generate( SOURCES HEADERS LIBS
    PROTO_PATH
        "${CMAKE_CURRENT_SOURCE_DIR}/proto"
    PROTO_FILES
        person.proto
        education/student.proto
        education/teacher.proto
        education/school.proto
    GRPC_FILES
        svc_directory.proto
)

#  Create target
set( TEST terminus_cmake_protobuf_test )

add_executable( ${TEST} main.cpp ${SOURCES} )

target_include_directories( ${TEST} PRIVATE ${CMAKE_CURRENT_BINARY_DIR} )

target_link_libraries( ${TEST} PRIVATE ${LIBS} )

#  Create test
add_test(
    NAME TerminusCMake.Protobuf.Generate
    COMMAND $<TARGET_FILE:${TEST}>
)