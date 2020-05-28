  class Agent
    attr_reader :x,:y
  
    def initialize()
      # 始点は(1,1)であることに注意
      @x = 1
      @y = 1
    end

    def move(direction)
    # xが北からの距離、yが西からの距離を示していることに注意
      case direction
        when "N"
          @x -= 1
        when "S"
          @x += 1
        when "E"
          @y += 1
        when "W"
          @y -= 1
      end
    end

  end
  
  # pointにflagをもたせ、最後に集計する
  # 終了条件を満たすまでAgentは移動する
  class Point
    attr_reader :direction
    attr_accessor :visited # ユーザーがその点を訪れたら更新する
  
    def initialize(direction,visited=false)
      @direction = direction
      @visited = visited
    end
  end


  class Board
    # デバッグなどで確認するため
    attr_reader :row,:col,:agent,:cells,:counter

    def initialize(row,col)
      @row = row
      @col = col
      @counter = 0
      @agent = Agent.new()
    end

    # initializeをあまり複雑にしたくないのでcellsの準備はここでする
    # agentの位置(x,y)はcellsの[x-1][y-1]に対応している
    def prepare(setting)
      @cells = setting.map do |row|
        row.map do |direction|
          Point.new(direction,false)
        end
      end
      @cells[0][0].visited = true
    end

    
    def start
      while true
        # agentの位置は(1,1)が起点、cellsは(0,0)が起点
        direction = @cells[agent.x-1][agent.y-1].direction
        if can_move(agent,direction)
          agent.move(direction)
          @cells[agent.x-1][agent.y-1].visited = true
        else
          break
        end 
      end
      count_flag
      counter
    end



    private

    def count_flag
      # すべてのセルのうち、visited が trueのものをカウントする.
      # わかりやすいけど計算量的にはイケてない気がする.
      @cells.each do |row|
        row.each do |cell|
          if(cell.visited)
            @counter += 1
          end
        end
      end
    end
    
    def can_move(agent,direction)
    # 移動先のセルをまだ訪れていない&&移動先が盤面の外ではない
      case direction
      when "N"
      (agent.x - 1) > 0 && (@cells[(agent.x) -1 -1][(agent.y) -1].visited == false)
      when "S"
      (agent.x + 1) <= row && (@cells[(agent.x) +1 -1][(agent.y) -1].visited == false)
      when "W"
      (agent.y - 1) > 0 && (@cells[(agent.x)-1][(agent.y) -1 -1].visited == false)
      when "E"
      (agent.y + 1) <= col && (@cells[(agent.x) -1][(agent.y)+1 -1].visited == false)
      end
    end

  end


def main(lines =
  [
    "3 4",
    "SNES",
    "EENS",
    "WSEW"
  ]
  )


row_col = lines.shift.chomp.split(" ")
row = row_col[0].to_i
col = row_col[1].to_i

board = Board.new(row,col)

setting = lines.map do |line|
  line.chomp.split("")
end

board.prepare(setting)
board.start

end

main()