Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA10D374B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5bYZqS2MOxwcZXczsFTPU3EuNuKL/PsiVgeD0oKzf8=; b=43k+U+X2tKZhpEsLbdqaXpEeVC
	AuAO8rHQrmCm1UKUcWJrpakUk64LM98p3mhP1X/uGRHjbc+9mjdR5yELve8RVbjNBT3Iy09VznLyb
	nYgOg2iS5FJTyALlhOWwuQ+m+pMTaDNQvwwmotgyhbMTkf1fg5RXSyyiR3z37CkYw5Q3FjxWAUG2c
	buPyWcMR9I/EUdwzXOh0m/kB3nTohlMEdB7jRoNEavqcHlRWf+KksjciPMW5mKGMI3+FPJm21/PSC
	9TDnKdkw5r0GuKtTgYnfcfgp7QPefjCXq7xScS2/8GLTQ7qcJikBbiH3qcrWONmjSuy5ixlvR+Dgh
	IgTB8nFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePr-0000000A9OC-2mBr;
	Fri, 05 Dec 2025 22:36:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePp-0000000A9O0-3sdb;
	Fri, 05 Dec 2025 22:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD96B60127;
	Fri,  5 Dec 2025 22:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59898C4CEF1;
	Fri,  5 Dec 2025 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974200;
	bh=jyoprTnb0euL03vxPz0Z60Gay9OGDg+3Fli9lQr140w=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=MBXlM74tBR7jy3sWA92Vd8bhrdec2i6m/vYU3v/44vvtPs+iC+GkbHxRFYVwGdgte
	 igzGm2L1pVG6RfuAN4W4oFgdBUJZ3XJ/bpPshlkYfF3FnbcfTyO7YxkFbQGp+sRAKl
	 nHvydvQbqS19VJdNl2bYhJ0nMj7jMUEfCVkBupNQRA88xusW7UHfgiDm/Xpv1/6vqu
	 Z2ZYJdZ0F3bXJhcfYuj5MtcslVkUDl73yP1+ImF6tdt2DQO/9keqmF7tWoACvHtKtV
	 2SXnMDm9E6kphR5HuSNn3yG4cE5sizZ9ohzMiZjoS4LhkThSQmS2KXxi0FRnSTEDkc
	 YupVwbQ2y50qg==
From: Rob Herring <robh@kernel.org>
Date: Fri, 05 Dec 2025 16:36:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, 
 Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In-Reply-To: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
Message-Id: <176497381380.863373.5448430069012667069.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add support for the Mediatek Genio 520-EVK and
 720-EVK boards
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


