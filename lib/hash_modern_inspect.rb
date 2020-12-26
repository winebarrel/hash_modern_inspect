module HashModernInspect
  def modern_inspect(options = {})
    modern_inspect0(self, options)
  end

  def modern_inspect_without_brace(options = {})
    if self.empty? and not options[:allow_empty]
      self.inspect
    else
      modern_inspect(options).sub(/\A\{/, '').sub(/\}\z/, '').strip
    end
  end

  def modern_inspect0(obj, options = {})
    buf = ''

    case obj
    when Array
      buf << '['

      obj.each_with_index do |value, i|
        buf << ', ' unless i.zero?
        buf << modern_inspect0(value, options)
      end

      buf << ']'
    when Hash
      buf << if options[:space_inside_hash]
               '{ '
             else
               '{'
             end

      obj.each_with_index do |kv, i|
        key, value = kv
        buf << ', ' unless i.zero?

        if key.is_a?(Symbol)
          key = key.to_s

          if key =~ /\A\w+\z/
            buf << "#{key}: "
          else
            buf << "#{key.to_s.inspect}: "
          end
        else
          buf << "#{modern_inspect0(key, options)}=>"
        end

        buf << modern_inspect0(value, options)
      end

      buf << if options[:space_inside_hash]
               ' }'
             else
               '}'
             end
    else
      buf << obj.inspect
    end

    buf
  end
end
Hash.include(HashModernInspect)
