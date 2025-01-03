<script lang="ts">
	import ThemeController from '$lib/components/ThemeController.svelte';
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

<main class="w-full h-full">
	<nav class="container flex w-full items-center justify-between px-8 py-2">
		<h1 class="text-accent text-4xl">Tic Tac Toe</h1>
		<ThemeController />
	</nav>
	{@render children()}
</main>
