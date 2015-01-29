using System;
using System.IO;
using System.Collections.Generic;

public class Scanner {
    private int curByte = 0;
    private byte[] __bytes;
    private List<Tuple<string, TOKENS>> __tokens;

    // Initializes the scanner and checks for file format
    public void initializeScanner(string fileName) {
        try {
            if(!fileName.EndsWith(".mp")) {
                // File format exception
                throw new Exception(Constants.ERROR_FILE_FORMAT);
            } else {
                // Grab all bytes from the file
                this.__bytes = File.ReadAllBytes(fileName);

                // Caching variables to save memory
                int i = 0,
                    length = __bytes.Length;
                string ws = Constants.WHITESPACE;

                // Loop through, ignoring whitespace
                for(i=0; i<length; i++) {
                    if(ws.Contains(""+__bytes[i])) {
                        continue;
                    } else {
                        getNextToken();
                    }
                }
            }
        } catch(Exception ex) {
            Console.WriteLine(ex);
        }
    }

    // This is the dispatcher
    private int getNextToken() {
        return 0; // change this
    }

    private int getLineNumber() {
        return 0; // change this
    }

    private int getColumnNumber() {
        return 0; // change this
    }

    // Finite State Automatons
    private int fsaLetter() {
        return 0; // change this
    }

    private Tuple<string, TOKENS> fsaDigit() {
        string lexeme = "";
        bool done = false;
        string DIGITS = Constants.DIGITS;
        TOKENS token = null;
        char next = '';
        S0: //Start state
            next = __bytes[curByte];
            curByte++;
            if(DIGITS.Contains("" + next)){
                lexeme += next;
                goto S1;
            } else {
                curByte--;
                throw new Exception(
                    "Dispatcher done goofed. Passed " +
                    next + " to the digit FSA, but " +  next +
                    "is not a digit."
                );
            }
        S1:
            token = TOKENS.INTEGER_LIT;
            next = __bytes[curByte];
            curByte++;
            if(DIGITS.Contains("" + next)){
                lexeme += next;
                goto S1;
            } else if(next == '.'){
                lexeme += next;
                goto S2;
            } else if(next == 'e' || next == 'E'){
                lexeme += next;
                goto S4;
            } else { //This is a success state, so reset the fp and return the lexeme
                curByte--; //reset the fp
                return new Tuple<lexeme, token>;
            }
        S2:
            next = __bytes[curByte];
            curByte++;
            if(DIGITS.Contains("" + next)){
                lexeme += next;
                goto S3;
            } else {
                curByte -= 2;
                return new Tuple<lexeme, token>;
            }
        S3:
            token = TOKENS.FIXED_LIT;
            next = __bytes[curByte];
            curByte++;
            if(DIGITS.Contains("" + next)){
                lexeme += next;
                goto S3;
            } else if(next == 'e' || next == 'E'){
                lexeme += next;
                goto S4;
            } else {
                curByte--;
                return new Tuple<lexeme, token>;
            }
        S4:
            next = __bytes[curByte];


        return 0; // change this
    }

    private int fsaPunct() { // doesn't include quotes
        return 0; // change this
    }

    private int fsaString() { // surrounded by quotes
        return 0; // change this
    }
}
