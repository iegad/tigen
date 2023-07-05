import QtQuick 2.15
import QtQuick.Controls 2.15

XRectangle {
    id: border
    property string source: ''
    signal textChanged()

    Image {
        id: img
        source: border.source
    }

    TextInput {
        onTextChanged: {

        }
    }
}
