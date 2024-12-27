Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A8AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yi3jZ/+f3EMk8I9lL+08u5LdDtd/ni9YqB/10MSV4GE=; b=4Z4MlUGzL2PsfdhQnCpnfyi61m
	vZ9ySRfikq7MoRhw9rMWbiV2sqlEJz/l75g/IIZCQeYBaOWIcqAOOs4NsyNklJnC6yMhwTENFf18Y
	3bhOGFH9slxticWh+gTA5abOMElmeMrdsqBfyII71AYDk32uHUWMmV8nf8eYDd6KBeY3pvxB9SMiX
	ZPAEDjTgPPWE1z6b8yHXeUquf/2iJxzUuoW7bvofrR+QCzlSBa1g4PLOj1lcuWWuxcQU+2wlAapGm
	1/lmot+hdhNMjzotvwFT8L86fRFC5uVnXKPSJcAUjj92b+gW3tOPFGruC4N1ATgHfwxpdf+8wgEeF
	Lr5yLIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR567-0000000HJ2u-0aoZ;
	Fri, 27 Dec 2024 07:49:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR54v-0000000HInT-0LfE;
	Fri, 27 Dec 2024 07:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF1B15C53C5;
	Fri, 27 Dec 2024 07:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BE1C4CED0;
	Fri, 27 Dec 2024 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735285692;
	bh=0qX+Xq7p6trQLZOKbCeFhjW+yBSId3LVR0sShRdPdnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDpM7o181v2HAQtbxH8lCmTLWg4Qyg8Rv3+SjfgXtcFF7Wr+dkrUQOkJZxTp/imH0
	 EGxPapJfXLMr+Ui3My6HJKKZwSJShjBArMYxO5qN2pwDwRSpglCCQGDIokyp2TveND
	 dpBDKKCBJvP7RLDNMt6piqnM7mRtd0CU1mPCeGafdoA6n7oL4JPSLl1ou4u9CFBPvU
	 EwnfQqCXhKPI5+o1XHNjpRduordnPV/5w6aZrEwUCeB4MUW0h6H9sqGiKREKekrKOK
	 kUX+6mnOJvbGK4iGtfXZGOPj6yggizE6iO4APr48lQZ9ZmQDi9o3HNc1Qqt51SFxxA
	 O+u4rqmA2UM2g==
Date: Fri, 27 Dec 2024 08:48:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 16/17] arm64: dts: rockchip: add core dtsi for RK3562
 Soc
Message-ID: <nfvn7agwci2ilcgmz6zhioelstk6wuzkj4ptwjxrrizfkrlq2a@tlnuluqtokt2>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-17-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-17-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_234813_223699_A08ACBEA 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 24, 2024 at 05:49:19PM +0800, Kever Yang wrote:
> +#include <dt-bindings/clock/rockchip,rk3562-cru.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/power/rockchip,rk3562-power.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/reset/rockchip,rk3562-cru.h>
> +#include <dt-bindings/soc/rockchip,boot-mode.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	compatible = "rockchip,rk3562";
> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		gpio4 = &gpio4;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;

No, drop i2c aliases. Not SoC specific.

> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +		serial6 = &uart6;
> +		serial7 = &uart7;
> +		serial8 = &uart8;
> +		serial9 = &uart9;

No, drop all above.

> +		spi0 = &spi0;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +		spi3 = &sfc;

Drop all above.

> +	};


...

> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			clocks = <&scmi_clk ARMCLK>;
> +			cpu-idle-states = <&CPU_SLEEP>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <138>;
> +		};

Keep consistent style. There is always line break between nodes.


> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +			clocks = <&scmi_clk ARMCLK>;
> +			cpu-idle-states = <&CPU_SLEEP>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <138>;
> +		};
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +			clocks = <&scmi_clk ARMCLK>;
> +			cpu-idle-states = <&CPU_SLEEP>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <138>;
> +		};
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +			clocks = <&scmi_clk ARMCLK>;
> +			cpu-idle-states = <&CPU_SLEEP>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <138>;
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +			CPU_SLEEP: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <120>;
> +				exit-latency-us = <250>;
> +				min-residency-us = <900>;
> +			};
> +		};
> +	};
> +
> +	cpu0_opp_table: opp-table-cpu0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <825000 825000 1150000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};

