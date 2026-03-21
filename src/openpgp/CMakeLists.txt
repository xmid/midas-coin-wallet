file(GLOB_RECURSE SOURCES *.cpp)
file(GLOB_RECURSE HEADERS *.h)

find_library(GCRYPT_LIBRARY 
  NAMES gcrypt libgcrypt
  PATHS
    /mingw64/lib
    ${MINGW_PREFIX}/lib
    ${CMAKE_FIND_ROOT_PATH}/lib
    ${CMAKE_FIND_ROOT_PATH}/mingw64/lib
  REQUIRED
)
find_path(GCRYPT_INCLUDE_DIR gcrypt.h 
  PATHS
    /mingw64/include
    ${MINGW_PREFIX}/include
    ${CMAKE_FIND_ROOT_PATH}/include
  REQUIRED
)

find_library(GPG_ERROR_LIBRARY 
  NAMES gpg-error libgpg-error
  PATHS
    /mingw64/lib
    ${MINGW_PREFIX}/lib
    ${CMAKE_FIND_ROOT_PATH}/lib
    ${CMAKE_FIND_ROOT_PATH}/mingw64/lib
  REQUIRED
)

add_library(openpgp
  ${SOURCES}
  ${HEADERS})

set_property(TARGET openpgp PROPERTY CXX_STANDARD 17)
set_property(TARGET openpgp PROPERTY CXX_STANDARD_REQUIRED ON)

target_include_directories(openpgp
  PUBLIC
    ${CMAKE_SOURCE_DIR}/midas/contrib/epee/include
    ${GCRYPT_INCLUDE_DIR})

target_link_libraries(openpgp
  PUBLIC
    ${GCRYPT_LIBRARY}
    ${GPG_ERROR_LIBRARY})
