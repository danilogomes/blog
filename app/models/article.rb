require 'elasticsearch'

class Article < ActiveRecord::Base
	include Elasticsearch::Model
end
