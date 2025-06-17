Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4602BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFEhbAbFKzjdZ9ss+kW/BvXUJ9VazO3zoHDmmTrBWbk=; b=4A3veTChJ6obi6e90x9swEhOm3
	RUPw7sVPuwN7HqI2ldk6oydXS3V5gZIQZQ76c5l4ExOuWySRzKvD5sCcsxOTMEzjEX2+oas7NrMQj
	P0XI7hbDQYkw5e78OpNb1o8ulYWBQqyQIZ/4qvrP4Pi9ziZ4iFUUunqgYQrwkTAYRU8CqcuFfVdNB
	raWdxJYgVTdabIJFZUsTP45WOv9vFakOs+w3UQ+S7XqjwEXa96VjiUCNnsrpXzTTUE89Wj8zGXkWu
	bMbL7vWkLZEq/EtfLTAQimn7BJBgWeDarrrhqJvwHbttgJ+sUT1XeaRxALC3Vs9N8VAVqDrdzCZ6m
	ZOf/POnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYBb-00000007jJO-0J4m;
	Tue, 17 Jun 2025 15:25:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXBb-00000007Wot-0lgH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A2055C566D;
	Tue, 17 Jun 2025 14:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1346C4CEE7;
	Tue, 17 Jun 2025 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170074;
	bh=YNDuQ57cE+yduWX4US+oUYZ9fyMenjbkoEoZLqgvLus=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QRcoL9yeJ96ky13EWdUI/zFtt/54M0CuZj3LdBVf1Kcr1cJF3fhlVdXWjqg2uY43q
	 +oC3YTnYNV9l0HK2bQ1S67XSQOjPLx9HPctaE91U3MG9p8IATT3Y4d57T1OC5f38yr
	 zU++uOdGP03IP9Hfd0r4Nx8xs7dC9Bk8tguUEorUuNPzv8ecgTLzXULDVfEqdWixEg
	 IL9nPrPOgtmCIrmCEB25Uub4WQ7tMACsefonZLzwNJe6eBQpmleuBpDIRzfoxX61fO
	 YOgZ5OMJl6KN3PJipRYt5jWLGIZdCR9pOq7ev7jmoFetvq14Cyo1bQtIxHv5qEp5p/
	 d3/1YjTCNHHvg==
Date: Tue, 17 Jun 2025 09:21:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, claudiu.beznea@tuxon.dev, 
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, 
 linux-arm-kernel@lists.infradead.org
To: Mihai Sain <mihai.sain@microchip.com>
In-Reply-To: <20250617104703.45395-1-mihai.sain@microchip.com>
References: <20250617104703.45395-1-mihai.sain@microchip.com>
Message-Id: <175016979802.2093569.17706303505979511319.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add cache configuration for Microchip SAMA7D and
 SAMA7G MPUs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_072115_306187_AFE7F553 
X-CRM114-Status: GOOD (  12.72  )
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


On Tue, 17 Jun 2025 13:47:01 +0300, Mihai Sain wrote:
> This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
> The cache configuration is described in datasheet chapter 15.2.
> 
> Mihai Sain (2):
>   ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
>   ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
> 
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 17 +++++++++++++++++
>  arch/arm/boot/dts/microchip/sama7g5.dtsi  | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> 
> base-commit: 9afe652958c3ee88f24df1e4a97f298afce89407
> --
> 2.49.0
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
 Base: using specified base-commit 9afe652958c3ee88f24df1e4a97f298afce89407

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250617104703.45395-1-mihai.sain@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): d-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): i-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): d-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): i-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): d-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): i-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#






