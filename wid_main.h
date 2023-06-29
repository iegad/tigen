#ifndef WID_MAIN_H
#define WID_MAIN_H


#include <QWidget>
#include <vector>
#include "wid_rux.h"


QT_BEGIN_NAMESPACE
namespace Ui { class wid_main; }
QT_END_NAMESPACE

class wid_main : public QWidget {
    Q_OBJECT

public:
    wid_main(QWidget *parent = nullptr);
    virtual ~wid_main();

private:
signals:


private slots:


private:
    Ui::wid_main *ui;
    wid_rux *widRux;
};
#endif // WID_MAIN_H
