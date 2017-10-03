N = 1000; //le nombre des réalisations 
T = 1; // le temps de l'exercice de l'option 
h = 0.05;
S0 = 1;
mu = 0.05;
sigma = 0.3;
M = T / h; //nombre de subdivision de l'intervalle [0,T]
t = 0; //la valeur de l'actif aux instants
somme  = 0; //la somme de S(t)
Nb = N / M; //nombre de réalisation dans chaque intervalle [0,T]

for i = 1:M
    for j = 1:Nb 
        U = grand(1,1,"unf",0,1); // la fonction grand(x,y,"unf",a,b) est pour générer une matrice avec la ligne x et la colonne y des nombres au hasard entre [a,b] qui suit une loi uniforme.
        Z = (U - Nb / 2) / sqrt(Nb / 12); // selon le théorème de la limite Centrale, on trouve Z suit une loi normale N(0,1)
        St = S0 * exp((mu - 1/2 * sigma^2) * t + sigma * sqrt(t) * Z);
        somme = somme + St;
    end
    t = (i + 1) * h;
end
moyenne = somme / N;

moyenne
