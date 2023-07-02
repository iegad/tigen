#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


int
main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QUrl url(u"qrc:/tigen/vMain.qml"_qs);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl) {
                QCoreApplication::exit(-1);
            }
        },
    Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}
