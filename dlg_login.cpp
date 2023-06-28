#include "dlg_login.h"
#include "ui_dlg_login.h"
#include <qmessagebox.h>


dlg_login::dlg_login(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::dlg_login)
    , widQrcode(nullptr)
    , widClassic(nullptr) {
    ui->setupUi(this);

    widQrcode = new wid_qrcode(ui->widMain);
    widClassic = new wid_classic(ui->widMain);

    _showWidClassic();
}


dlg_login::~dlg_login() {
    delete ui;
}


void
dlg_login::login(const std::string& user, const std::string &pwd) {
    if (user == "iegad" && pwd == "1111") {
        accept();
    } else {
        QMessageBox::critical(this, "Error Tips", tr("用户名/密码错误"));
    }
}


void
dlg_login::on_btnChangeLoginWay_clicked() {
    if (widQrcode->visibleRegion().isNull()) {
        _showWidQrcode();
    } else {
        _showWidClassic();
    }
}


void
dlg_login::_showWidQrcode() {
    widQrcode->show();
    widClassic->hide();
}


void
dlg_login::_showWidClassic() {
    widQrcode->hide();
    widClassic->show();
}

