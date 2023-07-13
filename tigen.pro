QT += quick core

SOURCES += \
    main.cpp \
    src/AppOptions.cpp

resources.files += main.qml
resources.files += views/VMain.qml
resources.files += components/XRectangle.qml
resources.files += components/XBlock.qml
resources.files += components/XButton.qml
resources.files += components/XSearch.qml
resources.files += components/XPlant.qml
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
    components/XBlock.qml \
    components/XButton.qml \
    components/XPlant \
    components/XRectangle.qml \
    components/XPlant.qml \
    views/VMain.qml \
    wMain.qml

HEADERS += \
    include/AppOptions.h

INCLUDEPATH += ./include
