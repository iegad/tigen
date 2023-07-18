import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"


Rectangle {
    id: xMsgPlant
    property string imageSource: ''
    property string msgContent: ''
    property bool isSelf: false

    height: bgTxtContent.height + 35

    XRectangle {
        id: bAvatar
        visible: !isSelf
        color: '#E3E3E3'
        cornersRadius: [5, 5, 5, 5]
        width: 40
        height: 40
        anchors.top: xMsgPlant.top
        anchors.topMargin: 3
        anchors.left: xMsgPlant.left
        anchors.leftMargin: 3

        Image {
            id: imgAvatar
            source: xMsgPlant.imageSource

            anchors.top: bAvatar.top
            anchors.topMargin: 3
            anchors.bottom: bAvatar.bottom
            anchors.bottomMargin: 3
            anchors.left: bAvatar.left
            anchors.leftMargin: 3
            anchors.right: bAvatar.right
            anchors.rightMargin: 3
        }
    }

    XRectangle {
        id: bgTxtContent
        cornersRadius: [isSelf ? 15 : 0, isSelf ? 0 : 15, 15, 15]
        color: isSelf ? '#EEEEEE' : '#95EC69'
        width: Math.min(txtContent.implicitWidth + 20, xMsgPlant.width)
        height: txtContent.implicitHeight + 20
        anchors.leftMargin: 3
        anchors.top: xMsgPlant.top
        anchors.topMargin: 20

        Component.onCompleted: {
            if (isSelf) {
                bgTxtContent.anchors.right = parent.right
            } else {
                bgTxtContent.anchors.left = bAvatar.right
            }
        }
    }

    TextEdit {
        id: txtContent
        text: xMsgPlant.msgContent
        readOnly: true
        anchors.fill: bgTxtContent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        selectByMouse: true
        wrapMode: TextEdit.WordWrap
    }
}
