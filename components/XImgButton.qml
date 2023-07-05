import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: xImgButton

    property bool actived: false
    property bool hovered: false
    property string tips: ''
    property string source: ''
    property string activeSource: ''

    signal clicked()
    signal entered()
    signal exited()

    Image {
        source: actived ? xImgButton.activeSource : xImgButton.source
        anchors.fill: parent
    }

    MouseArea {
        id: btn
        hoverEnabled: true
        anchors.fill: parent

        onClicked: {
            xImgButton.actived = true;
            xImgButton.clicked()
        }

        onEntered: {
            xImgButton.hovered = true
            xImgButton.entered()
        }

        onExited: {
            xImgButton.hovered = false
            xImgButton.exited()
        }
    }

    ToolTip {
        visible: xImgButton.hovered
        text: tips
        delay: 1000
        timeout: 3000
    }
}
