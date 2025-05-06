Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F690C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0kqMHOfmcniHjcnk6gTkLTRcT3FMqnnwRKlQdGX+JY=; b=Bewcq4oTlGs7Zi2k+B6wbybwNp
	fRRQ8CjqeutTXxqtXyqdJEwfKOlm5pFv5rMg5THSmFSoSwPyvXbdPMBq8nxay11BdNnYUGtZV1xhu
	7upPvi4rrRTrx2ZHHCqU+Q62L1CY1zQREOfO1APFNHsymb4dziSy8fza1o5jlD6e2+lyVwSDqxgpF
	15bQL3LYenhfifRQXmyErz6Ng3k8SMobQP7jWgFCRdph5rNw9WXY2usmcU8rXTLAHRa+o2T3ygIaT
	UEV8fdHg/TMkRNBdYS7RddYCTHoYv4/enCUlyahlgjIFMFeKVAurMRcThDMmnMYZww46unDcKVhbK
	i2ZAZSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpd-0000000DgOD-0cU6;
	Tue, 06 May 2025 23:36:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMxS-0000000D5rT-1gIE;
	Tue, 06 May 2025 18:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BA0E4A8F7;
	Tue,  6 May 2025 18:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B55C4CEF1;
	Tue,  6 May 2025 18:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555837;
	bh=Uqf8kJePtfsVZgbr7I/p/tyXitesai0FA9qB6jM2d68=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mTq9wd72DU/eVRRzweoLa9Us5dM41/K5sQmA3weNWILL47X8Wcx8FB2YmSXawNFxO
	 00r/kZZsupjVQsqvsSFMenCqsj6dw5/lZzRr33ggkVVN1CX9MwbnuXdgDWtRQQ70Va
	 kAi8VI68bih+bJwU8cdzG20jhtCrvgU5EctFEFcRNUGCYrAHgUCLc6gdt4Fk1nbugj
	 Ob2lQ/9Yn7FqnI1SqmLFra+kY/9HdeVfV8o2uWgrtYnJAicll9s351T5D9Nx4ctgEG
	 B0tw6Nr70flZ8CW1OhUgMC9S6tU4+0t7jmAivWARLNod01I8KSHLQtMske++7cXItA
	 OW2ACImsJ31pw==
Date: Tue, 06 May 2025 13:23:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, frattaroli.nicolas@gmail.com, 
 devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se, 
 conor+dt@kernel.org, andrew@lunn.ch
To: John Clark <inindev@gmail.com>
In-Reply-To: <20250506114115.613616-1-inindev@gmail.com>
References: <20250506114115.613616-1-inindev@gmail.com>
Message-Id: <174655575268.2171082.7949828475697497257.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Add Luckfox Omni3576 Carrier Board support for
 RK3576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_112358_488039_C6754A7E 
X-CRM114-Status: GOOD (  28.37  )
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


On Tue, 06 May 2025 07:41:12 -0400, John Clark wrote:
> This series adds device tree support for the Luckfox Omni3576
> Carrier Board with the Core3576 Module, powered by the Rockchip
> RK3576 SoC (four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52
> MC3 GPU). It enables essential functionality for booting Linux and
> basic connectivity, with plans for future support of peripherals
> like WiFi, MIPI-DSI, HDMI, and Ethernet.
> 
> The series was first posted as v1 at:
> https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com
> v2 at:
> https://lore.kernel.org/linux-rockchip/20250504102447.153551-1-inindev@gmail.com
> 
> Tested features (on Linux 6.15-rc4):
>  - UART: Serial console operational
>  - SD card: Mounts and reads/writes successfully
>  - PCIe: NVMe SSD detected, mounted, and fully functional
>  - USB 2.0: Host ports operational
>  - RTC: Timekeeping and wake-up tested
>  - LED: Heartbeat trigger functional
>  - eMMC: Enabled in device tree, not populated on tested hardware
> 
> The series includes three patches:
>  1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
>  2. dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
>  3. arm64: dts: rockchip: Add Luckfox Omni3576 board support
> 
> The device tree is covered by the existing ROCKCHIP ARCHITECTURE
> entry in MAINTAINERS. I am aware of ongoing RK3576 upstreaming
> efforts (e.g., by Collabora) and welcome feedback or collaboration
> to align with mainline driver development.
> 
> Changes in v3:
>  - Addressed Jonas Karlman's feedback on patch 3/3
>    (Luckfox Omni3576 device tree):
>    - Added pinctrl for green LED GPIO (gpio1 RK_PD5) for proper
>      pin setup.
>    - Reordered regulator node properties for consistent sequence
>      (e.g., regulator-name, regulator-min-microvolt,
>      regulator-max-microvolt, etc.).
>    - Updated regulator nodes (vcc_3v3_pcie, vbus_5v0_typec,
>      vcc_5v0_host, vcc_5v0_hdmi) to use 'gpios' property instead
>      of deprecated 'gpio'.
>    - Removed pmic-power-off pinctrl state and pinctrl-1 from RK806
>      PMIC node, as they are vendor-specific and undocumented in
>      bindings.
>    - Removed pwrkey node from PMIC, as it lacks binding
>      documentation.
>    - Added blank line between properties and child nodes in i2c2
>      node for DT style compliance.
>    - Removed no-mmc property from sdmmc node to enable MMC
>      support, aligning with RK3576 SD v3.0 and MMC v4.51
>      capabilities, allowing TF card slot to support MMC devices
>      or eMMC via adapter.
>  - Removed Ethernet support (gmac0/gmac1 nodes) per Andrew Lunn's
>    feedback, as it relied on the generic PHY driver with incorrect
>    RGMII delay settings, which would break with the upcoming
>    MAE0621A driver.
>  - Addressed Rob Herring's DTB check warnings, other warnings
>    (e.g., VOP, PCIe, OTP, HDMI PHY) originate from rk3576.dtsi and
>    are outside this patchset scope.
>  - Added RNG node to pick up Nicolas Frattaroli's "add RK3576 RNG
>    node" patch
> 
> Changes in v2:
>  - Enabled HDMI node per feedback from Heiko Stuebner and Nicolas
>    Frattaroli; untested due to upstream driver issues.
>  - Enabled Ethernet 1 node per Heiko's device tree philosophy;
>    untested due to suspected PHY driver or configuration issues
>    (removed in v3 per Andrew Lunn).
>  - Clarified eMMC remains enabled but unpopulated on tested
>    board, per Heiko.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
> John Clark (3):
>   dt-bindings: vendor-prefixes: Add luckfox prefix
>   dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
>   arm64: dts: rockchip: Add Luckfox Omni3576 Board support
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |  10 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 683 ++++++++++++++++++
>  .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  53 ++
>  5 files changed, 749 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
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
 Base: tags/next-20250506 (best guess, 2/3 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250506114115.613616-1-inindev@gmail.com:

arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/rng@2a410000: failed to match any schema with compatible: ['rockchip,rk3576-rng']






