import {} from "react";
import { Box, Container } from "@mui/material";
import { Link as TanstackLink } from "@tanstack/react-router";
import Link from "@mui/material/Link";
import { Button } from "@mui/material";

const Navbar = () => {
  return (
    <Box
      component={"nav"}
      sx={{
        px: 2,
        py: 0,
        width: "100%",
        display: "flex",
        justifyContent: "space-between",
        alignContent: "center",
      }}
    >
      <Container
        sx={{
          placeItems: "start",
          placeContent: "center",
          color: "primary.main",
        }}
      >
        <TanstackLink
          to="/"
          className="no-underline flex items-center justify-center gap-1.5"
        >
          <span className="iconify devicon--anaconda size-8"></span>
          <h1 className="">Adrian Gookool</h1>
        </TanstackLink>
      </Container>
      <Container sx={{ placeItems: "end", placeContent: "center" }}>
        <TanstackLink
          to="/projects"
          className="no-underline flex items-center justify-center gap-1.5"
        >
          <Link
            bgcolor="info"
            underline="hover"
            variant="button"
            component={Button}
            textAlign={"center"}
          >
            Projects
          </Link>
        </TanstackLink>
      </Container>
    </Box>
  );
};

export default Navbar;
