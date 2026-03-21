import QtQuick 2.9

import "." as MidasComponents
import "effects/" as MidasEffects

Rectangle {
    color: MidasComponents.Style.appWindowBorderColor
    height: 1

    MidasEffects.ColorTransition {
        targetObj: parent
        blackColor: MidasComponents.Style._b_appWindowBorderColor
        whiteColor: MidasComponents.Style._w_appWindowBorderColor
    }
}
