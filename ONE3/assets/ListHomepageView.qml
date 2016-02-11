import bb.cascades 1.4
import bb.device 1.4
import bb.system 1.2
Page {
    property variant nav
    function setActive() {
        if (hplistview.setActive) {
            hplistview.setActive();
        }
    }
    titleBar: TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                leftPadding: 10.0
                rightPadding: 10.0
                ImageView {
                    imageSource: "asset:///icon/ic_all.png"
                    scalingMethod: ScalingMethod.AspectFit
                    verticalAlignment: VerticalAlignment.Center
                    filterColor: ui.palette.primaryBase
                    gestureHandlers: TapHandler {
                        onTapped: {
                            console.log("ALL SERIES")
                            //TODO SHOW ALL HOMEPAGE ENTRIES
                        }
                    }
                }
                ImageView {
                    imageSource: "asset:///res/nav_title.png"
                    verticalAlignment: VerticalAlignment.Center
                    scalingMethod: ScalingMethod.AspectFit
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0

                    }
                }
                ImageView {
                    imageSource: "asset:///icon/ic_search.png"
                    scalingMethod: ScalingMethod.AspectFit
                    verticalAlignment: VerticalAlignment.Center
                    filterColor: ui.palette.primaryBase
                    gestureHandlers: TapHandler {
                        onTapped: {
                            console.log("SEARCH")
                            //TODO SHOW SEARCH PANEL
                        }
                    }
                }
            }

        }

    }
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    actionBarVisibility: ChromeVisibility.Compact
    ListView {
        id: hplistview
        property string endpoint: "http://v3.wufazhuce.com:8000/api/hp/idlist/0"
        attachedObjects: [
            DisplayInfo {
                id: di
            },
            Common {
                id: co
            },
            SystemToast {
                id: sst
            },
            ListScrollStateHandler {
                onFirstVisibleItemChanged: {
                    if (firstVisibleItem.setActive) {
                        firstVisibleItem.setActive()
                    }
                }
            }
        ]
        dataModel: ArrayDataModel {
            id: adm
        }
        scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
        snapMode: SnapMode.LeadingEdge
        flickMode: FlickMode.SingleItem
        layout: StackListLayout {
            orientation: LayoutOrientation.LeftToRight
            headerMode: ListHeaderMode.None
        }
        verticalAlignment: VerticalAlignment.Fill
        property int width: di.pixelSize.width
        listItemComponents: [
            ListItemComponent {
                type: ""
                SingleHomepageView {
                    hid: ListItemData.id
                    id: shv
                    verticalAlignment: VerticalAlignment.Fill
                    preferredWidth: shv.ListItem.view.width
                    onRequestAuthorView: {
                        shv.ListItem.view.invokeAuthorView(authorid)
                    }
                    onRequestImageView: {
                        shv.ListItem.view.invokeImageViewer(src)
                    }
                }
            }
        ]
        function invokeAuthorView(authorid) {
            //TODO AUTHORVIEW
        }
        function invokeImageViewer(imgsrc) {
            _app.viewimage(imgsrc)
        }
        onCreationCompleted: {
            co.ajax("GET", endpoint, [], function(b, d) {
                    if (b) {
                        d = JSON.parse(d);
                        if (d.data) {
                            for (var i = 0; i < d.data.length; i ++) {
                                adm.append({
                                        "id": d.data[i]
                                    })
                            }
                        }
                    } else {
                        sst.body = d;
                        sst.show();
                    }
                }, [], false)
        }
    }

}