QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    dlg_login.cpp \
    main.cpp \
    wid_classic.cpp \
    wid_qrcode.cpp \
    widget.cpp

HEADERS += \
    dlg_login.h \
    wid_classic.h \
    wid_qrcode.h \
    widget.h

FORMS += \
    dlg_login.ui \
    wid_classic.ui \
    wid_qrcode.ui \
    widget.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../xq/lib/release/ -lxq
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../xq/lib/debug/ -lxq
else:unix: LIBS += -L$$PWD/../xq/lib/ -lxq

INCLUDEPATH += D:/iegad/xq/include
DEPENDPATH += D:/iegad/xq/include

RESOURCES += \
    Resources.qrc
