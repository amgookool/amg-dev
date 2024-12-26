<script lang="ts">
	import { PlayersState } from '$lib/states/players.svelte';
	import Board from '$lib/components/Board.svelte';
	import ScoreCard from '$lib/components/ScoreCard.svelte';
	$inspect(PlayersState.O);
	$inspect(PlayersState.X);
</script>

<main class="flex w-full flex-col items-center justify-center gap-8 my-12">
	<ScoreCard />
	<Board />
</main>
