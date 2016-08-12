class RoverCommands
  COMMANDS = %w(L R M)

  def initialize(commands = nil)
    update(commands || '')
  end

  def update(commands)
    reset_index
    @command_str = commands
  end

  def current
    @command_str[@pointer]
  end

  def next
    pointer = @pointer
    @pointer += 1
    @command_str[pointer]
  end

  def reset_index
    @pointer = 0
  end

  def valid?
    (@command_str =~ /\A[#{COMMANDS.join}]+\z/) == 0
  end

  def self.rotate?(command)
    %w(L R).include?(command)
  end

  def self.direction(command)
    { 'L' => -1, 'R' => 1 }[command]
  end
end