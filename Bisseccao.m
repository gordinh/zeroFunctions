function Bisseccao(f, xa, xb, erroTolerance, realRoot, graphic)
    %Metodo da Bisseccao (intervalar)
    %retorna a raiz estimada da função
    %func = função a ser calculada
    %xa = lado esquerdo do interval
    %xb = lado direito do intervalo
    %erroTolerance = tolerancia de erro/criterio de parada em porcentagem
    
    %Autor: Lucas Morais e Felipe Cordeiro
    
    %O QUE FALTA: PLOTAR NO GRAFICO || MOSTRAR RAIZ ESTIMADA POR ITERACAO
    %|| MOSTRAR ERRO DE ESTIMACAO || MOSTRAR ERRO VERDADEIRO 
    %% functionname: function description
    %function f = fun(x)
            %f = (x + 1)^2 * e^(x - 2) - 1;
            %f = (-2.75*x^3)+(18*x^2)-(21*x)-(12);
    %end

    
    x = 0;
    iterador = 0;
    fa = polyval(f,xa); 
    erro = 100;
    vectorX = []; %vetor com valores de x para plotagem em grafico
    vectorY = []; %vetor com valores de y para plotagem em grafico
    while (erro > erroTolerance)
        xold = x; %salvando o valor antigo de x, para calculo do erro relativo
        x = (xa+xb) / 2; %calculando o valor de x sendo a media dos extremos do intervalo
        
        
        fx = polyval(f,x);  %calculando f(x)
        
        vectorX = [vectorX x]; %#ok<*AGROW> %adicionando valores de x no vetor
        vectorY = [vectorY fx];  %adicionando valores de y no vetor
        
        signal = fa * fx;
        if (signal > 0)
            xa = x;
            fa = fx;
        elseif (signal < 0)
           xb = x;
           fb = fx;            %#ok<NASGU>
        else
            %caso x seja a raiz
            disp ('fim')
            return;
        end
        erro = abs((x-xold)/x)*100;
        disp ('iteracao: '), disp (iterador)
        disp ('raiz_estimada: '), disp(x)
        disp ('Erro Relativo: '), disp (erro)
        iterador = iterador + 1;
        errorAbsolute = (realRoot - x);
        disp ('Erro Absoluto: '), disp (errorAbsolute)
    end
    disp ('iteracoes_maximas: '), disp (iterador)
    disp ('raiz_estimada: '), disp (x)
    
    %%%Gerando os gr�ficos e imagens a partir daqui
    figure(graphic);
    title('Graph of Newton-Raphson method');
    hold on;
    grid on;
    plot(1:0.2:3, polyval(f, 1:0.2:3), '-r');
    title('Grafico - Bisseccao');
    xlabel('x');
    ylabel(f);
    plot(vectorX, vectorY, '.b');
end
            
            
    
