defmodule Nerves.System.BR do
  use Nerves.Package.Platform


  def bootstrap() do
    IO.puts "RUN SYSTEM_BR"
  end

  def build_paths(pkg) do
    system_br = Nerves.Env.package(:nerves_system_br)
    [{:platform, system_br.path, "/nerves/env/platform"},
     {:package, pkg.path, "/nerves/env/#{pkg.app}"}]
  end

  def build() do

  end

  def stream(file \\ "build.log") do
    {:ok, pid} = Nerves.System.BR.Stream.start_link(file: file)
    IO.stream(pid, :line)
  end
end