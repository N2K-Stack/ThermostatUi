import QtQuick 2.0
import QtQml.Models 2.15


Rectangle {
    id: iHeatSelectDialog

    signal destroyThis()

    anchors.fill: parent
    color: Qt.rgba(0, 0, 0, 0)

    MouseArea {
        anchors.fill: parent
        onClicked: iHeatSelectDialog.destroyThis()
    }

    ListModel {
        id: iheatModel
        ListElement { controlText: "Heat" }
        ListElement { controlText: "Cool" }
        ListElement { controlText: "Auto" }
    }



    Rectangle {
        id: iInnerRectangle
        radius: 5
        width: parent.width / 2
        height: parent.height * 0.8
        anchors.centerIn: parent
        color: "black"
        border.color: "white"
        border.width: 3

    }

    ListView {
        id: iheatListView
        flickableDirection: Flickable.AutoFlickIfNeeded
        anchors.fill: iInnerRectangle
        model: iheatModel
        delegate: Rectangle {
            id: iheatControlButton
            width: iInnerRectangle.width
            height: iInnerRectangle.height / iheatModel.count
            color: "black"
            border.color: "white"
            border.width: 4
            radius: 5
            Text {
                id: iheatcontroltext
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 42
                text: controlText
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if( controlText === "Heat")
                        isystemController.setSystemState(0)

                    if( controlText === "Cool")
                        isystemController.setSystemState(1)

                    if( controlText === "Auto")
                        isystemController.setSystemState(2)

                    iHeatSelectDialog.destroyThis()
                }

                onPressed: {
                    iheatControlButton.color = "white"
                    iheatcontroltext.color = "black"
                }


                onReleased: {
                    iheatControlButton.color ="black"
                    iheatcontroltext.color = "white"
                }
            }

        }
    }

}
