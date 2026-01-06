Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC4FCEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uem1PYoLyulo/MUF23qZO/dNEnjzQ9As9kztGwIxewQ=; b=d4rnyUtp+FIGThsjuMpH0Iwlzb
	AFAjH3UnjQXYugddm+gFZ2w816QpJzyI+eNjq65G9hrtAO5PiuJCjut4bybYyXP2TWz1cja32FiTf
	l6xWmUDZ9Xi5iXD0kAWcE/lyYvehBGUH4bQSiYDjY6aooms0IC93XhxwCdOYau2VnpxLnelZFA2ah
	VogdDEGZOoPQjiLlGfrTCWCnw3iXh9Fu15a60troON37AXLQO8FmHHlLjRNUwkiQRPwmByqJGW9Kd
	iRuEXkI5B/ovQzC9yU8TjNIHZbDWSv5gibgD3sp2QsgFOGFSe7Ot1171yVnZcxPZiqPGHfXVjMAdP
	uMCkuwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB5U-0000000Datm-1WpK;
	Tue, 06 Jan 2026 17:43:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB5R-0000000DatF-2Sia;
	Tue, 06 Jan 2026 17:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBC0E434FA;
	Tue,  6 Jan 2026 17:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF69C116C6;
	Tue,  6 Jan 2026 17:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767721395;
	bh=knYO0dVBtKILflMNQYIaYPLoiqqfWTfUH8gCTse05RE=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Fm19qNEumPDXY1AVuxiNPc5H1ZrdFIFe8+BXOsTcO9NopdwkpsjKcrZNt+VSKzafn
	 2IvPjQvnzJQpfvS5aTgE2Y2ckiVpWI2hRJEnQs0Pg0dhz6u8nJhNIB2jcUvOAQrTIf
	 kH5zIH9uZYdd47qG99G6513q0kEM795b1yo3JMXldLM2GmN+6btkrOxR0EbbAZ1FCY
	 f0cazx/FvGVgIP9L1Ct9UAVDsXLWVXPdfV6BMmFHH4ze0dX3tkPAhJbksx9Pauzf1d
	 Xa96eiHRr/HvLuZD/onk+lo2+/E/NxA/dhg2QbJpAE8glTfO8qdt0KSV10PWE5fuZ8
	 5r7xcMcvU0Bmg==
From: Rob Herring <robh@kernel.org>
Date: Tue, 06 Jan 2026 11:43:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
To: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
References: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
Message-Id: <176772122105.2350532.2584006959358435109.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm: dts: mediatek: fix pinctl node names
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_094317_672023_3FA5DC44 
X-CRM114-Status: GOOD (  18.07  )
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


On Tue, 06 Jan 2026 09:20:54 -0600, David Lechner wrote:
> While passing by, I noticed that the pinctrl nodes in a couple of dtsi
> files did not match the addresses in their reg properties. Here are some
> patches to fix that.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> David Lechner (2):
>       arm: dts: mediatek: mt7623: fix pinctrl node name
>       arm: dts: mediatek: mt8135: fix pinctrl node name
> 
>  arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
>  arch/arm/boot/dts/mediatek/mt8135.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
> change-id: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7
> 
> Best regards,
> --
> David Lechner <dlechner@baylibre.com>
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
 Base: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com:

arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'musb', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml






