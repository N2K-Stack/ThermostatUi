import QtQuick 2.0
import QtQml.Models 2.12

Item {


    ListModel {
        id: iSettingMainMenuListModel
        ListElement {menuText: "Temperature Units"; iconSource: "qrc:/UI/Assets/thermometer.png"}
        ListElement {menuText: "Schedule"; iconSource: "qrc:/UI/Assets/calendar.png"}
        ListElement {menuText: "WiFi Settings"; iconSource: "qrc:/UI/Assets/wifi.png"}
        ListElement {menuText: "About"; iconSource: "qrc:/UI/Assets/info-button.png"}
    }

    Rectangle {
        id: iStackViewBackground

        width: parent.width * .7
        height: parent.height * .7

        anchors.centerIn: parent

        color: "black"
        border.width: 3
        border.color: "white"
        radius: 5

    }

    ListView {
        id: isettingListview
        flickableDirection: Flickable.AutoFlickIfNeeded
        anchors.fill: iStackViewBackground
        model: iSettingMainMenuListModel
        delegate: Rectangle {
            id: imainButton
            width: iStackViewBackground.width
            height: iStackViewBackground.height / iSettingMainMenuListModel.count
            color: "black"
            border.color: "white"
            border.width: 4
            radius: 5

            Image {
                id: iIconImage
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 30
                }
                source: iconSource
                height : 48
                width: 48
            }

            Text {
                id: imaintext
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: iIconImage.right
                    leftMargin: 40
                }

                color: "white"
                font.pixelSize: 30
                text: menuText
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if( iSettingStackView.depth >= 2)
                        iSettingStackView.pop()
                    else
                    iSettingStackView.push("qrc:/UI/SettingScreen/AboutPage.qml")
                }

                onPressed: {
                    imainButton.color = "white"
                    imaintext.color = "black"
                }


                onReleased: {
                    imainButton.color ="black"
                    imaintext.color = "white"
                }
            }

        }
    }

}


