Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56307C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Blk9r1hh0QxaQSw7sWRenuFslAKyJAfYF1GjGL322c8=; b=SLTPxa/YWFcQQ9kB/MkZ8zbu50
	QwOjDYnh+Bdxw4a1OnBJZcpvOpRwMEucBAWjLLrL9ZSD2T772OQYsfRgncWJa0vH++nT5Ys1K+tYr
	d6rCSdiV3FshsLEyenxMVPfMXXBoIHiskPgQdbbMkM4/Y34N8/ahVFj2UJ3gCYWq74sJP410989nZ
	i5wTRa6Dj6gr/KpCBr1ChuKpHgEONDHEx/v1hKbVV5LVp66lMjwBGsJjBX8TFCgan553+QhyoIFm6
	anCrHEghqtbV9el3eJaYw0Q+TqSnjkPjxyDGX9ex3O5cCX2C5hQkEVi9ajFqZZbNeR4ODzyjRl+2g
	+bHECaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sox-00000004Z30-2vFN;
	Mon, 21 Apr 2025 15:12:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sk9-00000004Y1u-1XyM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2A4F5C589E;
	Mon, 21 Apr 2025 15:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4632BC4CEEE;
	Mon, 21 Apr 2025 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248052;
	bh=XpBF592IiIG1LQEjR9hQKkk7p0JSOSBHnaLBwRYlLEY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Jmb0xUEUloBJKmK089RRQkHpaDUU5jfGzx4kpKwljevq90TBKkZOL2PqM0oguUH+W
	 CF6aXcFVg3x/Uyr24c2/17TLNTEaL5y+6rfWvxBxb/okvha4RxokeKrCkBFHq4o1MV
	 GWPNSzRJ6G13k9lVUumWyyon5f6fvZyTG3jcL0g4aLVk/UVQcJkJ1/1XDfxZLPiUN9
	 21ih5cG5/TU1/sys79t869STIBRCXtd8lQN7j4OyEdiTykj+ON6fOTyk0BfgDvcprn
	 uk+1fN8MQBq6PBdfSPme5LHQLa93GLhFJn3GyikPKDFj0vPpZe3D7P/W7R98j3LHV8
	 GUw9wl30vc2Wg==
Date: Mon, 21 Apr 2025 10:07:30 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel-list@raspberrypi.com, 
 devicetree@vger.kernel.org
To: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20250418143307.59235-1-wahrenst@gmx.net>
References: <20250418143307.59235-1-wahrenst@gmx.net>
Message-Id: <174524752073.2425603.8578531358448226652.robh@kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: bcm: Add support for Raspberry Pi 2 (2nd
 rev)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_080733_496296_BFD755ED 
X-CRM114-Status: GOOD (  14.58  )
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


On Fri, 18 Apr 2025 16:33:04 +0200, Stefan Wahren wrote:
> This series adds support for the Raspberry Pi 2 (2nd rev).
> 
> Stefan Wahren (3):
>   dt-bindings: arm: bcm2835: Add Raspberry Pi 2 (2nd rev)
>   ARM: dts: bcm: Add support for Raspberry Pi 2 (2nd rev)
>   arm64: dts: bcm: Add reference to RPi 2 (2nd rev)
> 
>  .../devicetree/bindings/arm/bcm/bcm2835.yaml  |   1 +
>  arch/arm/boot/dts/broadcom/Makefile           |   2 +
>  .../arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts | 130 ++++++++++++++++++
>  arch/arm64/boot/dts/broadcom/Makefile         |   1 +
>  .../boot/dts/broadcom/bcm2837-rpi-2-b.dts     |   2 +
>  5 files changed, 136 insertions(+)
>  create mode 100644 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts
>  create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-2-b.dts
> 
> --
> 2.34.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250417 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250418143307.59235-1-wahrenst@gmx.net:

arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: usb@2a000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: soc (simple-bus): gpu: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: soc (simple-bus): firmware: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: soc (simple-bus): power: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2835-cprman']
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2835-gpio']
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dtb: /soc/interrupt-controller@7e00b200: failed to match any schema with compatible: ['brcm,bcm2836-armctrl-ic']






