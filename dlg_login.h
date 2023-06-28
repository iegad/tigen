#ifndef DLG_LOGIN_H
#define DLG_LOGIN_H


#include <QDialog>
#include "wid_classic.h"
#include "wid_qrcode.h"


namespace Ui {
class dlg_login;
}

class dlg_login : public QDialog {
    Q_OBJECT

public:
    explicit dlg_login(QWidget *parent = nullptr);
    ~dlg_login();


    void login(const std::string& user, const std::string &pwd);


private slots:
    void on_btnChangeLoginWay_clicked();

private:
    void _showWidQrcode();
    void _showWidClassic();

    Ui::dlg_login *ui;

    wid_qrcode  *widQrcode;
    wid_classic *widClassic;
};

#endif // DLG_LOGIN_H
