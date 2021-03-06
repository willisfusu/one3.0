import bb.cascades 1.4
import cn.anpho 1.0
import bb.system 1.2
Page {
    property NavigationPane nav
    property variant rawdate
    property string api_url: "http://v3.wufazhuce.com:8000/api/serialcontent/bymonth/%1"
    onRawdateChanged: {
        console.log(rawdate)
        if (rawdate) {
            var day = Qt.formatDate(rawdate, "yyyy-MM-dd") + " 00:00:00";
            var endp = api_url.arg(encodeURIComponent(day));

            adm.clear();
            var d = _app.fetch(endp);
            var b = d.length > 0;
            if (b) {
                try {
                    d = JSON.parse(d).data;
                    adm.append(d);
                } catch (e) {
                    sst.body = JSON.stringify(e);
                    sst.show();
                }
            } else {
                sst.body = d;
                sst.show();
            }
        }
    }
    titleBar: TitleBar {
        dismissAction: ActionItem {
            title: qsTr("Back")
            onTriggered: {
                nav.pop()
            }
        }
        title: rawdate ? co.genStr(rawdate) : qsTr("Month View")
    }
    attachedObjects: [
        Common {
            id: co
        },
        SystemToast {
            id: sst
        }
    ]
    actionBarVisibility: ChromeVisibility.Compact
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    Container {
        ListView {
            dataModel: ArrayDataModel {
                id: adm
            }
            onTriggered: {
                var cur = adm.data(indexPath);
                var hpview = Qt.createComponent("Detail-SerialView.qml").createObject(nav);
                hpview.nav = nav;
                hpview.serialid = cur.id;
                nav.push(hpview)
            }
            property int fontsize: nav.fontsize
            listItemComponents: [
                ListItemComponent {
                    type: ""
                    ArticleItemTemplate {
                        id: shv
                        font_size: shv.ListItem.view.fontsize
                        tid: ListItemData.id
                        ttitle: ListItemData.title
                        tintro: ListItemData.excerpt
                        leftImage: "asset:///icon/ic_notes.png"
                    }
                }
            ]
            bottomPadding: 80.0
            bufferedScrollingEnabled: true
            scrollRole: ScrollRole.Main
        }
    }

}