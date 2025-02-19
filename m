Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F64C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 00:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPwUAaQ8wiZqx+eHaCXe0PobJIC4GzAQFCfn4ErrfIw=; b=BmFFyk+dSCdMR3r/Pkl5UlzCHL
	bB7R7ED5z/bfB2g2jxcg7gs9vjd/3eUhkpzMuZHkSpzlNRdPAJcZDk1foW8quJQBuruUj1G9bS2+i
	vmfN/deB/NTpZLbXRQkjGdmgS2HaDcYELU2bOM2qe1t9DAe8uHnCfjqLnDTEyPAzR0dcdKcdMzT84
	0Q7D435hpL305t9gEom4yTAIc4od8CL8RoqJZvDvh1ZQk5xXKEPh0wLB3FACMWY5aVpZ03KZ7csiW
	3gkdAAN6sPpgJKZ5wYm4mikahhthsC6NA85wE5Qug8Ate45pB4+mwX/UaHTRij98U/hugztCw1GsU
	Q4DNOwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYNN-0000000AQvW-1PK2;
	Wed, 19 Feb 2025 00:55:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYAW-0000000ANqO-1WnH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 00:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EAD15C5CAB;
	Wed, 19 Feb 2025 00:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AD0C4CEE2;
	Wed, 19 Feb 2025 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925747;
	bh=MCUZvMnjI+St/xxB98n3RdGdbJTQ9UD808hd20KqjPs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g7DXt187wHzs6lpJOBkSrmxvJy6EAno2kUlthlhPsgMhUKij1NDLsEfj8cya5mDQY
	 xfC1EOHc+knjSm5CH8o6khCn3rDz2NHfnSE1uk2Qhc0hgf/ydW3G8jOlCJqaoDh/DE
	 bc0jKanWKe7hYDToKMjh65tWXzRmnzM8mDRiG4lFQSpbSLOYX3R3wmn9HaeIzD+mTg
	 oyMiTZcjyshGu2hKWv44TdS1ze0xfKxFxZ9MmE1s4ru/Cbm6PDzEmVvzm0XHx3eEP2
	 O+Ti7sW763NoQQ1FeaEFJD+QH9Cae6SX5W/BN13rUrJaVeSUbodBzH2kJ1IjtMwMj8
	 Hni1nopfxMlfg==
Date: Tue, 18 Feb 2025 18:42:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
Message-Id: <173992516786.2065578.832520865805552342.robh@kernel.org>
Subject: Re: [PATCH 0/8]  Add System Components for Microchip SAMA7D65 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_164228_444325_C12C04C6 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, dmaengine@vger.kernel.org, krzk+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 14 Feb 2025 11:08:13 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch set adds support for the following systems in the SAMA7D65
> SoC:
> - DMAs
> - Chip ID
> - Dual watchdog timer.
> 
> Ryan Wanner (8):
>   dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
>   dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
>   dt-bindings: dma: atmel: add microchip,sama7d65-dma
>   ARM: at91: Add Support in SoC driver for SAMA7D65
>   ARM: dts: microchip: sama7d65: Add chipID for sama7d65
>   ARM: dts: microchip: sama7d65: Add watchdog for sama7d65
>   ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Enable DMAs
> 
>  .../devicetree/bindings/arm/atmel-sysregs.txt |  1 +
>  .../bindings/dma/atmel,sama5d4-dma.yaml       |  3 ++
>  .../bindings/watchdog/atmel,sama5d4-wdt.yaml  |  3 ++
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 12 +++++
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     | 44 +++++++++++++++++++
>  drivers/soc/atmel/soc.c                       |  5 +++
>  drivers/soc/atmel/soc.h                       |  3 ++
>  7 files changed, 71 insertions(+)
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for cover.1739555984.git.Ryan.Wanner@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d180: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']






