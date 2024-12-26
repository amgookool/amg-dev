<script lang="ts">
	import { PlayersState } from '$lib/states/players.svelte';
	import { BoardState } from '$lib/states/board.svelte';
</script>

<section class="flex w-full items-center justify-between sm:w-2/5">
	<h1
		class="bg-accent text-accent-content container flex w-full items-center justify-between rounded-full p-4"
	>
		<span class="bg-primary rounded-badge text-primary-content px-1.5 py-0.5"
			>{PlayersState.X.symbol}</span
		>
		{PlayersState.X.name}
		<span class="">{PlayersState.X.wins}</span>
	</h1>
	<h1 class="flex flex-col items-center justify-center px-4 text-2xl">
		0 <span class="text-sm font-light">Draws</span>
	</h1>
	<h1
		class="bg-accent text-accent-content container flex w-full items-center justify-between rounded-full p-4"
	>
		<span class=""
			>{PlayersState.O.wins}</span
		>
		{PlayersState.O.name}
		<span class="bg-secondary text-secondary-content rounded-badge px-1.5 py-0.5">{PlayersState.O.symbol}</span>
	</h1>
</section>
