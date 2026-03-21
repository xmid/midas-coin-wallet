import QtQuick 2.9

import "../components" as MidasComponents

TextEdit {
    color: MidasComponents.Style.defaultFontColor
    font.family: MidasComponents.Style.fontRegular.name
    selectionColor: MidasComponents.Style.textSelectionColor
    wrapMode: Text.Wrap
    readOnly: true
    selectByMouse: true
    // Workaround for https://bugreports.qt.io/browse/QTBUG-50587
    onFocusChanged: {
        if(focus === false)
            deselect()
    }
}
