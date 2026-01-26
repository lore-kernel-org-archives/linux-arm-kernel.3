Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36905D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GmR4U/6sjLZ6b4mP0qhVrXUe9sv8qZlxLz11xmTSMI=; b=1Y0UPctD0qA7m20Uga556MvHKG
	FaOT5+lcBVY/EO8/FMN5xPe/bpxRmamzK/u/N29/HrlJak4K6ewrB1v/9IP6umJPt+VWzHlj0f43V
	b3OGF2rgrdshqIuHCdicSFBJlVhOSlIJ5cLeKYf6YZlJTs+MVZY9dfoe/5unPYxdGdpqdtug76yOP
	EWtkmHiUwZQeaFUf7kSf4cOXcuoepF8W+TtX+ECqNrNpgPVphJoGhkLzhXPFlEj1viU6k73gFmsNR
	5j2Xm6xewBPflAv9kRlLw0J1Bt1HEHzmdn16TDnZ2t1oaBi42bBhnz54QyFDf1vaSgqyLFCr0hv7e
	8IXp+L6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPHy-0000000CqTI-1ILU;
	Mon, 26 Jan 2026 16:18:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPHv-0000000CqSm-3qGK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9GmR4U/6sjLZ6b4mP0qhVrXUe9sv8qZlxLz11xmTSMI=; b=W1YU4JX6USsiOCe6sebt6DfqKV
	35oiUK67jY8GYTFhaQHQnJr7jygPAsCtrIu5rnCvug/xXLZroQ0DSeAfCpfjfTVkrq/K7Xoeo+q0Q
	L0dqUFWsLX1sJC4HMsEqu1rVFuXOAvC2s3nooFLuqXT8ljvjzLMl5zveu3qUBIJ2bTDA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vkPHf-004oR8-T2; Mon, 26 Jan 2026 17:17:47 +0100
Date: Mon, 26 Jan 2026 17:17:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v9 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Message-ID: <ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch>
References: <20260126102257.2619862-1-a0987203069@gmail.com>
 <20260126102257.2619862-3-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126102257.2619862-3-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_081803_979714_A2B2044B 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Jan 26, 2026 at 06:22:56PM +0800, Joey Lu wrote:
> Add GMAC nodes for our MA35D1 development boards:
> two RGMII interfaces for SOM board, and one RGMII
> and one RMII interface for IoT board.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++

Did you answer my question about what these represent?

I _think_ your .dts{i} files are all messed up and need
re-architecturing.

arch/arm64/boot/dts/nuvoton/ma35d1.dtsi should represent the SoC.

There should be a .dtsi file which represents everything on the SOM.
This includes the SoC .dtsi file.

There should be a .dts file for the carrier board. It should include
the SOM .dtsi file.

You said one of the boards does not use the SOM, so it can directly
import the SoC .dtsi file.

>  3 files changed, 97 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> index 9482bec1aa57..ee32cedf3d9b 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> @@ -18,6 +18,8 @@ aliases {
>  		serial12 = &uart12;
>  		serial13 = &uart13;
>  		serial14 = &uart14;
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
>  	};
>  
>  	chosen {
> @@ -126,3 +128,34 @@ &uart14 {
>  	pinctrl-0 = <&pinctrl_uart14>;
>  	status = "okay";
>  };
> +
> +&gmac0 {
> +	phy-handle = <&eth_phy0>;

This is a .dts file, so represents a board. You said the PHYs are on
the board, not the SOM. So this is correct.


> +	status = "okay";
> +
> +	mdio0: mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

The MDIO bus is a property of the SoC. It always exists, even if it is
not used. So the mdio node should be in the SoC .dtsi file.

> +		eth_phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};

The PHY is a property of the board, so should be in the board .dts
file. 

> +	};
> +};
> +
> +&gmac1 {
> +	phy-mode = "rmii";
> +	phy-handle = <&eth_phy1>;
> +	status = "okay";

Correct.

> +
> +	mdio1: mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Wrong.

> +
> +		eth_phy1: ethernet-phy@1 {
> +			reg = <1>;
> +		};

Correct.

> +	};
> +};
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> index f6f20a17e501..b1b3e45280d5 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> @@ -18,6 +18,8 @@ aliases {
>  		serial12 = &uart12;
>  		serial14 = &uart14;
>  		serial16 = &uart16;
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
>  	};
>  
>  	chosen {
> @@ -129,3 +131,33 @@ &uart16 {
>  	pinctrl-0 = <&pinctrl_uart16>;
>  	status = "okay";
>  };
> +
> +&gmac0 {
> +	phy-handle = <&eth_phy0>;
> +	status = "okay";
> +
> +	mdio0: mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		eth_phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&gmac1 {
> +	phy-handle = <&eth_phy1>;
> +	status = "okay";
> +
> +	mdio1: mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		eth_phy1: ethernet-phy@1 {
> +			reg = <1>;
> +		};
> +	};
> +};

Same problem as above.

> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

This represents the SoC.

> @@ -379,5 +379,37 @@ uart16: serial@40880000 {
>  			clocks = <&clk UART16_GATE>;
>  			status = "disabled";
>  		};
> +
> +		gmac0: ethernet@40120000 {
> +			compatible = "nuvoton,ma35d1-dwmac";
> +			reg = <0x0 0x40120000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
> +			clock-names = "stmmaceth", "ptp_ref";
> +
> +			nuvoton,sys = <&sys 0>;
> +			resets = <&sys MA35D1_RESET_GMAC0>;
> +			reset-names = "stmmaceth";
> +
> +			phy-mode = "rgmii-id";

PHY mode is a property of the board. The board might have extra long
clock lines, so needs 'rgmii'. The board might use MII?

Please think about the hierarchy.  SoC -> SoM -> board. Put the
properties at the correct level.

    Andrew

---
pw-bot: cr

