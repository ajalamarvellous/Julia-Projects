function markovhashtable(file)
    bag_of_word = make_bow(file)
    hashtable_ = Dict()
    counter = 1
    for counter in 1:length(bag_of_word)-2
        prefix = bag_of_word[counter] * bag_of_word[counter+1]
        suffix = bag_of_word[counter+2]
        if prefix in keys(hastable)
            if suffix in hashtable_[prefix]
                print("")
            else
                push!(hashtable_[prefix], suffix)
            end
        else
            hashtable_[prefix] = [suffix]
        end
    end
end


function make_bow(file)
    bag_of_word = []
    for line in eachline(file)
        append!(bag_of_word, split(line, " "))
    end
end