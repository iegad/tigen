import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: plant

    property string title: ''
    property color titleColor: '#FFFFFF'
    property color backgorundColor: '#FFFFFF'
    property string imageSource: ''
    property color imageBorderColor: '#E3E3E3'
    property color hoveredColor: '#BCBCBC'
    property string lastTime: ''
    property string lastMsg: ''

    color: backgorundColor

    XRectangle {
        id: imgBorder
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 5
        height: plant.height
        width: height
        cornersRadius: [3, 3, 3, 3]
        color: imageBorderColor

        Image {
            id: img

            source: plant.imageSource
            anchors.top: parent.top
            anchors.topMargin: 3
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
            anchors.left: parent.left
            anchors.leftMargin: 3
            anchors.right: parent.right
            anchors.rightMargin: 3
        }
    }

    Text {
        id: title
        text: plant.title
        font.pixelSize: 14
        color: plant.titleColor
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.left: imgBorder.right
        anchors.leftMargin: 5
    }

    Text {
        id: lastTime
        text: plant.lastTime
        font.pixelSize: title.font.pixelSize - 4
        color: plant.titleColor
        anchors.top: title.bottom
        anchors.left: imgBorder.right
        anchors.leftMargin: 5
    }

    Text {
        id: lastMsg
        text: plant.lastMsg
        font.pixelSize: lastTime.font.pixelSize
        color: '#CCCCCC'
        anchors.top: lastTime.bottom
        anchors.left: imgBorder.right
        anchors.leftMargin: 5
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: parent.color = hoveredColor
        onExited: parent.color = backgorundColor
    }
}
