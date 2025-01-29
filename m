Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2BAC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvk7PcxjVm7DVem0/X+zTKRLIaOTW4TaFSbdcIPgeK8=; b=G10cY6lM197/GToaYrafihn0FY
	E4BZ7KT7GxtSJ3zA+JDlbbXA7DM6XynGf6Ozf0GiRupFTJUCx4fkvT7NlPfp9ZV3JNyaFkoJiMlR4
	9jB4NQqyLkxcu9QnTwfHOBkX9ALnTclEm2gi3l8dYqFxK/h++qtgTXmbIR4y8YZQwbf72eNZeSFdS
	NBZ8cJFjVYDPyI6aGH/97FSGbBg5nU738d32+foI4s3I7l2nBqU23Ms4EYXgVso534AaetI61PqIT
	sRVhqdeWCAAfVA0/OzYpK6Rl2ihVACRi7tgT1dVb2wkt1Ky99kkXGl/9SPFp8afyrrbD9ebipSjuf
	URNFBIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9Fn-000000079Z9-1TvO;
	Wed, 29 Jan 2025 14:41:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td9DM-000000079B0-0pxZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 14:38:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 853185C5B32;
	Wed, 29 Jan 2025 14:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F2DC4CED1;
	Wed, 29 Jan 2025 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738161527;
	bh=Ijc0D3c2quW9xa+fv7bpYpp4DktBUIOvlL0TbDbI0As=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cg34zhZfxDDIacyWEgp3ImPXrPqvIUmowVqmg5Tn8Srd+Ti6JJyI6CufZNqHDj3DM
	 xOfkVeIu445BLOI+2otUsA8CYsNAwacyMf4u3/XT5nM/DOSfLvqfi4y2bXi5hR6NqH
	 ii5yK0732ZQuCKNf4JGKAa8TNqHUuvy1RsKAxEmGD2jEUAstoUk3CaHTQ+vF51Ciug
	 vR3qfNmL3Be/Kb9RtysiHECBZzDRyq3iiq1p+29jnWQ9eWPtlyitK1RetplhOeJB4E
	 v4hRRXf23VUs9dMnjltnS55LxE4tc7b6ZjajfLycj5NqtFBfiaqvdRN9/FPzvdugGe
	 4qKQ2VB7gDKCA==
Date: Wed, 29 Jan 2025 08:38:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
References: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
Message-Id: <173816122476.2059271.15221051769130232976.robh@kernel.org>
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_063848_338977_2EACCAC8 
X-CRM114-Status: GOOD (  15.97  )
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


On Tue, 28 Jan 2025 18:29:17 +0100, Uwe Kleine-König wrote:
> This dts is enough to make the board boot to Linux with the rootfs on
> a micro SD card.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> in the variant I sent 15 min ago I fatfingered the address of the
> linux-arm-kernel list. So here comes a resend with the right address ...
> 
> Sorry for the noise
> Uwe
> 
>  arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
>  .../socfpga/socfpga_cyclone5_de10nano.dts     | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/intel/' for 20250128172917.4565-2-u.kleine-koenig@baylibre.com:

arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['altr,socfpga-cyclone5', 'altr,socfpga'] is too short
	'altr,socfpga-cyclone5' is not one of ['altr,socfpga-arria5-socdk']
	'altr,socfpga-cyclone5' is not one of ['altr,socfpga-arria10-socdk']
	'altr,socfpga-cyclone5' is not one of ['enclustra,mercury-pe1', 'google,chameleon-v3']
	'altr,socfpga-cyclone5' is not one of ['altr,socfpga-cyclone5-socdk', 'denx,mcvevk', 'ebv,socrates', 'macnica,sodia', 'novtech,chameleon96', 'samtec,vining', 'terasic,de0-atlas', 'terasic,socfpga-cyclone5-sockit']
	'altr,socfpga-cyclone5' is not one of ['altr,socfpga-stratix10-socdk', 'altr,socfpga-stratix10-swvp']
	'altr,socfpga-vt' was expected
	'altr,socfpga-arria5' was expected
	'altr,socfpga-arria10' was expected
	'enclustra,mercury-aa1' was expected
	'altr,socfpga-cyclone5' was expected
	'altr,socfpga-stratix10' was expected
	from schema $id: http://devicetree.org/schemas/arm/altera.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: base_fpga_region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pdma@ffe01000: $nodename:0: 'pdma@ffe01000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: base_fpga_region: $nodename:0: 'base_fpga_region' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/i2c@ffc04000/accelerometer@53: failed to match any schema with compatible: ['adi,adxl34x']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
	['altr,sys-mgr', 'syscon'] is too long
	'altr,sys-mgr-s10' was expected
	'altr,sys-mgr' was expected
	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: axi_h2f_lw_bridge@ff200000: $nodename:0: 'axi_h2f_lw_bridge@ff200000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#






