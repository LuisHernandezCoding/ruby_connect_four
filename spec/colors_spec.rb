require_relative '../lib/colors'

describe 'Colors' do
  colors = { 'default' => '38', 'black' => '30', 'red' => '31', 'green' => '32', 'brown' => '33', 'blue' => '34',
             'purple' => '35', 'cyan' => '36', 'gray' => '37', 'dark gray' => '1;30', 'light red' => '1;31',
             'light green' => '1;32', 'yellow' => '1;33', 'light blue' => '1;34', 'light purple' => '1;35',
             'light cyan' => '1;36', 'white' => '1;37' }
  colors.each do |color, value|
    it "should return a string with the color #{color}" do
      expect('test'.send(color)).to eq("\e[#{value}mtest\e[0m")
    end
  end
end

describe 'Background Colors' do
  bg_colors = { 'default' => '0', 'black' => '40', 'red' => '41', 'green' => '42', 'brown' => '43', 'blue' => '44',
                'purple' => '45', 'cyan' => '46', 'gray' => '47', 'dark gray' => '100', 'light red' => '101',
                'light green' => '102', 'yellow' => '103', 'light blue' => '104', 'light purple' => '105',
                'light cyan' => '106', 'white' => '107' }
  bg_colors.each do |color, value|
    it "should return a string with the background color #{color}" do
      expect('test'.send("bg_#{color}")).to eq("\e[#{value}mtest\e[0m")
    end
  end
end

describe 'Text Effects' do
  describe 'bold' do
    it 'should return the word "Test" with bold effect' do
      expect('test'.bold).to eql("\e[1mtest\e[22m")
    end
  end
  describe 'italic' do
    it 'should return the word "Test" with italic effect' do
      expect('test'.italic).to eql("\e[3mtest\e[23m")
    end
  end
  describe 'underline' do
    it 'should return the word "Test" with underline effect' do
      expect('test'.underline).to eql("\e[4mtest\e[24m")
    end
  end
  describe 'blink' do
    it 'should return the word "Test" with blink effect' do
      expect('test'.blink).to eql("\e[5mtest\e[25m")
    end
  end
end
describe 'No Colors' do
  it 'should return the word "Test" without colors' do
    expect('test'.no_colors).to eql('test')
  end
end
