# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{positional}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ed Howland"]
  s.date = %q{2010-04-08}
  s.description = %q{The positional fields gem}
  s.email = %q{ed.howland@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".yardoc/checksums",
     ".yardoc/objects/Positional.dat",
     ".yardoc/objects/Positional/Decorator.dat",
     ".yardoc/objects/Positional/Decorator/Index.dat",
     ".yardoc/objects/Positional/Decorator/Index/inject_i.dat",
     ".yardoc/objects/Positional/Decorator/Message.dat",
     ".yardoc/objects/Positional/Decorator/Message/inject_i.dat",
     ".yardoc/objects/Positional/Format.dat",
     ".yardoc/objects/Positional/Format/initialize_i.dat",
     ".yardoc/objects/Positional/Format/to_s_i.dat",
     ".yardoc/objects/Positional/MaskedParse.dat",
     ".yardoc/objects/Positional/MaskedParse/format_i.dat",
     ".yardoc/objects/Positional/MaskedParse/initialize_i.dat",
     ".yardoc/objects/Positional/MaskedParse/parse_i.dat",
     ".yardoc/objects/Positional/Output.dat",
     ".yardoc/objects/Positional/Output/dir_3D_i.dat",
     ".yardoc/objects/Positional/Output/dir_i.dat",
     ".yardoc/objects/Positional/Output/initialize_i.dat",
     ".yardoc/objects/Positional/Output/path_i.dat",
     ".yardoc/objects/Positional/Output/program_3D_i.dat",
     ".yardoc/objects/Positional/Output/program_i.dat",
     ".yardoc/objects/Positional/Output/puts_i.dat",
     ".yardoc/objects/Positional/Parse.dat",
     ".yardoc/objects/Positional/Parse/convert_i.dat",
     ".yardoc/objects/Positional/Parse/format_i.dat",
     ".yardoc/objects/Positional/Parse/initialize_i.dat",
     ".yardoc/objects/Positional/Parse/parse_i.dat",
     ".yardoc/objects/Positional/Parse/quote_3F_i.dat",
     ".yardoc/objects/Positional/Parse/significant_3F_i.dat",
     ".yardoc/objects/Positional/Parse/whitespace_3F_i.dat",
     ".yardoc/objects/Positional/Pipe.dat",
     ".yardoc/objects/Positional/Pipe/connect_i.dat",
     ".yardoc/objects/Positional/Pipe/initialize_i.dat",
     ".yardoc/objects/Positional/Pipe/input_3D_i.dat",
     ".yardoc/objects/Positional/Pipe/input_i.dat",
     ".yardoc/objects/Positional/Pipe/input_map_3D_i.dat",
     ".yardoc/objects/Positional/Pipe/input_map_i.dat",
     ".yardoc/objects/Positional/Pipe/output_map_3D_i.dat",
     ".yardoc/objects/Positional/Pipe/output_map_i.dat",
     ".yardoc/objects/Positional/Pipe/program_3D_i.dat",
     ".yardoc/objects/Positional/Pipe/program_i.dat",
     ".yardoc/objects/Positional/Pipe/putput_3D_i.dat",
     ".yardoc/objects/Positional/Pipe/putput_i.dat",
     ".yardoc/objects/root.dat",
     ".yardoc/proxy_types",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "csc.out",
     "doc/Positional.html",
     "doc/Positional/Decorator.html",
     "doc/Positional/Decorator/Index.html",
     "doc/Positional/Decorator/Message.html",
     "doc/Positional/Format.html",
     "doc/Positional/MaskedParse.html",
     "doc/Positional/Output.html",
     "doc/Positional/Parse.html",
     "doc/Positional/Pipe.html",
     "doc/_index.html",
     "doc/class_list.html",
     "doc/css/common.css",
     "doc/css/full_list.css",
     "doc/css/style.css",
     "doc/file.README.html",
     "doc/file_list.html",
     "doc/frames.html",
     "doc/index.html",
     "doc/js/app.js",
     "doc/js/full_list.js",
     "doc/js/jquery.js",
     "doc/method_list.html",
     "doc/top-level-namespace.html",
     "lib/positional.rb",
     "lib/positional/decorator.rb",
     "lib/positional/decorator/index.rb",
     "lib/positional/decorator/message.rb",
     "lib/positional/format.rb",
     "lib/positional/masked_parse.rb",
     "lib/positional/output.rb",
     "lib/positional/parse.rb",
     "lib/positional/pipe.rb",
     "out",
     "positional.gemspec",
     "seq.rb",
     "spec/coilselectioncooling",
     "spec/coilselectionheating",
     "spec/format_spec.rb",
     "spec/parse_spec.rb",
     "spec/pipe_spec.rb",
     "spec/positional_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/unity_array_spec.rb"
  ]
  s.homepage = %q{http://github.com/edhowland/positional}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{positional}
  s.test_files = [
    "spec/format_spec.rb",
     "spec/parse_spec.rb",
     "spec/pipe_spec.rb",
     "spec/positional_spec.rb",
     "spec/spec_helper.rb",
     "spec/unity_array_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<syntax>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<syntax>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<syntax>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end

