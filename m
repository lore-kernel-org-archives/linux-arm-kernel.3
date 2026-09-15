Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79011C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPC3tMekOOkb5QsKYECBHnd3JiInI8Q3f1HYPTy8hBI=; b=hVh92pZVABEMj5SaybV2m7SQDZ
	Pcg26qlkpwZccMcd5VQtVxOGPE9d64uH6+d9U9+QL0EBGuqLkZtakh9CJNPCTSUbxSyMRTPra64wP
	yARH7KmIreSX9O5QaUSWo4A8Ll8IrgETdW/lKpQ4zSdfwZGnco8asb6IDUpFbPvJSPsMggwF+WPD6
	BgDHTf5FeK7xt5N4kf6Yft4IU9joew5hiH7E97DC0RgwJd88MgcajcMcrF6DJ3BEpckbIZkLCn3HO
	O9Cr/ZOuZVi0+23mo8sLwwD+aZXUoyjDjJ4fTcII226FM0jdSkiEob/cJ9tInGfgBYtectWTPNUUk
	JdHdrbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IKi-00000004zEs-16m7;
	Tue, 15 Sep 2026 01:51:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IKg-00000004zEV-0ylm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:51:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE3136025F;
	Tue, 15 Sep 2026 01:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACD61F000FF;
	Tue, 15 Sep 2026 01:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789437097;
	bh=RPC3tMekOOkb5QsKYECBHnd3JiInI8Q3f1HYPTy8hBI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=mGV5Fz2ts6GMgtwlNTaZheA0T00bWo2nyPP2F1KN9Fi07MkJQqKvcZimw/u0YB3zw
	 wwvinIldj7AapRT2LwF+UnVomrvB8bfVOAtLQqjB4+bhB7jUdBHOluSi42NEYt1Hw0
	 rnrfgll9vwrAzlNtlAUimAxUuZGK1BxPQOO+/2hsQcsSUSgdSlNFlL4687EdTKO8nV
	 zCsgkdX3m663j2UL0isiXnjJZNPSUmic8A7gG8ZquIhe2xxB9ZLFg+OJ5UzDWkEtn6
	 9WA+C0NAuomKAdKoe6Y1TWZoNvIHME3wF69NHH9SjLDody2vJhVq7H3LpLnAzuQxJd
	 5G+h8uec1wtJA==
Date: Mon, 14 Sep 2026 20:51:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Walleij <linusw@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-1-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-1-9d0c17e1f816@kernel.org>
Message-Id: <178943696204.2694977.2443590518869733155.robh@kernel.org>
Subject: Re: [PATCH v2 01/20] dt-bindings: power: Convert Ux500 PM domains
 to schema
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


On Mon, 14 Sep 2026 13:54:29 +0200, Linus Walleij wrote:
> Convert the legacy Ux500 power domain text binding to YAML.
> 
> Move it under bindings/power.
> 
> Reference the generic power-domain schema.
> 
> Update MAINTAINERS for the new path.
> 
> Assisted-by: LLM
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
Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.example.dtb: sdi0_per1@80126000 (arm,pl18x): $nodename:0: 'sdi0_per1@80126000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml
Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.example.dtb: sdi0_per1@80126000 (arm,pl18x): 'anyOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml
Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.example.dtb: sdi0_per1@80126000 (arm,pl18x): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260914-ux500-power-domains-v7-1-v2-1-9d0c17e1f816@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


