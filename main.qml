import QtQuick 2.5
import QtQuick.Window 2.2
import "modules/Material" as Material

Window {
    visible: true

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    Material.Button {
        text: qsTr("Hello World Button")
    }
}
