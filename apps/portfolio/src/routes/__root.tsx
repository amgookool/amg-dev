import { createTheme, CssBaseline, ThemeProvider } from "@mui/material";
import { createRootRoute, Outlet } from "@tanstack/react-router";
import { TanStackRouterDevtools } from "@tanstack/router-devtools";
import Navbar from "../components/Navigation/Navbar";

const darkTheme = createTheme({
  palette: {
    mode: "dark",
  },
});

export const Route = createRootRoute({
  component: () => (
    <>
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <main>
          <Navbar />
          <Outlet />
        </main>
        <TanStackRouterDevtools />
      </ThemeProvider>
    </>
  ),
});
