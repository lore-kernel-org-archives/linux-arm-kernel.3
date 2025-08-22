Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72040CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjN8r4xZcz2LPldV/c6Zr/HcnO5MPthTtKM0QTDRRHw=; b=M3Et2e96TfD3CZ589gDrRgXApy
	la1VwZX338tIq+f9uUQb9vyEKf4mULKI9Xx/L9c+vfJWNVqc7p1LBCVqCDXjhr7JVUgt/3GVLrzkz
	mvPqsliiQL7vvUXqhWePNEWOA4zEhPxhl5ltKCg5iTgXoxQw5Kaa2ktsqoM9xEH0r+e7y+aKa8Puk
	xq25JeZeQ+M9afuSbMlPZqG48wj6SqkOKjNRiKd3Ac+Jj1TTf8CcouNYy5luISsG8K/yFRPsKhuZv
	exeieKALIH4n4dcz3ktN1SbojuwGpunV03B0pwoiKJpkbctM39AIBGd9oZ7IX4JYXdtCoan95wBdd
	Rp/iHMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUc-00000004MxO-2aev;
	Sat, 23 Aug 2025 08:20:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZIT-00000003Uyv-0HgW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 21:27:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37187A58C00;
	Fri, 22 Aug 2025 21:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DAEC4CEF1;
	Fri, 22 Aug 2025 21:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755898059;
	bh=HpMSsYpyCPlFj74ZKEihN0J4dnJzaki8VEY4sa1qWsQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c2SDqyJScPESg1glrinrRFpy9UCxzbJCA6GcUNaYpTyIXMkZ5nhtCk/toPGPkQEe8
	 WRqxHBLe+21e5iEUMWMIpsGGMaD/G1gGR+tuB8JFuJliC76OQkMv16v+MxqiZA9h59
	 SZf2a/U7wfpeHpktuydgkejUFxMHFa9g6KOZpN2DbEgbW/o0kvMI86dj7uRV86D/hG
	 cRsAxOnaHhGR6BHovF0z47TkjrxS5+xlNZOnIiu+CxJ9o5XHGfrb+wCpTrhQi0FHMa
	 GcBiFFh6yQ/199NWzIfBD895L2/MGoXJyvN1vdiZCNquyo9ILoodvYZuFXhjUuy0pq
	 b7bh9BsfoALLg==
Date: Fri, 22 Aug 2025 16:27:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
References: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
Message-Id: <175589786306.518460.17450425303264875357.robh@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: marvell: armada-37xx: Add default PCI
 interrup controller address cells
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_142741_266443_44C82F14 
X-CRM114-Status: GOOD (  16.98  )
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


On Fri, 22 Aug 2025 15:33:30 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to the PCI interrupt node to silence W=1
> warning:
> 
>   armada-37xx.dtsi:518.4-521.29: Warning (interrupt_map): /soc/pcie@d0070000:interrupt-map:
>     Missing property '#address-cells' in node /soc/pcie@d0070000/interrupt-controller, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: tags/next-20250822 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/marvell/' for 20250822133329.312326-3-krzysztof.kozlowski@linaro.org:

arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
arch/arm64/boot/dts/marvell/cn9130-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9131-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-7040-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9131-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/armada-8040-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
arch/arm64/boot/dts/marvell/cn9132-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#






