import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"


XBlock {
    id: vHome

    property int topHeight: 32

    cornersRadius: [5, 5, 5, 5]
    anchors.fill: parent

    // 窗体控制
    MouseArea {
        property int edges: 0

        anchors.fill: parent
        hoverEnabled: true

        drag.target: vHome
        drag.onActiveChanged: {
            if (active && mouseY <= vHome.topHeight && mouseY >= 0 && win.visibility !== Window.Maximized) {
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
            if (mouseY <= vHome.topHeight && mouseY >= 0) {
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
            tips: qsTr('消息')

            onClicked: {
                btnMsg.imageSource = 'qrc:/img/resources/msga.png'
                btnGroup.imageSource = 'qrc:/img/resources/group.png'
                btnContract.imageSource = 'qrc:/img/resources/contract.png'
                btnOrg.imageSource = 'qrc:/img/resources/org.png'
                btnMission.imageSource = 'qrc:/img/resources/mission.png'
                btnSetting.imageSource = 'qrc:/img/resources/setting.png'
            }
        }

        // 群组
        XButton {
            id: btnGroup
            anchors.top: btnMsg.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 7
            width: 39
            height: 39
            color: parent.color
            imageSource: 'qrc:/img/resources/group.png'
            tips: qsTr('群组')

            onClicked: {
                btnMsg.imageSource = 'qrc:/img/resources/msg.png'
                btnGroup.imageSource = 'qrc:/img/resources/groupa.png'
                btnContract.imageSource = 'qrc:/img/resources/contract.png'
                btnOrg.imageSource = 'qrc:/img/resources/org.png'
                btnMission.imageSource = 'qrc:/img/resources/mission.png'
                btnSetting.imageSource = 'qrc:/img/resources/setting.png'
            }
        }

        // 联系人
        XButton {
            id: btnContract
            anchors.top: btnGroup.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 7
            width: 39
            height: 39
            color: parent.color
            imageSource: 'qrc:/img/resources/contract.png'
            tips: qsTr('联系人')

            onClicked: {
                btnMsg.imageSource = 'qrc:/img/resources/msg.png'
                btnGroup.imageSource = 'qrc:/img/resources/group.png'
                btnContract.imageSource = 'qrc:/img/resources/contracta.png'
                btnOrg.imageSource = 'qrc:/img/resources/org.png'
                btnMission.imageSource = 'qrc:/img/resources/mission.png'
                btnSetting.imageSource = 'qrc:/img/resources/setting.png'
            }
        }

        // 组织架构
        XButton {
            id: btnOrg
            anchors.top: btnContract.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 7
            width: 39
            height: 39
            color: parent.color
            imageSource: 'qrc:/img/resources/org.png'
            tips: qsTr('组织')

            onClicked: {
                btnMsg.imageSource = 'qrc:/img/resources/msg.png'
                btnGroup.imageSource = 'qrc:/img/resources/group.png'
                btnContract.imageSource = 'qrc:/img/resources/contract.png'
                btnOrg.imageSource = 'qrc:/img/resources/orga.png'
                btnMission.imageSource = 'qrc:/img/resources/mission.png'
                btnSetting.imageSource = 'qrc:/img/resources/setting.png'
            }
        }

        // 任务
        XButton {
            id: btnMission
            anchors.top: btnOrg.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 7
            width: 39
            height: 39
            color: parent.color
            imageSource: 'qrc:/img/resources/mission.png'
            tips: qsTr('任务')

            onClicked: {
                btnMsg.imageSource = 'qrc:/img/resources/msg.png'
                btnGroup.imageSource = 'qrc:/img/resources/group.png'
                btnContract.imageSource = 'qrc:/img/resources/contract.png'
                btnOrg.imageSource = 'qrc:/img/resources/org.png'
                btnMission.imageSource = 'qrc:/img/resources/missiona.png'
                btnSetting.imageSource = 'qrc:/img/resources/setting.png'
            }
        }

        // 设置
        XButton {
            id: btnSetting
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 7
            width: 39
            height: 39
            color: parent.color
            imageSource: 'qrc:/img/resources/setting.png'
            tips: qsTr('设置')

            onClicked: {
                btnMsg.imageSource = 'qrc:/img/resources/msg.png'
                btnGroup.imageSource = 'qrc:/img/resources/group.png'
                btnContract.imageSource = 'qrc:/img/resources/contract.png'
                btnOrg.imageSource = 'qrc:/img/resources/org.png'
                btnMission.imageSource = 'qrc:/img/resources/mission.png'
                btnSetting.imageSource = 'qrc:/img/resources/settinga.png'
            }
        }
    }

    // 中间列表
    XBlock {
        id: bMidPlant
        width: 256
        height: parent.height - vHome.topHeight + 10
        anchors.top: parent.top
        anchors.topMargin: vHome.topHeight - 10
        anchors.left: bLeftBar.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        color: 'transparent'

        // 多功能搜索栏
        XSearch {
            id: txtSearch
            width: parent.width - 20
            height: 30
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: '#E3E3E3'

            onClick: {}
        }

        // Plant列表
        Rectangle {
            id: rcPlant
            height: bMidPlant.height - txtSearch.height - 20
            anchors.top: txtSearch.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            color: parent.color

            Component {
                id: plantDelegate
                XPlant {
                    imageSource: 'qrc:/img/resources/avatar.jpg'
                    width: lvPlant.width
                    height: 65
                    title: '地地地地地地地地'
                    backgorundColor: '#636363'
                    lastTime: '2023-01-01 12:23:55'
                    lastMsg: '12345678901234567890123456789012345678901234567890'
                }
            }

            ListView {
                id: lvPlant
                anchors.fill: parent
                model: 50
                delegate: plantDelegate
                clip: true
                boundsBehavior: Flickable.StopAtBounds

                ScrollBar.vertical: ScrollBar {
                    id: scrollBar
                    width: 6
                    z: 10
                    opacity: 1
                    policy: ScrollBar.AsNeeded

                    background: Rectangle {
                        id: bg
                        color: '#636363'
                    }
                }
            }
        }
    }

    // 右侧视图
    XBlock {
        id: bRightView

        anchors.top: parent.top
        anchors.topMargin: 32
        anchors.left: bMidPlant.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 5
        width: parent.width - bMidPlant.width - bLeftBar.width - 5
        height: parent.height

        VMsg {
            width: parent.width
            height: parent.height
            anchors.fill: parent
            dlgID: 'Aizen'
            color: vHome.color
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
