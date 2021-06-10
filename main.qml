import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    id: w

    width: gp.width
    height: gp.height + tb.height + 10
    minimumHeight: gp.height + tb.height + 10
    minimumWidth:  gp.width
    maximumHeight: gp.height + tb.height + 10
    maximumWidth: gp.width
    color: "#E9DFE0"

    visible: true
    title: qsTr("ГуитарХеро")
    ColumnLayout{
        id: cl
        anchors.centerIn: w.contentItem
        spacing: 2

        Gameplay{
            id:gp

            anchors.centerIn:w.contentItem

            onSuperAwesomeSignal: tr.text = a
            onGameisover:{ dia.open(); tr.color = "red"}

        }
        Toolbar {
            id: tb
            onQuitApp: Qt.quit()
            TextField{
                id: tf
                Layout.fillWidth: true
                Text{id:tr;text: "0"; anchors.centerIn: parent}
            }
            onNewGame: {dia.visible = false; tr.color = "black"; tr.text = 0; gp.newGamestarted()}

        }

        Dialog{
            id: dia
            title: qsTr("game over")
            anchors.centerIn: parent
            contentItem: Text {
                id: ttt
                text: qsTr("The game is over! See your results below!")
            }


        }

    }

}
