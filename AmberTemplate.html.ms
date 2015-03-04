<!doctype html>
<html>

<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{character_name}}{{#character_titles}}, {{character_titles}}{{/character_titles}}</title>

    <link href='http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Uncial+Antiqua' rel='stylesheet' type='text/css'>
    <style>
{{#colors}}
        body {
            margin-left: 20px;
            margin-right: 20px;

            font-family: "PT Serif", 'Times', 'Times New Roman', serif;
            background: url({{background_image_filename}});
            background-size: 256px 256px;
            /*background-repeat: no-repeat;*/
            background-origin: border-box;
            background-position: center;
            background-attachment: fixed;
            background-color: gray;

            color: {{main_text_color}};
        }

        ul {
            list-style-type: none;
            padding-left: 0em;
        }

        header {
            text-align: center;
            color: {{header_text_color}};
            text-shadow: 1px 1px 8px {{header_text_shadow_color}};
            font-size: 15pt;
            font-family: "Uncial Antiqua", fantasy;
            -webkit-stroke-width: 1px;
            -webkit-stroke-color: black;
            background-color: {{header_background_color}};
            border-radius: 10px;
            padding-bottom: 0px;
            padding-left: 20px;
            padding-right: 20px;
            box-shadow: 1px 1px 6px {{header_shadow_color}};
        }

        header h1 {
            padding-top: 10px;
            margin-bottom: 0;
            padding-bottom: 0;
            font-size: 38pt;
            line-height: 1.0em;
        }

        header p {
            margin-left: 10px;
            margin-right: 10px;
            margin-bottom: 10px;
            padding-bottom: 10px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 0.1em;
            margin-top: 0.1em;
        }

        th.table_section_header {
            font-size: 20px;
            border-top: 0px;
            border-left: 0px;
            border-right: 0px;
            border-bottom: 2px;
            border-style: solid;
            color: {{table_section_header_color}};
        }

        th.attribute {
            font-weight: 700;
        }

        .attribute {
            font-size: 16px;
        }
        #AttributesTable {
            width: 100%;
            border-collapse: collapse;
        }
        #AttributesTable tr {
            color: {{attributes_text_color1}};
            background-color: {{attributes_background_color1}};
            line-height: 1.5em;
            font-size: 16px;
        }
        #AttributesTable tr.alt {
            color: {{attributes_text_color2}};
            background-color: {{attributes_background_color2}};
        }
        #AttributesTable tr.header_row {
            color: #000000;
            background-color: rgba(0, 0, 0, 0);
        }
        th {
            text-align: left;
            padding-left: 5px;
        }
        td {
            text-align: right;
            padding-right: 5px;
        }
        .Other_Stuff {
            font-size: 16px;
        }

        #main {
            min-height: 50px;
            margin: 0px;
            padding: 0px;

            display: -webkit-flex;
            display:         flex;

            -webkit-flex-flow: row;
            flex-flow: row;

            -webkit-flex-direction: row;
            flex-direction: row;
        }

        #Attributes {
            -webkit-flex: 1 1 33%;
            flex: 1 1 33%;
            -webkit-order: 1;
            order: 1;
            border-right-width: 1px;
            border-bottom-width: 1px;

            border-top-left-radius: 10px;
        }

        #Powers {
            -webkit-flex: 1 1 33%;
            flex: 1 1 33%;
            -webkit-order: 2;
            order: 2;
            padding-left: 10px;
            padding-right: 10px;
            border-left-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
        }

        #Items {
            -webkit-flex: 1 1 33%;
            flex: 1 1 33%;
            -webkit-order: 3;
            order: 3;
            padding-left: 10px;
            border-left-width:1px;
            border-bottom-width: 1px;

            border-top-right-radius: 10px;
        }

        #BioDiv {
            display: -webkit-flex;
            display: flex;

            -webkit-flex-flow: row;
            flex-flow: row;

            -webkit-flex-direction: row;
            flex-direction: row;

            width: 100%;
            min-width: 100%;
        }

        #Bio {
          border-top-width: 1px;
          border-bottom-width: 1px;
          border-right-width: 1px;
          padding-left: 20px;
          padding-right: 20px;

          -webkit-flex-: 1 1 75%;
          flex: 1 1 75%;
          -webkit-order: 1;
          order: 1;

          width: 75%;

          text-align: justify;
          -webkit-hyphens: auto;
          -moz-hyphens: auto;
          hyphens: auto;
        }

        #Photo {
            border-top-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;

            -webkit-flex-: 1 1 25%;
            flex: 1 1 25%;
            -webkit-order: 2;
            order: 2;

            text-align: center;

            padding-left: 5px;
            padding-right: 5px;
            width: 25%;
        }

        #characterImg {
            width: 100%;
        }

        #Stuff {
            border-top-width: 1px;
            padding-left: 5px;

            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .section-header {
            min-width: 175px;
            text-align: center;
        }

        section {
            border-style: solid;
            border-width: 2px;
            background-color: {{main_background_color}};
        }

        footer {
            color: {{footer_text_color}};
            text-shadow: 2px 2px black;
            font-size: 10px;
            bottom: 0;
            width: 100%;
        }

        footer a:link, a:visited {
            color: {{footer_text_color}};
        }

        #content {
            box-shadow: 2px 2px 8px {{main_shadow_color}};
            border-radius: 10px;
        }

        @media all and (min-device-width: 320px) and (max-device-width: 667px) and (orientation: portrait) {
            #main {
                /*-webkit-flex-direction: column;
                -webkit-flex-flow: column;

                flex-direction: column;
                flex-flow: column*/
                display: initial;
            }

            #Attributes, #Powers, #Items {
                border-width: 2px;
            }

            #Attributes {
                border-bottom-width: 1px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }

            #Powers {
                border-top-width: 1px;
                border-bottom-width: 1px;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }

            #Items {
                border-top-width: 1px;
                border-bottom-width: 1px;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }

            #Stuff {
                border-top-width: 1px;
            }
        }
{{/colors}}
    </style>
