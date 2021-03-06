# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/ArticleItemTemplate.qml) \
        $$quote($$BASEDIR/assets/Common.qml) \
        $$quote($$BASEDIR/assets/Detail-EssayView.qml) \
        $$quote($$BASEDIR/assets/Detail-HPView.qml) \
        $$quote($$BASEDIR/assets/Detail-MovieView.qml) \
        $$quote($$BASEDIR/assets/Detail-MusicView.qml) \
        $$quote($$BASEDIR/assets/Detail-QAView.qml) \
        $$quote($$BASEDIR/assets/Detail-SerialView.qml) \
        $$quote($$BASEDIR/assets/ListEssayView.qml) \
        $$quote($$BASEDIR/assets/ListHomepageView.qml) \
        $$quote($$BASEDIR/assets/ListMovieView.qml) \
        $$quote($$BASEDIR/assets/ListMusicView.qml) \
        $$quote($$BASEDIR/assets/Month-Essay-ListView.qml) \
        $$quote($$BASEDIR/assets/Month-HP-ListView.qml) \
        $$quote($$BASEDIR/assets/Month-QA-ListView.qml) \
        $$quote($$BASEDIR/assets/Month-Serials-ListView.qml) \
        $$quote($$BASEDIR/assets/Page-About.qml) \
        $$quote($$BASEDIR/assets/Page-Articles-By-Month.qml) \
        $$quote($$BASEDIR/assets/Page-By-Month.qml) \
        $$quote($$BASEDIR/assets/Page-Search-Essay.qml) \
        $$quote($$BASEDIR/assets/Page-Search-Movie.qml) \
        $$quote($$BASEDIR/assets/Page-Search-Music.qml) \
        $$quote($$BASEDIR/assets/Page-Search-Pic.qml) \
        $$quote($$BASEDIR/assets/Page-Settings.qml) \
        $$quote($$BASEDIR/assets/Page-Sponsor.qml) \
        $$quote($$BASEDIR/assets/Readme.qml) \
        $$quote($$BASEDIR/assets/SearchPictureTemplate.qml) \
        $$quote($$BASEDIR/assets/SingleEssayView.qml) \
        $$quote($$BASEDIR/assets/SingleHomepageView.qml) \
        $$quote($$BASEDIR/assets/SingleMovieEntryView.qml) \
        $$quote($$BASEDIR/assets/SingleMusicView.qml) \
        $$quote($$BASEDIR/assets/WebBrowser.qml) \
        $$quote($$BASEDIR/assets/font/BradleyHandITCTTBold.ttf) \
        $$quote($$BASEDIR/assets/icon/ic_all.png) \
        $$quote($$BASEDIR/assets/icon/ic_copy.png) \
        $$quote($$BASEDIR/assets/icon/ic_diagnostics.png) \
        $$quote($$BASEDIR/assets/icon/ic_doctype_generic.png) \
        $$quote($$BASEDIR/assets/icon/ic_doctype_music.png) \
        $$quote($$BASEDIR/assets/icon/ic_doctype_video.png) \
        $$quote($$BASEDIR/assets/icon/ic_edit_bookmarks.png) \
        $$quote($$BASEDIR/assets/icon/ic_email_dk.png) \
        $$quote($$BASEDIR/assets/icon/ic_help.png) \
        $$quote($$BASEDIR/assets/icon/ic_history.png) \
        $$quote($$BASEDIR/assets/icon/ic_home.png) \
        $$quote($$BASEDIR/assets/icon/ic_info.png) \
        $$quote($$BASEDIR/assets/icon/ic_microphone.png) \
        $$quote($$BASEDIR/assets/icon/ic_microphone_mute.png) \
        $$quote($$BASEDIR/assets/icon/ic_next.png) \
        $$quote($$BASEDIR/assets/icon/ic_notes.png) \
        $$quote($$BASEDIR/assets/icon/ic_open.png) \
        $$quote($$BASEDIR/assets/icon/ic_open_link.png) \
        $$quote($$BASEDIR/assets/icon/ic_pause.png) \
        $$quote($$BASEDIR/assets/icon/ic_play.png) \
        $$quote($$BASEDIR/assets/icon/ic_previous.png) \
        $$quote($$BASEDIR/assets/icon/ic_search.png) \
        $$quote($$BASEDIR/assets/icon/ic_share.png) \
        $$quote($$BASEDIR/assets/icon/ic_speaker_dk.png) \
        $$quote($$BASEDIR/assets/icon/ic_speaker_mute.png) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/one3.spon) \
        $$quote($$BASEDIR/assets/res/144.png) \
        $$quote($$BASEDIR/assets/res/github.png) \
        $$quote($$BASEDIR/assets/res/icon.png) \
        $$quote($$BASEDIR/assets/res/merrick.png) \
        $$quote($$BASEDIR/assets/res/movie_play.png) \
        $$quote($$BASEDIR/assets/res/music_cover.png) \
        $$quote($$BASEDIR/assets/res/music_tone.png) \
        $$quote($$BASEDIR/assets/res/nav_title.png) \
        $$quote($$BASEDIR/assets/res/xiami.png) \
        $$quote($$BASEDIR/assets/xiami.css)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/WebImageView.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/WebImageView.h) \
        $$quote($$BASEDIR/src/applicationui.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/font/*.qml) \
        $$quote($$BASEDIR/../assets/font/*.js) \
        $$quote($$BASEDIR/../assets/font/*.qs) \
        $$quote($$BASEDIR/../assets/icon/*.qml) \
        $$quote($$BASEDIR/../assets/icon/*.js) \
        $$quote($$BASEDIR/../assets/icon/*.qs) \
        $$quote($$BASEDIR/../assets/res/*.qml) \
        $$quote($$BASEDIR/../assets/res/*.js) \
        $$quote($$BASEDIR/../assets/res/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}_zh_CN.ts) \
    $$quote($${TARGET}_zh_TW.ts) \
    $$quote($${TARGET}.ts)
