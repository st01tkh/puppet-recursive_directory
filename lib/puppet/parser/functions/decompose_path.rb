require 'puppet'

module Puppet::Parser::Functions
    # expects an args containing:
    # args[0]
    # - The destination directory for the interpolated templates to
    # - go on the client machine
    # - required: true
    #
    # args[1]
    # - The file mode for the finished files on the client
    # - required: false
    # - default: 0600
    #
    # args[2]
    # - The owner of the file
    # - required: false
    # - default: owner of puppet running process
    #
    # args[3]
    # - The group ownership of the file
    # - required: false
    # - default: owner of puppet running process
    #
    newfunction(:decompose_path, :type => :rvalue) do |args|
        destination_dir = args[0]
        mode = args[1]
        owner = args[2]
        group = args[3]

        params_hash = Hash.new
        if mode
            params_hash['mode'] = mode
        end
        if owner 
            params_hash['owner'] = owner
        end
        if group 
            params_hash['group'] = group
        end
        params_hash['ensure'] = 'directory'

        creatable_resources = Hash.new
        destination_dir_array = destination_dir.split(/\//)
        cur_dir_array = Array.new
        resources_hashes_array = Array.new
        paths_array = Array.new
        destination_dir_array.each do |dir|
            cur_dir_array.push(dir)
            next if dir =~ /^[a-zA-Z]\:$/ 
            cur_dir = cur_dir_array.join('/')
            dir += dir
            paths_array.push(cur_dir)
            creatable_resources[cur_dir] = params_hash
            r_params_hash = params_hash
            r_params_hash['path'] = cur_dir
            resources_hashes_array.push(r_params_hash)
        end

        data = Hash.new
        data['paths_array'] = paths_array
        data['resources_hashes_array'] = resources_hashes_array
        data['params_hash'] = params_hash
        return data

    end
end
