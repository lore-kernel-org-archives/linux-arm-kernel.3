Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84141CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+C7UJ5EIB57xL4KV5//HXNlxtQfTiI3AQWlDNB9xG9M=; b=uO2znFIBq7KKC2v6A0128seXDj
	OVYGQb+/oRSlORh8hfrHGXo/VIQwhGBq/2RnEpmjyMKHAUbJZFm+8Lk0PumljNr9L9iCroDQATxk5
	jnF5pHFOUyDp02IVI46rmLurKsTugWYNOPBd07pP7LwkavKQyjneWd4UQp7K1IZkeV9ARkkfBUT/H
	TYFvdCozyd7sC6OKHIvcxtysH882VXlgineck3iMRX9xq0xLZB2Icop8UStTzSd9jft4ZV0NgPx46
	Y+75mH2cftky/Yz/kjcLdK52kyPHjHt/ClpmtUN3DLW07/MxlzXDUje7ia0WJBI8FhufXy5IEcYHv
	eBzuyVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFyA-00000001bTN-1leS;
	Thu, 18 Jun 2026 16:51:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFy9-00000001bTH-3eYL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 16:51:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56ABC41ACC;
	Thu, 18 Jun 2026 16:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CECA1F000E9;
	Thu, 18 Jun 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781801517;
	bh=+C7UJ5EIB57xL4KV5//HXNlxtQfTiI3AQWlDNB9xG9M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=cRz3Arfn81Xxb0sb5xjVuc9aHEbbew8OcSDJxv/ZQWPs6orcRzAeN2C+dIx2RArvC
	 NxqS0oBMA4GI7gesRaqxmeuVANuET6TQ1GMQSsm6gGujTjolJMi5hiFQM6cZ7GS1zj
	 cUb9z5VIgT5bC3c7Kc8XYT9PRIYm9uhF2cawTytA+LLC9GYJMt5jc5nYKDsJLzcOn2
	 +LoJNrvv+dVlmX/MzxNlEQamZooeOeMlq7/aa4uWYOedDUylJvasepXktDtifWt+Hw
	 obOgwDjHstjkEzlU9nqPrTDH/uR1biK3+vvZJuMxyQcCyqGt+XWe6fJ43wKvDdcqvL
	 zXdtW9BTCB+XQ==
Date: Thu, 18 Jun 2026 11:51:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 dmaengine@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Mark Brown <broonie@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Linus Walleij <linusw@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-1-eb5e50b1a588@kernel.org>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-1-eb5e50b1a588@kernel.org>
Message-Id: <178180151626.1898523.11669770093439143903.robh@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: power: Convert Ux500 PM domains to
 schema
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


On Thu, 18 Jun 2026 07:00:47 +0200, Linus Walleij wrote:
> Convert the legacy Ux500 power domain text binding to YAML.
> 
> Move it under bindings/power.
> 
> Reference the generic power-domain schema.
> 
> Update MAINTAINERS for the new path.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ----------------
>  .../power/stericsson,ux500-pm-domains.yaml         | 46 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 47 insertions(+), 35 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.example.dts:25.28-28.11: Warning (unit_address_vs_reg): /example-0/sdi0_per1@80126000: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.example.dtb: sdi0_per1@80126000 (arm,pl18x): $nodename:0: 'sdi0_per1@80126000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.example.dtb: sdi0_per1@80126000 (arm,pl18x): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.example.dtb: sdi0_per1@80126000 (arm,pl18x): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260618-ux500-power-domains-v7-1-v1-1-eb5e50b1a588@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


