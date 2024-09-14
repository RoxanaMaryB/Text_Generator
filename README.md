# Text_Generator
**Nume: Baranga Roxana Mary**
**Grupă: 311CA**
 ## Tema 1 - Analiza datelor

### Metoda 1: Detectia anomaliilor

* Aceasta metoda este folosita pentru a detecta valorile care ies din tiparul general al datelor.

### Functii folosite:
#### estimate_gaussian
```markdown
function [mean_values, variances] = estimate_gaussian(X)
- estimeaza parametrii unei distributii gaussiene folosind datele din X
- date de intrare: X - datele de antrenare
- date de iesire: mean_values - media fiecarei coloane din X
                  variances - matrice de covarianta a datelor din X
```
#### gaussian_distribution
```markdown
function probability = gaussian_distribution(X, mean_value, variance)
- calculeaza probabilitatea ca datele din X sa apartina distributiei gaussiene
- date de intrare: X - datele de antrenare (vector linie)
                   mean_value - valoarea medie a distributiei
                   variance - matrice de covarianta
- date de iesire: probability - probabilitatea ca datele din X sa apartina distributiei gaussiene
```

#### check_predictions
```markdown
function [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths)
- verifica daca predictiile facute sunt corecte
- date de intrare: predictions - predictiile facute
                   truths - valoarea reala a datelor
- date de iesire: false_pozitives - numarul de predictii false pozitive
                    false_negatives - numarul de predictii false negative
                    true_pozitives - numarul de predictii corecte
```

#### optimal_threshold
```markdown
function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
- calculeaza cel mai bun epsilon pentru a detecta anomaliile
- foloseste formula:
    F1 = 2 * precision * recall / (precision + recall)
- date de intrare: truths - valoarea reala a datelor
                   probabilities - probabilitatea ca datele sa apartina distributiei gaussiene
- date de iesire: best_epsilon - epsilon-ul optim
                    best_F1 - F1 score-ul corespunzator epsilon-ului optim
                    associated_precision - precizia corespunzatoare epsilon-ului optim
                    associated_recall - recall-ul corespunzator epsilon-ului optim
```

### Functii ajutatoare:

#### multivariate_gaussian
```markdown
function probability = multivariate_gaussian(X, mean_values, variances)
- calculeaza probabilitatea ca datele din X sa apartina distributiei gaussiene
- foloseste functia: gaussian_distribution
- date de intrare: X - datele de antrenare
                   mean_values - media fiecarei coloane din X
                   variances - matrice de covarianta a datelor din X
- date de iesire: probability - probabilitatea ca datele din X sa apartina distributiei gaussiene
```

#### metrics
```markdown
function [precision, recall, F1] = metrics(true_pozitives, false_pozitives, false_negatives)
- calculeaza precizia, recall-ul si F1 score-ul
- foloseste formulele:
    precision = true_pozitives / (true_pozitives + false_pozitives)
    recall = true_pozitives / (true_pozitives + false_negatives)
    F1 = 2 * precision * recall / (precision + recall)
- date de intrare: true_pozitives - numarul de predictii corecte
                   false_pozitives - numarul de predictii false pozitive
                   false_negatives - numarul de predictii false negative
- date de iesire: precision - precizia
                    recall - recall-ul
                    F1 - F1 score-ul
```

#### identify_outliers
```markdown
function outliers = identify_outliers(X, yval)
- identifica valorile care sunt considerate anomalii
- estimeaza parametrii distributiei gaussiene si calculeaza probabilitatea ca datele sa apartina acesteia
- foloseste functiile: estimate_gaussian, multivariate_gaussian, optimal_threshold
- date de intrare: X - datele de antrenare
                   yval - valoarea reala a datelor
- date de iesire: outliers - valorile considerate anomalii
```

### Metoda 2: Kernel Regression

* Aceasta metoda este folosita pentru a estima valoarea functiei de predictie in punctele date, incercand minimizarea functiei de cost si a pierderilor.

### Functii folosite:
#### split_dataset
```markdown
function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
- imparte setul de date in set de antrenare si set de testare in functie de procentul dat
- date de intrare: X - datele de intrare
                   y - valorile reale asociate punctelor
                   percentage - procentul de date care vor fi folosite pentru antrenare
- date de iesire: X_train - datele de antrenare
                    y_train - valorile reale pentru datele de antrenare
                    X_pred - datele de testare
                    y_pred - valorile reale pentru datele de testare
```

#### build_kernel
```markdown
function [K] = build_kernel (X, f, f_param)
- construieste matricea kernel în care elementul de pe linia i și coloana j este egal cu valoarea funcției de kernel aplicate pe observațiile i și j din X
- date de intrare: X - datele de intrare
                   f - functia de kernel
                   f_param - parametrii functiei de kernel
- date de iesire: K - matricea kernel
```

#### cholesky
```markdown
function [L] = cholesky (A)
- calculeaza descompunerea Cholesky a matricei A
- date de intrare: A - matricea de descompus
- date de iesire: L - matricea inferior triunghiulara
```

