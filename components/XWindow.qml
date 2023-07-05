import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    property Window win
    property var mX
    property var mY

    id: rectMain
    color: "#1E1E1E"
    opacity: 1
    radius: 5
    anchors.fill: parent

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        property int resizeEdge: 0


        DragHandler {
            id: dragWin
            onActiveChanged: {
                if (rectMain.mX >= 70 && rectMain.mX <= 300 && rectMain.mY <= 50 && rectMain.mY >= 20) {
                    return;
                }

                if (active && win.visibility != Window.Maximized) {
                    console.log(rectMain.mX, " ", rectMain.mY)
                    win.startSystemMove()
                }
            }
        }

        onPositionChanged: {
            resizeMain(mouseX, mouseY)
        }

        onPressed: {
            rectMain.mX = mouseX;
            rectMain.mY = mouseY;
            resizeMain(mouseX, mouseY)
            if (resizeEdge !== 0) {
                win.startSystemResize(resizeEdge)
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

            if (x > win.width - 5) {
                resizeEdge |= Qt.RightEdge
            }

            if (y < 5) {
                resizeEdge |= Qt.TopEdge
            }

            if (y > win.height - 5) {
                resizeEdge |= Qt.BottomEdge
            }
        }
    }

    XLeftBar {
        id: leftBar
        avatarSource: "qrc:/img/resources/avatar.jpg"
        width: 55
        height: parent.height
        color: '#333333'
        cornersRadius: [5, 0, 0, 5]

        onClick: {
            console.log(btnIndex);
        }
    }

    Rectangle {
        id: searchBorder
        height: 65
        width: 240
        anchors.left: leftBar.right
        anchors.top: parent.top
        color: parent.color

        Rectangle {
            height: 30
            width: 220
            anchors.centerIn: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            radius: 5

            Image {
                id: img
                width: 16
                height: 16
                source: "qrc:/img/resources/Search.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
            }

            Rectangle {
                anchors.left: img.right
                height: 18
                width: 180
                anchors.verticalCenter: parent.verticalCenter

                TextInput {
                    id: txtSearch
                    anchors.fill: parent
                    leftPadding: 5
                    anchors.verticalCenter: parent.verticalCenter

                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            parent.focus = true
                            var pos = mapToItem(null, mouseX, mouseY)
                            rectMain.mX = pos.x
                            rectMain.mY = pos.y
                        }
                    }
                }
            }
        }
    }

    Component {
        id: blockDelegate
        Rectangle {
            width: 233
            height: 65
            border.color: 'red'

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Hello world")
                }
            }
        }
    }

    // 列表
    Rectangle {
        id: blockListBorder
        anchors.top: searchBorder.bottom
        anchors.left: leftBar.right
        anchors.bottom: parent.bottom
        width: 240
        color: '#252526'

        ListView {
            id: blockList
            anchors.fill: parent
            delegate: blockDelegate
            model: 50
            snapMode: ListView.NoSnap
            clip: true

            ScrollBar.vertical: ScrollBar {
                id: scrollBar
                policy: ScrollBar.AlwaysOn
                width: 7
                background: Rectangle {
                    id: scBack
                    color: '#DDDDDD'
                    opacity: 0.5
                }
            }
        }
    }

    // 内容窗口
    XRectangle {
        id: contentMain
        anchors.top: parent.top
        anchors.left: blockListBorder.right
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        cornersRadius: [0, 5, 5, 0]
        color: '#1E1E1E'
    }

    // 最小化托盘按钮
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
            win.hide()
        }

        onExited: {
            btnExit.color = '#1E1E1E'
        }
    }

    // 最大化/还原按钮
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
            if (win.visibility == Window.Maximized) {
                win.visibility = Window.Windowed
            } else {
                win.visibility = Window.Maximized
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
