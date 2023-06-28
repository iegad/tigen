#ifndef WID_CLASSIC_H
#define WID_CLASSIC_H

#include <QWidget>

namespace Ui {
class wid_classic;
}

class wid_classic : public QWidget
{
    Q_OBJECT

public:
    explicit wid_classic(QWidget *parent = nullptr);
    ~wid_classic();

private slots:
    void on_btnLogin_clicked();

private:
    Ui::wid_classic *ui;
};

#endif // WID_CLASSIC_H
