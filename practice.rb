require "active_support/all"
# require "active_support"
# require "active_support/core_ext/hash"
# require "active_support/core_ext/hash/indifferent_access"
p 'hello'
# puts {a: 1}.with_indifferent_access["a"]
p 'foo'.dup
p Rational(1)

p "foo".duplicable?
p 1.method(:+).duplicable?

p array = ['hardik']
p duplicate = array.dup #shallow copy
p duplicate.push 'another-string'
p duplicate.first.gsub!("hardik","hardik_vekariya")
p duplicate
p array

p array1 = ['hardik']
p duplicate1 = array1.deep_dup #deep copy
p duplicate1.push 'another-string'
p duplicate1.first.gsub!("hardik","hardik_vekariya")
p duplicate1
p array1

def a
  'hello'
end
p a.acts_like?(:string)
p a.acts_like?(:integer)

p 7.to_param
p 'Tom & Jerry'.to_param
p [0, true, String].to_param

p 7.to_query('sample')
p [3.45,-45.6].to_query('sample')
a = {c: 3, b: 2, a: 1, d: 4}.to_query
p a
a = {id: 89, name: "John Smith"}.to_query('user')
p a

class C
  def initialize(x,y)
    @x, @y = x,y
  end
end

p C.new(0,1).instance_values
p C.new(0,1).instance_variable_names

p 1.in?([1,2])
p 'he'.in?("helllo")
p 20.in?(20..40)

module X
  module Y
    module Z
    end
  end
end
M = X::Y::Z

p M.module_parent
p M.module_parent_name
p M.module_parents # hireachy of parents

module A
end
p A.name

p Module.new.name

# delegate to get details from other objects

class D
  class_attribute :x
end

class E < D; end

class F < E; end

D.x = :a
p E.x # => :a
p F.x # => :a

class Hardik; end
p Hardik.subclasses

class Hello < Hardik; end
class World < Hello; end
p Hardik.subclasses
p Hardik.descendants

s = "".html_safe
p s.html_safe? 

p "".html_safe + "<" 
p "".html_safe + "<".html_safe 

p "Hello World".remove(/Hello /) # => "World"
p " \n  foo\n\r \t bar \n".squish # => "foo bar"
p 'Hello my name is hardik vekariya'.truncate(20)
p 'Hello my name is hardik vekariya'.truncate(19, omission: 'hello')

p "👍👍👍👍".truncate_bytes(15, omission: "🖖")
p 'Hello my name is hardik vekariya'.truncate_words(3)
p 'Hello my name is hardik vekariya'.truncate_words(3, omission: " xyz")

p 'hardik'.starts_with?("h")
p 'hardik'.ends_with?("h")

p ' foo'.indent(2)
p 'hello'.at(0)
p 'hello'.at(2)
p 'hello'.at(-1)
p 'hello'.at(10)

p 'hardik'.from(0)
p 'hardik'.from(2)
p 'hardik'.from(-2)
p 'hardik'.from(10)

p 'hardik'.to(0)
p 'hardik'.to(2)
p 'hardik'.to(-2)
p 'hardik'.to(10)

p 'harrdik velaieor'.first
p 'harrdik velaieor'.last

p 'table'.pluralize(0)
p 'table'.pluralize(1)

p 'rubies'.singularize

p 'product_order'.camelize
p 'product order'.titleize
p "backoffice/session".camelize 

p "hardikVek".underscore

p "hello_hardik".dasherize

p "Backoffice::UsersController".demodulize

p "Admin::Hotel::ReservationUtils".demodulize 
p "Admin::Hotel::ReservationUtils".deconstantize 

p "John Smith".parameterize(separator: "_")
p "John Smith".parameterize(separator: "_", preserve_case: true)

p "InvoiceLine".tableize # => "invoice_lines"

p "invoice_lines".classify 

p "name".humanize                         # => "Name"
p "author_id".humanize                    # => "Author"
p "author_id".humanize(capitalize: false) # => "author"
p "comments_count".humanize               # => "Comments count"
p "_id".humanize                          # => "Id"

p 'ssl_error'.humanize 

p "Admin::Session".foreign_key # => "session_id"

p "2010-07-27".to_date              # => Tue, 27 Jul 2010
p "2010-07-27 23:37:00".to_time     # => 2010-07-27 23:37:00 +0200
p "2010-07-27 23:37:00".to_datetime

p 1.bytes
p 1.kilobytes
p 1.megabytes
p 1.gigabytes
p 1.terabytes

