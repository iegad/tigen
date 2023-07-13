import QtQuick 2.15
import QtQuick.Controls 2.15

XRectangle {
    id: txtSch

    property string text: ''
    property ListModel model

    signal click()

    cornersRadius: [5, 5, 5, 5]

    TextEdit {
        id: txtSearch
        width: parent.width - 30
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: imgSearch.left
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        selectByMouse: true
        clip: true
        text: txtSch.text

        onTextChanged: {
            txtSch.text = text
        }
    }

    Image {
        id: imgSearch
        source: 'qrc:/img/resources/Search.png'
        anchors.left: txtSearch.right
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        height: 20
        width: 20

        MouseArea {
            anchors.fill: parent
            onClicked: {
                txtSch.click()
            }
        }
    }

//    Menu {
//        id: menu
//        width: txtSch.width


//        Instantiator {
//            id: menuInstaniator
//            model: txtSch.model

//            delegate: MenuItem {
//                text: model.key
//            }

//            onObjectAdded: menu.insertItem(index, object)
//            onObjectRemoved: menu.removeItem(object)
//        }
//    }
}
