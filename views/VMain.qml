import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"


XBlock {
    property int offset: 32


    id: vHome
    opacity: 1
    cornersRadius: [5, 5, 5, 5]
    anchors.fill: parent


    MouseArea {
        property int edges: 0

        anchors.fill: parent
        hoverEnabled: true

        drag.target: vHome
        drag.onActiveChanged: {
            if (active && mouseY <= vHome.offset && mouseY >= 0 && win.visibility !== Window.Maximized) {
                win.startSystemMove()
            }
        }

        onPositionChanged: setEdges(mouseX, mouseY)

        onPressed: {
            setEdges(mouseX, mouseY)
            if (edges && containsMouse) {
                win.startSystemResize(edges)
            }
        }

        onDoubleClicked: {
            if (mouseY <= vHome.offset && mouseY >= 0) {
                if (win.visibility == Window.Maximized) {
                    win.visibility = Window.Windowed
                } else {
                    win.visibility = Window.Maximized
                }
            }
        }

        cursorShape: {
            if (edges === Qt.LeftEdge || edges === Qt.RightEdge)
                return Qt.SizeHorCursor
            else if (edges === Qt.TopEdge || edges === Qt.BottomEdge)
                return Qt.SizeVerCursor
            else if (edges === (Qt.LeftEdge | Qt.TopEdge) || edges === (Qt.RightEdge | Qt.BottomEdge))
                return Qt.SizeFDiagCursor
            else if (edges === (Qt.LeftEdge | Qt.BottomEdge) || edges === (Qt.RightEdge | Qt.TopEdge))
                return Qt.SizeBDiagCursor
            return Qt.ArrowCursor
        }

        function setEdges (x, y) {
            edges = 0

            if (x < 5) edges |= Qt.LeftEdge
            if (x > width - 5) edges |= Qt.RightEdge
            if (y < 5) edges |= Qt.TopEdge
            if (y > height - 5) edges |= Qt.BottomEdge
        }
    }

    // 左侧工具栏
    XBlock {
        id: bLeftBar
        width: 55
        height: parent.height
        cornersRadius: [5, 0, 0, 5]
        color: $appOptions.leftBarColor
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom


        // 头像按钮
        XButton {
            id: btnAvatar
            imageSource: $appOptions.avatarSource
            width: 45
            height: 45
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            imageHeight: 37
            imageWidth: 37
            color: '#E3E3E3'
            cornersRadius: [5, 5, 5, 5]
        }

        // 消息
        XButton {
            id: btnMsg
            anchors.top: btnAvatar.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 7
            width: 39
            height: 39
            color: parent.color
            imageSource: 'qrc:/img/resources/msg.png'

            onClicked: {
                imageSource = 'qrc:/img/resources/msga.png'
                btnContract.imageSource = 'qrc:/img/resources/group.png'
            }
        }

        // 联系人
        XButton {
            id: btnContract
            anchors.top: btnMsg.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 7
            width: 39
            height: 39
            color: parent.color
            imageSource: 'qrc:/img/resources/group.png'

            onClicked: {
                imageSource = 'qrc:/img/resources/groupa.png'
                btnMsg.imageSource = 'qrc:/img/resources/msg.png'
            }
        }
    }


    // 最小化托盘按钮
    XButton {
        id: btnExit
        width: 32
        height: 32
        anchors.top: parent.top
        anchors.right: parent.right
        cornersRadius: [0, 5, 0, 0]
        color: parent.color

        imageSource: 'qrc:/img/resources/Close.png'

        onEntered: btnExit.color = 'red'
        onClicked: win.hide()
        onExited: btnExit.color = parent.color
    }


    // 最大化/还原按钮
    XButton {
        id: btnMinMax
        width: 32
        height: 32
        anchors.top: parent.top
        anchors.right: btnExit.left
        cornersRadius: [0, 0, 0, 0]
        color: parent.color

        imageSource: "qrc:/img/resources/icon-kfckfc.png"

        onClicked: {
            if (win.visibility == Window.Maximized) {
                win.visibility = Window.Windowed
            } else {
                win.visibility = Window.Maximized
            }
        }

        onEntered: btnMinMax.color = 'red'
        onExited: btnMinMax.color = parent.color
    }
}