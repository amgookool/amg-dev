<script lang="ts" module>
	import { goto } from '$app/navigation';
	import { BoardState } from '$lib/states/board.svelte';
	import { PlayersState } from '$lib/states/players.svelte';
	import { cn } from '$lib/utils';

	export const tilePlayerColor = (value: 'X' | 'O' | null) => {
		if (value === 'X') return 'text-primary';
		if (value === 'O') return 'text-secondary';
		return '';
	};

	export const tileBorderStyles = (index: number) => {
		const newBorderStyles = {
			'border-e-2': index === 0 || index === 3 || index === 6,
			'border-b-2': index === 0 || index === 1 || index === 2,
			'border-s-2': index === 2 || index === 5 || index === 8,
			'border-t-2': index === 6 || index === 7 || index === 8
		};

		return cn(newBorderStyles);
	};

	export const handleTileClick = (index: number) => {
		if (
			(BoardState.currentPlayer === 'X' || BoardState.currentPlayer === 'O') &&
			BoardState.cells[index] === null
		) {
			BoardState.setCell(index, BoardState.currentPlayer);
			BoardState.disabledCells[index] = true;
			BoardState.checkForWinner();

			if (BoardState.winningCombination.length) {
			}

			if (BoardState.winningCombination.length > 0) {
				BoardState.winningCombination.forEach((winningIndex) => {});
			}

			if (BoardState.winner && BoardState.winner === 'X') {
				PlayersState.incrementWins('X');
				PlayersState.incrementTotalGames();
			} else if (BoardState.winner && BoardState.winner === 'O') {
				PlayersState.incrementWins('O');
				PlayersState.incrementTotalGames();
			}

			if (BoardState.winner === null && BoardState.isDraw) PlayersState.incrementTotalGames();
		}
		BoardState.switchPlayer();
	};

	export const getStrikeThroughString = (winningCombination: number[]) => {
		if (winningCombination.length === 0) return null;
		// Row top
		if ([0, 1, 2].every((index) => winningCombination.includes(index)))
			return 'top-[16%] h-2 w-full';
		// Row middle
		if ([3, 4, 5].every((index) => winningCombination.includes(index)))
			return 'top-[50%] h-2 w-full';
		// Row bottom
		if ([6, 7, 8].every((index) => winningCombination.includes(index)))
			return 'top-[83.5%] h-2 w-full';
		// Column left
		if ([0, 3, 6].every((index) => winningCombination.includes(index)))
			return 'left-[15.5%] top-[5%] h-[92%] w-2';
		// Column middle
		if ([1, 4, 7].every((index) => winningCombination.includes(index)))
			return 'left-[49.5%] top-[5%] h-[92%] w-2';
		// Column right
		if ([2, 5, 8].every((index) => winningCombination.includes(index)))
			return 'left-[83%] top-[5%] h-[92%] w-2';
		// Diagonal from left top to right bot
		if ([0, 4, 8].every((index) => winningCombination.includes(index)))
			return ' left-5 top-[50%] h-2 w-[90%] skew-y-[45deg] transform bg-black';
		// Diagonal from left bot to right top
		if ([2, 4, 6].every((index) => winningCombination.includes(index)))
			return 'left-3 top-[50%] h-2 w-[90%] skew-y-[-45deg] transform';
	};
</script>

<script lang="ts">
	type TileProps = {
		value: 'X' | 'O' | null;
		index: number;
		isDisabled: boolean;
	};

	const navigateHome = () => {
		PlayersState.reset();
		BoardState.resetGame();
		goto('/');
	};
</script>

{#snippet tile(props: TileProps)}
	<button
		onclick={() => handleTileClick(props.index)}
		disabled={props.isDisabled}
		class={cn(
			'border-accent relative size-28 rounded-sm',
			props.isDisabled && 'cursor-not-allowed',
			tileBorderStyles(props.index),
			BoardState.winningCombination.includes(props.index) && ''
		)}
	>
		<span class={cn('text-4xl font-semibold', tilePlayerColor(props.value))}>
			{props.value}
		</span>
	</button>
{/snippet}

{#snippet boardStrikes(winningCombination: number[])}
	<div class={cn('absolute bg-accent', getStrikeThroughString(winningCombination))}></div>
{/snippet}

<section class="flex w-full flex-col items-center justify-center">
	<div class="relative">
		{#each [0, 1, 2] as row}
			<div class="flex">
				{#each [0, 1, 2] as col}
					{@render tile({
						index: row * 3 + col,
						value: BoardState.cells[row * 3 + col],
						isDisabled: BoardState.disabledCells[row * 3 + col]
					})}
				{/each}
			</div>
		{/each}
		{#if BoardState.winningCombination.length > 0 && BoardState.winner}
			{@render boardStrikes(BoardState.winningCombination)}
		{/if}
	</div>
	{#if BoardState.winner}
		<h2 class="text-accent mt-2 text-2xl font-semibold">
			Winner: {BoardState.winner === 'X' ? PlayersState.X.name : PlayersState.O.name}
		</h2>
	{:else}
		<h2 class="text-accent mt-2 text-2xl font-semibold">
			Current Player: {BoardState.currentPlayer === 'X' ? PlayersState.X.name : PlayersState.O.name}
		</h2>
	{/if}
	<div class="mt-4 flex items-center justify-center gap-4">
		<button onclick={navigateHome} class="btn btn-lg sm:btn-block btn-accent btn-outline"
			>Main Menu</button
		>
		<button
			onclick={() => BoardState.resetGame()}
			type="button"
			class="btn btn-lg sm:btn-block btn-accent btn-outline">Play Again</button
		>
	</div>
</section>
