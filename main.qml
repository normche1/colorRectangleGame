import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.12
import QtQuick.Controls 2.5
import "MyFunctions.js" as MyFunctions


Window {
    id:root
    property int sumCounter: 0
    property int secTillEnd: 0

    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    color: "white"
    width: 400
    height: 440
    visible: true
    title: qsTr("Square Clicker")


    Timer{
        id:secTimer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            paintedRect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            colRect1.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            colRect2.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            colRect3.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            colRect4.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            MyFunctions.randRect();

            MyFunctions.secTimerStopped()
        }
    }

    Rectangle{
        id:paintedRect
        x:50
        y:20

        width: parent.width-100
        height: 50
        border.color: "black"
        border.width: 4
        radius: 5
        Text {
            id: paintedRectText
            text: qsTr("Click my color!")
            anchors.centerIn: parent
            font.pixelSize: 40
        }
    }
        ColRect {
            id: colRect1
            x: 100
            y: 100
        }
        ColRect {
            id: colRect2
            x: 200
            y: 100
        }
        ColRect {
            id: colRect3
            x: 100
            y: 200
        }
        ColRect {
            id: colRect4
            x: 200
            y: 200
        }

    Text {
        id: textScore
        x: 10
        y: 323
        height: 30
        text: "TOTAL SCORE: " + root.sumCounter
        font.pixelSize: 24
    }

    Text {
        id: textSecs
        x: 277
        y: 323
        width: 113
        height: 30
        text: qsTr("TIME: " + secTillEnd)
        font.pixelSize: 24
    }


    Rectangle {
        id: startButton
        x: 50
        y: 380
        width: 300
        height: 38
        color: "#ffffff"
        radius: 5
        border.width: 2
        Text {
            id: staettext
            width: 55
            height: 29
            text: qsTr("Start")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            onClicked: {
                secTimer.start()
                root.secTillEnd = 30
                root.sumCounter = 0
                colRect1.clearCounter()
                colRect2.clearCounter()
                colRect3.clearCounter()
                colRect4.clearCounter()
                seqAnimation.running = true
            }
        }

        SequentialAnimation {
            id: seqAnimation
            running: false
            loops: 1
            ScaleAnimator{
                target:startButton
                from: 1
                to: 0.9
                duration: 50
                running: false
            }
            ScaleAnimator{
                target:startButton
                from: 0.9
                to: 1
                duration: 50
                running: false
            }
        }
    }
}


