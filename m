Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7A5C3ABB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUlYEpCmHnw7/C90N4bgYwaq3+9eXUqFNW19LfTzOhU=; b=UIwuyqpmChuFq4XMCU4iiORoaV
	atWmnu2+/0+Mi5sQBQydqYvMgY36div/tz+VvNy2SvAgE1mQhiF4pNpAV7dEKQhADSqR4O2XzyhQO
	sff3fXFJsRw/NDr5Xdl8ePSuMdUSzffo5Z78a+a04CBXYQODpTw51FTUieLbOXuyPiQu3b/3X+mYR
	GrMAQiR4hGl5MKzuMGcbWHbE6D9ryurXWouJkxL3mJJLMbgJP90gp/y/Uh2FjvzSttvAOFo43mxky
	jGXXRKOmIiMqrxqDXsjfETobVAVfEmgTPt1bG0NqEF2rx1L/TQavZ0lPgRs4eE68MyrmK8J3EFeOI
	Ivrk5hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx8z-00000007gn6-2DYT;
	Mon, 05 May 2025 14:50:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx3B-00000007fOr-1KeM;
	Mon, 05 May 2025 14:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F4784A84F;
	Mon,  5 May 2025 14:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE95C4CEE4;
	Mon,  5 May 2025 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456248;
	bh=UzAMomFyuhI5xvI4clydLab7kwq4ZLQzU3pP+AbldBQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cSu8Mt8por9ww8yacAcqvoxu8hG0uHsJGl//PCcFDGVwml06a5bylHtsq5TgsLu1j
	 7rEPWAoSPRrht30xbBwv5+l2tQT/C8cT5rHfdY9lAl+7sdVmmz/9agz/eIq3JpPZKa
	 H6FWHzmLpm8+OgL8JnRVmKbuIbzsmWMQp1YaFO5k/YwY0cpkVDcEKvYFBIY4di53NY
	 eb/28aR4TYZNww+iDHcMdn12KdLpI0tL2P2mdvmyH0QvjoHdvcuaGAdB53kUXw/WHH
	 zUyqAybpkSUNklLbNfbFT4BFbf3eQ0Y5/mcZAQpd4Mt8DICY37OL64C0+cUCoV37Jo
	 +ggtVD89jEgew==
Date: Mon, 05 May 2025 09:44:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 detlev.casanova@collabora.com, nicolas.frattaroli@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 heiko@sntech.de, linux-kernel@vger.kernel.org
To: John Clark <inindev@gmail.com>
In-Reply-To: <20250504102447.153551-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
Message-Id: <174645594199.1246544.16804266826655176867.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add Luckfox Omni3576 Carrier Board support for
 RK3576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_074409_397576_FFD5327B 
X-CRM114-Status: GOOD (  21.70  )
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


On Sun, 04 May 2025 06:24:44 -0400, John Clark wrote:
> This series adds device tree support for the Luckfox Omni3576 Carrier Board
> with Core3576 Module, based on the Rockchip RK3576 SoC, enabling essential
> functionality for booting Linux and basic connectivity. v1 was posted at:
> https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com
> 
> Tested features (on Linux 6.15-rc4):
>  - UART: Serial console operational
>  - SD card: Mounts and reads/writes successfully
>  - PCIe: NVMe SSD detected, mounted, and fully functional
>  - Ethernet 0: Functional with RGMII PHY
>  - USB 2.0: Host ports
>  - RTC: Timekeeping and wake-up tested
>  - LED: Heartbeat trigger works
>  - eMMC: Enabled, not populated on tested board
> 
> The series includes the following patches:
>  1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
>  2. dt-bindings: arm: rockchip: Add luckfox,omni3576 binding
>  3. arm64: dts: rockchip: Add Luckfox Omni3576 Board support
> 
> The new DTS is covered by the existing ROCKCHIP ARCHITECTURE entry in MAINTAINERS.
> 
> I am aware of ongoing RK3576 upstreaming efforts (e.g., by Collabora) and
> welcome feedback or collaboration to align with mainline driver development.
> 
> Changes in v2:
>  - Enabled HDMI node per feedback from Heiko and Nicolas; untested due to
>    upstream driver issues
>  - Enabled Ethernet 1 node per Heiko's DT philosophy; untested due to
>    suspected PHY driver or configuration issues
>  - Clarified eMMC remains enabled but unpopulated on tested board, per Heiko
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
> John Clark (3):
>   dt-bindings: vendor-prefixes: Add luckfox prefix
>   dt-bindings: arm: rockchip: Add Luckfox Omni3576 board
>   arm64: dts: rockchip: Add Luckfox Omni3576 Board support
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3576-luckfox-omni3576.dts  | 779 ++++++++++++++++++
>  4 files changed, 787 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> 
> --
> 2.39.5
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
 Base: tags/v6.15-rc1-32-g2acfe31a8ce5 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250504102447.153551-1-inindev@gmail.com:

arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: vop@27d00000 (rockchip,rk3576-vop): 'vop-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
	'rockchip,rk3568-pcie' was expected
	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): 'msi-map' is a required property
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): Unevaluated properties are not allowed ('compatible', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/pcie@2a200000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a210000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a210000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
	'rockchip,rk3568-pcie' was expected
	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/pcie@2a210000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pmic@23 (rockchip,rk806): Unevaluated properties are not allowed ('pwrkey' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: hdmiphy@2b000000 (rockchip,rk3576-hdptx-phy): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#






