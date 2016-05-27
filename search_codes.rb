class CptCodes
  def diag_codes_1
    @diag_codes_1 = ('99210'..'99220').to_a
  end

  def diag_codes_2
    @diag_codes_2 = ('10000'..'10001').to_a
  end

  def diag_codes_3
    @diag_codes_3 = ('20000'..'20001').to_a
  end
end

class SearchCodes < CptCodes
  def initialize(array)
    @array = array
    @found = []
  end

  def start_search
    @array.each do |x|
      search_diags(x, diag_codes_1)
      search_diags(x, diag_codes_2)
      search_diags(x, diag_codes_3)
    end
    print @found
  end

  private

  def search_diags(num, diag_codes)
    diag_codes.each do |v|
      (num == v) ? (@found << v) : nil
    end
  end
end

test = SearchCodes.new(%w(10000 20001).inject(('99210'..'99250').to_a, :<<))
test.start_search
