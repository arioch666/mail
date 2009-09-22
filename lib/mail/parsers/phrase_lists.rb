# Autogenerated from a Treetop grammar. Edits may be lost.


module Mail
  module PhraseLists
    include Treetop::Runtime

    def root
      @root || :primary_phrase
    end

    include RFC2822

    module PrimaryPhrase0
      def phrases
        [first_phrase] + other_phrases.elements.map { |o| o.phrase_value }
      end
    end

    def _nt_primary_phrase
      start_index = index
      if node_cache[:primary_phrase].has_key?(index)
        cached = node_cache[:primary_phrase][index]
        @index = cached.interval.end if cached
        return cached
      end

      r0 = _nt_phrase_list
      r0.extend(PrimaryPhrase0)

      node_cache[:primary_phrase][start_index] = r0

      r0
    end

  end

  class PhraseListsParser < Treetop::Runtime::CompiledParser
    include PhraseLists
  end

end