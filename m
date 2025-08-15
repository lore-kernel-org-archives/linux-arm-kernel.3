Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A74CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 21:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxnI97Oar3eJxffsPtaRWw14y+f8eKTN8g29/St3/s4=; b=QpdsrbtQxab5qQgINJkRTTMetq
	GGM3m8NQaoqvUQ6aqa6HLZETynhkP1BCgU+g7TGkM3X8azWb3CR6gD/yfMR4vWLlJLZxohZ/6BfeP
	ZFCGOSSV/PsfmJdeNDABpisMmeUdf/0v0ohOV87p6MrPDMNp4TkbPOUfTuimzj8OH4kb3JJCjjZWH
	AWMjfr7xx/Kxos/1ZXsziBt2X4QyBnipKfOlqasOiTlyL2JMGCb8sPmWB2LyXTrSX3jNZYdj1T7OW
	OQRJc4DvgtJZIW2LPRZ1Wu2klvatkVKGjk4Jta9FP1M6X89zUf+zPACyEcC7lVR2SDXIkD1FllG+v
	S0lRmPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1s2-00000003XZe-1IbG;
	Fri, 15 Aug 2025 21:21:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1pP-00000003XEU-2f5v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 21:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1708D6141C;
	Fri, 15 Aug 2025 21:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C685EC4CEEB;
	Fri, 15 Aug 2025 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755292750;
	bh=AWF7ROMiI+AFCkdDNOd6X3SLMWbwQ51ClYm8LtWloJQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Z3e5v6U9jNUaD41ytw6FxJKG/p6EF4RS26+LYK6VtArQ4DSVyNj2/faRMNOQPxeSS
	 iCpnbvjGMFjPRKbNtHNj7a8TuWitLBPIimAcqcIfEffZGKcl7Wc17tLXMLzT51AXW8
	 ucVQQzzOYfdhEJNWcSie+kE7SoJC2lumk4R9fHqWxJ5npWdaNK2o+jltI9/73Q9ssF
	 Hm2FSzfpcOpClw4L6zjDSChVbzyjakQTfg3frK3ab/lwjz7SbGM4T2UjE+Ssc5YumZ
	 ps7FnmyBDfEULcwsWr0xLzxQfOAgVH4oyvoX3bidX62RBbOjWxN/oBu8dKLggfJYBB
	 JXA2CFaarqhuQ==
Date: Fri, 15 Aug 2025 16:19:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 devicetree@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
Message-Id: <175529260025.3212383.1843651240268969923.robh@kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: ixp4xx: Add device trees for MI424WR
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


On Thu, 14 Aug 2025 18:40:02 +0200, Linus Walleij wrote:
> This patch series adds device trees for Actiontec MI424WR
> versions A, C and D.
> 
> These routers are quite common in the Americas and uses
> the IXP4xx SoC.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (3):
>       dt-bindings: Add Actiontec vendor prefix
>       dt-bindings: arm: List actiontec devices
>       ARM: dts: Add ixp4xx Actiontec MI424WR device trees
> 
>  .../devicetree/bindings/arm/intel-ixp4xx.yaml      |   2 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm/boot/dts/intel/ixp/Makefile               |   2 +
>  .../ixp/intel-ixp42x-actiontec-mi424wr-ac.dts      |  37 +++
>  .../intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts |  38 +++
>  .../intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  | 273 +++++++++++++++++++++
>  6 files changed, 354 insertions(+)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250814-ixp4xx-mi424wr-dts-afef5c00d68d
> 
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
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
 Base: using specified base-commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/intel/' for 20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org:

arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: gpio@1,0 (brcm,bcm6345-gpio): 'bank-width', 'intel,ixp4xx-eb-write-enable', 'pci-reset-hog', 'pstn-relay-hog-1', 'pstn-relay-hog-2' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dtb: gpio@1,0 (brcm,bcm6345-gpio): 'bank-width', 'intel,ixp4xx-eb-write-enable', 'pci-reset-hog', 'pstn-relay-hog-1', 'pstn-relay-hog-2' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']






