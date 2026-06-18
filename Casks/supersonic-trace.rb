cask "supersonic-trace" do
  version "0.2.1"
  sha256 "c291177d6018f50578bd60f9f009bf5d37a78aab5ba14f91d6e3e60a021e0960"

  url "https://github.com/lubos-buracinsky/Supersonic-Trace/releases/download/v#{version}/Supersonic-Trace-#{version}.zip"
  name "Supersonic Trace"
  desc "Private macOS clipboard for developers and AI agents"
  homepage "https://supersonic.xyz/supersonic-trace/"

  depends_on macos: ">= :sonoma"

  app "Supersonic Trace.app"
  binary "#{appdir}/Supersonic Trace.app/Contents/Resources/trace"
  binary "#{appdir}/Supersonic Trace.app/Contents/Resources/trace-mcp"

  postflight do
    system_command "/usr/bin/open",
                   args: ["-gj", "#{appdir}/Supersonic Trace.app"],
                   must_succeed: false,
                   print_stdout: false,
                   print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/Supersonic Trace",
  ]
end
