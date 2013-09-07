require "readline"

task :continue do
  while taskname = Readline.readline(">>", true)
    break if %w(exit quit bye).include?(taskname)
    Rake::Task.tasks.each(&:reenable)
    begin
      Rake::Task[taskname].invoke
    rescue
      warn $!
    end
  end
end
