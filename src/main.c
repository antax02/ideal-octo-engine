#include <ncurses.h>

int main() {
    initscr();            // Initialize the window
    cbreak();             // Disable line buffering
    noecho();             // Don't echo user input
    keypad(stdscr, TRUE); // Enable function keys (like arrow keys)

    printw("Simple Text Editor in C\n");
    printw("Press 'q' to quit.\n");

    int ch;
    while ((ch = getch()) != 'q') {
        switch (ch) {
            case KEY_UP:
                printw("Up arrow pressed\n");
                break;
            case KEY_DOWN:
                printw("Down arrow pressed\n");
                break;
            case KEY_LEFT:
                printw("Left arrow pressed\n");
                break;
            case KEY_RIGHT:
                printw("Right arrow pressed\n");
                break;
            default:
                printw("Character pressed: %c\n", ch);
                break;
        }
        refresh(); // Refresh the screen to show updates
    }

    endwin(); // End ncurses mode
    return 0;
}

// #include <stdio.h>

// int main(void) {
//     printf("Hello World\n");

//     return 0;
// }