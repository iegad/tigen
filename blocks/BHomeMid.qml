import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"


Rectangle {
    Rectangle {
        id: searchBorder
        height: 65
        width: parent.width
        anchors.left: leftBar.right
        anchors.top: parent.top
        color: parent.color

        Rectangle {
            height: 30
            width: parent.width - 20
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
                width: parent.width - 25
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
}
