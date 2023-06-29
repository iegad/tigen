#include "wid_rux.h"
#include "ui_wid_rux.h"

wid_rux::wid_rux(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::wid_rux)
{
    ui->setupUi(this);
}

wid_rux::~wid_rux()
{
    delete ui;
}
