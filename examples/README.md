# TeX4ht documentation examples

Each example should be put in a subdirectory of this one. It needs to use a
Makefile to compile TeX files to both PDF and HTML. PDF files should use format
that can be used to include it as an image in the documentation.

There is a Makefile template in `Makefile-template` file.

Each example should produce just small HTML output. Stripped version of this
output, containing only contents of the `<body>` element is saved in file
`<jobname>-body.html`. This is handled by a DOM filter in `.make4ht`
configuration file.
