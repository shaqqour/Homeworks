class Map
    def initialize
        @map = Array.new { Array.new(2) }
    end

    def set(key, value)
        found = false
        @map.each do |set|
            if set[0] == key
                set[1] = value
                found = true
            end
        end
        @map << [key, value] if found == false
        @map
    end

    def get(key)
        @map.each do |set|
            return set[1] if set[0] == key
        end
        nil
    end

    def delete(key)
        value = get(key)
        @map.reject! { |set| set[0] == key }
        value
    end

    def show
        deep_dup(@map)
    end

    private

    def deep_dup(array)
        array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end  
end