import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    id: iSettingScreen
    color:"black"
    anchors.fill: parent

    Image {
        id: iBackButton
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 15
            topMargin: 20
        }
        width: 40
        height: 40

       source: "qrc:/UI/Assets/previous.png"

       MouseArea {
           anchors.fill: parent
           onClicked: imainLoader.source = "../HomeScreen/HomeScreen.qml"
       }

    }



   StackView {
        id: iSettingStackView
        anchors.fill: parent
        initialItem: "SettingMainMenu.qml"
   }
}
