local tmux = require('Navigator')

tmux.setup({
    -- Save modified buffer(s) when moving to mux
    -- nil - Don't save (default)
    -- 'current' - Only save the current modified buffer
    -- 'all' - Save all the buffers
    auto_save = 'current',

    -- Disable navigation when the current mux pane is zoomed in
    disable_on_zoom = true,
})
