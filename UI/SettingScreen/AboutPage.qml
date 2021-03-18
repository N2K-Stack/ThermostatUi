import QtQuick 2.0

Rectangle {

    id: iAboutPageBackground

     width: parent.width * .7
     height: parent.height * .7

     anchors.centerIn: parent

     color: "black"
     border.width: 3
     border.color: "white"
     radius: 5


     Text {
         anchors {
             top: parent.top
             left: parent.left
             leftMargin: 40
             topMargin: 60
         }

         color: "white"
         font.pixelSize: 30
         text: "Made by:<br> The Software Engineer<br><br>Developed using Qt/QML"


     }

}



