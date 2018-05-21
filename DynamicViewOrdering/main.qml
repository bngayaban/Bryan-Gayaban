import QtQuick 2.6
import QtQml.Models 2.1
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Item {
            id: mainContent
            anchors.fill: parent
            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    color: "lightblue"
                    height: 50
                    Layout.fillWidth: true

                    Text {
                        anchors.centerIn: parent
                        text: "A fake toolbar"
                    }
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    ListView {
                        id: listView
                        model: PageModel
                        delegate: DraggableItem {
                            Rectangle {
                                height: parent.height/3
                                width: listView.width
                                color: "white"

                                Loader{
                                    id: tileLoader
                                    anchors.centerIn: parent
                                    width: parent.width/2
                                    height: parent.height/2
                                    source: page
                                }

                                // Bottom line border
                                Rectangle {
                                    anchors {
                                        left: parent.left
                                        right: parent.right
                                        bottom: parent.bottom
                                    }
                                    height: 1
                                    color: "lightgrey"
                                }
                            }

                            draggedItemParent: mainContent

                            onMoveItemRequested: {
                                myModel.move(from, to, 1);
                            }
                        }
                    }
                }
            }
        }

    /*
    Loader{
        id: tileLoader
        anchors.centerIn: parent
        width: parent.width/2
        height: parent.height/2
        source: page
    }
    */
}
