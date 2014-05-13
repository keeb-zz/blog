blog
====

This is an example of a different kind of blog engine. Normally, engines are
rated by their ability to adequately address concerns like extensibility,
plugins, etc.

But, what if we could create an IDE purpose-built for a given project? How does
the ability to completely swap compilation targets, use different editors, 
change the way we reason about our tools?

This is an exploration of that concept. Where possible, I've included alternate
methods of doing the same tasks, in a completely different way.

Editors are an example. We have a web-based flow and a vim-based flow, 
operating on the same files, even simultaneously. For vim, you can also import 
your settings using the same mechanisms.

A challenge for those of you following along - see how easy it is to
incorporate emacs in to the flow. Or, even more interesting, see if you
can incorporate something like TextMate which requires a different platform.

# To Do

* Screecast of normal workflow
* Add git-based workflow (clone for vol creation, commit for publish)
* Trusted Build / Web Hooks, does this change anything?
* Tests?

# Setup

This section assumes you're going to use things as is. Where appropriate, the
files have been commented heavily so that you can customize at will while
being able to understand the intent.

## vim pre-setup

If you want to use a web-based IDE, skip this section.

This is an example of how to set up a terminal based editor. Modify the
Dockerile if you use something like vundle. It would be much better to install
the plugins and set up the env every time docker build / docker run are 
executed.

```
$ cd vim-settings
$ cp -r ~/.vim vim
$ cp -r ~/.vimrc vimrc
$ docker build -t ..
```

Once the build is run, do something like


```
docker run -name vim-settings <image>
```

As a result of executing this build, the *volume* `vim-settings` now contains an
editable snapshot of our settings which can be shared by any container. 

Time to put it to use.


## Source Files

But first.. source files are required. 


```
$ cd markdown
$ docker build -t markdown .
$ docker run -name markdown markdown
```

Like above, the *volume* `markdown` now contains an editable snapshot of the
content we want to edit. This volume will be operated on in many ways
downstream - from editing, to compiling, to publishing.

## Editing with VIM

Now that the 2 volume containers exist, editing can take place. 

```
$ cd vim-editor
$ docker build -t vim-editor .
$ docker run -i -t -volumes-from vim-settings -volumes-from markdown vim-editor\
     /content/index.html
```
Saving works: the command can be run multiple times and file state will remain.

## Compiling

Takes what is in /content, does something, and creates a volume in `www`

### compile

```
$ cd compile
$ docker build -t compile
$ docker run -name v1 -volumes-from markdown compile
```

Image runs 'compile.sh' which by default copies the contents from `/content` and
creates a *volume* in /www

### jekyll-compile

```
$ cd jekyll-compile
$ docker build -t jekyll-compile
$ docker run -name v1 -volumes-from markdown compile
```

# Serving staticly with nginx

Finally, the last tool in the chain for now. With these primitives, a full
workflow, including hosting, can be achieved.

If a different configuration is needed for whatever reason (ssl, certs, etc),
Dockerfile and repo are available in the `nginx` directory.

That being said, this is a durable static file hosting nginx, hosted behind a
reverse proxy of some sort maybe [hipache](http://github.com/dotcloud/hipache)


```
$ docker run -d -p 80 -volumes-from v1 keeb/nginx
```

