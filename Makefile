
ANTLRDIR=/usr/local/Cellar/antlr/4.7.2
ANTLRLIB=$(ANTLRDIR)/antlr-4.7.2-complete.jar
ANTLR=$(ANTLRDIR)/bin/antlr
GRUN=$(ANTLRDIR)/bin/grun

# For dotnet
NUNITVERSION=3.6.1
ANTLRNET=Antlr4.Runtime.Standard
ANTLRDLL=Antlr4.Runtime.Standard.4.7.2/lib/net35/Antlr4.Runtime.Standard.dll
DLLSPATH=../pddlnet
CSANTLR=pddlListener.cs pddlBaseListener.cs pddlLexer.cs pddlParser.cs
NUNITLIB=NUnit.$(NUNITVERSION)/lib/net45/nunit.framework.dll
NUNITLITE=NUnitLite.$(NUNITVERSION)/lib/net45/nunitlite.dll
LIBSTEST=-reference:output/$(NUNITLIB),output/$(NUNITLITE),Microsoft.CSharp,pddlnet
MONOBIN=/Library/Frameworks/Mono.framework/Commands
NUGET=$(MONOBIN)/nuget

export CLASSPATH:=.:$(ANTLRLIB)

all: testgrammar parsers

parsers: csparser

testgrammar: pddl.g4
	mkdir -p tmp && \
	$(ANTLR) -o tmp pddl.g4 && \
	cd tmp && javac *.java && \
	$(GRUN) pddl domain ../examples-pddl/domain-01.pddl && \
	$(GRUN) pddl problem ../examples-pddl/problem-01.pddl


csparser: pddl.g4 pddlnet/pddl.cs
	mkdir -p pddlnet && \
	$(ANTLR) -Dlanguage=CSharp -package PDDLNET -o pddlnet pddl.g4 && \
	(cd pddlnet && \
	$(NUGET) install $(ANTLRNET) && \
	$(MONOBIN)/mcs -out:pddlnet.dll -reference:$(ANTLRDLL) -t:library pddl.cs $(CSANTLR))

cstest: csparser pddlnet/pddltest.cs
	(cd pddlnet && \
	mkdir -p output && \
	$(NUGET) install NUnitLite -Verbosity quiet -OutputDirectory output && \
	$(MONOBIN)/mcs -d:NUNIT $(LIBSTEST) -out:output/pddlnettest.exe -reference:$(ANTLRDLL) -t:exe pddltest.cs && \
	cp pddlnet.dll $(ANTLRDLL) output/$(NUNITLIB) output/$(NUNITLITE) output && \
	cd output && \
	$(MONOBIN)/mono pddlnettest.exe )

csnuget: cstest
	(cd pddlnet && \
	rm -f pddlnet.dll.*.nupkg && \
	$(NUGET) pack pddlnet.dll.nuspec )

csnugetpublish: csnuget
	(cd pddlnet && \
	$(NUGET) push pddlnet.dll.*.nupkg )

