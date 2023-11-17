function writeDataToFile()
    data = load_output;  % Directly access the variable

    % Define the file path for the text file
    file_path = 'C:\matlab_files_text\test_file2.txt';

    % Write the data to the text file in append mode
    dlmwrite(file_path, data, 'delimiter', '\t', '-append');

    disp('Data exported to file.txt.');

    % Increment the counter
    writeCounter = writeCounter + 1;
    if writeCounter >= numWriteIterations
        % Stop the timer
        stop(timerObj);
        delete(timerObj);
        clear timerObj;
        disp('Data writing completed.');
    end
end
