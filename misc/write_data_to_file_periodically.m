load_system('SmallScaleMicroGrid.slx');
writeIntervalSeconds = 10;
numWriteIterations = 5;
writeCounter = 0;
timerObj = timer('TimerFcn', @(~,~) writeDataToFile(load_output), ...
                 'ExecutionMode', 'fixedRate', ...
                 'Period', writeIntervalSeconds, ...
                 'TasksToExecute', numWriteIterations);

% Start the timer
start(timerObj);

% Simulate the model
sim('SmallScaleMicroGrid.slx');

close_system('SmallScaleMicroGrid.slx', 0);
function writeDataToFile(data)

    file_path = 'C:\matlab_files_text\test_file2.txt';

    dlmwrite(file_path, data, 'delimiter', '\t', '-append');  % Use '\t' for tab-delimited data
    disp('Data exported to file.txt.');
    writeCounter = writeCounter + 1;
    if writeCounter >= numWriteIterations
        % Stop the timer
        stop(timerObj);
        delete(timerObj);
        clear timerObj;
        disp('Data writing completed.');
    end
end
