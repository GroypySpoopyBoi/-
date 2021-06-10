import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {

    signal newGame()
    signal quitApp()

    Button{
        id: rb

        text: "RESTART"

        onClicked: newGame()

    }

    Button{
        id: eb

        text: "EXIT"

        onClicked: quitApp()
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Ctrl+N"]
        onActivated: newGame()
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: [StandardKey.Close, "Ctrl+Q"]
        onActivated: quitApp()
    }
}
