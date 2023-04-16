import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.12
import "MyFunctions.js" as MyFunctions


Rectangle{
    property alias text: txtx.text

    function clearCounter(){
        MyFunctions.counter = 0
        colRect.text = "0"
    }

    id:colRect
    width: 100
    height: 100
    border.color: "black"
    border.width: 2
    radius: 5

    Text {
        id: txtx
        text: qsTr("0")
        anchors.centerIn: parent
        font.pixelSize: 40
    }
    
    MouseArea{
        anchors.fill: parent
        onClicked: {if(secTimer.running === true){
                MyFunctions.setCounter()
                txtx.text = MyFunctions.getCounter()
                MyFunctions.summaryCounter();
                seqAnim.running = true;

            }
        }
    }

    SequentialAnimation {
        id: seqAnim
        running: false
        loops: 1
        ScaleAnimator{
            target:colRect
            from: 1
            to: 0.9
            duration: 100

        }
        ScaleAnimator{
            target:colRect
            from: 0.9
            to: 1
            duration: 50

        }
    }
}
