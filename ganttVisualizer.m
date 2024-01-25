function ganttVisualizer(tasks, startTimes, endTimes, totalDays) % totalDays will differ depending on the month
    validateInput(tasks, startTimes, endTimes);
    figure;

    for i = 1:numel(tasks)
        createBlocks(i, tasks{i}, startTimes(i), endTimes(i));
    end

    plotSettings(totalDays, numel(tasks));
    xlabel('Day of the Month');
    grid on;
    title('Task Visualization');
end

function validateInput(tasks, startTimes, endTimes)
    if numel(tasks) ~= numel(startTimes) || numel(tasks) ~= numel(endTimes)
        error('Make sure each task has a corresponding start and end time!');
    end
end

function createBlocks(number, task, startTime, endTime)
    x = [startTime, endTime, endTime, startTime];
    y = [number, number, number+1, number+1];
    patch(x, y, 'b', 'EdgeColor', 'b', 'FaceColor', 'b'); % can edit the appearance of the blocks here
    text((startTime + endTime)/2, number + 0.5, task, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'w'); % text specifications
end

function plotSettings(numberOfDays, numTasks)
    set(gca, 'YTick', []);
    set(gca, 'YTickLabel', []);
    xlim([1 numberOfDays]);
    ylim([0 numTasks + 1]);
end