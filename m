Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACBECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1UWvGCBuMfs/692VBVKpex9XmoBMjwVMGJDbY95QmY=; b=icQsLsDPoFIvgrwwXVKpm2kp0S
	247Zk1LrWjmTG3DiVwq8VN6ZSdXG52jmaLTFOC3kpN/0ZXb/Xdd5x8dtaxlBs7qCCDCIvDPtap/A5
	CwarznqSR5kqadzaHMr4dCnKRDl6LXSFn9jOuLxakrgl+5V1S7sTHz2jUu7xWLCuo53/mLB2Bd+Ox
	vcShn84hd40ZbJIr5bPzk0xJr3FXcGR6sNC4wB+tj8xe9v7Xb5U2vV2Ve3uaVgusE5peRdSqNAwmw
	FmH+kgl/KVuFMGEip457eMrIQrHB12TavfEjHQWDsrrNEY865IxD1ZYB/frk4m38B/P+NTJj8Hy6S
	kdHAOY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9R8N-00000005Svv-2Du6;
	Thu, 16 Oct 2025 16:47:23 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9R8K-00000005SuS-2DGW;
	Thu, 16 Oct 2025 16:47:21 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1v9R89-000000002py-116l;
	Thu, 16 Oct 2025 16:47:09 +0000
Date: Thu, 16 Oct 2025 17:47:05 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH 10/15] arm64: dts: mediatek: mt7981b: Add Ethernet and
 WiFi offload support
Message-ID: <aPEhiVdgkVLvF9Et@makrotopia.org>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-10-de259719b6f2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-openwrt-one-network-v1-10-de259719b6f2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_094720_720519_5CCFCC25 
X-CRM114-Status: GOOD (  17.40  )
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

