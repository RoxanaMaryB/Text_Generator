

function transitionMatrix = generate_transition_matrix(sequence_corpus, word_corpus, unique_words, unique_sequences, sequence_length)
    total_sequences = length(unique_sequences);
    total_words = length(unique_words);

    % initializare
    transitionMatrix = sparse(total_sequences, total_words);
    % parcurgere corpus
    for idx = 1 : (length(word_corpus) - sequence_length)
        current_sequence = sequence_corpus{idx};

        % verif daca exista cuv urmator
        if (idx + sequence_length) <= length(word_corpus)
            next_word = word_corpus{idx + sequence_length};

            sequence_index = find(strcmp(unique_sequences, current_sequence), 1);
            word_index = find(strcmp(unique_words, next_word), 1);

            % incremenatare tranzitii
            if ~isempty(sequence_index) && ~isempty(word_index)
                transitionMatrix(sequence_index, word_index) = transitionMatrix(sequence_index, word_index) + 1;
            end
        end
    end
endfunction