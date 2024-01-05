cmake_minimum_required(VERSION 3.16)

project(EmojiPickerDemo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

set(QML_IMPORT_PATH ${CMAKE_BINARY_DIR}/qml CACHE STRING "" FORCE)

if(QT_KNOWN_POLICY_QTP0001)
    qt_policy(SET QTP0001 NEW)
endif()

qt_add_executable(appEmojiPickerDemo
    main.cpp
)

qt_add_qml_module(appEmojiPickerDemo
    URI EmojiPickerDemo
    VERSION 1.0
    QML_FILES Main.qml
)

add_subdirectory(third_parties/qml-emoji-picker)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appEmojiPickerDemo PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appEmojiPickerDemo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appEmojiPickerDemo
    PRIVATE Qt6::Quick
)

target_link_libraries(appEmojiPickerDemo PRIVATE EmojiPickerplugin)

include(GNUInstallDirs)
install(TARGETS appEmojiPickerDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
