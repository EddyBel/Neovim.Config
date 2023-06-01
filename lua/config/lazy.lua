--------------------> VERIFY THAT THE LAZY PACKAGE MANAGER IS INSTALLED CORRECTLY <---------------------------------

-- Concatenates the path to the "lazy" folder inside the "data" folder of neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If the "lazy" folder does not exist in the above path, clone the "lazy.nvim" repository inside it
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
-- Add the "lazy.nvim" path to the beginning of the neovim plugin paths.
vim.opt.rtp:prepend(lazypath)
