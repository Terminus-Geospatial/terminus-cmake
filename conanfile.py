from conan import ConanFile
from conan.tools.cmake import CMake, CMakeToolchain, CMakeDeps

class CMakeConan(ConanFile):

    name = "terminus_cmake"
    version = "1.0.2"

    license = "Terminus Proprietary"
    author = "Marvin Smith <marvin_smith1@me.com>"
    url = "https://bitbucket.org/msmith81886/terminus-cmake/src/main/"
    description = "Collection of CMake functions and macros for use in Terminus CMake Projects"
    topics = ("terminus", "cmake", "build")

    options = { "with_tests": [True, False] }

    default_options = { "with_tests": False }

    settings = "os", "compiler", "build_type", "arch"

    def _configure_cmake(self):
        cmake = CMake(self)
        cmake.configure()
        return cmake

    def generate(self):
        tc = CMakeToolchain(self)
        tc.variables["VERSION_FROM_CONANFILE"] = self.version
        tc.variables["NAME_FROM_CONANFILE"] = self.name
        tc.variables["DESC_FROM_CONANFILE"] = self.description
        tc.variables["URL_FROM_CONANFILE"] = self.url

        tc.variables["TERMINUS_CMAKE_ENABLE_TESTS"] = self.options.with_tests
        tc.generate()

        deps = CMakeDeps(self)
        deps.generate()

    def build(self):
        cmake = self._configure_cmake()
        cmake.build()

    def package(self):
        cmake = self._configure_cmake()
        cmake.install()

    def package_info(self):
        self.cpp_info.builddirs = ["cmake"]

    def package_id(self):
        self.info.clear()
