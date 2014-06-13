class Awesomator
  def initialize(array)
    @awesomes = array
  end

  def awesomest
    person = awesome_list(1).last
    if person.is_a? Person
      puts "#{person.name} is the awesomest at #{person.awesomeness} AU."
    else
      puts "You! You are the awesomest!"
    end
  end

  def awesummary
    people = awesome_list(10)
    if people.empty?
      puts "No people! Top 10 is empty!"
    else
      puts "Top #{people.count} Most Awesome"
      people.each_with_index { |p,i| puts "#{i}. #{p.name}\t#{p.awesomeness}" }
    end
  end

  def awesomean
    if @awesomes.empty?
      puts "No people! Average awesomeness is 0."
    else
      mean = @awesomes.map { |a| a.awesomeness }.inject{|sum,x| sum + x }.to_f / @awesomes.count
      puts "Average Awesomeness for #{@awesomes.count} people - Mean: #{mean}"
    end
  end

  protected

  def awesome_list(n)
    @awesomes.sort_by { |a| a.awesomeness }.last(n).reverse
  end
end

class Person
  attr_accessor :name, :awesomeness
  def initialize(n, a)
    @name = n
    @awesomeness = a
  end
end
