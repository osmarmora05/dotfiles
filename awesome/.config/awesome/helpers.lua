-- Useful functions used throughout the configuration

local gears      = require('gears')
local color      = require('modules.color')
local rubato     = require('modules.rubato')
local cairo      = require("lgi").cairo
local beautiful  = require('beautiful')

local _F         = {}

-- Blyaticon's image cropping function, uses a cairo surface
-- which it crops to a ratio.
-- https://git.gemia.net/paul.s/homedots/-/blob/main/awesome/helpers.lua#L133
function _F.crop_surface(ratio, surf)
   local old_w, old_h = gears.surface.get_size(surf)
   local old_ratio    = old_w / old_h
   if old_ratio == ratio then return surf end

   local new_w = old_w
   local new_h = old_h
   local offset_w, offset_h = 0, 0
   -- quick mafs
   if (old_ratio < ratio) then
      new_h    = math.ceil(old_w * (1 / ratio))
      offset_h = math.ceil((old_h - new_h) / 2)
   else
      new_w    = math.ceil(old_h * ratio)
      offset_w = math.ceil((old_w - new_w) / 2)
   end

   local out_surf = cairo.ImageSurface(cairo.Format.ARGB32, new_w, new_h)
   local cr       = cairo.Context(out_surf)
   cr:set_source_surface(surf, -offset_w, -offset_h)
   cr.operator = cairo.Operator.SOURCE
   cr:paint()

   return out_surf
end

-- Applies the blur effect to the titlebar buttons lose focus

function _F.apply_transition(opts)
   opts                   = opts or {}
   local bg               = opts.bg or beautiful.bg_light
   local hbg              = opts.hbg or beautiful.mid_normal
   local element          = opts.element
   local prop             = opts.prop
   local background       = color.color { hex = bg }
   local hover_background = color.color { hex = hbg }
   local transition       = color.transition(background, hover_background, color.transition.RGB)
   local fading           = rubato.timed {
      duration = 0.30,
   }
   fading:subscribe(function(pos)
      element[prop] = transition(pos / 100).hex
   end)
   return {
      on  = function()
         fading.target = 100
      end,
      off = function()
         fading.target = 0
      end
   }
end

-- Finds a value from an array. It is mainly used in the fear widget
function _F.indexOf(array, value)
   for i, v in ipairs(array) do
      if v == value then
         return i
      end
   end
   return nil
end

return _F