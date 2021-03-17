import QtQuick 2.12
import QtQuick.Window 2.12
import system_control 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Thermostat UI")

    SystemController {
        id: isystemController
    }

    Loader {
        id: imainLoader
        anchors.fill: parent
        source: "./UI/HomeScreen/HomeScreen.qml"
    }
}
