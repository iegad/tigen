QT += quick core

SOURCES += \
    vMain.cpp

resources.files += vMain.qml
resources.files += components/XRectangle.qml
resources.files += components/XButton.qml
resources.files += components/XImgButton.qml
resources.files += components/XLeftBar.qml
resources.files += components/XWindow.qml
resources.prefix = /$${TARGET}
RESOURCES += resources \
    img.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    components/XButton.qml \
    components/XImgButton.qml \
    components/XLeftBar.qml \
    components/XRectangle.qml \
    components/XSearch.qml \
    components/XWindow.qml \
    vMain.qml

HEADERS +=
