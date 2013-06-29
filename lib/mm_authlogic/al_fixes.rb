# Here is where we can override the implementation of methods defined
# by Authlogic.
module Authlogic::ActsAsAuthentic::Login::Config

  private
  
  def find_with_case(field, value, sensitivity=true)
    if sensitivity
      send "find_by_#{field}", value
    else
      where(field.to_sym =>  {:$regex => /#{Regexp.escape value}/i}).first
    end
  end

end

module Authlogic::Session::UnauthorizedRecord

  def credentials=(value)
    super
    values = value.is_a?(Array) ? value : [value]
    klass = values.first.class
    self.unauthorized_record = values.first if
      (klass < MongoMapper::Document) ||
      (defined?(ActiveRecord) && (klass < ::ActiveRecord::Base))
  end

end

module Authlogic::Session::PriorityRecord

  def credentials=(value)
    super
    values = value.is_a?(Array) ? value : [value]
    klass = values[1].class
    self.unauthorized_record = values[1] if
      (klass < MongoMapper::Document) ||
      (defined?(ActiveRecord) && (klass < ::ActiveRecord::Base))
  end

end

module Authlogic::ActsAsAuthentic::PerishableToken::Methods::ClassMethods

  # Override to use where query accoriding to the MongoMapper way
  def find_using_perishable_token(token, age = self.perishable_token_valid_for)
    return if token.blank?
    age = age.to_i

    conditions = {:perishable_token => token}

    conditions[:updated_at.gt] = age.seconds.ago if
      column_names.include?("updated_at") && age > 0

    where(conditions).first
  end

end
