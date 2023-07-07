#    File:    CMakeLists.txt
#    Author:  Marvin Smith
#    Date:    7/5/2023


message( "\n-- ... Testing color module..." )
message( STATUS "${YELLOW} This message should be yellow!${COLOR_RESET}" )
message( STATUS "${YELLOW}${COLOR_BOLD} This message should be bold yellow! ${COLOR_RESET}" )
message( STATUS "This message should not be yellow." )

add_subdirectory( terminus_cmake_protobuf_test )