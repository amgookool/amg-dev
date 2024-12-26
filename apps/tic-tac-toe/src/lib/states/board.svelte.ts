export const BoardState = $state({
    cells: Array(9).fill(null) as ('X' | 'O' | null)[],
    disabledCells: Array(9).fill(false) as boolean[],
    currentPlayer: 'X' as 'X' | 'O',
    winner: null as 'X' | 'O' | null,
    isDraw: false as boolean,
    isGameOver: false as boolean,

    setCell(index: number, symbol: 'X' | 'O') {
        this.cells[index] = symbol;
    },

    switchPlayer() {
        this.currentPlayer = this.currentPlayer === 'X' ? 'O' : 'X';
    },

    setWinner(symbol: 'X' | 'O') {
        this.winner = symbol;
    },

    setDraw() {
        this.isDraw = true;
    },

    setGameOver() {
        this.isGameOver = true;
    },

    resetGame() {
        this.cells = Array(9).fill(null);
        this.disabledCells = Array(9).fill(false);
        this.currentPlayer = 'X';
        this.winner = null;
        this.isDraw = false;
        this.isGameOver = false;
    },

    checkForWinner() {
        const winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
            [0, 4, 8], [2, 4, 6] // diagonals
        ];

        for (const combination of winningCombinations) {
            const [a, b, c] = combination;
            // check if the cells are not null and are equal for winner
            if (this.cells[a] && this.cells[a] === this.cells[b] && this.cells[a] === this.cells[c]) {
                this.setWinner(this.cells[a]);
                this.disabledCells = Array(9).fill(true);
                this.setGameOver();
                return;
            }
            // check if all cells are filled for draw and no winning combination
            if (!this.cells.includes(null) && !this.winner) {
                this.setDraw();
                this.setGameOver();
            }
        }
    }
});