<script lang="ts">
	import { PlayersState } from '$lib/states/players.svelte';
	import { BoardState } from '$lib/states/board.svelte';
	import { fade, scale, fly, blur, draw, crossfade, slide } from 'svelte/transition';
	import { backOut, backIn, backInOut, bounceIn, cubicOut } from 'svelte/easing';
	import { cn } from '$lib/utils';
	
	let draws = $derived(PlayersState.totalGames - PlayersState.O.wins - PlayersState.X.wins);

	type CardProps = {
		player: 'X' | 'O';
		name: string | null;
		wins: number;
	};
</script>

{#snippet card(props: CardProps)}
	<h1
		transition:fade
		class={cn(
			'container flex w-full items-center justify-between rounded-full p-4',
			'bg-neutral text-neutral-content',
			'transition delay-75 duration-300 ease-in-out',
			BoardState.currentPlayer === 'X' && props.player === 'X' && 'ring-primary ring-2',
			BoardState.currentPlayer === 'O' && props.player === 'O' && 'ring-secondary ring-2'
		)}
	>
		{#if props.player === 'X'}
			<!-- Symbol -->
			<svg
				class={cn(
					'i-lucide-x size-7',
					BoardState.currentPlayer !== 'X' && 'text-neutral-content animate-flip',
					BoardState.currentPlayer === 'X' && 'text-primary animate-bounce'
				)}
			/>
			<!-- Name -->
			<span
				class={cn(
					'text-accent text-xl font-semibold',
					BoardState.currentPlayer === 'X' && 'text-primary animate-pulse'
				)}
			>
				{props.name}
			</span>
			<!-- Wins -->
			<span class={cn('text-error text-xl font-bold')}>
				{props.wins}
			</span>
		{:else}
			<!-- Wins -->
			<span class={cn('text-error text-xl font-bold')}>
				{props.wins}
			</span>
			<!-- Name -->
			<span
				class={cn(
					'text-accent text-xl font-semibold',
					BoardState.currentPlayer === 'O' && 'text-secondary animate-pulse'
				)}
			>
				{props.name}
			</span>
			<!-- Symbol -->
			<svg
				class={cn(
					'i-lucide-circle size-7',
					BoardState.currentPlayer !== 'O' && 'text-neutral-content animate-flip',
					BoardState.currentPlayer === 'O' && 'text-secondary animate-bounce'
				)}
			/>
		{/if}
	</h1>
{/snippet}

<section class={cn('flex w-full items-center justify-between sm:w-2/5')}>
	{@render card({
		player: 'X',
		name: PlayersState.X.name,
		wins: PlayersState.X.wins
	})}

	<h1 transition:fly class={cn('flex flex-col items-center justify-center px-4 text-2xl')}>
		<span class={cn('text-error text-2xl font-bold')}>{draws}</span>
		<span class="i-lucide-swords text-error animate-wiggle-slow size-8"> Draws </span>
	</h1>

	{@render card({
		player: 'O',
		name: PlayersState.O.name,
		wins: PlayersState.O.wins
	})}
</section>
