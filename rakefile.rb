class Worker
end

class Linux < Worker
end

class Windows < Worker
end

def linux? do
  'linux' == Gem::Platform.local.os
end

task :main do
  puts linux?
end


task :default => :main
