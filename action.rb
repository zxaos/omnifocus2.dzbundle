# Dropzone Action Info
# Name: OmniFocus2
# Description: Creates a task in OmniFocus with the selected text or file
# Handles: Files, Text
# Creator: Matt Bond
# URL: http://codefire.io/
# Events: Clicked, Dragged
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: Yes
# RunsSandboxed: Yes
# Version: 1.0
# MinDropzoneVersion: 3.0

#Note http://bettermess.com/omnilaunch/

require 'uri'

def dragged
  # Welcome to the Dropzone 3 API! It helps to know a little Ruby before playing in here.
  # If you haven't coded in Ruby before, there's an excellent introduction at http://www.codecademy.com/tracks/ruby

  # Each meta option at the top of this file is described in detail in the Dropzone API docs at https://github.com/aptonic/dropzone3-actions/blob/master/README.md#dropzone-3-api
  # You can edit these meta options as required to fit your action.
  # You can force a reload of the meta data by clicking the Dropzone status item and pressing Cmd+R

  # This is a Ruby method that gets called when a user drags items onto your action.
  # You can access the received items using the $items global variable e.g.
  puts $items.inspect
  puts RUBY_VERSION
  # The above line will list the dropped items in the debug console. You can access this console from the Dropzone settings menu
  # or by pressing Command+Shift+D after clicking the Dropzone status item
  # Printing things to the debug console with puts is a good way to debug your script. 
  # Output printed with puts will be shown in red in the console

  case ENV['dragged_type']
  when 'files'
  when 'text'
    text = URI.escape (URI.unescape ($items.join('')))
    puts text
    `open omnifocus:///add?name="#{text}"`
  end
  # omnifocus://

  # You should always call $dz.url or $dz.text last in your script. The below $dz.text line places text on the clipboard.
  # If you don't want to place anything on the clipboard you should still call $dz.url(false)
  $dz.url(false)
end
 
def clicked
  # This method gets called when a user clicks on your action
  puts `open omnifocus:///add?`
  # system("open ")
  # $dz.finish("You clicked me!")
  $dz.url(false)
end
