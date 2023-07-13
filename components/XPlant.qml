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
        text: "Title"
        font.pixelSize: 16
        color: plant.titleColor
        height: parent.width * 0.7
        anchors.top: parent.top
        anchors.topMargin: 8
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