#### get_lower_inverse
```markdown
function [P] = get_lower_inverse(L)
- calculeaza inversa matricei L inferior triunghiulara
- creeaza o matrice extinsa L2 prin adaugarea unei matrice identitate la dreapta matricei L
- pentru fiecare pivot din L2, scaleaza randul pivotului și elimina toate elementele de deasupra si de sub pivot
- extrage partea dreapta a matricei extinse, care reprezintă inversa matricei L
- date de intrare: L - matricea inferior triunghiulara
- date de iesire: P - inversa matricei L
```

#### get_prediction_params
```markdown
function [a] = get_prediction_params(K, y, lambda)
- calculeaza parametrii de predictie
- foloseste formula: a = (K + lambda * I)^(-1) * y
- rezolva L' * z = y
- rezolva L * a = z
- apeleaza functiile: backward_subst si forward_subst
- date de intrare: K - matricea kernel
                   y - valorile reale asociate punctelor
                   lambda - parametrul de regularizare
- date de iesire: a - parametrii de predictie
```

#### conjugate_gradient
```markdown
function [x] = conjugate_gradient (A, b, x0, tol, max_iter)
- rezolva sistemul de ecuatii liniare A * x = b folosind metoda gradientului conjugat
- se opreste cand numarul de iteratii este mai mare decat max_iter sau cand eroarea este mai mica decat tol
- date de intrare: A - matricea sistemului
                   b - vectorul termenilor liberi
                   x0 - vectorul initial
                   tol - toleranta
                   max_iter - numarul maxim de iteratii
- date de iesire: x - solutia sistemului
```

#### get_prediction_params_iterative
```markdown
function [a] = get_prediction_params_iterative (K, y, lambda)
- calculeaza parametrii de predictie folosind metoda gradientului conjugat
- apeleaza functia: conjugate_gradient
- date de intrare: K - matricea kernel
                   y - valorile reale asociate punctelor
                   lambda - parametrul de regularizare
- date de iesire: a - parametrii de predictie
```
#### eval_value
```markdown
function pred = eval_value(x, X, f, f_param, a)
- prezice valoarea unui vector de intrare in functie de toti vectorii folositi pentru antrenare
- foloseste formula: pred = sum(a(i) * f(x, X(i), f_param))
- date de intrare: x - vectorul de intrare
                   X - datele de antrenare
                   f - functia de kernel
                   f_param - parametrii functiei de kernel
                   a - parametrii de predictie
- date de iesire: pred - valoarea prezisa
```

### Metoda 3: Generare de text

* Aceasta metoda este folosita pentru a genera text folosind o lanturi Markov.

### Functii folosite:

#### distinct_words
```markdown
function retval = distinct_words (tokens)
- returneaza un vector cu cuvintele distincte din tokens (parcurgand tokens si adaugand cuvintele in retval o singura data)
- date de intrare: tokens - cuvintele din text
- date de iesire: retval - cuvintele distincte
```

#### k_secv
```markdown
function B = k_secv (A, k)
- genereaza toate secventele de lungime k dintr-un cell array de siruri de caractere, le concateneaza si le adauga intr-un nou cell array B
- date de intrare: A - cell array-ul de siruri de caractere
                   k - lungimea secventei
- date de iesire: B - cell array-ul de secvente de lungime k
```

#### distinct_k_secv
```markdown
function unique_cell_array = distinct_k_secv (cell_array)
- returneaza un cell array cu elementele unice din cell_array
- date de intrare: cell_array - cell array-ul de secvente
- date de iesire: unique_cell_array - cell array-ul de secvente unice
```

#### word_idx
```markdown
function retval = word_idx(distinct_wds)
- returneaza un map cu cuvintele distincte si indexul lor
- date de intrare: distinct_wds - cuvintele distincte
- date de iesire: retval - map-ul cu cuvintele distincte si indexul lor
```

#### k_secv_idx
```markdown
function retval = k_secv_idx(distinct_k_sec)
- returneaza un map cu secventele distincte si indexul lor
- date de intrare: distinct_k_sec - secventele distincte
- date de iesire: retval - map-ul cu secventele distincte si indexul lor
```

#### stochastic_matrix
```markdown
function M = stochastic_matrix(k_secv_corpus, corpus_words, word_set, k_secv_set, k)
- returneaza matricea stochastica M
- fiecare rand al matricei reprezinta o secventa de cuvinte, iar fiecare coloana reprezinta un cuvant. Elementul de pe randul i ai coloana j este de cate ori cuvantul j urmeaza secventa de cuvinte i în corpus
- date de intrare: k_secv_corpus - secventele de cuvinte din corpus
                   corpus_words - cuvintele din corpus
                   word_set - map-ul cu cuvintele distincte si indexul lor
                   k_secv_set - map-ul cu secventele distincte si indexul lor
                   k - lungimea secventei
- date de iesire: M - matricea stochastica
```
