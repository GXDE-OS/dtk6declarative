/*
 * Copyright (C) 2022 UnionTech Technology Co., Ltd.
 *
 * Author:     yeshanshan <yeshanshan@uniontech.com>
 *
 * Maintainer: yeshanshan <yeshanshan@uniontech.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11
import org.deepin.dtk.style 1.0 as DS

FocusScope {
    property int maxVisibleItems : DS.Style.arrowListView.maxVisibleItems
    property int itemHeight:  DS.Style.arrowListView.itemHeight
    property alias view: itemsView

    implicitHeight: childrenRect.height
    implicitWidth: childrenRect.width

    Column {
        Button {
            height: DS.Style.arrowListView.stepButtonSize.height
            width: DS.Style.arrowListView.stepButtonSize.width
            flat: true
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: itemsView.interactive && !itemsView.atYBeginning
            icon.name: "go-up"
            onClicked: itemsView.decrementCurrentIndex()
        }

        ListView {
            id: itemsView
            implicitHeight: Math.min(contentHeight, maxVisibleItems * DS.Style.arrowListView.itemHeight)
            interactive: Window.window ? (contentHeight > Window.window.height || model.count > maxVisibleItems) : false
            clip: true
            ScrollIndicator.vertical: ScrollIndicator { }
        }

        Button {
            height: DS.Style.arrowListView.stepButtonSize.height
            width: DS.Style.arrowListView.stepButtonSize.width
            flat: true
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: itemsView.interactive && !itemsView.atYEnd
            icon.name: "go-down"
            onClicked: itemsView.incrementCurrentIndex()
        }
    }
}