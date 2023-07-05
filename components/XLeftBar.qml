import QtQuick 2.15

// 左侧菜单
XRectangle {
    id: leftBar

    property string avatarSource: ''
    signal click(int btnIndex)

    // 头像
    Rectangle {
        id: avatarBorder
        visible: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5
        width: 45
        height: 45
        color: '#BBBBBB'
        radius: 5

        Image {
            id: avatar
            source: leftBar.avatarSource
            anchors.topMargin: 3
            anchors.leftMargin: 3
            anchors.rightMargin: 3
            anchors.bottomMargin: 3
            anchors.fill: parent
        }
    }

    // 消息
    XImgButton {
        id: btnMsg
        tips: qsTr('消息')
        source: "qrc:/img/resources/msg.png"
        activeSource: "qrc:/img/resources/msga.png"

        anchors.top: avatarBorder.bottom
        anchors.left: parent.left
        anchors.topMargin: 18
        anchors.leftMargin: 18
        width: 20
        height: 20
        color: parent.color

        onClicked: {
            btnAddrbook.actived = false;
            leftBar.click(0)
        }
    }

    // 通讯录
    XImgButton {
        id: btnAddrbook
        tips: qsTr('通讯录')
        source: "qrc:/img/resources/addrbook.png"
        activeSource: "qrc:/img/resources/addrbooka.png"

        anchors.top: btnMsg.bottom
        anchors.left: parent.left
        anchors.topMargin: 18
        anchors.leftMargin: 18
        width: 20
        height: 20
        color: parent.color

        onClicked: {
            btnMsg.actived = false;
            leftBar.click(1)
        }
    }
}