On Wed, 03 Dec 2025 14:59:25 +0100, Louis-Alexis Eyraud wrote:
> This patch series adds the support for the Mediatek Genio 520-EVK (based
> on MT8371 SoC) and Mediatek Genio 720-EVK (based on MT8391 SoC).
> 
> MT8371 and MT8391 SoC are less powerful variants of MT8189 SoC
> with the following differences:
>   - Arm Cortex-A78 CPU core maximum frequency (2.2 Ghz for MT8371, 2.6
>     Ghz for MT8391, 3 Ghz for MT8189).
>   - Arm Mali G57 MC2 GPU core maximum frequency (880 Mhz for MT8371,
>     1.1 Ghz for MT8189 and MT8391)
>   - ISP engine number (1 for MT8371, 2 for MT8189 and MT8391)
> MT8371 and MT8391 SoC hardware register maps are identical to MT8189.
> 
> The Genio 520/720-EVK boards have following features:
>   - MT8371 (or MT8391) SoC
>   - MT6365 PMIC
>   - MT6319 Buck IC
>   - MT6375 Charger IC
>   - 8GB LPDDR5 RAM
>   - 64GB eMMC 5.1
>   - 128GB UFS
>   - 20V DC Jack
>   - USB Type-C Power Adapter
>   - Micro SD card slot
>   - Push Button x 4 (Power, Reset, Download and Home Key)
>   - LED x 3 (System Power, Reset, DC-IN Power)
>   - USB Type-C Connector (USB 3.2) x 2
>   - USB Type-C Connector (USB 2.0) x 1
>   - 3.5mm Earphone Jack x 1 (with Microphone Input)
>   - 3.5mm Line Out Audio Jack x 1
>   - Analog Microphone x 1
>   - Digital Microphone x 2
>   - Gigabit Ethernet with RJ45 connector
>   - DP x 1 (Mode over USB Type-C)
>   - LVDS port x 1
>   - eDP port x 1
>   - UART x2 with serial-to-usb converters and USB Type-C connectors
>   - UART Port x 2 on Pin Header
>   - M.2 Slot x 2
>   - I2C Capacitive Touch Pad
>   - 4-Lane DSI x 1
>   - 4-Data Lane CSI x 2
>   - I2S Pin header
>   - 40-Pin 2.54mm Pin Header x 1
>   - CAN Bus x 1 (RS232 Connector)
> 
> The series adds two include files for mt8189 (mt8189.dtsi) and common
> board definitions (mt8391-genio-common.dtsi) and a devicetree file for
> each board. In regard to the current MT8189 SoC upstream support and in
> order to limit the number of prerequisite patches, this series provides
> the following basic hardware enablement for:
>   - cpu
>   - clocks
>   - spmi and regulators
>   - UART 0/1/2/3
>   - eMMC and SD card
>   - watchdog
>   - timer
>   - efuse and socinfo
>   - auxadc
> 
> The series is based on linux-next next-20251203 tag, and the
> following patch series are currently required:
> - I2C dt-bindings [1]
> - SPMI dt-bindings [2]
> - timer dt-bindings [3]
> - Add support for MT8189 clock/power controller [4]
> - Add SD/MMC Card driver support for Mediatek MT8189 SoC [5]
> - mt8189: Add pinmux macro header file [6]
> 
> Note:
> The v3 revision of [4] patch series is causing the following `make dtbs_check`
> issue for both board devicetrees:
> ```
> arch/arm64/boot/dts/mediatek/mt8391-genio-720-evk.dtb: /soc/clock-controller@1c000800:
>   failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao', 'syscon']
> ```
> The mismatch between compatible string in driver and dt-bindings has
> already been reported during the series review ([7]) and hopefully will be
> fixed in its future revision.
> 
> [1] https://lore.kernel.org/linux-mediatek/20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com/
> [2] https://lore.kernel.org/linux-mediatek/20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com/
> [3] https://lore.kernel.org/linux-mediatek/20250825033136.7705-1-zhanzhan.ge@mediatek.com/
> [4] https://lore.kernel.org/linux-mediatek/20251106124330.1145600-1-irving-ch.lin@mediatek.com/
> [5] https://lore.kernel.org/linux-mediatek/20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com/
> [6] https://lore.kernel.org/linux-mediatek/20250919020525.7904-1-ot_cathy.xu@mediatek.com/
> [7] https://lore.kernel.org/linux-mediatek/a50e6d433afcf8b08a47694bc5a52acc28871ee5.camel@collabora.com/
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Louis-Alexis Eyraud (4):
>       dt-bindings: serial: mediatek,uart: Add compatible for MT8189 SoC
>       dt-bindings: arm: mediatek: add compatibles for Mediatek Genio 520/720-EVK boards
>       arm64: dts: mediatek: add device-tree for Genio 720-EVK board
>       arm64: dts: mediatek: add device-tree for Genio 520-EVK board
> 
>  .../devicetree/bindings/arm/mediatek.yaml          |  10 +
>  .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
>  arch/arm64/boot/dts/mediatek/Makefile              |   2 +
>  arch/arm64/boot/dts/mediatek/mt8189.dtsi           | 860 +++++++++++++++++++++
>  .../boot/dts/mediatek/mt8371-genio-520-evk.dts     |  19 +
>  .../boot/dts/mediatek/mt8391-genio-720-evk.dts     |  15 +
>  .../boot/dts/mediatek/mt8391-genio-common.dtsi     | 555 +++++++++++++
>  7 files changed, 1462 insertions(+)
> ---
> base-commit: e47d97576181b31291cf58e77d737d21def0e160
> change-id: 20251128-add-mediatek-genio-520-720-evk-06162377974d
> prerequisite-message-id: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
> prerequisite-patch-id: af92e103b9f50af16560a11d4eabc644bd724b07
> prerequisite-message-id: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
> prerequisite-patch-id: c82ad0d3145322fea43aed2e1d830ebc8eae8180
> prerequisite-message-id: <20250825033136.7705-1-zhanzhan.ge@mediatek.com>
> prerequisite-patch-id: 7aeee7d452186b3bc1c11722b7ddb7dfbae7d396
> prerequisite-message-id: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
> prerequisite-patch-id: ea3e5cf891c9753a77f126ad1ddad455a0752883
> prerequisite-patch-id: ae9a4cb1daadb56cc298b87142b29b749dc11835
> prerequisite-patch-id: 3df47b0207d75102032975e6811f71a5e7909e43
> prerequisite-patch-id: 1c25a1327d50152cef227f58c08076072d65cee3
> prerequisite-patch-id: f2cd301aea79253adb85bd3f62c012dd3850e1a7
> prerequisite-patch-id: 81dc09321182c48f6928582e8b9d22f35a757515
> prerequisite-patch-id: e0a251231fd14fa582800db8f3bb77011f6836f9
> prerequisite-patch-id: da7c54c83cb8566df39beac753c80615523479e5
> prerequisite-patch-id: 2f3d41e32b230ddc016fd75ace5b286cd11b2127
> prerequisite-patch-id: 309f350ed5c942b640b5c3434737fee28d6825b0
> prerequisite-patch-id: 7579b6db7ec7a31e28db616c73b4c1b0eb4ee106
> prerequisite-patch-id: 0cdea5380c8d35cfd89e01bf843ef7fdafbc7830
> prerequisite-patch-id: 3dc3e377981d3c894fc39122200a0f0d46f5d71b
> prerequisite-patch-id: b57bf39e50a5316d2f9264e1eb89071d3e8e8b0a
> prerequisite-patch-id: 56fd80d33667839823794173064860c613f911cd
> prerequisite-patch-id: 963a3ed54fb5fd9fd518f28254eaf93a70b2f603
> prerequisite-patch-id: 3c9cbc33093f754d867ca324cc7e689fbbaae8af
> prerequisite-patch-id: 336ba35d1924706d1d21c6e46718d973277f207a
> prerequisite-patch-id: f3322d6494603585fc4728074484055d07484dd6
> prerequisite-patch-id: f5a70e41fe9df7df0ab29538701bdfdb401a9d01
> prerequisite-patch-id: b46a91afc38bea2ee6a8440f59e71e39728df6ad
> prerequisite-message-id: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
> prerequisite-patch-id: feab935ed7d0d7234dcc1980185300782c61620e
> prerequisite-patch-id: efbd41a9926397f9b3ffd19235a04791b61f35c7
> prerequisite-patch-id: 5b12a1056dfe87e4d39af584d8b16c31a1a00a04
> prerequisite-message-id: <20250919020525.7904-1-ot_cathy.xu@mediatek.com>
> prerequisite-patch-id: 7f2d960cde2f0e0a307721150e83b7b05b9a60d7
> 
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
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
 Deps: looking for dependencies matching 28 patch-ids
 Deps: Applying prerequisite patch: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189 SoC
 Deps: Applying prerequisite patch: [PATCH] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8189 SoC
 Deps: Applying prerequisite patch: [PATCH v7 4/9] dt-bindings: timer: Support MediaTek MT8189 timer
 Deps: Applying prerequisite patch: [PATCH v3 01/21] dt-bindings: clock: mediatek: Add MT8189 clock definitions
 Deps: Applying prerequisite patch: [PATCH v3 02/21] dt-bindings: power: mediatek: Add MT8189 power domain definitions
 Deps: Applying prerequisite patch: [PATCH v3 03/21] clk: mediatek: fix mfg mux issue
 Deps: Applying prerequisite patch: [PATCH v3 04/21] clk: mediatek: Add MT8189 apmixedsys clock support
 Deps: Applying prerequisite patch: [PATCH v3 05/21] clk: mediatek: Add MT8189 topckgen clock support
 Deps: Applying prerequisite patch: [PATCH v3 06/21] clk: mediatek: Add MT8189 vlpckgen clock support
 Deps: Applying prerequisite patch: [PATCH v3 07/21] clk: mediatek: Add MT8189 vlpcfg clock support
 Deps: Applying prerequisite patch: [PATCH v3 08/21] clk: mediatek: Add MT8189 bus clock support
 Deps: Applying prerequisite patch: [PATCH v3 09/21] clk: mediatek: Add MT8189 cam clock support
 Deps: Applying prerequisite patch: [PATCH v3 10/21] clk: mediatek: Add MT8189 dbgao clock support
 Deps: Applying prerequisite patch: [PATCH v3 11/21] clk: mediatek: Add MT8189 dvfsrc clock support
 Deps: Applying prerequisite patch: [PATCH v3 12/21] clk: mediatek: Add MT8189 i2c clock support
 Deps: Applying prerequisite patch: [PATCH v3 13/21] clk: mediatek: Add MT8189 img clock support
 Deps: Applying prerequisite patch: [PATCH v3 14/21] clk: mediatek: Add MT8189 mdp clock support
 Deps: Applying prerequisite patch: [PATCH v3 15/21] clk: mediatek: Add MT8189 mfg clock support
 Deps: Applying prerequisite patch: [PATCH v3 16/21] clk: mediatek: Add MT8189 mmsys clock support
 Deps: Applying prerequisite patch: [PATCH v3 17/21] clk: mediatek: Add MT8189 scp clock support
 Deps: Applying prerequisite patch: [PATCH v3 18/21] clk: mediatek: Add MT8189 ufs clock support
 Deps: Applying prerequisite patch: [PATCH v3 19/21] clk: mediatek: Add MT8189 vcodec clock support
 Deps: Applying prerequisite patch: [PATCH v3 20/21] pmdomain: mediatek: Add bus protect control flow for MT8189
 Deps: Applying prerequisite patch: [PATCH v3 21/21] pmdomain: mediatek: Add power domain driver for MT8189 SoC
 Deps: Applying prerequisite patch: [PATCH 1/3] dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
 Deps: Applying prerequisite patch: [PATCH 2/3] mmc: mtk-sd: add support for SPM resource release control
 Deps: Applying prerequisite patch: [PATCH 3/3] mmc: mtk-sd: add support for MT8189 SoC
 Deps: Applying prerequisite patch: [PATCH v2] arm64: dts: mediatek: mt8189: Add pinmux macro header file
 Base: e47d97576181b31291cf58e77d737d21def0e160 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com:

arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dtb: /soc/clock-controller@1c000800: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao', 'syscon']
arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8391-genio-720-evk.dtb: /soc/clock-controller@1c000800: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao', 'syscon']
arch/arm64/boot/dts/mediatek/mt8391-genio-720-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml






