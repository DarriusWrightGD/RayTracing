import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "modules/Material" 0.2
import "modules/Material/ListItems" 0.2 as ListItem
import "modules/Material/Extras" 0.1


ApplicationWindow {
    id: rayTracing
    width: 1080
    height: 600
    title: "Ray tracing"
    visible: true

    theme {
        primaryColor: "blue"
        accentColor: "red"
        backgroundColor: "white"
        tabHighlightColor: "white"
    }

    initialPage: homePage
    property var objects: [
        "Fox", "Apple", "Chair"
    ]

    property var sections: [objects]
    property var sectionTitles: ["Obj Files"]
    property string selectedComponent: sections[0][0]
    property Action printAction: Action {
        name: "Print"
        visible: true
        iconName: "action/print"
    }

    property list<Item> myActions: []

    Page
    {
        id: homePage
        title: "Ray Tracer"

        anchors.fill: parent
        actions: myActions
        Sidebar {
            id: sidebar
            anchors {
                top: parent.top
                bottom: parent.bottom
            }

            Column {
                id: objectList
                width: parent.width
                height: Units.dp(560)

                Repeater {
                    model: objects
                    delegate: ListItem.Standard {
                        text: modelData
                        selected: modelData == selectedComponent
                        onClicked: selectedComponent = modelData
                    }
                }
            }
            Rectangle {
                anchors.bottom: objectList.bottom
                height:30

                Button {

                    Icon {
                        name: "content/add"
                    }


                }


            }


        }

        Rectangle {
            id: tracedImage
            anchors {
                left: sidebar.right
                right: objectEditor.left
                top: parent.top
                bottom: parent.bottom
            }

            Image {
                anchors.fill: parent
                source: Qt.resolvedUrl("images/raytracing.png")
            }
        }

        Column {
            id:objectEditor
            anchors.right: parent.right
            width: Units.dp(250)

            ColumnLayout {
                x: 5

                Label {
                    id: objectName
                    style: "title"
                    text: "Name: " + selectedComponent
                }
            }
        }

    }
}
