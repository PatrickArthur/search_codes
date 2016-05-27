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
    @search = ('diag_codes_1'..'diag_codes_3').to_a
  end

  def start_search
    @search.each { |diag| search_diags(send(diag)) }
    print @found
  end

  private

  def search_diags(diag_codes)
    intersection = @array & diag_codes
    @found.push(*intersection)
  end
end

test = SearchCodes.new(%w(10000 20001).inject(('99210'..'99250').to_a, :<<))
test.start_search
