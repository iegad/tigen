#ifndef APPOPTIONS_H
#define APPOPTIONS_H

#include <QObject>
#include <QColor>

class AppOptions : public QObject {
    Q_OBJECT
public:
    explicit AppOptions(QObject *parent = nullptr);


    QColor mainColor() const {
        return mainColor_;
    }

    void setMainColor(QColor color) {
        emit mainColorChanged(mainColor_);
        mainColor_ = color;
    }

    QColor leftBarColor() const {
        return leftBarColor_;
    }

    void setleftBarColor(QColor color) {
        emit leftBarColorChanged(leftBarColor_);
        leftBarColor_ = color;
    }

    QString avatarSource() const {
        return avatarSource_;
    }

    void setAvatarSource(QString source) {
        emit avatarSourceChanged(avatarSource_);
        avatarSource_ = source;
    }


    Q_PROPERTY(QColor mainColor READ mainColor WRITE setMainColor NOTIFY mainColorChanged)
    Q_PROPERTY(QColor leftBarColor READ leftBarColor WRITE setleftBarColor NOTIFY leftBarColorChanged)
    Q_PROPERTY(QString avatarSource READ avatarSource WRITE setAvatarSource NOTIFY avatarSourceChanged)


signals:
    void mainColorChanged(QColor before);
    void leftBarColorChanged(QColor before);
    void avatarSourceChanged(QString before);

private:
    QColor mainColor_ = {0x1E, 0x1E, 0x1E};
    QColor leftBarColor_ = {0x33, 0x33, 0x33};
    QString avatarSource_ = "qrc:/img/resources/avatar.jpg";
};

#endif // APPOPTIONS_H
