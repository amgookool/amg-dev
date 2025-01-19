import type { Config } from "tailwindcss";
/* 
Iconify Icons prefixes
! https://github.com/iconify/icon-sets/blob/master/collections.md
! Place in addIconSelectors functions
*/
import { addIconSelectors } from "@iconify/tailwind";

export default {
  content: ["./src/**/*.{ts,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [addIconSelectors(["logos", "devicon", "line-md"])],
} satisfies Config;
