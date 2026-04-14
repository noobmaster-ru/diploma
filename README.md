# My diploma
```bash
    pdflatex diploma.tex
    biber diploma
    pdflatex diploma.tex
    pdflatex diploma.tex
```


## Запуск octave:
```bash
    octave --gui
```

## Затем в терминале octave
```bash
    cd dynare_code/
    addpath /opt/homebrew/opt/dynare/lib/dynare/matlab
```


## Сохранение графиков 
```bash
% --- Улучшенное сохранение графиков IRF в PNG ---
varlist = {'Y', 'C', 'I', 'K', 'L', 'W', 'R', 'Rb', 'pi', 'tfp'};
russian_names = {'Y – выпуск', 'C – потребление', 'I – инвестиции', 'K – капитал', ...
                 'L – труд', 'W – зарплата', 'R – процентная ставка (реальная)', ...
                 'Rb – номинальная ставка', 'pi – инфляция', 'tfp – TFP'};
shocks = {'tfp_shock', 'mon_shock'};

if ~exist('graphs_png_k_costs', 'dir')
    mkdir('graphs_png_k_costs');
end

for i = 1:length(shocks)
    for j = 1:length(varlist)
        fieldname = [varlist{j}, '_', shocks{i}];
        if isfield(oo_.irfs, fieldname)
            data = oo_.irfs.(fieldname);
            T = length(data);
            periods = (0:T)';
            data_with_zero = [0; data(:)];
            
            figure('Visible', 'off');
            hold on;
            plot(periods, data_with_zero, 'b-', 'LineWidth', 1.5);
            plot(periods, zeros(size(periods)), 'r--', 'LineWidth', 1);
            title([varlist{j}, ' (', shocks{i}, ')'], 'FontSize', 12);
            xlabel('Periods', 'FontSize', 10);
            ylabel('Value', 'FontSize', 10);
            grid on;
            legend({russian_names{j}, 'steady state'}, 'Location', 'northeast', 'FontSize', 8);
            
            filename = fullfile('graphs_png_k_costs', [fieldname, '.png']);
            print(filename, '-dpng', '-r300');
            close;
        end
    end
end

fprintf('Улучшенные PNG-графики сохранены в папку graphs_png_improved/\n');
```