</head>

<body>
    <header>
        <h1>{{character_name}}</h1>
        {{#character_titles}}<p>{{character_titles}}</p>{{/character_titles}}
    </header>
    <div id='content'>
<div id='main'>
    {{#attributeAuction}}
    <section id="Attributes">
        <h2 class='section-header''>Attributes</h2>
        <table id='AttributesTable'>
            <tbody>
                <tr class='header_row'>
                    <th class='table_section_header' colspan="1">Primary</th>
                    <th class='table_section_header' style="text-align: right;">Rank</th>
                </tr>
                <tr>
                    <th class='attribute'>Stregth</th>
                    <td class='attribute' id='strengthRank'>{{{strengthRank}}}</td>
                    <!-- <td class='attribute' id='strength'>{{strength}}</td> -->
                </tr>
                <tr class='alt'>
                    <th class='attribute'>Psyche</th>
                    <td class='attribute' id='psycheRank'>{{{psycheRank}}}</td>
                    <!-- <td class='attribute' id='psyche'>{{psyche}}</td> -->
                </tr>
                <tr>
                    <th class='attribute'>Endurance</th>
                    <td class='attribute' id='enduranceRank'>{{{enduranceRank}}}</td>
                    <!-- <td class='attribute' id='endurance'>{{endurance}}</td> -->
                </tr>
                <tr class='alt'>
                    <th class='attribute'>Warfare</th>
                    <td class='attribute' id='warfareRank'>{{{warfareRank}}}</td>
                    <!-- <td class='attribute' id='warfare'>{{warfare}}</td> -->
                </tr>
                <tr>
                    <th class='attribute'>Sorcery</th>
                    <td class='attribute' id='sorceryRank'>{{{sorceryRank}}}</td>
                    <!-- <td class='attribute' id='sorcery'>{{sorcery}}</td> -->
                </tr>
                <tr class='header_row'>
                    <th class='table_section_header' style="padding-top: 10px;" colspan="1">Secondary</th>
                    <th class='table_section_header' style="text-align: right; vertical-align: bottom">Rank</th>
                </tr>
                <tr>
                    <th class='attribute'>Armies</th>
                    <td class='attribute' id='armiesRank'>{{{armiesRank}}}</td>
                    <!-- <td class='attribute' id='armies'>{{armies}}</td> -->
                </tr>
                <tr class='alt'>
                    <th class='attribute'>Lore</th>
                    <td class='attribute' id='loreRank'>{{{loreRank}}}</td>
                    <!-- <td class='attribute' id='lore'>{{lore}}</td> -->
                </tr>
                <tr>
                    <th class='attribute'>Renown/Allies</th>
                    <td class='attribute' id='renownRank'>{{{renownRank}}}</td>
                    <!-- <td class='attribute' id='renown'>{{renown}}</td> -->
                </tr>
                <tr class='alt'>
                    <th class='attribute'>Artifacts</th>
                    <td class='attribute' id='artifactsRank'>{{{artifactsRank}}}</td>
                    <!-- <td class='attribute' id='artifacts'>{{artifacts}}</td> -->
                </tr>
                <tr>
                    <th class='attribute'>Lineage</th>
                    <td class='attribute' id='lineageRank'>{{{lineageRank}}}</td>
                    <!-- <td class='attribute' id='lineage'>{{lineage}}</td> -->
                </tr>
            </tbody>
        </table>
    </section>
{{/attributeAuction}}
    <section id="Powers">
        <h2 class='section-header'>Known Powers</h2>
        <ul id='PowersList' class='Other_Stuff'>
            {{#powers}}
            <li>{{name}}</li>
            {{/powers}}
        </ul>
    </section>
    <section id="Items">
        <h2 class='section-header'>Items</h2>
        <ul id='itemsList' class='Other_Stuff'>
            {{#items}}
            <li>{{name}}</li>
            {{/items}}
        </ul>
    </section>
</div>
    <div id="BioDiv">
        <section id="Bio">
          <h2 class='section-header'>Bio</h2>
          <p>{{{bio}}}</p>
        </section>
        <section id="Photo">
            <h2 class='section-header'>Character Image</h2>
            <img src="{{image}}" alt="{{character_name}}" id="characterImg"/>
        </section>
    </div>
    <section id="Stuff">
        <h2>{{stuff_type}} Stuff: {{stuff}}</h2>
    </section>
</div>
    <footer>
        <p>
        Image Credit: <a href="http://seamless-pixels.blogspot.co.uk/2014/07/wood-25-tree-bark-plank-texture.html" title="(Wood 25) tree bark plank texture">(Wood 25) tree bark plank texture</a> from <a href="http://seamless-pixels.blogspot.co.uk" title="Seemless Texture Library">Seamless Texture Library</a>
    </p>
    </footer>
</body>

</html>
