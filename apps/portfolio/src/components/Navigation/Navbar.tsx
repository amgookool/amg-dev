import {} from "react";
import Box from "@mui/material/Box";

const Navbar = () => {
  return (
    <Box
      component={"nav"}
      sx={{
        px: 8,
        py: 6,
        color: "violet",
        display: "flex",
        justifyContent: "space-between",
        alignContent: "center",
        bgcolor: "darkslategray",
      }}
    >
      <h1 className="bg-red-800">Navbar</h1>
      <h1 className="bg-green-600">navbar2</h1>
    </Box>
  );
};

export default Navbar;
