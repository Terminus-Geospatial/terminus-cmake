from conan import ConanFile
from conan.tools.cmake import CMake

class CMakeConan(ConanFile):

    name = "terminus_cmake"
    version = "0.0.1"

    license = "Terminus Proprietary"
    author = "Marvin Smith <marvin_smith1@me.com>"
    url = "https://bitbucket.org/msmith81886/terminus-cmake/src/main/"
    description = "Collection of CMake functions and macros for use in Terminus CMake Projects"
    topics = ("terminus", "cmake", "build")

    def _configure_cmake(self):
        cmake = CMake(self)
        cmake.definitions["VERSION_FROM_CONANFILE"] = self.version
        cmake.definitions["NAME_FROM_CONANFILE"] = self.name
        cmake.definitions["DESC_FROM_CONANFILE"] = self.description
        cmake.definitions["URL_FROM_CONANFILE"] = self.url
        cmake.configure()
        return cmake

    def build(self):
        cmake = self._configure_cmake()
        cmake.build()

    def package(self):
        cmake = self._configure_cmake()
        cmake.install()

    def package_info(self):
        self.cpp_info.builddirs = ["cmake"]
        
