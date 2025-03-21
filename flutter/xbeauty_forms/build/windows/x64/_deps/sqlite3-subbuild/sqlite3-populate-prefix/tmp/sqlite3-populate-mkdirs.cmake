# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-src"
  "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-build"
  "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-subbuild/sqlite3-populate-prefix"
  "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-subbuild/sqlite3-populate-prefix/tmp"
  "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-subbuild/sqlite3-populate-prefix/src/sqlite3-populate-stamp"
  "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-subbuild/sqlite3-populate-prefix/src"
  "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-subbuild/sqlite3-populate-prefix/src/sqlite3-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-subbuild/sqlite3-populate-prefix/src/sqlite3-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/Andrew/projects/flutter/beautyforms/build/windows/x64/_deps/sqlite3-subbuild/sqlite3-populate-prefix/src/sqlite3-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
