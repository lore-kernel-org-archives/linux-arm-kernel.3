Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F26F433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXlOXson+ZOeKet8SZPRBk7wXfDuJIIqtNcyxVWMftI=; b=ACvV7NPPzK8WnGrthZcl9H+OOT
	8ydgGrwDyYa+Yj/dtElvo+gT59iuA3eKv2tuNHz/jWZcWONXtAMhIKsylaKgsOdohic33ePcsJp9c
	vlQi2iLGKEQ5759qQKM2La0wkhJ7Rd6mVKHjK4n8CXJQGtyd1ozbNoDWQO0Pe9Sds+S8wSBf+8C6e
	IPtHDslIiqYCv3SGXMy07nE/V1qwumt12gPoJtsoMRDFvlzrGVKqYBJIRflQxEC589Ib/20WxZjMd
	VTz+ch2Zyacq2F9oumVSenrSzYmLCYtqlzg1vTITLlK1SkKjQGrXrMJaP/HI/gnEkfWK7fUuFH1Wn
	gWCH1xVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8nE-00000001hU0-2g6h;
	Wed, 15 Apr 2026 22:33:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8m4-00000001hOw-1dd9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 22:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2DBF60180;
	Wed, 15 Apr 2026 22:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B73C19424;
	Wed, 15 Apr 2026 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776292315;
	bh=WPuIjMAw2ocla7dY4PH5AfZDm54Cudg1cBk8x+T2SWo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uJ5VWjvMoT3HFcDUCZIjlcya34Wb+vN/KoNeCdTsmgE0YpuNfEF7a8tR5VJUYNKtD
	 ZLMiZJ3TRHtJiiWzSLEgNT8KNDwHCFE8yyBFY30yBgTT+deMu0BopFqUETadRqZN+v
	 d7kEb26guP4aMc8y4lA/wJprSezQyaf+103VrbqK7aP0ycrmy95ktZxaJ9/QGlOkH8
	 YiZ5gjfKqHOcVGyl0SPffjtIJ3nhiQxDcVDvm0dXD+Vk3zdjQfbWCrIBQieSMd7oTk
	 uqpvT/oqyEP1VeNp+Idtogxc3N4Fut0riuoME02qVOR1t5eoo1K9tOjjRiv5Mzir3a
	 hnzfJ9FhivtTA==
Date: Wed, 15 Apr 2026 17:31:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Bartosz Golaszewski <brgl@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Lee Jones <lee@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260414-upstream_pinctrl-v6-2-709f2127da33@aspeedtech.com>
References: <20260414-upstream_pinctrl-v6-0-709f2127da33@aspeedtech.com>
 <20260414-upstream_pinctrl-v6-2-709f2127da33@aspeedtech.com>
Message-Id: <177629231119.934339.16424036449507234934.robh@kernel.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
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


On Tue, 14 Apr 2026 17:39:00 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
> 
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 112 +++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: allOf:1: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: allOf:1: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260414-upstream_pinctrl-v6-2-709f2127da33@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


