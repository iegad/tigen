import QtQuick 2.15


XRectangle {
    property string source

    signal clicked()
    signal pressed()
    signal release()
    signal entered()
    signal exited()

    Image {
        id: img
        source: parent.source
        anchors.centerIn: parent
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
