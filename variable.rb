 # Define a local variable called 'greeting',
 # give it the value of the string "Hello World"

require_relative '../variable.rb'

RSpec.configure do |config|
  config.order = 'default'
end

def get_variable_from_file(file, variable)
  file_scope = binding
  file_scope.eval(File.read(file))

  begin
    return file_scope.local_variable_get(variable)
  rescue NameError
    raise NameError, "local variable `#{variable}` not defined in #{file}."
  end
end

describe "./variable.rb" do

  it "defined a local variable called greeting and set it equal to 'Hello World'" do
    greeting = get_variable_from_file('./variable.rb', "greeting")

    expect(greeting).to eq("Hello World")
  end

end

