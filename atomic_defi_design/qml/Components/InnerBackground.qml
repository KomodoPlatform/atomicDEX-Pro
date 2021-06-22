import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import Qaterial 1.0 as Qaterial
import "../Constants"

Item {
    id: control
    property alias content: inner_space.sourceComponent
    property alias color: rect.color
    property alias radius: rect.radius
    property alias border: rect.border
    property bool shadowOff: false
    property bool auto_set_size: true
    implicitWidth: auto_set_size ? inner_space.width : 0
    implicitHeight: auto_set_size ? inner_space.height : 0
    property color bottomBorderColor: theme.colorInnerShadowBottom
    property color topBorderColor: theme.colorInnerShadowTop

    Item {
        id: rect_with_shadow
        anchors.fill: parent

        DefaultRectangle {
            id: rect
            anchors.fill: parent
            border.color: "transparent"
            color: theme.backgroundColor

            Loader {
                anchors.centerIn: parent
                id: inner_space

                layer.enabled: true

                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: inner_space.width
                        height: inner_space.height
                        radius: rect.radius
                    }
                }
            }
        }

        layer.enabled: !control.shadowOff
        //layer.effect: DefaultInnerShadow { }
    }

    LinearGradient {
        id: gradient
        visible: rect.border.width > 0
        source: rect
        width: rect.width + rect.border.width*2
        height: rect.height + rect.border.width*2
        anchors.centerIn: parent

        z: -1
        start: Qt.point(0, 0)
        end: Qt.point(0, height)

        gradient: Gradient {
            GradientStop {
               position: 0.35
               color: control.topBorderColor
            }
            GradientStop {
               position: 0.65
               color: control.bottomBorderColor //Qaterial.Colors.blueA400//
            }
        }
    }
}
