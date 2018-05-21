import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQml 2.2
import QtCharts 2.0

SwipeView {
    spacing: 5

    Rectangle{
        color: "green"
        Text{
            id: textbox1
            text: qsTr("this is textSwip1")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
