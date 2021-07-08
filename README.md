<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="Laboratorio01_0"></a>Laboratorio01</h1>
<hr>
<p class="has-line-data" data-line-start="2" data-line-end="3">En este laboratorio se elabora una imagen en <strong>Docker</strong>, lo cual se especifíca con los siguientes pasos:</p>
<ol>
<li class="has-line-data" data-line-start="3" data-line-end="4">Con los siguientes comandos creamos un directorio y el archivo <strong>Dockerfile</strong>.</li>
</ol>
<pre><code class="has-line-data" data-line-start="5" data-line-end="8" class="language-sh"><span class="hljs-variable">$mkdir</span> Alpine
<span class="hljs-variable">$vi</span> Dockerfile
</code></pre>
<ol start="2">
<li class="has-line-data" data-line-start="8" data-line-end="9">Dentro del Dockerfile ponemos lo siguiente:</li>
</ol>
<pre><code class="has-line-data" data-line-start="10" data-line-end="16" class="language-sh">FROM alpine:latest
WORKDIR /<span class="hljs-built_in">jobs</span>
RUN apk update
RUN apk upgrade
EXPOSE <span class="hljs-number">80</span>
</code></pre>
<blockquote>
<p class="has-line-data" data-line-start="16" data-line-end="17">En la primera línea descargaremos la última versión, luego ubicaremos el directorio de trabajo, se ejecuta actualizaciones y por al final se expone el puerto 80.</p>
</blockquote>
<ol start="3">
<li class="has-line-data" data-line-start="18" data-line-end="19">Se crea la imagen y se valida</li>
</ol>
<pre><code class="has-line-data" data-line-start="20" data-line-end="26" class="language-sh"><span class="hljs-variable">$docker</span> build -t alpine:mario

<span class="hljs-variable">$docker</span> images
REPOSITORY   TAG       IMAGE ID       CREATED             SIZE
alpine       mario     <span class="hljs-number">4161</span>cded0f90   About an hour ago   <span class="hljs-number">8.69</span>MB
</code></pre>
<blockquote>
<p class="has-line-data" data-line-start="26" data-line-end="27">Donde -t lo uso para darle un nombre (tag) a la imagen.</p>
</blockquote>
<ol start="4">
<li class="has-line-data" data-line-start="28" data-line-end="29">Se crea el contenedor:</li>
</ol>
<pre><code class="has-line-data" data-line-start="30" data-line-end="37" class="language-sh"><span class="hljs-variable">$docker</span> run -dp <span class="hljs-number">80</span>:<span class="hljs-number">8080</span> --name=marioV2 alpine:mario
c1913c772b83fa05811816ecd64e367cbcc07955622ea71ae03d091bb6718c3f

<span class="hljs-variable">$docker</span> ps
CONTAINER ID   IMAGE          COMMAND     CREATED         STATUS         PORTS                                           NAMES
c1913c772b83   alpine:mario   <span class="hljs-string">"/bin/sh"</span>   <span class="hljs-number">6</span> seconds ago   Up <span class="hljs-number">5</span> seconds   <span class="hljs-number">80</span>/tcp, <span class="hljs-number">0.0</span>.<span class="hljs-number">0.0</span>:<span class="hljs-number">80</span>-&gt;<span class="hljs-number">8080</span>/tcp, :::<span class="hljs-number">80</span>-&gt;<span class="hljs-number">8080</span>/tcp   marioV2
</code></pre>
<blockquote>
<p class="has-line-data" data-line-start="37" data-line-end="38">En esta parte creamos el contenedor de modo interactivo, en segundo plano y exponiendo el puerto 8080 dándole un nombre “marioV2”</p>
</blockquote>
