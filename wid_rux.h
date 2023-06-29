#ifndef WID_RUX_H
#define WID_RUX_H

#include <QWidget>

namespace Ui {
class wid_rux;
}

class wid_rux : public QWidget
{
    Q_OBJECT

public:
    explicit wid_rux(QWidget *parent = nullptr);
    ~wid_rux();

private:
    Ui::wid_rux *ui;
};

#endif // WID_RUX_H
