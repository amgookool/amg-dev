<script lang="ts">
	import { BoardState } from '$lib/states/board.svelte';
	import { PlayersState } from '$lib/states/players.svelte';
	import { fly, scale, slide } from 'svelte/transition';

	let draws = $derived(PlayersState.totalGames - PlayersState.O.wins - PlayersState.X.wins);

	type CardProps = {
		player: 'X' | 'O';
		name: string | null;
		wins: number;
	};
</script>

{#snippet card(props: CardProps)}
	<h1
		transition:scale={{ delay: 900, duration: 400 }}
		class={[
			'container flex w-full items-center justify-between rounded-full p-4',
			'bg-neutral text-neutral-content',
			'transition delay-75 duration-300 ease-in-out',
			BoardState.currentPlayer === 'X' && props.player === 'X' && 'ring-primary ring-2',
			BoardState.currentPlayer === 'O' && props.player === 'O' && 'ring-secondary ring-2'
		]}
	>
		{#if props.player === 'X'}
			<!-- Symbol -->
			<svg
				transition:fly={{ delay: 1500, duration: 500, y: 100 }}
				class={[
					'i-lucide-x size-7',
					BoardState.currentPlayer !== 'X' && 'text-neutral-content animate-flip',
					BoardState.currentPlayer === 'X' && 'text-primary animate-bounce'
				]}
			/>
			<!-- Name -->
			<span
				transition:fly={{ delay: 1500, duration: 500, y: 100 }}
				class={[
					'text-accent text-xl font-semibold',
					BoardState.currentPlayer === 'X' && 'text-primary animate-pulse'
				]}
			>
				{props.name}
			</span>
			<!-- Wins -->
			<span
				transition:fly={{ delay: 1500, duration: 500, y: 100 }}
				class={['text-error text-xl font-bold']}
			>
				{props.wins}
			</span>
		{:else}
			<!-- Wins -->
			<span
				transition:fly={{ delay: 1500, duration: 500, y: 100 }}
				class={['text-error text-xl font-bold']}
			>
				{props.wins}
			</span>
			<!-- Name -->
			<span
				transition:fly={{ delay: 1500, duration: 500, y: 100 }}
				class={[
					'text-accent text-xl font-semibold',
					BoardState.currentPlayer === 'O' && 'text-secondary animate-pulse'
				]}
			>
				{props.name}
			</span>
			<!-- Symbol -->
			<svg
				transition:fly={{ delay: 1500, duration: 500, y: 100 }}
				class={[
					'i-lucide-circle size-7',
					BoardState.currentPlayer !== 'O' && 'text-neutral-content animate-flip',
					BoardState.currentPlayer === 'O' && 'text-secondary animate-bounce'
				]}
			/>
		{/if}
	</h1>
{/snippet}

<section
	transition:slide={{ axis: 'y', delay: 500 }}
	class={['flex w-full items-center justify-between sm:w-2/5']}
>
	{@render card({
		player: 'X',
		name: PlayersState.X.name,
		wins: PlayersState.X.wins
	})}

	<h1
		transition:scale={{ delay: 1000 }}
		class={['flex flex-col items-center justify-center px-4 text-2xl']}
	>
		<span class={['text-error text-2xl font-bold']}>{draws}</span>
		<span class="i-lucide-swords text-error animate-wiggle-slow size-8"> Draws </span>
	</h1>

	{@render card({
		player: 'O',
		name: PlayersState.O.name,
		wins: PlayersState.O.wins
	})}
</section>
