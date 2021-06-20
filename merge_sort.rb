def merge_sort(array_to_sort)
    return array_to_sort if array_to_sort.size <= 1

    half_left, half_right = array_to_sort.each_slice((array_to_sort.size / 2.0).round).to_a

    half_left = merge_sort(half_left)
    half_right = merge_sort(half_right)

    merge = lambda do |left, right, sorted = []|
        left.first < right.first ? sorted.push(left.shift) : sorted.push(right.shift) until left.empty? || right.empty?

        sorted.concat(left).concat(right)
    end

    merge.call(half_left, half_right)
end

merge_sort([8, 25, 4, 7, 49, 9, 515, 3, 5, 6])