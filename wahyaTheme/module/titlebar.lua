local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local theme_name = "stoplight"
local titlebar_icon_path = os.getenv("HOME") .. "/.config/awesome/theme/icons/titlebar/" .. theme_name .. '/'
local tip = titlebar_icon_path --alias to save time/space
local titlebars = {}
local theme = {}
local dpi = require('beautiful').xresources.apply_dpi
local decorExtended = require('module.titlebar-decorate-client')
local titleBarSize = beautiful.titlebar_size

-- Define the images to load
beautiful.titlebar_close_button_normal = tip .. "close_normal.svg"
beautiful.titlebar_close_button_focus  = tip .. "close_focus.svg"
beautiful.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
beautiful.titlebar_minimize_button_focus  = tip .. "minimize_focus.svg"
beautiful.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
beautiful.titlebar_ontop_button_focus_inactive  = tip .. "ontop_focus_inactive.svg"
beautiful.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
beautiful.titlebar_ontop_button_focus_active  = tip .. "ontop_focus_active.svg"
beautiful.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
beautiful.titlebar_sticky_button_focus_inactive  = tip .. "sticky_focus_inactive.svg"
beautiful.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
beautiful.titlebar_sticky_button_focus_active  = tip .. "sticky_focus_active.svg"
beautiful.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
beautiful.titlebar_floating_button_focus_inactive  = tip .. "floating_focus_inactive.svg"
beautiful.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
beautiful.titlebar_floating_button_focus_active  = tip .. "floating_focus_active.svg"
beautiful.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
beautiful.titlebar_maximized_button_focus_inactive  = tip .. "maximized_focus_inactive.svg"
beautiful.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
beautiful.titlebar_maximized_button_focus_active  = tip .. "maximized_focus_active.svg"
-- hover
beautiful.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
beautiful.titlebar_close_button_focus_hover  = tip .. "close_focus_hover.svg"
beautiful.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
beautiful.titlebar_minimize_button_focus_hover  = tip .. "minimize_focus_hover.svg"
beautiful.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
beautiful.titlebar_ontop_button_focus_inactive_hover  = tip .. "ontop_focus_inactive_hover.svg"
beautiful.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
beautiful.titlebar_ontop_button_focus_active_hover  = tip .. "ontop_focus_active_hover.svg"
beautiful.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
beautiful.titlebar_sticky_button_focus_inactive_hover  = tip .. "sticky_focus_inactive_hover.svg"
beautiful.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
beautiful.titlebar_sticky_button_focus_active_hover  = tip .. "sticky_focus_active_hover.svg"
beautiful.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
beautiful.titlebar_floating_button_focus_inactive_hover  = tip .. "floating_focus_inactive_hover.svg"
beautiful.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
beautiful.titlebar_floating_button_focus_active_hover  = tip .. "floating_focus_active_hover.svg"
beautiful.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
beautiful.titlebar_maximized_button_focus_inactive_hover  = tip .. "maximized_focus_inactive_hover.svg"
beautiful.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
beautiful.titlebar_maximized_button_focus_active_hover  = tip .. "maximized_focus_active_hover.svg"

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {position = 'left', size = titleBarSize}) : setup {
        { -- Top
            awful.titlebar.widget.closebutton    (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.minimizebutton (c),

            layout  = wibox.layout.fixed.vertical
        },
          nil,
        { -- Bottom
			      awful.titlebar.widget.floatingbutton (c),
            layout = wibox.layout.fixed.vertical()
        },
        layout = wibox.layout.align.vertical
    }


    -- CUSTOM TITLEBAR FOR TERMINALS
    -- You need XPROP for this to work
    if c.class == "kitty" or c.class == "XTerm" then
      awful.titlebar(c, {position = "left", bg = '#000000AA', size = titleBarSize}) : setup {
        {
          awful.titlebar.widget.closebutton    (c),
          awful.titlebar.widget.maximizedbutton(c),
          awful.titlebar.widget.minimizebutton (c),
          layout  = wibox.layout.fixed.vertical
        },
          nil,
        { -- Bottom
          awful.titlebar.widget.floatingbutton (c),
          layout = wibox.layout.fixed.vertical()
        },
          layout = wibox.layout.align.vertical
        }
      end


    -- CUSTOM TITLEBAR FOR Firefox
    -- You need XPROP for this to work
    if c.class == "firefox" then
      awful.titlebar(c, {position = "left", bg = '#222222', size = titleBarSize}) : setup {
        {
          awful.titlebar.widget.closebutton    (c),
          awful.titlebar.widget.maximizedbutton(c),
          awful.titlebar.widget.minimizebutton (c),
          layout  = wibox.layout.fixed.vertical
        },
          nil,
        { -- Bottom
          awful.titlebar.widget.floatingbutton (c),
          layout = wibox.layout.fixed.vertical()
        },
          layout = wibox.layout.align.vertical
        }
      end

    -- CUSTOM TITLEBAR FOR Gimp2-10
    -- You need XPROP for this to work
    if c.class == "Gimp-2.10" then
      awful.titlebar(c, {position = "left", bg = '#454545', size = titleBarSize}) : setup {
        {
          awful.titlebar.widget.closebutton    (c),
          awful.titlebar.widget.maximizedbutton(c),
          awful.titlebar.widget.minimizebutton (c),
          layout  = wibox.layout.fixed.vertical
        },
          nil,
        { -- Bottom
          awful.titlebar.widget.floatingbutton (c),
          layout = wibox.layout.fixed.vertical()
        },
          layout = wibox.layout.align.vertical
        }
      end

end)

return beautiful
