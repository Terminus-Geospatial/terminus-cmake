Terminus CMake Build System Utilities
=====================================

This repository contains helper CMake scripts for configuring a C++ project.  In particular, it works
well with the utilities packaged in the [`terminus-setup`](https://github.com/Terminus-Geospatial/terminus-setup) repository.

Special Notes
-------------

### Raspberry Pi

There is currently an issue with the GRPC/Protobuf test which requires
us to skip the tests. 

    conan-build.sh -o 'with_tests=False' -c