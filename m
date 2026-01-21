Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CABAD262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eTuwud+ZMhwYB2/Jp8/FOdaTtqWNn4KVdInncP8Rog=; b=diBm77+g/9eatupAHks1MVMd0n
	BTMF/UAwVytdGN7LAp2PPPWRMW6akVEw9E+GTtTgc2DcQXhNdXoIsY/gpL1YgkwoERBWDeTtvz+dz
	R0fyZe5xrAAbVc6eJGE3tuDP8RH78CxNSeFfCon4hbKJ10WDARhrodsks0zF/MPMXrdl9TunlWFsS
	B5StScFe9eBI75qg6JxPwre5+FJ5MBgw71L5r00NCYJtEsjc9bPfrLCOgx2PS9g9r9fZmFTIbSHKq
	W+ISm02zHAweay9MJ28CmYbNRW9Y25pJ6perXQhLMgb1yaOqYKGA2b5Mb5cCnMqZcP6x/E+fdmpVJ
	3UgKXcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTNI-000000054ZW-38gs;
	Wed, 21 Jan 2026 08:15:36 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTNF-000000054Xp-0Qru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:15:34 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C18021A0D7D;
	Wed, 21 Jan 2026 09:15:30 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A994F1A0D78;
	Wed, 21 Jan 2026 09:15:30 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 15432202C4;
	Wed, 21 Jan 2026 09:15:30 +0100 (CET)
Date: Wed, 21 Jan 2026 09:15:30 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RFC 2/4] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
Message-ID: <aXCLIjrGfLVGv+Si@lsv051416.swis.nl-cdc01.nxp.com>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-2-36562ab0e9f7@oss.nxp.com>
 <176582217911.3066791.4926710165988218857.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176582217911.3066791.4926710165988218857.robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_001533_448054_F9192FF6 
X-CRM114-Status: GOOD (  17.57  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Dec 15, 2025 at 12:09:39PM -0600, Rob Herring (Arm) wrote:
> 
> On Sun, 14 Dec 2025 23:15:38 +0100, Jan Petrous (OSS) wrote:
> > The DWMAC IP on supported SoCs has connected queue-based IRQ lines.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 40 +++++++++++++++++++---
> >  1 file changed, 36 insertions(+), 4 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: ignoring, error in schema: properties: interrupt-names
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-doc-validate", line 8, in <module>
>     sys.exit(main())
>              ~~~~^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
>     ret |= check_doc(f)
>            ~~~~~~~~~^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
>     dtsch.check_schema_refs()
>     ~~~~~~~~~~~~~~~~~~~~~~~^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 241, in check_schema_refs
>     self._check_schema_refs(resolver, self)
>     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
>     self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
>     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                             has_constraint=has_constraint)
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 216, in _check_schema_refs
>     self._check_schema_refs(resolver, schema[i], parent=parent, is_common=is_common,
>     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                             has_constraint=has_constraint)
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
>     ref_sch = resolver.lookup(schema['$ref']).contents
>               ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
>     retrieved = self._registry.get_or_retrieve(uri)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
>     registry = self.crawl()
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
>     id = resource.id()
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
>     id = self._specification.id_of(self.contents)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
>     return contents.get("$id")
>            ^^^^^^^^^^^^
> AttributeError: 'list' object has no attribute 'get'
> Lexical error: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts:58.13-17 Unexpected 'snps'
> Error: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts:58.13-17 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20251214-dwmac_multi_irq-v1-2-36562ab0e9f7@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

It was missing closing semicolon in the example. Thanks for catch.
Fixed in v2.

/Jan


