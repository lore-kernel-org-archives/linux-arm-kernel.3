Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77027C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQvLKcr1C5Qrj+kjnTzeup/xVFRgar6oMp47Wxl2bko=; b=LlBjlbhW60/uX6ZIKhtITYhoHL
	CXyr7He2Eu3JV52CzFW6CMpGOBrcKiL5kGYnv8eua0y6Qh0FZFGxLpiR4ZSulrNYpWfLfi5Rv5ViV
	1S0lm4HbOJRrhgo05f/RMoBihqO8gZzoTfr8qoyFS4W0/+0AM+EjXZb5/vY/yNL4jloe2Glh3z+Ww
	q4xcwCJ/kE8u0BHBUr7oarznR4xujul71KcXZ5Q13P3YMp0OfBiqvKMaq/Qppps88FwFeEeLhm6HN
	fBLizps1evOVeUlaDQ7sZ62JLg1uU5I32yYfRafyj5pP4SNY7x1z+ZHaNFEZ0unghBdwJPj2a5CAQ
	Zqh5H1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwdd-0000000Ardr-0dpZ;
	Wed, 18 Jun 2025 17:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsxp-0000000AKLE-0RNy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF2065C5474;
	Wed, 18 Jun 2025 13:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0115C4CEE7;
	Wed, 18 Jun 2025 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750253788;
	bh=xshy0rpJ6W5iYQQc9c0rwAuf1vDblFR4z0sFAMnuujc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O16Bsr4uXdPa70J8t1ZcSIO5rXL8LfJj0muu1rZLN2sNa+J8wYbBEtZzouC46+G38
	 tmH0XfH4w6kPuhiT6ZrXX9WhMZMGc4ARc6DIvCoglJz7eMFf228mK2i2K9XiFxOo11
	 Sf8mm/I/6dKsyKZ74bcMXhce9VPXmha08+tlUvuNvSwQRqM4fS1UayFa+w9Yb8Ukeh
	 dwBVmXBSud3+fZiCicxNySw8zA61KPxwkJWSxebVCINOyqA9h37AUwOFOrzVAiJNPw
	 y19/ZU96AdvD+zJbIqSYcLL04Fb+vVncjUj4XFGz+/Z+OfAGbzikS+9EXQWKtheN4X
	 nNwsAtGIx4kOg==
Date: Wed, 18 Jun 2025 08:36:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, 
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
To: Mihai Sain <mihai.sain@microchip.com>
In-Reply-To: <20250618103914.2712-1-mihai.sain@microchip.com>
References: <20250618103914.2712-1-mihai.sain@microchip.com>
Message-Id: <175025355214.1756305.9442014210793499196.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add cache configuration for Microchip SAMA7D
 and SAMA7G MPUs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_063629_234798_11B28754 
X-CRM114-Status: GOOD (  14.19  )
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


On Wed, 18 Jun 2025 13:39:12 +0300, Mihai Sain wrote:
> This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
> The cache configuration is described in datasheet chapter 15.2.
> 
> Changelog:
> 
> v1 -> v2:
> - Remove the cache-unified property from l1-cache node
> 
> Mihai Sain (2):
>   ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
>   ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
> 
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
>  arch/arm/boot/dts/microchip/sama7g5.dtsi  | 16 ++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> 
> base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
> --
> 2.50.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 52da431bf03b5506203bca27fe14a97895c80faf

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250618103914.2712-1-mihai.sain@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#






