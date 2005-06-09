#
#	Rubygame -- Ruby bindings to SDL to facilitate game creation
#	Copyright (C) 2004  John 'jacius' Croisant
#
#	This library is free software; you can redistribute it and/or
#	modify it under the terms of the GNU Lesser General Public
#	License as published by the Free Software Foundation; either
#	version 2.1 of the License, or (at your option) any later version.
#
#	This library is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#	Lesser General Public License for more details.
#
#	You should have received a copy of the GNU Lesser General Public
#	License along with this library; if not, write to the Free Software
#	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

module Rubygame
	module Time
		class Clock
			attr_reader :start,:passed,:ticks,:desired_fps,:desired_mspf
			def initialize(desired_fps=nil)
				@start = Rubygame::Time.get_ticks()
				@last_tick = @start	# time that last tick occured
				@passed = 0		# time (ms) since last tick
				@raw_passed = 0	# @passed, before applying delay to steady FPS
				@ticks = 0		# incremented every time Clock#tick is called
				self.desired_fps=desired_fps # frames per second to delay for
			end

			# Set the desired number of frames per second. If this is set,
			# Clock#tick() will add a small delay to each frame to slow down
			# execution if it is running faster than this value.
			# If nil, no slowdown will be made to execution.
			#
			# This implicitely sets @desired_mspf.
			def desired_fps=(dfps)
				@desired_fps = dfps
				@desired_mspf = (dfps and 1000.0/dfps)
			end

			# Set the desired time (milliseconds) between frames. If this is 
			# set, Clock#tick() will add a small delay to each frame to slow 
			# down execution if the natural delay between frames is too small.
			# If nil, no slowdown will be made to execution.
			# 
			# This implicitely sets @desired_fps.
			def desired_msfp=(dmsfp)
				@desired_fps = (dmsfp and 1000.0/dmspf)
				@desired_mspf = dmsfp
			end

			# Returns milliseconds since this Clock was initialized
			def time
				@last_tick - @start
			end

			# Return frames per second (fps) recorded by the Clock
			def fps
				begin
					return 1000*@ticks / (@last_tick - @start)
				rescue ZeroDivisionError
					return 0
				end
			end

			# Call this function once per frame to use framerate tracking.
			# Returns the number of milliseconds since the last time you
			# called the function.
			# If @desired_fps is set, this function will delay execution for a
			# certain amount of time so that (if you call this function once
			# per frame) the program will run at that framerate.
			def tick()
				now = Rubygame::Time.get_ticks() # ms since init'd Rubygame
 				@passed = now - @last_tick # how long since the last tick?
 				@last_tick = now # update last tick time
				@ticks += 1		# increment ticks
				@raw_passed = @passed # save unadjusted @passed

				# Now we manually delay if we are too early, so the 
				# frames per second stays approx. at the desired rate.
				goal_delay = 0   # store what we want
				actual_delay = 0 # store what we get
				if @desired_fps and (self.fps() > @desired_fps)
					goal_delay = @desired_mspf - @passed
					unless goal_delay < 0
						actual_delay = Rubygame::Time.delay(goal_delay)
						@passed += actual_delay	# why @raw_passed is different
					# else we are running too slow anyway, can't un-delay
					end
				end
				return @passed
			end

		end # class Clock
	end # module Time
end #module Rubygame
