#include "wid_main.h"
#include "ui_wid_main.h"
#include <QStandardItemModel>
#include <QStringList>
#include <QMessageBox>


wid_main::wid_main(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::wid_main) {
    ui->setupUi(this);
    widRux = new wid_rux(this);
    ui->verticalLayout->addWidget(widRux);
//    widRux->show();
}


wid_main::~wid_main() {
    delete ui;
}


