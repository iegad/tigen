import QtQuick 2.15
import Qt.labs.platform 1.1
import "views"


Window {
    id: wMain
    width: 640
    height: 480
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
    color: 'transparent'

    minimumWidth: 640
    minimumHeight: 480

    // 托盘
    SystemTrayIcon {
        id: trayIcon
        tooltip: 'tigen'
        visible: true
        icon.source: 'qrc:/img/resources/Fire.png'

        menu: Menu {
            MenuItem {
                text: "Setting"
                onTriggered: {

                }
            }

            MenuItem {
                text: "About"
                onTriggered: {

                }
            }

            MenuItem {
                text: "Quit"
                onTriggered: {
                    Qt.quit()
                }
            }
        }

        onActivated: {
            wMain.show()
            wMain.raise()
            wMain.requestActivate()
        }
    }

    // 主窗体
    VMain {
        id: vMain
        win: wMain
        anchors.fill: parent
        color: $appOptions.mainColor
    }
}
