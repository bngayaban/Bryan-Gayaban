import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQml.Models 2.1

ApplicationWindow {
    visible: true
    id: otherRoot
    Rectangle{

    id: root

    anchors.fill:
        parent

    Component {
            id: dragDelegate

            MouseArea {
                id: dragArea

                property bool held: false

                anchors { left: parent.left; right: parent.right }
                height: otherRoot.height/3
                propagateComposedEvents: true
                drag.target: held ? tileLoader.item : undefined
                drag.axis: Drag.YAxis

                onPressAndHold: {held = true
                    console.log("holding")
                }
                onReleased: held = false



                    Loader
                    {
                        id: tileLoader
                        width: parent.width
                        height: parent.height
                        source: page
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

            model: PetsModel {}
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
