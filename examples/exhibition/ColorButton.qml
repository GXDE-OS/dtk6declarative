/*
 * Copyright (C) 2022 UnionTech Technology Co., Ltd.
 *
 * Author:     JiDe Zhang <zhangjide@deepin.org>
 *
 * Maintainer: JiDe Zhang <zhangjide@deepin.org>
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

import QtQuick 2.0
import QtQuick.Controls 2.15

Button {
    id: root
    property color color

    checkable: true
    background: Item {
        implicitWidth: 22
        implicitHeight: 22

        Rectangle {
            anchors {
                fill: parent
                margins: 3
            }

            radius: width / 2
            color: root.color
        }

        Rectangle {
            visible: root.checked
            anchors.fill: parent
            color: "transparent"
            radius: width / 2
            border {
                width: 1.5
                color: root.color
            }
        }
    }
    contentItem: null
}