require 'redis'
require 'redis-namespace'
require 'json'

module UCAS
  class Datastore
    @@redis = Redis.new
    @@adapter = Redis::Namespace.new("ucas-#{VERSION}".to_sym, :redis => @@redis)
    
    def self.redis
      @@adapter
    end
    
    def self.get(key)
      JSON.parse(@@adapter.get(key), symbolize_names: true)
    end
    
    def self.set(key, value)
      @@adapter.set(key, value.to_json)
    end
    
    def self.all
      keys = @@adapter.keys("*")
      results = {}
      keys.each do |key|
        results[key] = self.get(key)
      end
      results
    end
    
  end
end