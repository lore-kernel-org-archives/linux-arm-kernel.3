Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51CDD2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWzUL86zeloyhVgkXz4snN6gH5GJmE76J80J6yEf0kk=; b=Nzd98V8CVPTEaGGMHa9GG0ifsK
	BCtSyoCuPBo66KmbvQobMofMNKKvMkQ7kfGVTXAfU3f/2LBAfS4Ln/KJbfPJ1SidWFivABbTp5tsV
	s2OJLSY5qIMPb32EOGrbKCHw2toKff2mXwS1zs8mBx971zvXQQD6eKBEcQoLG03Cj0sYaMmT4OxZt
	XQq5/PPFcgM/yvUR8Fpe5QFO3PMYbXwOzXPqhn0ft5w1MZ9aw11jaeLcg32HP9I9e9CVIrZDHSZAU
	sFmfx8wcsf6hrEqeNvMeQ8t77n98eNVC2TZiGoDMd2nPETSBPHM+A8/ua7oNILjliKWqmHuhbjUlM
	dP30rUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viApt-00000003q6R-0vk0;
	Tue, 20 Jan 2026 12:27:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viApq-00000003q4w-3jpn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3380D4376F;
	Tue, 20 Jan 2026 12:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B855DC16AAE;
	Tue, 20 Jan 2026 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912069;
	bh=OBQa66E8qIIZZ+a5/f/YUB/uMB9Oa+5RXnBGA2tH1VA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hHyqsg7SLKU6D/+NrFAwaN3MhGr5XHbaGDgQQaIQvl+t/iY5qBmfoYu4l8P1Lcgm2
	 oqJ3zQmgw1zYfVFAqf8RWA870XZkWL9FQDro7p9evW2z0tw4c4/sBvgKaSQtE4S5hn
	 CdQsPuEKhcpai1OKgQmiT+5ZVmFPe9frZIGN4ZfeuxtJ7DNvwhniQ85cZa9PK0IB8T
	 LRTiByz0h8vDb+LxO4ccWKXYiOI8JKsTMY1lsJ9exLUtk9yiLYW4Mi8tjUvTgSQUVa
	 U4O5JcFDH62U61e3HJyoNXKzJhwJ7VTiD1wcAU6iW1MKXr8WJHEzxlNP0uS3iWfgpB
	 YOcSVoJ6njokA==
Date: Tue, 20 Jan 2026 06:27:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: bmc-sw@aspeedtech.com, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
 <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
Message-Id: <176891206887.1610236.16662937885214497301.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_042750_970885_AC16271A 
X-CRM114-Status: GOOD (  14.51  )
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


On Tue, 20 Jan 2026 19:43:06 +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in ASPEED AST27xx SoCs.
> 
> The AST2700 SoC consists of two interconnected SoC instances, each
> with its own pin controller register block managed by a separate
> System Control Unit (SCU).
> 
> Introduce the "aspeed,ast2700-soc0-pinctrl" compatible string to
> describe the SoC0 pin controller, which is not compatible with
> existing ASPEED pinctrl bindings.
> 
> The SoC1 pin controller follows a regular and predictable register
> layout and can be described using an existing generic pinctrl
> binding, therefore no dedicated AST2700-specific compatible string
> is introduced for it.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  27 +++++
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 +++++++++++++++++++++
>  2 files changed, 157 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
	'pins' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
	'drive-strength' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'pins' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'drive-strength' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml
Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dts:63.13-50: Warning (ranges_format): /example-1/syscon@12c02000:ranges: "ranges" property has invalid length (16 bytes) (parent #address-cells == 1, child #address-cells == 1, #size-cells == 1)
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: syscon@12c02000 (aspeed,ast2700-scu0): reg: [[0, 314580992], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: pinctrl@400 (aspeed,ast2700-soc0-pinctrl): 'reg' does not match any of the regexes: '-state$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: pinctrl@400 (aspeed,ast2700-soc0-pinctrl): emmcclk-driving-state: 'drive-strength', 'pins' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