On Thu, Oct 16, 2025 at 12:08:46PM +0200, Sjoerd Simons wrote:
> Add device tree nodes for the Ethernet subsystem on MT7981B SoC,
> including:
> - Ethernet MAC controller with dual GMAC support
> - Wireless Ethernet Dispatch (WED)
> - SGMII PHY controllers for high-speed Ethernet interfaces
> - Reserved memory regions for WiFi offload processor
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 133 ++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 13950fe6e8766..c85fa0ddf2da8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -2,6 +2,7 @@
>  
>  #include <dt-bindings/clock/mediatek,mt7981-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/reset/mt7986-resets.h>
>  
> @@ -47,11 +48,36 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		wo_boot: wo-boot@15194000 {
> +			reg = <0 0x15194000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		wo_ilm0: wo-ilm@151e0000 {
> +			reg = <0 0x151e0000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		wo_dlm0: wo-dlm@151e8000 {
> +			reg = <0 0x151e8000 0 0x2000>;
> +			no-map;
> +		};
> +
>  		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
>  		secmon_reserved: secmon@43000000 {
>  			reg = <0 0x43000000 0 0x30000>;
>  			no-map;
>  		};
> +
> +		wo_emi0: wo-emi@47d80000 {
> +			reg = <0 0x47d80000 0 0x40000>;
> +			no-map;
> +		};
> +
> +		wo_data: wo-data@47dc0000 {
> +			reg = <0 0x47dc0000 0 0x240000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc {
> @@ -107,6 +133,18 @@ pwm: pwm@10048000 {
>  			#pwm-cells = <2>;
>  		};
>  
> +		sgmiisys0: syscon@10060000 {
> +			compatible = "mediatek,mt7981-sgmiisys_0", "syscon";
> +			reg = <0 0x10060000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		sgmiisys1: syscon@10070000 {
> +			compatible = "mediatek,mt7981-sgmiisys_1", "syscon";
> +			reg = <0 0x10070000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
>  			reg = <0 0x11002000 0 0x100>;
> @@ -338,6 +376,10 @@ soc-uuid@140 {
>  			thermal_calibration: thermal-calib@274 {
>  				reg = <0x274 0xc>;
>  			};
> +
> +			phy_calibration: phy-calib@8dc {
> +				reg = <0x8dc 0x10>;
> +			};
>  		};
>  
>  		ethsys: clock-controller@15000000 {
> @@ -347,6 +389,97 @@ ethsys: clock-controller@15000000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		wed: wed@15010000 {
> +			compatible = "mediatek,mt7981-wed",
> +				     "syscon";
> +			reg = <0 0x15010000 0 0x1000>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +			memory-region = <&wo_emi0>, <&wo_ilm0>, <&wo_dlm0>,
> +					<&wo_data>, <&wo_boot>;
> +			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
> +					      "wo-data", "wo-boot";
> +			mediatek,wo-ccif = <&wo_ccif0>;
> +		};
> +
> +		eth: ethernet@15100000 {
> +			compatible = "mediatek,mt7981-eth";
> +			reg = <0 0x15100000 0 0x40000>;
> +			assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
> +					  <&topckgen CLK_TOP_SGM_325M_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_CB_NET2_800M>,
> +						 <&topckgen CLK_TOP_CB_SGM_325M>;
> +			clocks = <&ethsys CLK_ETH_FE_EN>,
> +				 <&ethsys CLK_ETH_GP2_EN>,
> +				 <&ethsys CLK_ETH_GP1_EN>,
> +				 <&ethsys CLK_ETH_WOCPU0_EN>,
> +				 <&topckgen CLK_TOP_SGM_REG>,
> +				 <&sgmiisys0 CLK_SGM0_TX_EN>,
> +				 <&sgmiisys0 CLK_SGM0_RX_EN>,
> +				 <&sgmiisys0 CLK_SGM0_CK0_EN>,
> +				 <&sgmiisys0 CLK_SGM0_CDR_CK0_EN>,
> +				 <&sgmiisys1 CLK_SGM1_TX_EN>,
> +				 <&sgmiisys1 CLK_SGM1_RX_EN>,
> +				 <&sgmiisys1 CLK_SGM1_CK1_EN>,
> +				 <&sgmiisys1 CLK_SGM1_CDR_CK1_EN>,
> +				 <&topckgen CLK_TOP_NETSYS_SEL>,
> +				 <&topckgen CLK_TOP_NETSYS_500M_SEL>;
> +			clock-names = "fe", "gp2", "gp1", "wocpu0",
> +				      "sgmii_ck",
> +				      "sgmii_tx250m", "sgmii_rx250m",
> +				      "sgmii_cdr_ref", "sgmii_cdr_fb",
> +				      "sgmii2_tx250m", "sgmii2_rx250m",
> +				      "sgmii2_cdr_ref", "sgmii2_cdr_fb",
> +				      "netsys0", "netsys1";
> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "fe0", "fe1", "fe2", "fe3", "pdma0",
> +					  "pdma1", "pdma2", "pdma3";
> +			sram = <&eth_sram>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,ethsys = <&ethsys>;
> +			mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
> +			mediatek,infracfg = <&topmisc>;
> +			mediatek,wed = <&wed>;
> +			status = "disabled";
> +
> +			mdio_bus: mdio-bus {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				int_gbe_phy: ethernet-phy@0 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <0>;
> +					phy-mode = "gmii";
> +					phy-is-integrated;
> +					nvmem-cells = <&phy_calibration>;
> +					nvmem-cell-names = "phy-cal-data";

Please also define the two LEDs here with their corresponding (only)
pinctrl options for each of them, with 'status = "disabled";'. This
makes it easier for boards to make use of the Ethernet PHY leds by just
referencing the LED and setting the status to 'okay'.

> +				};
> +			};
> +		};
> +
> +		eth_sram: sram@15140000 {
> +			compatible = "mmio-sram";
> +			reg = <0 0x15140000 0 0x40000>;
> +			ranges = <0 0x15140000 0 0x40000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
> +		wo_ccif0: syscon@151a5000 {
> +			compatible = "mediatek,mt7986-wo-ccif", "syscon";
> +			reg = <0 0x151a5000 0 0x1000>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		wifi: wifi@18000000 {
>  			compatible = "mediatek,mt7981-wmac";
>  			reg = <0 0x18000000 0 0x1000000>,
> 
> -- 
> 2.51.0
> 

