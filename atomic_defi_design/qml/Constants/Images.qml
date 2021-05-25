pragma Singleton
import QtQuick 2.15

QtObject {
	readonly property string assets_path: "qrc:///"
    readonly property string image_path: assets_path + "atomic_defi_design/assets/images/"

    // Image list
    readonly property string tour_step1: image_path + "tutorial/step1.png"
    readonly property string tour_step2: image_path + "tutorial/step2.png"
    readonly property string tour_step3: image_path + "tutorial/step3.png"
}