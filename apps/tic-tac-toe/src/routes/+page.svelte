<script lang="ts">
	import { goto } from '$app/navigation';
	import { PlayersState } from '$lib/states/players.svelte';
	import { slide } from 'svelte/transition';
	let playerOName = '';
	let playerXName = '';

	const handlePlayerNames = (event: SubmitEvent) => {
		event.preventDefault();

		PlayersState.setPlayerName('O', playerOName);
		PlayersState.setPlayerName('X', playerXName);

		goto('/game');
	};
</script>

<section
	transition:slide={{ duration: 500, axis: 'x', delay: 100 }}
	class="flex items-center justify-center"
>
	<div class="card bg-base-100 w-96 shadow-xl">
		<div class="card-body gap-4">
			<h2 class="card-title">Tic Tac Toe!</h2>
			<form class="space-y-3" onsubmit={handlePlayerNames}>
				<label class="input input-bordered fill-accent hover:fill-primary flex items-center gap-2">
					<svg
						xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 24 24"
						class="size-6 fill-inherit opacity-70"
					>
						<path
							d="M18.3 5.71a1 1 0 00-1.42 0L12 10.59 7.12 5.71a1 1 0 00-1.42 1.42L10.59 12l-4.89 4.88a1 1 0 001.42 1.42L12 13.41l4.88 4.89a1 1 0 001.42-1.42L13.41 12l4.89-4.88a1 1 0 000-1.42z"
						/>
					</svg>
					<input
						required
						bind:value={playerXName}
						name="playerX"
						type="text"
						class="grow"
						placeholder="Name of Player X"
					/>
				</label>

				<label class="input input-bordered fill-accent hover:fill-primary flex items-center gap-2">
					<svg
						xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 24 24"
						class="size-6 fill-inherit opacity-70"
					>
						<path
							d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"
						/>
					</svg>
					<input
						required
						bind:value={playerOName}
						name="playerO"
						type="text"
						class="grow"
						placeholder="Name of Player O"
					/>
				</label>
				<div class="card-actions justify-center">
					<button type="submit" class="btn btn-primary w-full text-xl font-semibold">Play!</button>
				</div>
			</form>
		</div>
	</div>
</section>
