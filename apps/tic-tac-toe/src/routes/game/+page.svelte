<script lang="ts">
	import Board from '$lib/components/Board.svelte';
	import ScoreCard from '$lib/components/ScoreCard.svelte';
	import { slide } from 'svelte/transition';
</script>

<section
	transition:slide={{ duration: 500, axis: 'y', delay: 100 }}
	class="flex w-full flex-col items-center justify-center gap-8"
>
	<ScoreCard />
	<Board />
</section>