...

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	scmi_shmem: scmi-shmem@10f000 {


Where is the soc node?

> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0x0010f000 0x0 0x100>;
> +	};
> +
> +	usbdrd_dwc3: usb@fe500000 {
> +		compatible = "rockchip,rk3562-dwc3", "snps,dwc3";
> +		reg = <0x0 0xfe500000 0x0 0x400000>;
> +		clocks = <&cru CLK_USB3OTG_REF>, <&cru CLK_USB3OTG_SUSPEND>,
> +			 <&cru ACLK_USB3OTG>, <&cru PCLK_PHP>;
> +		clock-names = "ref_clk", "suspend_clk", "bus_clk", "pipe";
> +		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&power RK3562_PD_PHP>;
> +		resets = <&cru SRST_USB3OTG>;
> +		dr_mode = "otg";
> +		phys = <&u2phy_otg>;
> +		phy-names = "usb2-phy";
> +		phy_type = "utmi_wide";
> +		snps,dis_enblslpm_quirk;
> +		snps,dis-u1-entry-quirk;
> +		snps,dis-u2-entry-quirk;
> +		snps,dis-u2-freeclk-exists-quirk;
> +		snps,dis-del-phy-power-chg-quirk;
> +		snps,dis-tx-ipgap-linecheck-quirk;
> +		snps,dis_rxdet_inp3_quirk;
> +		snps,parkmode-disable-hs-quirk;
> +		snps,parkmode-disable-ss-quirk;
> +		status = "disabled";
> +	};

....

> +		snps,axi-config = <&gmac0_stmmac_axi_setup>;
> +		snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> +		snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> +		status = "disabled";
> +v
> +		mdio0: mdio {
> +			compatible = "snps,dwmac-mdio";
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +		};
> +
> +		gmac0_stmmac_axi_setup: stmmac-axi-config {
> +			snps,wr_osr_lmt = <4>;
> +			snps,rd_osr_lmt = <8>;
> +			snps,blen = <0 0 0 0 16 8 4>;
> +		};
> +
> +		gmac0_mtl_rx_setup: rx-queues-config {
> +			snps,rx-queues-to-use = <1>;
> +			queue0 {};
> +		};
> +
> +		gmac0_mtl_tx_setup: tx-queues-config {
> +			snps,tx-queues-to-use = <1>;
> +			queue0 {};
> +		};
> +	};
> +
> +	saradc1: saradc@ffaa0000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "rockchip,rk3562-saradc";
> +		reg = <0x0 0xffaa0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +		#io-channel-cells = <1>;
> +		clocks = <&cru CLK_SARADC_VCCIO156>, <&cru PCLK_SARADC_VCCIO156>;
> +		clock-names = "saradc", "apb_pclk";
> +		resets = <&cru SRST_P_SARADC_VCCIO156>;
> +		reset-names = "saradc-apb";
> +		status = "disabled";
> +	};
> +
> +	gmac1: ethernet@ffb30000 {
> +		compatible = "rockchip,rk3562-gmac", "snps,dwmac-4.20a";
> +		reg = <0x0 0xffb30000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "macirq", "eth_wake_irq";
> +		rockchip,grf = <&sys_grf>;
> +		rockchip,php-grf = <&ioc_grf>;
> +		clocks = <&cru CLK_MAC100_50M_MATRIX>, <&cru CLK_MAC100_50M_MATRIX>,
> +			 <&cru PCLK_MAC100>, <&cru ACLK_MAC100>;
> +		clock-names = "stmmaceth", "clk_mac_ref",
> +			      "pclk_mac", "aclk_mac";
> +		resets = <&cru SRST_A_MAC100>;
> +		reset-names = "stmmaceth";
> +		status = "disabled";
> +
> +		mdio1: mdio {
> +			compatible = "snps,dwmac-mdio";
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +		};
> +	};
> +
> +	pinctrl: pinctrl {


MMIO devices are not outside of soc.

> +		compatible = "rockchip,rk3562-pinctrl";
> +		rockchip,grf = <&ioc_grf>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpio0: gpio@ff260000 {


Best regards,
Krzysztof


