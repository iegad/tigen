#include "wid_classic.h"
#include "dlg_login.h"
#include "ui_wid_classic.h"

wid_classic::wid_classic(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::wid_classic) {
    ui->setupUi(this);
}


wid_classic::~wid_classic() {
    delete ui;
}


void
wid_classic::on_btnLogin_clicked() {
    auto login = (dlg_login*)parentWidget()->parent();

    login->login(ui->txtUser->text().toStdString(), ui->txtPwd->text().toStdString());
}

