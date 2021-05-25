//! Qt Imports
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.12
import QtQuick.Controls.Universal 2.12

import Qaterial 1.0 as Qaterial

// Project Imports
import "../Components"
import "../Constants"


Qaterial.Dialog {


    id: setting_modal
    width: 850
    height: 650
    anchors.centerIn: parent
    dim: true
    modal: true
    title: "Tour"
    header: Item{}
    Overlay.modal: Item {
        Rectangle {
            anchors.fill: parent
            color: theme.surfaceColor
            opacity: .7
        }
    }
    background: FloatingBackground {
        color: theme.dexBoxBackgroundColor
        radius: 3
    }
    padding: 0
    topPadding: 0
    bottomPadding: 0
    Item {
        width: parent.width
        height: 60
        Qaterial.AppBarButton {
            anchors.right: parent.right
            anchors.rightMargin: 10
            foregroundColor: theme.foregroundColor
            icon.source: Qaterial.Icons.close
            anchors.verticalCenter: parent.verticalCenter
            onClicked: setting_modal.close()
        }
        Row {
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 20
            DexLabel {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Tour of App")
                font: theme.textType.head6
            }
        }

        Qaterial.DebugRectangle {
            anchors.fill: parent
            visible: false
        }
    }
    ListModel {
        id: tour_model
        Component.onCompleted: {
            append({
                name: "WELCOME TO ATOMICDEX",
                description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                image: Images.tour_step1,
                reverse: true
            })
            console.log("IMAGES STEP 1 = "+Images.tour_step1)
            append({
                name: "LOT OF CRYPTO 200+",
                description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                image: Images.tour_step2,
                reverse: false
            })
            append({
                name: "SMART PORTFOLIO",
                description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                image: Images.tour_step1,
                reverse: true
            })
        }
    }
    Item {
        width: parent.width
        height: parent.height-110
        y:60

        SwipeView {
            id: swipeTour
            anchors.fill: parent
            clip: true
            Repeater {
                model: tour_model
                delegate: Item {
                    Image {
                        width: parent.width-50
                        height: parent.height-50
                        anchors.centerIn: parent
                        source: image
                        opacity: .5

                    }
                    Column {
                        anchors.fill: parent
                        padding: 20
                        spacing: 20
                        DexLabel {
                            horizontalAlignment: reverse? Text.AlignRight : Text.AlignLeft 
                            width: parent.width-20
                            leftPadding: 20
                            rightPadding: 20
                            wrapMode: Label.Wrap
                            font: _font.head3
                            text: name
                        }
                        DexLabel {
                            horizontalAlignment: reverse?  Text.AlignRight : Text.AlignLeft 
                            width: parent.width-20
                            leftPadding: reverse? 365 : 0
                            rightPadding: reverse? 20 : 365
                            wrapMode: Label.Wrap
                            font: _font.head6
                            text: description
                            opacity: .4
                            scale: 0.91
                        }
                    }
                    
                }
            }
        }
        PageIndicator {
            currentIndex: swipeTour.currentIndex
            count: swipeTour.count
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
        
    }
    Item {
        width: parent.width-15
        height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        Row {
            anchors.right: parent.right 
            height: parent.height
            spacing: 15
            
            DexSelectableButton {
                id: backbutton
                selected: true
                visible:  swipeTour.currentIndex>0
                anchors.horizontalCenter: undefined
                anchors.verticalCenter: parent.verticalCenter
                text: ""
                height: 40
                width: backRow.width+30
                Row {
                    id: backRow
                    anchors.centerIn: parent
                    Qaterial.ColorIcon {
                        anchors.verticalCenter: parent.verticalCenter
                        source: Qaterial.Icons.chevronLeft
                    }
                    spacing: 10
                    DexLabel {
                        text: qsTr("Back")
                        color: theme.buttonColorTextEnabled
                        anchors.verticalCenter: parent.verticalCenter
                        font: theme.textType.button
                    }
                    opacity: .6
                }
                onClicked: {
                    swipeTour.currentIndex = swipeTour.currentIndex-1 
                }
            }
            DexSelectableButton {
                id: nextbutton
                visible: swipeTour.count>0 && swipeTour.currentIndex!=swipeTour.count-1
                selected: true
                anchors.horizontalCenter: undefined
                anchors.verticalCenter: parent.verticalCenter
                text: ""
                height: 40
                width: nextRow.width+30
                Row {
                    id: nextRow
                    layoutDirection: Qt.RightToLeft 
                    anchors.centerIn: parent
                    Qaterial.ColorIcon {
                        anchors.verticalCenter: parent.verticalCenter
                        source: Qaterial.Icons.chevronRight
                    }
                    spacing: 10
                    DexLabel {
                        text: qsTr("Next")
                        color: theme.buttonColorTextEnabled
                        anchors.verticalCenter: parent.verticalCenter
                        font: theme.textType.button
                    }
                    opacity: .6
                }
                onClicked: {
                    swipeTour.currentIndex = swipeTour.currentIndex+1
                }
            }
        }
    }
}