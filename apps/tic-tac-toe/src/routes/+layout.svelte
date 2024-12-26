<script lang="ts">
	import '../app.css';
	let { children } = $props();
</script>

<svelte:head>
	<title>Tic-Tac-Toe</title>
</svelte:head>

{@render children()}
