
###
###

module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig {
    availabletasks: 
      tasks: ['build']

    shell:
      build:
        command: 'coffee --no-header -b -o lib/ src/' 

  }
  grunt.registerTask('build', ['shell:build'])
  grunt.registerTask('default', ['availabletasks','build']);
