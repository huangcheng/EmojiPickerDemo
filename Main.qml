import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import im.cheng.EmojiPicker

Window {
    width: 1024
    height: 768
    visible: true
    title: qsTr("EmojiPicker")

    color: '#e0e3e4'

    property int pickerWidth: 350
    property int pickerHeight: 450
    property string pickerTheme: 'light'
    property string placeholder: 'Search'
    property bool pickerSkinTonesDisabled: false
    property bool pickerSearchDisabled: false
    property bool pickerShowPreview: true

    property string emojis: ''

    Column {
        anchors.centerIn: parent
        spacing: 10

        RowLayout {
            spacing: 20

            EmojiPicker {
                id: picker

                theme: pickerTheme

                defaultSkinTone: 'neutral'
                skinTonesDisabled: pickerSkinTonesDisabled
                searchPlaceholder: placeholder
                searchDisabled: pickerSearchDisabled
                showPreview: pickerShowPreview

                onEmojiClicked: function (emoji) {
                    emojis += emoji
                }

                Layout.preferredWidth: pickerWidth
                Layout.preferredHeight: pickerHeight
            }

            Rectangle {
                Layout.preferredWidth: pickerWidth
                Layout.preferredHeight: pickerHeight

                Rectangle {
                    anchors.margins: 16
                    anchors.fill: parent

                    ColumnLayout {
                        anchors.fill: parent

                        Row {
                            Layout.fillWidth: true

                            Text {
                                text: qsTr("Skin Tones Disabled")

                                font.bold: true

                                width: parent.width / 2
                            }

                            Rectangle {

                                // color: '#F5F5F5'
                                radius: 5

                                width: parent.width / 2
                                height: 25

                                CheckBox {
                                    checked: pickerSkinTonesDisabled

                                    onCheckedChanged: pickerSkinTonesDisabled = checked

                                    anchors.right: parent.right
                                }
                            }
                        }

                        Row {
                            Layout.fillWidth: true

                            Text {
                                text: qsTr("Search Disabled")

                                font.bold: true

                                width: parent.width / 2
                            }

                            Rectangle {

                                // color: '#F5F5F5'
                                radius: 5

                                width: parent.width / 2
                                height: 25

                                CheckBox {
                                    checked: pickerSearchDisabled

                                    onCheckedChanged: pickerSearchDisabled = checked

                                    anchors.right: parent.right
                                }
                            }
                        }

                        Row {
                            Layout.fillWidth: true

                            Text {
                                text: qsTr("Show Preview")

                                font.bold: true

                                width: parent.width / 2
                            }

                            Rectangle {

                                // color: '#F5F5F5'
                                radius: 5

                                width: parent.width / 2
                                height: 25

                                CheckBox {
                                    checked: pickerShowPreview

                                    onCheckedChanged: pickerShowPreview = checked

                                    anchors.right: parent.right
                                }
                            }
                        }

                        Row {
                            Layout.fillWidth: true

                            Text {
                                text: qsTr("Search Placeholder")

                                font.bold: true

                                width: parent.width / 2
                            }

                            Rectangle {

                                color: '#F5F5F5'
                                radius: 5

                                width: parent.width / 2
                                height: 25

                                TextInput {
                                    text: placeholder

                                    width: parent.width - 10
                                    onTextChanged: placeholder = text

                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    anchors.rightMargin: 5
                                }
                            }
                        }

                        Row {
                            Layout.fillWidth: true

                            Text {
                                text: qsTr("Theme")

                                font.bold: true

                                width: parent.width / 2
                            }

                            Rectangle {

                                // color: '#F5F5F5'
                                radius: 5

                                width: parent.width / 2
                                height: 25

                                ComboBox {
                                    model: ['Light', 'Dark']
                                    currentIndex: pickerTheme === 'light' ? 0 : 1

                                    anchors.fill: parent

                                    onActivated: function (index) {
                                        pickerTheme = index === 0 ? 'light' : 'dark'
                                    }
                                }
                            }
                        }

                        Row {
                            Layout.fillWidth: true

                            Text {
                                text: qsTr("Height")

                                font.bold: true

                                width: parent.width / 2
                            }

                            Rectangle {
                                color: '#F5F5F5'

                                radius: 5

                                width: parent.width / 2
                                height: 25

                                TextInput {
                                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                                    text: pickerHeight

                                    width: parent.width - 10
                                    onTextChanged: pickerHeight = text

                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    anchors.rightMargin: 5
                                }
                            }
                        }

                        Row {
                            Layout.fillWidth: true

                            Text {
                                text: qsTr("Width")

                                font.bold: true

                                width: parent.width / 2
                            }

                            Rectangle {
                                color: '#F5F5F5'

                                radius: 5

                                width: parent.width / 2
                                height: 25

                                TextInput {
                                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                                    text: pickerWidth

                                    width: parent.width / 2

                                    onTextChanged: pickerWidth = text

                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    anchors.rightMargin: 5
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            width: parent.width
            height: 68
            radius: 5

            color: '#fff'

            Text {
                anchors.fill: parent

                anchors.margins: 10

                font.pixelSize: 16

                text: emojis

                wrapMode: Text.Wrap
            }
        }
    }
}
