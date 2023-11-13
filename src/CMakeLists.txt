cmake_minimum_required(VERSION 3.18)
cmake_policy(VERSION 3.18)

project(isothermal1d
        LANGUAGES CXX)

find_package(bout++
             REQUIRED)

add_executable(isothermal1d
               isothermal1d.cxx)

target_link_libraries(isothermal1d
                      PRIVATE bout++::bout++)
