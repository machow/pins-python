<!doctype html>
<html>
  <head>
    <link rel="stylesheet" href="pagedtable-1.1/pagedtable.css">
    <script language="javascript" src="pagedtable-1.1/pagedtable.js"></script>
    <link rel="stylesheet" href="highlight.js-9.15.9/qtcreator_light.css">
    <script src="highlight.js-9.15.9/highlight.js"></script>
    <style>
      body {
        font-size: 16px;
        font-family: 'Lato', sans-serif;
        color: #333;
      }
      section {
        border-left: solid 6px #dddddd;
        padding: 0.5em 0 0.5em 10px;
        margin-bottom: 1em;
      }
      pre {
        margin: 0;
        padding: 1em;
      }
      h3 {
        font-weight: normal;
        color: #888;
        margin: 0 0 0.5em 0;
      }
    </style>
  </head>
  <body>

    <section>
       <h3>{{pin_name}}</h3>
       {% if pin_metadata %}
       <p>
         {% if date %}<b>Last updated:</b> {{ date }} &bull;{% endif %}
         <b>Format:</b> {{ pin_metadata.type }} &bull;
         <b>API:</b> v{{ pin_metadata.api_version }}
       </p>
       <p>{{ pin_metadata.description }}</p>
       <p>Download data: {{ pin_files }}</p>
       <details>
         <summary>Raw metadata</summary>
         <pre>{{ pin_metadata.to_yaml() }}</pre>
       </details>
       {% endif %}
     </section>

    <section>
    <h3>Code</h3>

    <!-- TODO: how to handle this?

      <pre id="pin-r" class="pin-code"><code class="r">library(pins)
board <- {{board_deparse}}
pin_read(board, "{{pin_name}}")</code></pre>

    !-->

    <script type="text/javascript">
      hljs.registerLanguage("r", highlight_r);
      hljs.initHighlightingOnLoad();
    </script>
    </section>

    <section style="{{ data_preview_style }}">
      <h3>Preview <small>(up to 100 rows)</small></h3>
      <div data-pagedtable style="height: 25em;">
        <script data-pagedtable-source type="application/json">
          {{ data_preview }}
        </script>
      </div>
    </section>
  </body>
</html>
