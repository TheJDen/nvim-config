require("one_monokai").setup({
    transparent = false,
    colors = {
        black = '#000000'
    },
    themes = function(colors)
        return {
            Normal = { bg = colors.black }  
        }
    end,
    italics = true,
})
