import {} from "react";
import { Box, Container } from "@mui/material";
import { Link } from "@tanstack/react-router";
import { Button } from "@mui/material";

const Navbar = () => {
  return (
    <Box
      component={"nav"}
      sx={{
        px: 2,
        py: 0,
        color: "primary.main",
        display: "flex",
        justifyContent: "space-between",
        alignContent: "center",
      }}
    >
      <Container
        sx={{ width: "100%", placeItems: "start", placeContent: "center" }}
      >
        <Link
          to="/"
          className="no-underline flex items-center justify-center gap-1.5"
        >
          <span className="iconify devicon--anaconda size-8"></span>
          <h1>Adrian Gookool</h1>
        </Link>
      </Container>
      <Container
        sx={{ width: "100%", placeItems: "end", placeContent: "center" }}
      >
        <Link to="/projects" className="no-underline">
          <Button variant="contained" color="secondary">
            Projects
          </Button>
        </Link>
      </Container>
    </Box>
  );
};

export default Navbar;
