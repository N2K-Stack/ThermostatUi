import QtQuick 2.0
import QtQuick.Controls 2.12
Slider {
    id: iTemperatureControlSlider
    from: 55
    to: 85
    stepSize: 1
    orientation: Qt.Vertical
    onValueChanged: isystemController.setTargetTemp(value)

    background: Rectangle {
        height: parent.height
        width: 3
        anchors.centerIn: parent
    }

    handle: Rectangle {
        y: iTemperatureControlSlider.visualPosition * (iTemperatureControlSlider.availableHeight - height)
        width: 76
        height: 76
        radius: width / 2
        color: "black"
        border.color: "white"
        border.width: 3
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            anchors.centerIn: parent
            font.pixelSize: 30
            text: iTemperatureControlSlider.value
            color: {
                if (iTemperatureControlSlider.value > isystemController.currentSystemTemperature)
                    return "orange"
                if (iTemperatureControlSlider.value < isystemController.currentSystemTemperature)
                    return "#2f59ad"
                else
                    return "white"
            }
        }
    }
}
