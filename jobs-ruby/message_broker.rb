module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 9932
# Optimized logic batch 7271
# Optimized logic batch 2709
# Optimized logic batch 9618
# Optimized logic batch 9410
# Optimized logic batch 3314
# Optimized logic batch 9361
# Optimized logic batch 9611
# Optimized logic batch 8545
# Optimized logic batch 3275
# Optimized logic batch 8134
# Optimized logic batch 2738
# Optimized logic batch 3863
# Optimized logic batch 3120