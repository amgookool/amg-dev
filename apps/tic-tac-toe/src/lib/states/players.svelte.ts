export const PlayersState = $state({
	X: {
		name: 'Player X',
		symbol: 'X',
		wins: 0
	},
	O: {
		name: 'Player O',
		symbol: 'O',
		wins: 0
	},
	totalGames: 0,

	setPlayerName(player: 'X' | 'O', name: string) {
		this[player].name = name;
	},

	incrementWins(player: 'X' | 'O') {
		this[player].wins++;
	},

	incrementTotalGames() {
		this.totalGames++;
	},

	resetScores() {
		this.X.wins = 0;
        this.O.wins = 0;
        this.totalGames = 0;
	}
});
