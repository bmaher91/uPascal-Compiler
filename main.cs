using System;
using System.Collections.Generic;

public class Driver {
    static public void Main(string[] args) {


        // User entered incorrect usage for our program
        if(args.Length == 0 || args.Length > 2) {
            Console.WriteLine(Constants.USAGE_HELP);
            Environment.Exit(0);
        }
        Scanner scanner = new Scanner();
        List<Token> tokens = scanner.initializeScanner(args[0]);
        Console.WriteLine(Constants.TOKEN_TABLE_HEADER_FORMAT,
            "TOKEN", "LINE", "COLUMN", "LEXEME"
        );
        foreach(Token token in tokens){
            Console.WriteLine(
                "{0,-12}{1,8}{2,8}\t{3}",
                token.Type.ToString(),
                token.Line,
                token.Column,
                token.Lexeme
            );
        }
        scanner.TestDriver();
    }
}
