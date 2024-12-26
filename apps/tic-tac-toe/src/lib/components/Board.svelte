<script lang="ts">
	import { BoardState } from '$lib/states/board.svelte';
	import { cn } from '$lib/utils';

	type TileProps = {
		value: 'X' | 'O' | null;
		index: number;
		isDisabled: boolean;
	};

	const tilePlayerColor = (value: 'X' | 'O' | null) => {
		if (value === 'X') return 'text-primary';
		if (value === 'O') return 'text-secondary';
		return '';
	};

	const tilePlayerHover = (value: 'X' | 'O' | null) => {
		if (value === 'X') return 'hover:text-primary';
		if (value === 'O') return 'hover:text-secondary';
		return '';
	};

	const tileBorderStyles = (index: number) => {
		// const borderStyles = {
		//     'border-t-0': index < 3,
		//     'border-l-0': index % 3 === 0,
		//     'border-r-0': index % 3 === 2,
		//     'border-b-0': index > 5,
		// };

		// return cn(borderStyles);

		const newBorderStyles = {
			'border-e-2': index === 0 || index === 3 || index === 6,
			'border-b-2': index === 0 || index === 1 || index === 2,
			'border-s-2': index === 2 || index === 5 || index === 8,
			'border-t-2': index === 6 || index === 7 || index === 8
		};

		return cn(newBorderStyles);

		// let tileBorderIndexStyles = {
		// 	0: 'border-e-2 border-b-2',
		// 	1: 'border-b-2',
		// 	2: 'border-s-2 border-b-2',
		// 	3: 'border-e-2',
		// 	4: '',
		// 	5: 'border-s-2',
		// 	6: 'border-e-2 border-t-2',
		// 	7: 'border-t-2',
		// 	8: 'border-s-2 border-t-2'
		// };
	};

	const handleTileClick = (index: number) => {
		if (
			(BoardState.currentPlayer === 'X' || BoardState.currentPlayer === 'O') &&
			BoardState.cells[index] === null
		) {
			BoardState.setCell(index, BoardState.currentPlayer);
			BoardState.disabledCells[index] = true;
			BoardState.checkForWinner();
		}
		BoardState.switchPlayer();
	};

	const handlePlayAgain = () => {
		BoardState.resetGame();
	};
</script>

{#snippet tile(props: TileProps)}
	<button
		onclick={() => handleTileClick(props.index)}
		disabled={props.isDisabled}
		class={cn(
			'border-accent relative size-28 rounded-sm',
			props.isDisabled && 'cursor-not-allowed',
			tileBorderStyles(props.index)
		)}
	>
		<span
			class={cn(
				'text-4xl font-semibold',
				tilePlayerColor(props.value),
				tilePlayerHover(props.value)
			)}
		>
			{props.value}
		</span>
	</button>
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
	</div>
	{#if BoardState.winner}
		<h2 class="text-accent mt-2 text-2xl font-semibold">Winner: {BoardState.winner}</h2>
	{:else}
		<h2 class="text-accent mt-2 text-2xl font-semibold">
			Current Player: {BoardState.currentPlayer}
		</h2>
	{/if}
	<div class="mt-4 flex items-center justify-center gap-4">
		<a href="/" class="btn btn-accent btn-outline btn-block">Menu</a>
		<button onclick={handlePlayAgain} type="button" class="btn btn-accent btn-outline btn-block"
			>Play Again</button
		>
	</div>
</section>
