require './awesomator'

describe Awesomator, '#class' do
  before do
    people = [
      Person.new("Jesus", 9001),
      Person.new("Andrew", 100),
      Person.new("Chesterton", 1000),
      Person.new("C.S. Lewis", 1001)
    ]
    @awesome = Awesomator.new(people)
    @empty = Awesomator.new([])
  end

  it 'prints the very most awesome person' do
    expect {
      @awesome.awesomest
    }.to output(/Jesus/).to_stdout
  end

  context 'the list is empty' do
    it 'handles the mean' do
      expect {
        @empty.awesummary
      }.to output(/No people! Top 10 is empty!/).to_stdout
    end

    it 'reports an empty summary' do
      expect {
        @empty.awesomean
      }.to output(/No people! Average awesomeness is 0./).to_stdout
    end

    it 'reports an awesomest - You' do
      expect {
        @empty.awesomest
      }.to output("You! You are the awesomest!\n").to_stdout
    end
  end

  it 'prints the mean, formatted to two trailing decimals' do
    expect {
      @awesome.awesomean
    }.to output(/Mean: 2775\.5/).to_stdout
  end

  it 'can report a Top N when N is < 10' do
    expect {
      @awesome.awesummary
    }.to output(/Top 4 Most Awesome/).to_stdout
  end

  it 'only reports top ten if there are more than 10' do
    big_list = (0..50).map { |i| Person.new("person#{i}", i*50) }
    big_awesomator = Awesomator.new(big_list)
    expect {
      big_awesomator.awesummary
    }.to output(/Top 10 Most Awesome/).to_stdout
  end
end
