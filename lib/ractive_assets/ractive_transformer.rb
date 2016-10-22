module RactiveAssets
  class RactiveTransformer
    def self.call(input)
      precompiled = Ractive.precompile(input[:data], RactiveAssets::Config.options)
      template_namespace = RactiveAssets::Config.template_namespace
 
      { data: unindent(<<-TEMPLATE)
        (function() {
          this.#{template_namespace} || (this.#{template_namespace} = {});
          this.#{template_namespace}['#{input[:name]}'] = #{precompiled.to_json};
          return this.#{template_namespace}['#{input[:name]}'];
        }).call(this);
        TEMPLATE
      }
    end

    private

    def self.unindent(input)
      input.gsub /^#{input[/\A\s*/]}/, ''
    end
  end
end
