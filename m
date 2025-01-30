Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC69C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hwoHpLXNqISvs5BnClfsg3ilUk9ReklrUhiP39QnHA=; b=2gFQmObrTM1LP9nMfSlbsqpZxV
	Bw0qabDKrO9ah4ZE3u0nELW/fuF7Gl9rVO6h+a2NBAqsDbLYNXlVXCO/UO8dC1yhNSUP/cF8S3vck
	+4TRRPuYMRQnTNkIajvT7lsrpEp049A/DKlrswdwG0MBAmcnIcr2Q6I17MJNNs5fFrDp71C1Tt19A
	6+yEmuvTg/V7de+RTVHiEbvvN9VrkBOYAZGdbMUTPqx0nNTjVgHySR9KqCMqo3zGIQ6+9KApqYc1R
	702SObb1C0AkjkytFGKSD9VDdzM4H0hz//SPjtj4axTwBTTX5DMWlJlc+4T8I4Mo68SmqChR4mhde
	b7NJPueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeDH-00000009oYA-3A6j;
	Thu, 30 Jan 2025 23:44:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde6s-00000009njt-3UiP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64D3EA425D3;
	Thu, 30 Jan 2025 23:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B30DC4CED2;
	Thu, 30 Jan 2025 23:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280289;
	bh=4lk7Ig7s5pJJbMrVZyk6e3D+x/5H8relNk/MdScJCB0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=azAqe0cnNc8eM36JQGaBvZHcaKfmjN3ub1BdsMCsTqXaZNT9aDmxbz3603cRanMf6
	 qq3+XMflKe20EIyWy7O6VtgdfYlZtqwbieI/VLMa0YcOm2OFYw95m5FAZQ2GpPW8fY
	 trdbqy8i/Oqa+eJOUjXB2G1xqhzndPKostHq8oau/HN1mNfSdJxVlxc9JiosDeJ1Zj
	 fLp+AsFU5cFG76tQqz/z8jJZGhvNz8j0Lw/T5UlS4rzEvptaWERDFybKRFnkctbaKz
	 rN+owmeYpuxELumjleJ6khJK2nuiLf5WPthz+Cx6I4WhkCzUhuebWUcD/ICQXBe5a4
	 onr4OLqT8ahWg==
Date: Thu, 30 Jan 2025 17:38:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Dinh Nguyen <dinguyen@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
References: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
Message-Id: <173828013131.1872475.6879199940703724951.robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's
 de10-nano
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153811_005120_9D67DC9F 
X-CRM114-Status: GOOD (  22.38  )
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


On Thu, 30 Jan 2025 08:45:53 +0100, Uwe Kleine-König wrote:
> This dts is enough to make the board boot to Linux with the rootfs on
> a micro SD card.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> changes since (implicit) v1 available at
> https://lore.kernel.org/linux-arm-kernel/20250128172917.4565-2-u.kleine-koenig@baylibre.com/:
> 
>  - Use rgmii-id for ethernet/mdio. (Andrew Lunn)
>  - Add a compatible entry for the machine (only had the SoC before),
>    fix compatible for accelerometer and various other small
>    improvements, most of them pointed out by the dt checker.
>    (Krzysztof Kozlowski)
> 
> There are still warnings when the dtb is built, but they all originate
> from the SoC dtsi.

Except for the ones with the board compatible...

> 
> Something I forgot to say in v1: The accelerometer fails to probe
> (readout of the device ID yields an error). This also doesn't work for
> me with the downstream kernel and dtb. I didn't debug that. Is that a
> reason to drop it?
> 
> Best regards
> Uwe
> 
>  arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
>  .../socfpga/socfpga_cyclone5_de10nano.dts     | 95 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/intel/' for 20250130074553.92023-2-u.kleine-koenig@baylibre.com:

arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga'] is too short
	['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga'] is too long
	'terasic,de10-nano' is not one of ['altr,socfpga-arria5-socdk']
	'terasic,de10-nano' is not one of ['altr,socfpga-arria10-socdk']
	'terasic,de10-nano' is not one of ['enclustra,mercury-pe1', 'google,chameleon-v3']
	'terasic,de10-nano' is not one of ['altr,socfpga-cyclone5-socdk', 'denx,mcvevk', 'ebv,socrates', 'macnica,sodia', 'novtech,chameleon96', 'samtec,vining', 'terasic,de0-atlas', 'terasic,socfpga-cyclone5-sockit']
	'terasic,de10-nano' is not one of ['altr,socfpga-stratix10-socdk', 'altr,socfpga-stratix10-swvp']
	'altr,socfpga-vt' was expected
	'altr,socfpga-arria5' was expected
	'altr,socfpga-arria10' was expected
	'enclustra,mercury-aa1' was expected
	'altr,socfpga-stratix10' was expected
	'altr,socfpga' was expected
	from schema $id: http://devicetree.org/schemas/arm/altera.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /: failed to match any schema with compatible: ['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: base_fpga_region: 'ranges' is a required property
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






