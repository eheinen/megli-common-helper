require 'json'
require 'timeout'
require_relative '../ext/string'

module MegliHelper
  class CommonHelper
    # Check if text is null or empty
    # @param text [String] text to be checked
    # @return [Boolean] true if text is nil or empty and false if not
    def self.nil_or_empty?(text)
      (text.nil? || text.to_s.empty? || text.empty?)
    rescue
      false
    end

    # Convert string value to boolean
    # @param value [String] value to be converted
    # @return [Boolean][nil] if string is not a valid boolean it will return nil
    def self.to_boolean(value)
      return false if nil_or_empty? value
      return true if %w(true 1 y yes).include? value.to_s.downcase.strip
      return false if %w(false 0 n no).include? value.to_s.downcase.strip
      false
    rescue
      false
    end

    # Transform float value to a decimal formatted
    # @param decimal [Float] value to be formatted
    # @param decimal_format formmated used to format the value
    # @param currency [String] currency signal to be included in the decimal like: $, £, R$, etc.
    # @param currency_before [Boolean] where the currency must be included (before or after decimal)
    # @return [String] decimal formatted
    def self.to_decimal(decimal, decimal_format = '%8.2f', currency = nil, currency_before = true)
      new_decimal = (decimal_format % decimal).strip
      unless nil_or_empty?(currency)
        return currency + new_decimal if currency_before
        return new_decimal + currency
      end
      new_decimal
    end

    # Transform keys of hash or array of hashes in snake case
    # @param hash_object [Array/Hash] object that will be formatted
    # @return [Array/Hash] keys converted in snake case
    def self.transform_hash_keys_in_snake_case(hash_object)
      case hash_object
      when Array
        hash_object.map { |v| transform_hash_keys_in_snake_case(v) }
      when Hash
        Hash[hash_object.map { |k, v| [k.to_s.underscore, transform_hash_keys_in_snake_case(v)] }]
      else
        hash_object
      end
    end

    # Check if the JSON passed is valid or not
    # @param json [String] json to be verified
    # @return [Boolean] is valid or not
    def self.valid_json?(json)
      return false if nil_or_empty? json
      JSON.parse(json)
      true
    rescue
      false
    end

    # Wait until a condition passed happen
    # @param condition [Proc] condition block to be validated
    # @param condition_status [Boolean] condition status to be used to define if condition is satisfied or not
    # @param timeout [Integer] timeout to wait for the condition happen
    # @param sleep_for [Float] value used to call the condition block
    def self.wait_until_condition(condition, condition_status = true, timeout = 20, sleep_for = 0.25)
      Timeout.timeout(timeout) do
        sleep sleep_for until condition.call == condition_status
      end
    end
  end
end
