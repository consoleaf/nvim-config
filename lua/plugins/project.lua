return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      detection_methods = { "pattern" },
      patterns = {
        ".git",
        "Makefile",
        "yarn.lock",
        "package-lock.json",
      },
    },
  },
}
