Terminus Build System Scripts
=============================

Setup
-----

Add scripts directory to your `~/.bashrc`. 

    echo ". ${PWD}/scripts" >> "~/.bashrc"

Special Notes
-------------

### Raspberry Pi

There is currently an issue with the GRPC/Protobuf test which requires
us to skip the tests. 

    conan-build.sh -o 'with_tests=False' -c