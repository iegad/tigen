#include "wid_qrcode.h"
#include "ui_wid_qrcode.h"

wid_qrcode::wid_qrcode(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::wid_qrcode) {
    ui->setupUi(this);
    QPixmap *pixmap = new QPixmap("D:/iegad/tigen/resources/qrcode.png");
    pixmap->scaled(ui->imgQrCode->size(), Qt::KeepAspectRatio);
    ui->imgQrCode->setPixmap(*pixmap);
}

wid_qrcode::~wid_qrcode() {
    delete ui;
}
