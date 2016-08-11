class RoverCommands
  COMMANDS = %w(L R M)

  def initialize
    update('')
  end

  def update(commands)
    @pointer = 0
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

  def valid?
    @command_str =~ /\A[#{COMMANDS.join}]+\z/
  end

  def self.rotate?(command)
    %w(L R).include?(command)
  end

  def self.direction(command)
    { 'L' => -1, 'R' => 1 }[command]
  end
end