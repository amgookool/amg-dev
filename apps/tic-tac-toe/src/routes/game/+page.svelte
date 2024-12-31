<script lang="ts">
	import Board from '$lib/components/Board.svelte';
	import ScoreCard from '$lib/components/ScoreCard.svelte';
</script>

<section class="flex w-full flex-col items-center justify-center gap-8">
	<ScoreCard />
	<Board />
</section>
