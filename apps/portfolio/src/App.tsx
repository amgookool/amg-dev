// import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import { CssBaseline, ThemeProvider, createTheme } from "@mui/material";
import Navbar from "./components/Navigation/Navbar";

const darkTheme = createTheme({
  palette: {
    mode: "dark",
  },
});

function App() {
  // const [count, setCount] = useState(0)

  return (
    <>
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <Navbar />
      </ThemeProvider>
    </>
  );
}

export default App;
