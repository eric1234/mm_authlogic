module MongoMapper::Plugins::AuthLogic
  extend ActiveSupport::Concern

  included do
    plugin MongoMapper::Plugins::CustomScope
    plugin MMAuthLogic::ARTrickery

    [
      MMAuthLogic::Base,
      Authlogic::ActsAsAuthentic::Email,
      Authlogic::ActsAsAuthentic::LoggedInStatus,
      Authlogic::ActsAsAuthentic::Login,
      Authlogic::ActsAsAuthentic::MagicColumns,
      Authlogic::ActsAsAuthentic::Password,
      Authlogic::ActsAsAuthentic::PerishableToken,
      Authlogic::ActsAsAuthentic::PersistenceToken,
      Authlogic::ActsAsAuthentic::RestfulAuthentication,
      Authlogic::ActsAsAuthentic::SessionMaintenance,
      Authlogic::ActsAsAuthentic::SingleAccessToken,
      Authlogic::ActsAsAuthentic::ValidationsScope,
    ].each {|m| include m}
  end
end