import QtQuick 2.0
import QtQml.Models 2.1
import QtQuick.Controls 2.2

ApplicationWindow {
    id: root
    visible: true

    Rectangle {
        anchors.fill: parent
        id: rect
        Component {
            id: dragDelegate

            MouseArea {
                id: dragArea

                property bool held: false

                anchors { left: parent.left; right: parent.right }
                height: content.height

                drag.target: held ? content : undefined
                drag.axis: Drag.YAxis
                propagateComposedEvents: true
                onPressAndHold: held = true
                onReleased: held = false

                Rectangle {
                    id: content
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                    width: dragArea.width; height: rect.height/3



                    border.width: 5
                    border.color: "lightsteelblue"

                    color: dragArea.held ? "lightsteelblue" : "red"
                    Behavior on color { ColorAnimation { duration: 100 } }

                    radius: 2
                    Drag.active: dragArea.held
                    Drag.source: dragArea
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2
                    states: State {
                        when: dragArea.held

                        ParentChange { target: content; parent: rect }
                        AnchorChanges {
                            target: content
                            anchors { horizontalCenter: undefined; verticalCenter: undefined }
                        }
                    }

                    Loader{
                        id: tileLoader
                        anchors.centerIn: parent
                        width: parent.width/2
                        height: parent.height/2
                        source: page
                    }
                }
                DropArea {
                    anchors { fill: parent; margins: 10 }

                    onEntered: {
                        visualModel.items.move(
                                    drag.source.DelegateModel.itemsIndex,
                                    dragArea.DelegateModel.itemsIndex)
                    }
                }
            }
        }
        DelegateModel {
            id: visualModel

            model: PageModel {}
            delegate: dragDelegate
        }

        ListView {
            id: view

            anchors { fill: parent; margins: 2 }

            model: visualModel

            spacing: 4
            cacheBuffer: 50
        }
    }
}
