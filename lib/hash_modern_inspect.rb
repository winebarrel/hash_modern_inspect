module HashModernInspect
  def modern_inspect
    modern_inspect0(self)
  end

  def modern_inspect_without_brace
    if self.empty?
      self.inspect
    else
      modern_inspect.sub(/\A\{/, '').sub(/\}\z/, '')
    end
  end

  def modern_inspect0(obj)
    buf = ''

    case obj
    when Array
      buf << '['

      obj.each_with_index do |value, i|
        buf << ', ' unless i.zero?
        buf << modern_inspect0(value)
      end

      buf << ']'
    when Hash
      buf << '{'

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
          buf << "#{modern_inspect0(key)}=>"
        end

        buf << modern_inspect0(value)
      end

      buf << '}'
    else
      buf << obj.inspect
    end

    buf
  end
end
Hash.include(HashModernInspect)
