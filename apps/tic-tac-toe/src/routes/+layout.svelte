<script lang="ts">
	import Navbar from '$lib/components/Navbar.svelte';
	import '../app.css';

	let { children } = $props();
</script>

<svelte:head>
	<title>Tic-Tac-Toe</title>
</svelte:head>

<main class="h-full w-full">
	<Navbar />
	{@render children()}
</main>
