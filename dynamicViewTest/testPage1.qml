import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQml 2.2

Rectangle {
    id: content
    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }
    width: dragArea.width; height: dragArea.height

    border.width: 5
    border.color: "lightsteelblue"

    color: dragArea.held ? "lightsteelblue" : "white"
    Behavior on color { ColorAnimation { duration: 100 } }

    radius: 20
    Drag.active: dragArea.held
    Drag.source: dragArea
    Drag.hotSpot.x: width / 2
    Drag.hotSpot.y: height / 2
    states: State {
        when: dragArea.held

        ParentChange { target: content; parent: root }
        AnchorChanges {
            target: content
            anchors { horizontalCenter: undefined; verticalCenter: undefined }
        }
    }
    SwipeView {
        id: view;
        spacing: 5

        currentIndex: 0
        anchors.fill: parent

        Rectangle {
            color: "transparent"
            id: firstPage
            Text{
                id: textbox1
                text: qsTr("this is textSwip1")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle {
            id: secondPage
            color: "transparent"
            Text{
                id: textbox2
                text: qsTr("this is textSwip2")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle {
            id:thirdPage
            color: "transparent"
            Text{
                id: textbox3
                text: qsTr("this is textSwip3")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}

