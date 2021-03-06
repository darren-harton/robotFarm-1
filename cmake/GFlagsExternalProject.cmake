#[[ Cmake guard. ]]
if(TARGET GFlagsExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_GFLAGS_URL
    "https://github.com/gflags/gflags/archive/v2.2.2.zip"
    CACHE STRING
    "URL of the Google Flags source archive")

externalproject_add(GFlagsExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/gflags
                    URL ${ROBOT_FARM_GFLAGS_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                    -DBUILD_SHARED_LIBS:BOOL=ON
                    -DBUILD_STATIC_LIBS:BOOL=ON
                    -DBUILD_gflags_LIB:BOOL=ON
                    -DBUILD_gflags_nothreads_LIB:BOOL=ON
                    -DINSTALL_SHARED_LIBS:BOOL=ON
                    -DINSTALL_STATIC_LIBS:BOOL=ON)
