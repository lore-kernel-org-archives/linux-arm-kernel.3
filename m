Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E2C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUwzbbA/Kzi2GvoW3/gC0e7zhB9cAZn309Gh1CQe6JA=; b=P5y9Yl3DpPVfktWSTeZAWxu4KC
	YZoQwgEPyboRQALaq2iss9+HF5G3aN0dLChq/ZI5+h0djcrHVHihb5bVbxGIxx5aNywDFDzYiL20r
	uCveI4ruGHP6qSrBbjHb87gYwYQax73s6AZ/EEYsc81zJWV7dFt9tFMPMecL4I5Vm/oGBVY8cFUYR
	CwzV1AEVgKnR0khd2ENqS2UjQcah38gIs2PSySMPE1gP6wRHWx8ofeygwYxJEAtc5guwK48l/aYjB
	jH4AHyJDmQX2+XnK8PS8OaiPcGxh6brUCH5UFZLzE9R9CUaYNqDeUkZcsnmzfXBtiw2c+XrWfalHy
	MIty+7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5hO-00000000shP-3gLP;
	Mon, 03 Mar 2025 13:19:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5co-00000000s0E-3vQU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:14:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 889F35C5975;
	Mon,  3 Mar 2025 13:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98BBC4CEE9;
	Mon,  3 Mar 2025 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007666;
	bh=FiWSvzkRIMYnufn/6j3BHnlJOVYfPeryI4S3GXt0vAc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TGmDv4Qy0cdXTql42zoM9MZxyD+mzsNU84Gh2a9Bf7K6p/0qDRxKws68ZDFYHyWON
	 334fbrKihCSvqDRJGspPw/djb7ne82q3xjesrA1HfHtPYKLh+uHq4AUBa+U1W21glj
	 e5TM4yUFaV3LSXJYgJLVnlCHzktDkF5R2x2eLbVIgBHr6vJ8UMs4V2N3i/ZxSByZCr
	 +LHt2BQ6LdRwXX+N7gEsTHfI4yVgFToA8SUQwczwR7qXqArTYC98YLw1nU+ks3qvP/
	 KzNygSvESuVw7PKUv07+kfDwmhA+N5UwLVHM3xplqdt0imjVpHsVd3t2xOkMMa5xna
	 hBrhbq/qTUfLA==
Date: Mon, 03 Mar 2025 07:14:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
In-Reply-To: <cover.1740675317.git.Ryan.Wanner@microchip.com>
References: <cover.1740675317.git.Ryan.Wanner@microchip.com>
Message-Id: <174100756391.1496568.10334189756404294750.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add System Components for Microchip SAMA7D65
 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051427_019659_26CDDAD9 
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, dmaengine@vger.kernel.org, krzk+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 28 Feb 2025 08:24:09 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch set adds support for the following systems in the SAMA7D65
> SoC:
> - DMAs
> - Chip ID
> - Dual watchdog timer.
> 
> Changes v1 -> v2:
> - Removed pathes that have been accepted and applied from v1 [1].
> - Corrected missing newline in dt-binding.
> - Corrected mismatch in watchdog dt node.
> 
> 1) https://lore.kernel.org/linux-arm-kernel/09eafe54-c262-4db4-b11d-0644a1f90a14@tuxon.dev/
> 
> Ryan Wanner (2):
>   dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
>   ARM: dts: microchip: sama7d65: Add watchdog for sama7d65
> 
>  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml    | 4 ++++
>  arch/arm/boot/dts/microchip/sama7d65.dtsi                  | 7 +++++++
>  2 files changed, 11 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for cover.1740675317.git.Ryan.Wanner@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dtb: nand-controller: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#






