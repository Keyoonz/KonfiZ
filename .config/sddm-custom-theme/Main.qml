import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Components"

Item {
  id: root
  height: Screen.height
  width: Screen.width
  Rectangle {
    id: backgound
    anchors.fill: parent
    height: parent.height
    width: parent.width
    z: 0
    color: config.backgroundColor
  }
  Item {
    id: mainPanel
    z: 3
    anchors {
      fill: parent 
      margins: 50
    }
    LoginPanel {
      id: loginPanel
      anchors.fill: parent
    }
  }
}
