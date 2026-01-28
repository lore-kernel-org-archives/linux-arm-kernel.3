Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A36D25B45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n91HvnCLX++7R9lBgxRXVFUHJJvGOdsApG3xVtpeyM=; b=pCa7m59Aj0iyrttQwMKtCjMgb2
	cN5CSArCbTP+Urd+SjoYZuO6GXU8DgkCKIgJfp26pcWuIxBK/WBlCZDZaXGSSJB9e/GuZHZ4KyrEx
	Bu6xttkgEHmRkW5+aXzFX8XEjNH+09dE/3YvNnGzVKbvvhdVsQCOWMf0z9IZVrzzBMxVeby50Yner
	qo0Z408EnrDgueOvBEU5EzHBP6Q69AJDhkznBRdcRA0Kk8ZXxhsQAS3osFBi8lN/spJykcuF8hvyd
	xqCxfE4Bj91zlhI5seRWKkM9qjYsfsSG6h++Wo1GS3lV0lWQ9hhyYfRRL57vRMVThFQNNWegadSU/
	LMbkXUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3dC-0000000Fv2y-0EPZ;
	Wed, 28 Jan 2026 11:22:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3d9-0000000Fv1E-11VI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B18440256;
	Wed, 28 Jan 2026 11:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20287C4CEF1;
	Wed, 28 Jan 2026 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769599356;
	bh=SNl3JdvfWmRGGK6KLY9mNIhIDAZMrCCfZgN9ekGju9A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tVGC1dS4tJKiMtblu4E4K4bzGaKfN2CbtvcisX7n9PrkxaN+lSxPUFpErR0UAMs9l
	 1twOazGt9wVkZshFU/9KMWwYmL509JVFotH2hKrX9CDnGeJ9V7ZZ1ljRll1mwqDygU
	 uTtJN38dCZe45GT+eRPMu+wLx+fBP1t2z+hKOB0Z610jAW4Zf24GYrThCYzb8Vu7Ix
	 25Q6Lqqx2RZE3sDk2eMmILhcv3jmM+QjoRyIfqGTMDRAqyg9aD7PBz1cILLq9nn/M9
	 ktmrvDTux3bKQcEOmNqUuTh92Arqfncyuh/oKJgDx2P0Gq72CBYgksY2v0POnD9GPo
	 QkSLTWP09cx7w==
Date: Wed, 28 Jan 2026 05:22:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: cix-kernel-upstream@cixtech.com, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, p.zabel@pengutronix.de, peter.chen@cixtech.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 lee@kernel.org, conor+dt@kernel.org
To: Gary Yang <gary.yang@cixtech.com>
In-Reply-To: <20260128093611.1932770-2-gary.yang@cixtech.com>
References: <20260128093611.1932770-1-gary.yang@cixtech.com>
 <20260128093611.1932770-2-gary.yang@cixtech.com>
Message-Id: <176959935538.776071.11378547409870368509.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: reset: add sky1 reset controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_032239_368074_F8E81439 
X-CRM114-Status: GOOD (  11.92  )
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


On Wed, 28 Jan 2026 17:36:09 +0800, Gary Yang wrote:
> There are two reset controllers on Cix sky1 Soc.
> One is located in S0 domain, and the other is located
> in S0 and S5 domain.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Link: https://lore.kernel.org/r/20251124063235.952136-2-gary.yang@cixtech.com
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       |   7 +
>  .../bindings/reset/cix,sky1-rst.yaml          |  46 +++++
>  .../soc/cix/cix,sky1-system-controller.yaml   |  48 +++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  5 files changed, 307 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: ignoring, error in schema: properties: compatible: oneOf: 0: contains
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ~~~~~~~~~^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
    dtsch.check_schema_refs()
    ~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 241, in check_schema_refs
    self._check_schema_refs(resolver, self)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 216, in _check_schema_refs
    self._check_schema_refs(resolver, schema[i], parent=parent, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
    ref_sch = resolver.lookup(schema['$ref']).contents
              ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
    registry = self.crawl()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
    id = resource.id()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
    id = self._specification.id_of(self.contents)
  File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
    return contents.get("$id")
           ^^^^^^^^^^^^
AttributeError: 'list' object has no attribute 'get'

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260128093611.1932770-2-gary.yang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


