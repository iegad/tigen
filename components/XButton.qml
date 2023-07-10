import QtQuick 2.15
import QtQuick.Controls 2.15


XRectangle {
    id: xButton
    property string imageSource: ''
    property int imageHeight: xButton.height / 2
    property int imageWidth: xButton.width / 2
    property string tips: ''


    signal clicked()
    signal pressed()
    signal release()
    signal entered()
    signal exited()


    Image {
        id: img
        width: xButton.imageWidth
        height: xButton.imageHeight
        source: xButton.imageSource
        anchors.centerIn: parent
    }

    ToolTip {
        id: tip
        text: xButton.tips
        timeout: 2000
        delay: 1000
        visible: xButton.tips ? mouseArea.containsMouse : false
    }


    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent

        onClicked: {
            parent.clicked()
        }

        onPressed: {
            parent.pressed()
        }

        onEntered: {
            parent.entered()
        }

        onExited: {
            parent.exited()
        }
    }
}
