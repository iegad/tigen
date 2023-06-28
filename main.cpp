#include "dlg_login.h"
#include "widget.h"
#include "xq/net/net.in.h"
#include <QApplication>

int
main(int argc, char *argv[]) {
    ASSERT(!rux_env_init());

    QApplication a(argc, argv);

    int n = 1;

    do {
        dlg_login login;
        if (login.exec() == QDialog::Rejected) {
            break;
        }

        Widget w;
        w.show();
        n = a.exec();
    } while(0);

    ASSERT(!rux_env_release());
    return n;
}
