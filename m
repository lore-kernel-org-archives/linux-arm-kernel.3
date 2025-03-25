Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50029C36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 03:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBGcNe5occCs8XxvzW6yTXPNpLdlfFYZmRYv1G0YKzQ=; b=vyhQTXvaoaEi2VDgGW7JDYfOBP
	TYCFDc5sjvKmjd1x81Md/P62aR3G6xdjvJysrGXRgErzUCfvol3Mb6K4JrWCBWzfaynR89qNxklVP
	bZBdL8xKRQBR4w3UEI8o0K1uZJT65c4l71W4orkk1et+a0ey4ShfkMP9DBKO7lvcSoVhftxn7Co0q
	FHG7dAEfF1qyXqRqDjN2236A5t+D90KLTdYNR6vVSTdeQqYzC4GNGVmqrsA12gJ+N4SOquggzeEeG
	jCsFrdHRMTnAq1vEXsIj4UYnF87bw+6taumu7ciQaFjdRH3e2pfmoxw3KCXip+hoY/E8PMvHJRamK
	EwiD/D1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twukv-00000004k7N-1P2G;
	Tue, 25 Mar 2025 03:15:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twujC-00000004js9-0bBl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 03:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C4975C5747;
	Tue, 25 Mar 2025 03:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2960C4CEDD;
	Tue, 25 Mar 2025 03:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742872401;
	bh=KziQK7EppF5DOtBo7utcqARNBAi9Ars+fyKXqAXwwQY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vNg/JsMrXRn+fPXc9o2GtWX/1TEHmPJwgwn5rQ/kSlOKCEtPKAntisR79WOG74aSr
	 TC1tvxs4yaJ1ObDFIe01JX+PM1/DqIGoID2HwBHNUYwM+3qwTM8dNOr918LcZjvNpL
	 uIAxYA8NCggQjrZvsBzKhZPi36TadgbTBdCwpC/kI05Wyj2Ell5jq2PZDgSqgZT7VN
	 TB9gzlMjyd0hCssyjV+x/VnQ2MeWUhII9q06rv52KYSUXWhouGByhtWsbsWfTP50CJ
	 b7A6ETi46LP21piNgCckqLYmwwtsRNnfY8CuJwNHZ0FeKsHRIJpGfrFJrHTKAi92a9
	 7NoWTwPdzVlAQ==
Date: Mon, 24 Mar 2025 22:13:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 andrew@codeconstruct.com.au, tingkaic@nvidia.com, 
 devicetree@vger.kernel.org, dkodihalli@nvidia.com, 
 linux-arm-kernel@lists.infradead.org, leohu@nvidia.com, 
 linux-kernel@vger.kernel.org, gpiccoli@igalia.com, tony.luck@intel.com, 
 linux-aspeed@lists.ozlabs.org, kees@kernel.org, openbmc@lists.ozlabs.org, 
 joel@jms.id.au, Paul Menzel <pmenzel@molgen.mpg.de>, 
 Mars Yang <maryang@nvidia.com>, linux-hardening@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
To: Willie Thai <wthai@nvidia.com>
In-Reply-To: <20250324175926.222473-1-wthai@nvidia.com>
References: <20250324175926.222473-1-wthai@nvidia.com>
Message-Id: <174287235976.1618206.14203259564478820837.robh@kernel.org>
Subject: Re: [PATCH v4 0/3] Add device tree for Nvidia's GB200NVL BMC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_201322_270367_F6875BAB 
X-CRM114-Status: GOOD (  19.33  )
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


On Mon, 24 Mar 2025 17:59:23 +0000, Willie Thai wrote:
> The GB200NVL BMC is an Aspeed Ast2600 based BMC
> for Nvidia Blackwell GB200NVL platform.
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
> 
> Co-developed-by: Mars Yang <maryang@nvidia.com>
> Signed-off-by: Mars Yang <maryang@nvidia.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Link: https://www.aspeedtech.com/server_ast2600/ [1]
> Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> Changes v1 -> v2:
>   - Fix the SOB name [Krzysztof]
>   - Fix warnings from scripts/checkpatch.pl run [Krzysztof]
>   - Fix DTS coding style [Krzysztof]
>   - Move pinctrl override to the bottom [Krzysztof]
>   - Drop bootargs [Krzysztof]
>   - Follow DTS coding style and change naming for leds node [Krzysztof]
>   - Change flash 0 status property [Krzysztof]
>   - Change the phy-mode to rgmii [Andrew]
>   - Remove the max-speed in mac0 [Andrew]
>   - Put gpio line name in one line per group of 8 gpios, but keep some b/c they can exceed length limit [Paul]
> Changes v2 -> v3:
>   - Fix missing new line [Krzysztof]
>   - Fix missing binding define, adding it in the patch no.1 of this patch set v3 [Krzysztof, Rob]
>   - Fix DTS coding style [Krzysztof]
>   - Modify nodes name to generic name for: i2c expander pca9546, gpio expander pca9555, power monitor lm5066i, fan controller max31790 [Krzysztof]
>   - Skip mac setting and wait till the delay issue in phy-mode fix from Aspeed SOC vendor side [Andrew]
>   - Remove i2c-scl-clk-low-timeout-us which is Apseed proprietary property [Mars]
> Changes v3 -> v4:
>   - Order binding patch first in the patch set [Andrew Jeffery]
>   - Make the commit message more concise [Krzysztof]
>   - Remove stray blank lines [Krzysztof]
>   - Remove unnecessary comments [Krzysztof]
>   - Remove underscore, repalce by dash symbol in node name [Krzysztof]
>   - Remove disable-master property in i2c as it is downstream added property [Rob, Andrew Jeffery]
>   - Remove #address-cells, #size-cells in nxp,pca9555 and maxim,max31790 as they are no longer defined [Rob, Andrew Jeffery]
> ---
> 
> Willie Thai (3):
>   dt-bindings: arm: aspeed: add Nvidia's GB200NVL BMC
>   dt-bindings: pinctrl: aspeed,ast2600-pinctrl
>   ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |    1 +
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       |    1 +
>  arch/arm/boot/dts/aspeed/Makefile             |    1 +
>  .../aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 1149 +++++++++++++++++
>  4 files changed, 1152 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250324175926.222473-1-wthai@nvidia.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e6e0000/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e6e0000/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e6e0000/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e6e0000/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: crypto@1e6fa000: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e780000/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e789000: lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e789000: reg-io-width: 4 is not of type 'object'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e780000/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e780000/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e790000/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b100: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e790000/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e790000/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']






