#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "AppOptions.h"


int
main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QUrl url(u"qrc:/tigen/main.qml"_qs);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl) {
                QCoreApplication::exit(-1);
            }
        },
    Qt::QueuedConnection);

    AppOptions* appOptions = new AppOptions;
    engine.rootContext()->setContextProperty("$appOptions", appOptions);
    engine.load(url);
    return app.exec();
}
