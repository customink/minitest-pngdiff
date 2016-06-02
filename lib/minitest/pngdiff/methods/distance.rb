module Minitest
  module Pngdiff
    module Methods
      class Distance
        include ChunkyPNG::Color

        def calc_difference(pixel1, pixel2)
          euclidean_distance_rgba(pixel1, pixel2)
        end
      end
    end
  end
end
