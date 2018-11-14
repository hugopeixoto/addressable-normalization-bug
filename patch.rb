module Addressable
  class URI
    def normalized_query(*flags)
      return nil unless self.query
      return @normalized_query if defined?(@normalized_query)
      @normalized_query ||= begin
        pairs = query_values.to_a
        pairs.sort! if flags.include?(:sorted)
        component = pairs.map do |pair|
          pair
            .map { |c| Addressable::URI.normalize_component(c, CharacterClasses::UNRESERVED) }
            .join("=")
        end.join("&")
        component == "" ? nil : component
      end
      # All normalized values should be UTF-8
      @normalized_query.force_encoding(Encoding::UTF_8) if @normalized_query
      @normalized_query
    end
  end
end
