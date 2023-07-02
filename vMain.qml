import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "components"


Window {
    id: vMain
    width: 640
    height: 480
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
    title: qsTr("tigen")
    color: 'transparent'
    modality: Qt.WindowModal

    minimumWidth: 640
    minimumHeight: 480


    MouseArea {
        property int resizeEdge: 0

        anchors.fill: parent
        hoverEnabled: true


        DragHandler {
            onActiveChanged: {
                if (active && vMain.visibility != Window.Maximized) {
                    vMain.startSystemMove()
                }
            }
        }

        onPositionChanged: {
            resizeMain(mouseX, mouseY)
        }

        onPressed: {
            resizeMain(mouseX, mouseY)

            if (resizeEdge !== 0) {
                vMain.startSystemResize(resizeEdge)
            }
        }

        cursorShape: {
            if (resizeEdge === Qt.LeftEdge || resizeEdge === Qt.RightEdge) {
                return Qt.SizeHorCursor
            }
            else if (resizeEdge === Qt.TopEdge || resizeEdge === Qt.BottomEdge) {
                return Qt.SizeVerCursor
            }
            else if (resizeEdge === (Qt.LeftEdge | Qt.TopEdge) || resizeEdge === (Qt.RightEdge | Qt.BottomEdge)) {
                return Qt.SizeFDiagCursor
            }
            else if (resizeEdge === (Qt.LeftEdge | Qt.BottomEdge) || resizeEdge === (Qt.RightEdge | Qt.TopEdge)) {
                return Qt.SizeBDiagCursor
            }
        }

        function resizeMain (x, y) {
            resizeEdge = 0;

            if (x < 5) {
                resizeEdge |= Qt.LeftEdge
            }

            if (x > vMain.width - 5) {
                resizeEdge |= Qt.RightEdge
            }

            if (y < 5) {
                resizeEdge |= Qt.TopEdge
            }

            if (y > vMain.height - 5) {
                resizeEdge |= Qt.BottomEdge
            }
        }
    }

    Rectangle {
        id: rectMain
        color: "#1E1E1E"
        opacity: 1
        radius: 5
        anchors.fill: parent

        XRectangle {
            id: leftBar
            width: 55
            height: parent.height
            color: '#333333'
            cornersRadius: [5, 0, 0, 5]
        }

        // XRectangle {
        //     id: topBar
        //     width: parent.width
        //     height: 37
        //     color: '#323233'
        //     cornersRadius: [5, 5, 0, 0]
        // }

        XButton {
            id: btnExit
            width: 37
            height: 37
            anchors.top: parent.top
            anchors.right: parent.right
            cornersRadius: [0, 5, 0, 0]
            color: parent.color

            source: "qrc:/img/resources/Close.png"

            onEntered: {
                btnExit.color = 'red'
            }

            onClicked: {
                Qt.quit()
            }

            onExited: {
                btnExit.color = '#1E1E1E'
            }
        }

        XButton {
            id: btnMinMax
            width: 37
            height: 37
            anchors.top: parent.top
            anchors.right: btnExit.left
            cornersRadius: [0, 0, 0, 0]
            color: parent.color

            source: "qrc:/img/resources/icon-kfckfc.png"

            onClicked: {
                if (vMain.visibility == Window.Maximized) {
                    vMain.visibility = Window.Windowed
                } else {
                    vMain.visibility = Window.Maximized
                }
            }

            onEntered: {
                btnMinMax.color = 'red'
            }

            onExited: {
                btnMinMax.color = '#1E1E1E'
            }
        }
    }
}