p 1.day.from_now
p (4.days + 5.weeks).from_now

p 5551234.to_fs(:phone)
p 9985632147.to_fs(:phone, country_code: 91)

p 63636.to_fs(:currency)
p 12345678.to_fs(:delimited, delimiter: ",")   

p 111.2345.to_fs(:rounded, precision: 2)   

p 1234567890123.to_fs(:human_size)        # => 1.12 TB
p 1234567890123.to_fs(:human)

p 2.multiple_of?(1) # => true
p 1.multiple_of?(2) # => false

p 1.ordinal    # => "st"
p 2.ordinal    # => "nd"
p 53.ordinal   # => "rd"
p 2009.ordinal # => "th"

p 1.ordinalize    # => "st"
p 2.ordinalize    # => "nd"
p 53.ordinalize   # => "rd"
p 2009.ordinalize # => "th"

p 1.month.from_now
p 50.years.from_now

p BigDecimal(5.00, 6).to_s("e")  # => "0.5E1"

p [1,2,3].sum
p (1..1000).sum
a = [[1,2],[2,3],[3,4]].sum([])
p a
# b = %w(foo bar baz).sum([])             # => "foobarbaz"
# p b

p (1..5).sum {|n| n * 2 }

p [ 1, 2, 3 ].including(4, 5)      
p [ 1, 2, 3 ].excluding(3)      
p [ 1, 2, 3, 2 ].many?     
p [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name)
p [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pick(:name)

num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
odd_num = num.extract! {|number| number.odd?}
p odd_num
p num

p %w(Earth Wind Fire).to_sentence

p [{a: 1, b: 2}, {c: 3}].to_xml

p Array.wrap([1, 2, 3])

p [1, 2, 3].in_groups_of(2, 0)
p [1, 2, 3].in_groups_of(2, false)

p %w(1 2 3 4 5 6 7).in_groups(3, false)

x = {a: 1, b: 1}.merge(a: 0, c: 2)
p x
# => {:a=>0, :b=>1, :c=>2}
# options = {length: 30, omission: "..."}.merge(options)
b = {a: {b: 1}}.deep_merge(a: {c: 2})
# => {:a=>{:b=>1, :c=>2}}
p b

c = { a: 1, b: 2}.except(:a)
p c

d = {nil => nil, 1 => 1, a: :a}.stringify_keys
p d

e = {nil => nil, 1 => 1, "a" => "a"}.symbolize_keys
p e

hash = { person: { name: 'Rob', age: '28' } }

p hash.deep_transform_values{ |value| value.to_s.upcase }
# => {person: {name: "ROB", age: "28"}}
hash = {a: 1,b: 2}
rest = hash.slice!(:a)
p hash
p rest

hash = {a: 1, b: 2}
rest = hash.extract!(:a) # => {:a=>1}
p hash                     # => {:b=>2}
p rest

p (Date.today..Date.tomorrow).to_s
p (1..10) === (3..7)  # => true
p (1..10).include?(3..7)  # => true
p (1..10) === (0..7)  # => false
p (1..10).include?(0..7)  # => false

p (1..10).overlaps?(0..7)   # => true
p (1..10).overlaps?(11..27) # => false

d = Date.new(2001,8,21)
p d.beginning_of_week
p d.beginning_of_week(:sunday)
p d.end_of_week
p d.end_of_week(:sunday)

p d.tuesday?

p d.next_week
p d.next_week(:saturday)

p d.prev_year
p d.next_year

p d.prev_month
p d.next_month

p d.end_of_month
p d.beginning_of_month

p d.end_of_quarter
p d.beginning_of_quarter

p d.end_of_year
p d.beginning_of_year

p d.years_ago(5)
p d.years_since(5)

p d.months_ago(5)
p d.months_since(5)

p d.weeks_ago(5)
p d.weeks_since(5)

p d.days_ago(5)
p d.days_since(5)

p d.advance(years: 1, weeks: 2)
p d.advance(years: -1, weeks: -2)

p d.change(year: 2011, month: 11)
 
e = Date.current
p e + 1.day
p e + 2.day
p e + 2.hour

date = DateTime.new(2010, 6, 7, 19, 55, 25)
p date.beginning_of_hour 
p date.beginning_of_minute
p date.end_of_hour 
p date.beginning_of_day
p date.beginning_of_month

now = DateTime.current # => Mon, 07 Jun 2010 19:27:52 -0400
p now.utc                # => Mon, 07 Jun 2010 23:27:52 +0000

p Time.zone_default
