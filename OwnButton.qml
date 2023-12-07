import QtQuick
import QtQuick.Controls

Rectangle {
    property alias text: label.text
    property bool pressed: false

    signal activated(real xPosition, real yPosition)

    width: 100
    height: 40

    Rectangle {
        id: button
        width: parent.width
        height: parent.height
        color: parent.pressed ? "lightblue" : "yellow"

        property bool buttonPressed: false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                button.parent.pressed = !button.parent.pressed;
                button.color = button.parent.pressed ? "lightblue" : "yellow";
                button.buttonPressed = button.parent.pressed;
                activated(mouse.x, mouse.y);
            }
        }

        Rectangle {
            id: highlight
            anchors.fill: parent
            color: "blue"
            visible: button.buttonPressed
        }

        Text {
            id: label
            anchors.centerIn: parent
            text: "Click me"
        }
    }

    onActivated: {
        console.log("Activated at " + xPosition + "," + yPosition);
    }
}
