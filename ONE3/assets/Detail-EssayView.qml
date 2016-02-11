import bb.cascades 1.4
import cn.anpho 1.0
import bb.multimedia 1.4
import bb.system 1.2
Page {
    property variant nav

    property string essayid
    property string endpoint: "http://v3.wufazhuce.com:8000/api/essay/%1"
    onEssayidChanged: {
        if (essayid.trim().length > 0) {
            load();
        }
    }
    function requestAuthorView(author_id) {
        //TODO SHOW AUTHOR VIEW
    }
    function load() {
        var endp = endpoint.arg(essayid);
        co.ajax("GET", endp, [], function(b, d) {
                if (b) {
                    try {
                        d = JSON.parse(d).data;

                        author_id = d.author[0].user_id
                        author_img = d.author[0].web_url
                        author_introduce = d.hp_author_introduce
                        author_it = d.auth_it
                        author_name = d.hp_author
                        author_weibo = d.wb_name

                        c_content = d.hp_content
                        console.log(c_content.length)
                        c_intro = d.guide_word
                        c_subtitle = d.sub_title
                        c_title = d.hp_title
                        c_time = d.hp_makettime

                        audio_url = d.audio
                    } catch (e) {
                        sst.body = qsTr("Error: %1").arg(JSON.stringify(e))
                        sst.show();
                    }

                } else {
                    sst.body = qsTr("Error : %1").arg(d)
                    sst.show();
                }
            }, [], false)
    }
    // AUTHOR
    property string author_img
    onAuthor_imgChanged: {
        if (author_img.length > 0) {
            author_imgview.url = author_img
        }
    }
    property string author_id
    property string author_name
    property string author_it
    property string author_weibo
    // AUDIO
    property string audio_url
    onAudio_urlChanged: {
        if (audio_url.trim().length > 0) {
            mp.sourceUrl = audio_url
        }
    }
    // CONTENT
    property string c_title
    property string c_subtitle
    property string c_intro
    property string c_content
    property string c_time
    property string author_introduce

    attachedObjects: [
        MediaPlayer {
            id: mp
            property bool isPlaying: false
            onMediaStateChanged: {
                if (mediaState == MediaState.Started) {
                    isPlaying = true
                } else {
                    isPlaying = false
                }
            }
        },
        Common {
            id: co
        },
        SystemToast {
            id: sst
        }
    ]
    function setActive() {
        scrollview.scrollRole = ScrollRole.Main
    }
    titleBar: TitleBar {
        title: qsTr("Essay")
        dismissAction: ActionItem {
            title: qsTr("Back")
            onTriggered: {
                nav.pop();
            }
        }
        acceptAction: ActionItem {
            imageSource: mp.isPlaying ? "asset:///icon/ic_pause.png" : "asset:///icon/ic_play.png"
            title: mp.isPlaying ? "暂停" : "收听"
            onTriggered: {
                if (mp.isPlaying) {
                    mp.pause();
                } else {
                    mp.play();
                }
            }
            enabled: audio_url.length > 0
        }
    }
    actionBarVisibility: ChromeVisibility.Compact
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    ScrollView {
        id: scrollview
        Container {
            leftPadding: 20.0
            topPadding: 20.0
            rightPadding: 20.0
            bottomPadding: 20.0
            Container {
                gestureHandlers: TapHandler {
                    onTapped: {
                        requestAuthorView(author_id)
                    }
                }
                implicitLayoutAnimationsEnabled: false
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight

                    }
                    implicitLayoutAnimationsEnabled: false
                    WebImageView {
                        preferredHeight: ui.du(8)
                        preferredWidth: ui.du(8)
                        id: author_imgview
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: author_name
                        textStyle.textAlign: TextAlign.Left
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Center
                        textStyle.fontWeight: FontWeight.W100
                        textStyle.fontSize: FontSize.Large
                        implicitLayoutAnimationsEnabled: false
                        leftMargin: 20.0
                    }
                }

                Label {
                    multiline: true
                    text: author_it
                    visible: text.length > 0
                    textStyle.fontSize: FontSize.XSmall
                    textStyle.fontWeight: FontWeight.W100
                    opacity: 0.6
                    textFormat: TextFormat.Plain
                    horizontalAlignment: HorizontalAlignment.Fill
                    textStyle.textAlign: TextAlign.Left
                    implicitLayoutAnimationsEnabled: false
                }
                Label {
                    text: author_weibo
                    visible: text.length > 0
                    textStyle.fontSize: FontSize.XSmall
                    textStyle.fontWeight: FontWeight.W100
                    opacity: 0.6
                    horizontalAlignment: HorizontalAlignment.Fill
                    textStyle.textAlign: TextAlign.Left
                    implicitLayoutAnimationsEnabled: false
                }
            }
            Label {
                text: c_title
                horizontalAlignment: HorizontalAlignment.Fill
                textStyle.textAlign: TextAlign.Center
                textStyle.fontSize: FontSize.Large
                textStyle.fontWeight: FontWeight.W100
                implicitLayoutAnimationsEnabled: false
            }
            Label {
                text: _app.html2text(c_content)
                textFormat: TextFormat.Html
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Fill
                multiline: true
                textStyle.fontSize: FontSize.Medium
                textStyle.textAlign: TextAlign.Left
                implicitLayoutAnimationsEnabled: false
            }
            Label {
                text: author_introduce
                textStyle.fontStyle: FontStyle.Italic
                textStyle.fontWeight: FontWeight.W100
                textStyle.fontSize: FontSize.XSmall
                opacity: 0.6
                verticalAlignment: VerticalAlignment.Fill
                horizontalAlignment: HorizontalAlignment.Left
            }
        }
    }
}