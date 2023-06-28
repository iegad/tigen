#ifndef WID_QRCODE_H
#define WID_QRCODE_H

#include <QWidget>

namespace Ui {
class wid_qrcode;
}

class wid_qrcode : public QWidget
{
    Q_OBJECT

public:
    explicit wid_qrcode(QWidget *parent = nullptr);
    ~wid_qrcode();

private:
    Ui::wid_qrcode *ui;
};

#endif // WID_QRCODE_H
