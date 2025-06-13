#include "httplib.h"
#include <iostream>

int main() {
    httplib::Server svr;
    svr.Get("/", [](const httplib::Request&, httplib::Response& res) {
        res.set_content("C++ Hardware Service", "text/plain");
    });
    int port = 3014;
    std::cout << "C++ Hardware Service running on port " << port << std::endl;
    svr.listen("0.0.0.0", port);
}
