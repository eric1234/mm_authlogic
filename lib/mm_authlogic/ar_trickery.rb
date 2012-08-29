# AuthLogic makes certain assumptions about the models that hold true
# for ActiveRecord. These extensions ensure that the also hold true
# for MongoMapper
module MMAuthLogic
  module ARTrickery
    extend ActiveSupport::Concern

    module ClassMethods

      # In ActiveRecord this usually returns self but if using STI it
      # will return the root class of the inheritance tree. To keep with
      # this idea we will query the name of the collection (which is
      # assigned as classes inherit in MongoMapper) then convert that to
      # a class name.
      def base_class
        collection_name.gsub('.', '/').classify.constantize
      end

      def primary_key
        :_id
      end

      def default_timezone
        :utc
      end
    end

    # MongoMapper doesn't support readonly
    def readonly?
      false
    end

  end
end
