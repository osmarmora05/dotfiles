local awful     = require('awful')
local wibox     = require('wibox')
local gears     = require('gears')
local dpi       = require('beautiful').xresources.apply_dpi
local buttons   = require('bindings.widgets.taglist').buttons
local rubato    = require('modules.rubato')
local colors    = require('widgets.wibar.module.colors')


return function(s)
   return wibox.widget{
      shape = function(c, w, h)
         gears.shape.rounded_rect(c, w, h, dpi(4))
      end,
      bg      = colors.bg_light,
      height = dpi(250),
      widget  = wibox.container.background,
      {
         margins = dpi(14),
         widget  = wibox.container.margin,
         awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            buttons = buttons,
            layout  = {
               layout  = wibox.layout.fixed.vertical,
               spacing = dpi(5)
            },
            style   = {
               bg_focus    = colors.yellow,
               bg_occupied = colors.mid_light,
               bg_empty    = colors.mid_dark,
               bg_urgent   = colors.red,
               shape = function(c, w, h)
                  gears.shape.rounded_rect(c, w, h, dpi(30))
               end,
            },
            -- The fun stuff.
            widget_template = {
               -- Create the tag icon as an empty textbox.
               widget  = wibox.container.margin,
               margins = {
                  bottom = dpi(3),
                  top = dpi(3),
                  left= dpi(3),
                  right= dpi(4)
               },
               {
                  widget = wibox.container.background,
                  forced_height = 42,
                  forced_width = 15,
                  id     = 'background_role',
                  {
                     widget = wibox.widget.textbox,
                     text   = ''
                  },
               },
      
               -- Create a callback to change its size with an animation depending
               -- on focus and occupation.
               create_callback = function(self, tag)
                  self.animate = rubato.timed {
                     duration   = 0.15,
                     subscribed = function(h)
                        self:get_children_by_id('background_role')[1].forced_height = h
                     end
                  }
                  self.update = function()
                     if tag.selected then
                        -- If the tag is focused:
                        self.animate.target = dpi(42)
                     elseif #tag:clients() > 0 then
                        -- If the tag is occupied:
                        self.animate.target = dpi(25)
                     else
                        -- If the tag is unoccupied and unfocused:
                        self.animate.target = dpi(12)
                     end
                  end
                  -- Generate the bar sizes once.
                  self.update()
               end,
               -- Then update on callback.
               update_callback = function(self)
                  self.update()
               end
            }
         }
      }
   }
end