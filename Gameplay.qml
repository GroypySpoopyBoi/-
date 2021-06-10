import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Rectangle{
    signal superAwesomeSignal(var a)
    signal gameisover()
    signal newGamestarted();
    id: hi
    property var score: 0
    property var fail: 0
    width: gaeme.width
    height: gaeme.height
    onNewGamestarted:{
    n1.y = -n1.height; n2.y = -n2.height; n3.y = -n3.height; n4.y = -n4.height;
    hi.score = 0;hi.fail = 0;swatch.restart();swatch1.restart();swatch2.restart();swatch3.restart();swatch4.restart();


    }
    Timer{
        id:swatch
        interval: 1

        running: true
        repeat: true
        triggeredOnStart: true

        onTriggered: {if (fail >= 3){
                swatch1.stop();swatch2.stop();swatch3.stop();swatch4.stop(); swatch.stop();gameisover(hi.score)

            }
        }

    }
    RowLayout{
        id: gaeme
        spacing: 2


        Rectangle{



            property var bt: index
            id: rec1
            property var tm: 1
            width: 60
            height: 600
            gradient: Gradient {
                GradientStop { position: 0.0; color: "grey" }
                GradientStop { position: 1.0; color: "black" }
            }
            border.color: "purple"
            border.width: 5
            visible: true

            Note{
                id:n1
                y: -2*height
                Timer{
                    id:swatch1
                    interval: 1 + 25/hi.score

                    running: true
                    repeat: true
                    triggeredOnStart: true

                    onTriggered: {n1.y += rec1.tm + hi.score/15
                        if(n1.y > rec1.height){n1.y = -height; hi.fail +=1}
                        if(hi.score === 0){swatch1.interval = 26}
                    }


                }
                Shortcut{
                    context: Qt.ApplicationShortcut
                    sequences: ["F"]
                    onActivated: {if((l.y - n1.y <= l.height + hi.score/10) && (l.y >= n1.y))
                        { hi.score += 1; superAwesomeSignal(hi.score);n1.y= -2*n1.height}
                    }
                }

            }

        }


        Rectangle{

            property var bt: index
            id: rec2
            property var tm: 1
            width: 60
            height: 600
            gradient: Gradient {
                GradientStop { position: 0.0; color: "grey" }
                GradientStop { position: 1.0; color: "black" }
            }
            border.color: "purple"
            border.width: 5
            visible: true

            Note{
                id:n2
                y: -height
                Timer{
                    id:swatch2
                    interval: 1 + 25/hi.score

                    running: true
                    repeat: true
                    triggeredOnStart: true

                    onTriggered: {n2.y += rec2.tm + hi.score/15
                        if(n2.y > rec4.height){n2.y = -height; hi.fail +=1}
                        if(hi.score === 0){swatch2.interval = 26}
                    }


                }

                Shortcut{
                    context: Qt.ApplicationShortcut
                    sequences: ["G"]
                    onActivated:{if((l.y - n2.y <= l.height  + hi.score/10) && (l.y >= n2.y))
                        { hi.score += 1; superAwesomeSignal(hi.score); n2.y = -n2.height }
                    }
                }

            }


        }

        Rectangle{

            property var bt: index
            id: rec3
            property var tm: 1
            width: 60
            height: 600
            gradient: Gradient {
                GradientStop { position: 0.0; color: "grey" }
                GradientStop { position: 1.0; color: "black" }
            }
            border.color: "purple"
            border.width: 5
            visible: true

            Note{
                id:n3
                y: -5*height
                Timer{
                    id:swatch3
                    interval: 1 + 25/hi.score

                    running: true
                    repeat: true
                    triggeredOnStart: true

                    onTriggered: {n3.y += rec3.tm + hi.score/15
                        if(n3.y > rec3.height){n3.y = -height; hi.fail +=1}
                        if(hi.score === 0){swatch3.interval = 26}
                    }

                }

                Shortcut{
                    context: Qt.ApplicationShortcut
                    sequences: ["J"]
                    onActivated: {if((l.y - n3.y <= l.height + hi.score/10) && (l.y >= n3.y))
                        {hi.score += 1;superAwesomeSignal(hi.score); n3.y = -5*n3.height }
                    }
                }

            }


        }

        Rectangle{

            property var bt: index
            id: rec4
            property var tm: 1
            width: 60
            height: 600
            gradient: Gradient {
                GradientStop { position: 0.0; color: "grey" }
                GradientStop { position: 1.0; color: "black" }
            }
            border.color: "purple"
            border.width: 5
            visible: true

            Note{
                id:n4
                y: -height
                Timer{
                    id:swatch4
                    interval: 1 + 25/(hi.score)

                    running: true
                    repeat: true
                    triggeredOnStart: true

                    onTriggered: {n4.y += rec4.tm + hi.score/15
                        if(n4.y > rec4.height){n4.y = -height; hi.fail +=1}
                        if(hi.score === 0){swatch4.interval = 26}
                    }


                }

                Shortcut{
                    context: Qt.ApplicationShortcut
                    sequences: ["K"]
                    onActivated: {if((l.y - n4.y <= l.height + hi.score/10) && (l.y >= n4.y))
                        {hi.score += 1;superAwesomeSignal(hi.score); n4.y = -n4.height}
                    }
                }

            }


        }

    }



    Note{
        id: l
        color: "blue"
        y: rec1.height - height
        x: rec1.width - width
        Text{text:qsTr("F"); color: "white"; anchors.centerIn: parent; scale:2 }

    }

    Note{
        id: l2
        color: "red"
        y: rec2.height - height
        x: 2*rec2.width - width + 2
        Text{text:qsTr("G"); color: "white"; anchors.centerIn: parent; scale:2 }

    }

    Note{
        id: l3
        color: "green"
        y: rec3.height - height
        x: 3*rec3.width - width + 4
        Text{text:qsTr("J"); color: "white"; anchors.centerIn: parent; scale:2}

    }

    Note{
        id: l4
        color: "yellow"
        y: rec4.height - height
        x: 4*rec4.width - width + 6
        Text{text:qsTr("K"); color: "white"; anchors.centerIn: parent; scale:2 }

    }

}
