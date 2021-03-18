import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
      id: iHomeScreen
    property var heatSelectDialogHolder: null

    function createHeatSelectDialog() {
        if( heatSelectDialogHolder === null) {
            var Component = Qt.createComponent("HeatSelectDialog.qml")
            heatSelectDialogHolder = Component.createObject(iHomeScreen, {"x":0, "y":0})
            if( heatSelectDialogHolder) {
               heatSelectDialogHolder.anchors.fill = iHomeScreen
               heatSelectDialogHolder.destroyThis.connect( destroyHeatSelectDialog)
            }
        }
    }

    function destroyHeatSelectDialog() {
        if( heatSelectDialogHolder !== null) {
            heatSelectDialogHolder.destroy()
            heatSelectDialogHolder = null
        }
    }

    Rectangle{
        id: imainBackground

        anchors.fill: parent
        color: "black"

    }

    Text {
        id: icurrentTempText

        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 200
        text: isystemController.currentSystemTemperature
    }

    Text {
        id: iSystemstatusText
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: icurrentTempText.bottom
            topMargin: 20
        }
        font.pixelSize: 30
        color: "white"
        text: isystemController.systemStatusMessage
    }

    Image {
        id: iheatCoolSelection
        anchors {
            top: iTemperatureSlider.top

            right: icurrentTempText.left
            rightMargin: 100

        }
        width: 70
        height: 70
        source: {
            if (isystemController.systemState === 0)
                return "qrc:/UI/Assets/flame.png"

            if (isystemController.systemState === 1)
                return "qrc:/UI/Assets/ice-crystal.png"
            if (isystemController.systemState === 2)
                return "qrc:/UI/Assets/auto.png"
        }

        ColorOverlay {
            anchors.fill: iheatCoolSelection
            source: iheatCoolSelection
            color: {
            if (isystemController.systemState === 0)
                return "orange"
            if (isystemController.systemState === 1)
                return "#2f59ad"
            if (isystemController.systemState === 2)
                return "white"
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: createHeatSelectDialog()
        }

    }


    Image {

        id: isettingIcon
        anchors {
            bottom: iTemperatureSlider.bottom

            right: icurrentTempText.left
            rightMargin: 100

        }
        width: 70
        height: 70
        source: "qrc:/UI/Assets/settings.png"

        MouseArea {
            anchors.fill: parent
            onClicked: imainLoader.source = "../SettingScreen/SettingScreen.qml"
        }
    }

    TemperatureControlSlider {
       id: iTemperatureSlider
       value : isystemController.targetTemp
       anchors {
           top: parent.top
           bottom: parent.bottom
           left: icurrentTempText.right
           leftMargin: 100
           topMargin: 80
           bottomMargin: 80
       }
    }
}
