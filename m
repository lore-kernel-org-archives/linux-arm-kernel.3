Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB85D711BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyAB+1D/TyFvzr1CcsMP6PbwqOATOGVJszboZBdhRSc=; b=Ht+VIWTbsqmo0hSnV7FCMuBZ9Q
	AoALbH9GCDBcfr8A7vpjgJI/trpo2lYKUr/lFnuDnFQ+jg+qkmF+ERcskKa6CGL9ZKXxlij3e+bNN
	Q9qCwaPgqdgrD+ZLFoq3JBP8lvAAEpwrzmt+vPX+ebZElckXw3UuilnRtntL4CpRTRP/odRKNYprK
	37HMUfaP1pCvKZfreiP7jNHAZb0cq3m3bDsz6XA+eGlURn+NLqp5JKUIHSIIqqnKfxZGdBjur59bb
	QRoSBzj7rgREfMCp3f1dqkYwmuYL3RkUAIFwxGwWqulUDgJWJq4wa/r9UkIN9Oq9uKj2v3ogZY48/
	UFWZRKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnC7-0000000FlaF-0rhp;
	Wed, 20 Nov 2024 16:04:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnAI-0000000Fl9g-3OjA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 511F25C5DA3;
	Wed, 20 Nov 2024 16:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE86C4CECD;
	Wed, 20 Nov 2024 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118570;
	bh=b1IuNrwPmr0zkVZQsOVX4JsVJnuSgjzcTTSibhiBAAo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kqsaLTUpfd7yNmynoxc6h047wjdIhAs6rm/HTg2+jhM7QvOE9IN0Bhb/HDgWgEAKj
	 5av8rppfoLbwvw6Siw/FkkHDUJ2Oek0WpVZSXboFNAwfC6yNe41Q95z+xtG8mDhIWU
	 M01nEn1jitahQNEWGqsiM5tOxh5wMp6bxBd/Z8xdBO4mGxkP4gKHYMAzPQueYWs4Vq
	 DE1OXGAhzpg5UtPjgFXr/642GB8CsUl8P5WA0UGsR8mDCGleAMY3G2Lh+oVK5dRJNa
	 56aGQROQrh4FRgVRGuMXYCHROmc24RNNNCrAX1biRdJUHFSJP37rO1VCiw6y9ffcim
	 Rzd/4w2TctLnA==
Date: Wed, 20 Nov 2024 10:02:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Josua Mayer <josua@solid-run.com>
In-Reply-To: <20241119-cn9131-solidwan-comphy-fixup-v1-1-6e7446434204@solid-run.com>
References: <20241119-cn9131-solidwan-comphy-fixup-v1-1-6e7446434204@solid-run.com>
Message-Id: <173211840566.1124339.3191670898165271963.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: marvell: cn9131-cf-solidwan: fix cp1
 comphy links
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_080250_938870_D40C189E 
X-CRM114-Status: GOOD (  14.42  )
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


On Tue, 19 Nov 2024 18:33:08 +0100, Josua Mayer wrote:
> Marvell CN913x platforms use common phy framework for configuring and
> linking serdes lanes according to their usage.
> Each CP (X) features 5 serdes lanes (Y) represented by cpX_comphyY
> nodes.
> 
> CN9131 SolidWAN uses CP1 serdes lanes 3 and 5 for eth1 and eth2 of CP1
> respectively. Devicetree however wrongly links from these ports to the
> comphy of CP0.
> 
> Replace the wrong links to cp0_comphy with cp1_comphy inside cp1_eth1,
> cp1_eth2.
> 
> Fixes: 1280840d2030 ("arm64: dts: add description for solidrun cn9131 solidwan board")
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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


New warnings running 'make CHECK_DTBS=y marvell/cn9131-cf-solidwan.dtb' for 20241119-cn9131-solidwan-comphy-fixup-v1-1-6e7446434204@solid-run.com:

arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: ap807: $nodename:0: 'ap807' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: config-space@f0000000: $nodename:0: 'config-space@f0000000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: config-space@f0000000: pmu: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: config-space@f0000000: timer: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@6e0000: clock-names: ['core'] is too short
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@6e0000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /ap807/config-space@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: cp0: $nodename:0: 'cp0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: config-space@f2000000: $nodename:0: 'config-space@f2000000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog', 'pcie0-0-w-disable-hog' were unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41: 'gpio-controller' is a required property
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41: '#gpio-cells' is a required property
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68: Unevaluated properties are not allowed ('reset-gpios' was unexpected)
	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@780000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: cp1: $nodename:0: 'cp1' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: config-space@f4000000: $nodename:0: 'config-space@f4000000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog-0', 'm2-full-card-power-off-hog-1' were unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: sata@540000: sata-port@0: 'anyOf' conditional failed, one must be fixed:
	'phys' is a required property
	'target-supply' is a required property
	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']






