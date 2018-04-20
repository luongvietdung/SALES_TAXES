class Util
  class << self
    IMPORTED_REGEX = /\bimported\b/
    EXEMPTED_REGEX = /book|pill|chocolate/

    def exempted? product
      !!(EXEMPTED_REGEX =~ product)
    end

    def imported? product
      !!(IMPORTED_REGEX =~ product)
    end
  end
end