# PhpStorm

## Live Templates

You can download the settings here: [PhpStorm-live-templates-settings.zip](./PhpStorm-live-templates-settings.zip)

Here is the description of the shortcuts:

### Description

<templateSet group="Custom">
  <template name="t" value="// @todo: current: " description="PHP/JS -&gt; @todo/current" toReformat="false" toShortenFQNames="true">
    <context>
      <option name="JAVA_SCRIPT" value="true" />
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="q" value="die('here.'); // @todo: debug backtrace" description="PHP -&gt; die('here.');" toReformat="false" toShortenFQNames="true">
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="d" value="dump($CLIPBOARD$);die(); // @todo: debug backtrace" description="PHP -&gt; dump();die();" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="z" value="var_dump($CLIPBOARD$); die(); // @todo: debug backtrace" description="PHP -&gt; var_dump(); die();" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="a" value="print_r($CLIPBOARD$); die(); // @todo: debug backtrace" description="PHP -&gt; print_r(); die();" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="apre" value="print '&lt;pre&gt;' . print_r($CLIPBOARD$, true) . '&lt;/pre&gt;'; die(); // @todo: debug backtrace" description="PHP -&gt; &lt;pre&gt; print_r() &lt;/pre&gt;; die();" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="c" value="$output-&gt;writeln('&lt;info&gt;$SELETION$&lt;/info&gt;');" description="PHP / Symfony -&gt; console.log" toReformat="false" toShortenFQNames="true">
    <variable name="SELETION" expression="" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="zz" value="var_dump($CLIPBOARD$); // @todo: debug backtrace" description="PHP -&gt; var_dump();" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="co" value="console.log($CLIPBOARD$);" description="console.log" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="JAVA_SCRIPT" value="true" />
    </context>
  </template>
  <template name="vd" value="\Symfony\Component\VarDumper\VarDumper::dump($CLIPBOARD$); // @todo: debug backtrace" description="VarDumper();" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="coi" value="console.log('(i) Debug Info: Value to debug:' + $CLIPBOARD$);" description="console.log: (i) Debug info" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="JAVA_SCRIPT" value="true" />
    </context>
  </template>
  <template name="coe" value="console.log(&quot;/!\\ ERROR: : &quot; + $CLIPBOARD$);" description="console.log: /!\ Error" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="JAVA_SCRIPT" value="true" />
    </context>
  </template>
  <template name="qq" value="die('_________________________here, you notice me?_________________________.'); // @todo: debug backtrace" description="PHP -&gt; die('_______.');" toReformat="false" toShortenFQNames="true">
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="code" value="```&#10;$CLIPBOARD$&#10;```" description="```clipboard()```" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="OTHER" value="true" />
    </context>
  </template>
  <template name="tq" value="// @question: " description="PHP/JS -&gt; @question" toReformat="false" toShortenFQNames="true">
    <context>
      <option name="JAVA_SCRIPT" value="true" />
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="tt" value="// @todo: " description="PHP/JS -&gt; @alias of todo" toReformat="false" toShortenFQNames="true">
    <context>
      <option name="JAVA_SCRIPT" value="true" />
      <option name="PHP" value="true" />
    </context>
  </template>
  <template name="dd" value="dump($CLIPBOARD$); // @todo: debug backtrace" description="PHP -&gt; dump();" toReformat="false" toShortenFQNames="true">
    <variable name="CLIPBOARD" expression="clipboard()" defaultValue="" alwaysStopAt="true" />
    <context>
      <option name="PHP" value="true" />
    </context>
  </template>
</templateSet>
