## ractive_assets
 
### Use Ractive with the Rails asset pipeline.

Makes it easy to use [Ractive.js](http://www.ractivejs.org/) in your rails project by precompiling your templates, and bundling the library.

**Beware**, this gem is not nearly packaged well enough, even though it's being used in production. It started as a quick and dirty port of the great [handlebars_assets](https://github.com/leshill/handlebars_assets) gem by Les Hill, and mirrors it's structure almost completely so it can be both familiar and well architectured.

We're really grateful for all help packaging it! (Mainly writing proper docs and more tests).

### Bundled Ractive.js version:
0.5.8

### Gemfile

```ruby
gem 'ractive_assets', github: 'unity/ractive_assets'
```

- Yes, we need to publish it to rubygems, but that's got to wait until some docs and tests are written.

### Add the javascript to your HTML page:

```ruby
 javascript_include_tag "......?"
```

Where you can choose either:
 * ractive -- this contains no support for older browsers and lets you generate ractive templates in the browser
 * ractive.runtime -- this contains no support for older browsers and does not let you generate templates browser-side
 * ractive-legacy -- this contains support for older browsers and lets you generate ractive templates in the browser
 * ractive-legacy.runtime -- this contains support for older browsers and does not let you generate templates browser-side


Include the view templates in the asset pipeline:
```javasript
 //= require_tree ./views
```

### Extensions supported

```
template.rac
template.ractive
```

### Client side

```javascript
var template = RactiveTemplates["path/to/your/template"]

var view = new Ractive({
  el:'your_element',
  template:template
});
```

### A few words on minifiers

We didn't bundle the mified versions of the library since you shouldnt need those (the asset pipeline handles this very well)

### Use your own ractive.js distribution (bower for instance)

In ruby (ensures templates are compiled with the right version) 
```ruby
RactiveAssets::Config.compiler_path = 'path_to_ractive.js',
```

In Javascript
```javascript
//= require path_to_ractive.runtime
//= require_tree ./path_to_templates
```
