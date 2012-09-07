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
    self.unauthorized_record = values.first if
      values.first.class < ::ActiveRecord::Base ||
      values.first.is_a?(MongoMapper::Document)
  end

end
