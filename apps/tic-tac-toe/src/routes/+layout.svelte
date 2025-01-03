<script lang="ts">
	import Navbar from '$lib/components/Navbar.svelte';
	import { onMount } from 'svelte';
	import { themeChange } from 'theme-change';
	import '../app.css';
	
	let { children } = $props();

	onMount(() => {
		themeChange(false);
	});
</script>

<svelte:head>
	<title>Tic-Tac-Toe</title>
</svelte:head>

<main class="h-full w-full">
	<Navbar />
	{@render children()}
</main>
