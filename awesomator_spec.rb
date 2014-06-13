require '../awesomator'

describe Awesomator do
  setup do
    people = [
      Person.new("Jesus", 9001),
      Person.new("Andrew", 100),
      Person.new("Chesterton", 1000),
      Person.new("C.S. Lewis", 1001)
    ]
    @awesome = Awesomator.new(people)
  end

  it 'prints the very most awesome person' do
    output = capture :stdout do
      @awesome.awesomest
    end

    expect(output).to match(/Jesus/)
    expect(1).to eq 2
  end

  context 'the list is empty' do
    it 'handles the mean' do

    end

    it 'reports an empty summary' do

    end

    it 'reports an awesomest' do

    end
  end

  it 'handles a tie for awesomest' do

  end

  it 'prints the mean, formatted to two trailing decimals' do

  end

  it 'can report a Top N when N is < 10' do

  end
end
