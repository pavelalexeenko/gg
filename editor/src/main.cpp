#include <QApplication>
#include <QMainWindow>

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);

    QMainWindow window;


    window.show();

    return app.exec();
}

//int main(int argc, char* argv[])
//{
//    Fling::Engine Engine = {};
//
//    try
//    {
//        // Run with editor and IMGUI
//
//        // Just run with the game and No editor features.
//        Engine.Run<Sandbox::Game>();
//    }
//    catch (const std::exception & e)
//    {
//        std::cerr << e.what() << std::endl;
//        return EXIT_FAILURE;
//    }
//
//    return EXIT_SUCCESS;
//}