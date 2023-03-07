# frozen_string_literal: true

require 'ruby-prof'

require_relative '../../task-1'
require_relative '../../scripts/profilers_setup'

RubyProf.measure_mode = RubyProf::WALL_TIME

file_path = profilers_setup
result = RubyProf.profile { work(file_path: file_path, disable_gc: true) }

printer = RubyProf::CallTreePrinter.new(result)
printer.print(path: 'reports/ruby_prof', profile: 'callgrind')