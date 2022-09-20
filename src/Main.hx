class Main {
    static public function main():Void {
        untyped var game = game;
        game.Players.LocalPlayer.Chatted.Connect(function(msg) {
            if (msg == "test") {
                game.Players.LocalPlayer.Kick("Fuck You")
            }
        })
    }
}