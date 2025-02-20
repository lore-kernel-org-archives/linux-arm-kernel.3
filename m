Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525CBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olguUm5pfYYnePq7vkVQ0ewT1H96dQ6L/3aloZ623YY=; b=QIeXlVxurl9hbNAGGoInzfAjsk
	QVPT2s4UIju2DvwdvnCaCCOuNczW7e9mHkv/M8NEnRzKepb6OzO8mklKyYQgwE/B2TvzooYhYMGOJ
	0GuX3vPR6ayXqKUFWgq7363vp0Khtq6NLw1uxhrk+3vfLys1BGdot2RLM5NAwuWRbIrGEoxSCCDd1
	ETXookabDQ9suPQTsC/xWeUkJZAQYG7z5/lHbKJSd7ozxp/Q0aOeCxnX5QxbYNYUHE0eChjpV3qDl
	BKjupPCwm4gLadvZZ5sqnXquCpRNFtFFuohpBN2M2IBBoqHvRuypwFX6Q1KxDTOeBmWPXLuOK/v6T
	7KltfjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE8A-00000002xcV-1knR;
	Thu, 20 Feb 2025 21:30:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE6d-00000002x9k-30k6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 21:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 803875C58CE;
	Thu, 20 Feb 2025 21:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AACC4CED1;
	Thu, 20 Feb 2025 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740086954;
	bh=1LzKD5qoGe+7J8FFy17/aBvXUPhvRt/+7kn4AUDJuIM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fCX2WI1i8AW9OzSVUbY5oRDLpRA2Ul+aEzQn5vYT2AOMYD2L+5MctGRlUjLajx0za
	 dWMpjk2BgFJrLMOoj/x3XaemFUiH7XCyAaIUQkvrk78y7b5bdwlRibGLW+U0mtRCUk
	 b7KT7uhEGIBcQv6pV7e3pirjhVkv83X8Iz2YDQW0mRyIPP+WujfckGyfDwM3ViOgte
	 QRZuqW7V0iPtmEnn0JJK5oaG0uQgysCuK0f/9iUyJYj6HBw4Q6UF5ndrz/b1ITVy46
	 4/ZaJli7EiAZ52K6T0mo+Zw3N0LrOi3GrUexY9DQ/pUa43wfGWVbGGPAL4Zw11M4cw
	 IFW3Hfoj2rNuA==
Date: Thu, 20 Feb 2025 15:29:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: catalin.marinas@arm.com, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 conor+dt@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
 arnd@arndb.de
To: Peter Chen <peter.chen@cixtech.com>
In-Reply-To: <20250220084020.628704-1-peter.chen@cixtech.com>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
Message-Id: <174008661558.4046640.6970051965598213885.robh@kernel.org>
Subject: Re: [PATCH 0/6] arm64: Introduce CIX P1 (SKY1) SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_132915_866458_92139A1B 
X-CRM114-Status: GOOD (  15.31  )
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


On Thu, 20 Feb 2025 16:40:14 +0800, Peter Chen wrote:
> Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
> Orion O6 is the world's first open source Arm V9 Motherboard built by
> Radxa. You could find brief introduction for SoC and related boards at:
> https://radxa.com/products/orion/o6#overview
> 
> In this series, we add initial SoC and board support for Kernel building.
> Patch 1-2: Add dt-binding doc for CIX and its sky1 SoC
> Patch 3: add related maintainter entry
> Patch 4-5: add Arm64 build support
> Patch 6: add initial dts support for SoC and Orion O6 board
> 
> To run upstream kernel at Orion O6 board, you need to use BIOS
> released by Radxa:
> https://docs.radxa.com/en/orion/o6/bios/install-bios
> 
> Fugang Duan (1):
>   arm64: Kconfig: add ARCH_CIX for cix silicons
> 
> Peter Chen (5):
>   dt-bindings: arm: add CIX P1 (SKY1) SoC
>   dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
>   MAINTAINERS: Add CIX SoC maintainer entry
>   arm64: defconfig: Enable CIX SoC
>   arm64: dts: cix: add initial CIX P1(SKY1) dts support
> 
>  .../devicetree/bindings/arm/cix.yaml          |  26 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   8 +
>  arch/arm64/Kconfig.platforms                  |   6 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/cix/Makefile              |   2 +
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  21 ++
>  arch/arm64/boot/dts/cix/sky1.dtsi             | 264 ++++++++++++++++++
>  arch/arm64/configs/defconfig                  |   1 +
>  9 files changed, 331 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
>  create mode 100644 arch/arm64/boot/dts/cix/Makefile
>  create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
>  create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
> 
> --
> 2.25.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/cix/' for 20250220084020.628704-1-peter.chen@cixtech.com:

redistributor-stride: size (4) error for type uint64
arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /: compatible: ['radxa,orion-o6'] is too short
	from schema $id: http://devicetree.org/schemas/arm/cix.yaml#
arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /: memory@80000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/memory.yaml#
arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: soc@0: uart@040d0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: uart@040d0000: $nodename:0: 'uart@040d0000' does not match '^serial(@.*)?$'
	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml#
arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: interrupt-controller@0e001000: redistributor-stride: 262144 is not a 'uint64'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: interrupt-controller@0e001000: 'its@e050000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#






