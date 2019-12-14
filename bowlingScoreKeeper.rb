# Christie Finnie
# Due: 2019-12-16

# Bowling scorer - actions and properties for a bowler
#
class Bowler
  

  def initialize
    @frames = []
  end

  def rolls(roll1, roll2 = nil, roll3 = nil)
    # add to frame tracking
    @frames.push([roll1, roll2, roll3])
  end

  def score
    puts "\n=== Scoring player ==="
    total = 0
    frame_totals = []
    
    @frames.each_with_index do | frame, index |
        frame_total = 0
        roll1 = frame[0]
        roll2 = frame[1]
        roll3 = frame[2] 

        # === get frame total
        if roll1 == "X"
          # A strike counts as 10 pins plus the pins knocked down on the next two deliveries.
        
          if @frames.length > index + 1
              next_frame = @frames[index + 1]
              
              next_frame_r1 = @frames[index + 1][0]
              next_frame_r2 = @frames[index + 1][1]
              
              # puts "next frame #{next_frame}"

              # add next frame roll1 and roll2
              frame_total = 10 
              if next_frame_r1 == "X" && @frames.length > index + 2
                # On strike, get next roll from next next frame unless we're past frame 9
                next_next_frame = @frames[index + 2]
              
                next_next_frame_r1 = @frames[index + 2][0]
                next_next_frame_r2 = @frames[index + 2][1]
              
                # puts "next next frame #{next_next_frame}"
                if next_next_frame_r1 == "X"
                  frame_total += 20
                else 
                  frame_total += 10 + next_next_frame_r1
                end

              elsif next_frame_r2 == "/"
                frame_total += 10
              elsif next_frame_r2 == "X"
                frame_total += 20
              else 
                frame_total += next_frame_r1 + next_frame_r2
              end
          elsif @frames.length == 10 && index == 9
            # On strike and we're totalling the final frame
            frame_total = 10

            if roll2 != nil
              if roll2 == "X"
                frame_total += 10
              else 
                frame_total += roll2
              end
            end

            if roll3 != nil 
              if roll3 == "X"
                frame_total += 10
              else
                frame_total += roll3
              end
            end

          else 
            frame_total = nil
          end
        
        elsif roll2 && roll2 == "/"
          # A spare counts as 10 pins plus the pins knocked down on the next delivery.
          if @frames.length > index + 1
            
            next_frame = @frames[index + 1]
            next_frame_r1 = @frames[index + 1][0]
            
            # puts "next frame #{next_frame}"

            # add next frame roll1 and roll2
            frame_total = 10 
            if next_frame_r1 == "X"
              frame_total += 10
            else 
              frame_total += next_frame_r1 
            end
          else 
            frame_total = nil
          end
        else
          frame_total += roll3 ? 
            roll1 + roll2 + roll3 : 
            roll1 + roll2
        end
        
        # === store frame total
        if frame_total == nil 
          puts "frame #{index}, f:#{frame}, ft: nil" 
        else 

          puts "frame #{index}, f:#{frame}, ft:#{frame_total}" 
        end 

        frame_totals.push(frame_total)

    end

    # === add frame totals
    puts "frame_totals: #{frame_totals}"
    
    #puts "last frame total = #{frame_totals.last == nil ? "nil": frame_totals.last }"
    
    frame_totals.each do | frame_score | 
      if frame_score != nil
        total += frame_score
      end
    end
    

    # puts "score = #{score.to_s}"

    if @frames.length == 1 && frame_totals.last == nil
      puts "score = nil"
      nil
    else 
      puts "score = #{total.to_s}"
      total
    end 

  end

  def frame_total
  end

end

