class PlayerOption
  def initialize(options)
    @options = options
  end

  def display_options
    @options.to_s
  end
end