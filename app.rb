Dir['./app/**/*.rb'].each do |app|
  require app
end

rover_controller = RoverController.new(data_provider: CommandLineInput)
rover_controller.setup
rover_controller.start_rovers