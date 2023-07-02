#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


int
main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QUrl url(u"qrc:/tigen/vMain.qml"_qs);
    engine.load(url);
    return app.exec();
}
