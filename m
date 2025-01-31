Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4A5C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNJe8FC5/4EztO9HbgXUH/+Stc1cR+F0l/chGYeRYog=; b=zFWWgnZobPsEq1dLytteL3tvRI
	9i+kTCOzv/HATX1nq67fonfsnF+bRW/KmBejaHLGTfMn/RVB0rs4sRjAUOIOUhSqA4yeW0qLnZT8C
	lBRn79tAwHNepeipvnd7xPK2Z4n06E5/q13rCId+1ghnFrfJB834fgUxO1+SBeQS4h2GZ6hxa/G46
	y6ph824OpXP7LQqXStxy6Po2rgpX2RJa5LEgkKHVoJEH6RGWb47PZdSKh6xADeFArSrgl5eyLVfJG
	PpkRaPbLYGhOaMNiw7rBb9WiGdwdzvVMt0xhsGDLJTdo8QudXTHnxxs4zb8j/Y6j8fejsIxrQW6Sl
	X+ccX5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyWc-0000000BS16-3ZsV;
	Fri, 31 Jan 2025 21:26:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyU3-0000000BRjS-1G47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0E5F5C5E69;
	Fri, 31 Jan 2025 21:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4ECC4AF0C;
	Fri, 31 Jan 2025 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738358606;
	bh=LhKmvruLeCM6t4BXmtrDutkIVF5ck5kKXhLD8OcRytk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZVTh5YOWh7KdS1WWFsmOX/teeIRH8tzWoZ9VUyF7LyhG2xxVbfUIk3QiqJg2tWHTc
	 DsHKurAgD5rAo2EWeZAyWdHQ5sYU+WareLJcK3JtdyGGts29C1Q30jtqfQk/q6IrOO
	 nqkUI90KxJ58RkRHbuEEevxM+Q5ydG6akIHhS0zxGXNcGpnFsWMynXn/mKwk9FOYRe
	 mtdrXcBzfKnsr1vvLMWl5JFEYO2sXZJysWBJQyAfrkMrVh3IFhORnET9fr4QyLkywo
	 gOnnFZVd7Nu3uJJhrFjI/u2UdU8YsHRmEyWmyfusHFMWV3HmouHU2796jW1XiCeF9a
	 KUDD3H6k5+QuQ==
Date: Fri, 31 Jan 2025 15:23:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
Message-Id: <173835855390.46028.13185945524234872285.robh@kernel.org>
Subject: Re: [PATCH 0/4] ARM: dts: at91: calao_usb: fix various naming
 problems
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_132327_380066_C3C3EA90 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 31 Jan 2025 22:02:35 +0100, Wolfram Sang wrote:
> Two patches deal with the either missed or mistyped vendor 'Calao'. The
> other two patches deal with improper node names as reported by
> dtbs_check.
> 
> Wolfram Sang (4):
>   ARM: dts: at91: usb_a9263: fix wrong vendor
>   ARM: dts: at91: use correct vendor name for Calao boards
>   ARM: dts: at91: calao_usb: fix button nodes
>   ARM: dts: at91: usb_a9g20_lpw: use proper mmc node name
> 
>  arch/arm/boot/dts/microchip/tny_a9260.dts          |  2 +-
>  arch/arm/boot/dts/microchip/tny_a9260_common.dtsi  |  2 +-
>  arch/arm/boot/dts/microchip/tny_a9263.dts          |  2 +-
>  arch/arm/boot/dts/microchip/tny_a9g20.dts          |  2 +-
>  arch/arm/boot/dts/microchip/usb_a9260.dts          |  2 +-
>  arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  |  6 ++----
>  arch/arm/boot/dts/microchip/usb_a9263.dts          |  8 +++-----
>  arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 10 ++++------
>  arch/arm/boot/dts/microchip/usb_a9g20.dts          |  2 +-
>  arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |  2 +-
>  arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |  4 ++--
>  11 files changed, 18 insertions(+), 24 deletions(-)
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250131210236.36212-6-wsa+renesas@sang-engineering.com:

arch/arm/boot/dts/microchip/usb_a9263.dtb: /: failed to match any schema with compatible: ['calao,usb-a9263', 'atmel,at91sam9263', 'atmel,at91sam9']






