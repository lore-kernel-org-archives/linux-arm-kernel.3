Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66771E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX+3JukbnYzy8nobXAdigQ/517cLWUzoIO8tkMTU270=; b=tbRGTEHUHOfroUmt8uIIS97y1h
	7R5g2uYdGIRyGfCoBpTbw9jq6HWxVM+OYI5TLTfGd1jiv3fZPrdvhubPMDOsA/HQOjvNcKkObo6z4
	Uz2HZWFH+bcMllIYjv44zpU3+7RPBPmDOs4yP3WzNovpbMCarisWcQorkYllp8ZSmWvLexEpBn/IM
	CJFoyF+IaED8RZYDAhX8tDajocwFVspkeCyHf3ZM3OBUfugF79ROtKmahuisvHx6AZVj4qxoKIPXW
	I/D4XlQeO/LyeNEiIpbB/5s5mG6mZq1Yp/kiRQWkHPvbxOMwaQV/Kfb60PtSwYoA41nxYLAaybR3r
	GM6QsWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAJY-000000058Bf-1tlT;
	Tue, 07 Jan 2025 14:12:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAAQ-000000055ny-3lKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44EC8A41372;
	Tue,  7 Jan 2025 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F02C4CEDD;
	Tue,  7 Jan 2025 14:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736258565;
	bh=1y1trmqo4VZPTWM5xAydMhMQsybEilrtQDjuW11FTX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mYtQjzn3Kr0oMbufGyVBS0J8tFdem8M6ETYf8k+gYZ9WSTcZ0ACMT4yTVBdIlHIpt
	 JvK93tMzH50rvi8BNPyszkS07D04AzXTiNPGbmefbrL5dkKGyazQWLRS+rjJOVayFS
	 LtXS6kYgsmb480EJpSTO/AcZSRCQpnOcU0tgcnybfU4jowvV3Zmqj/IA43v5A11n1L
	 CGRDW9o55qVRSPW4WkEqBTaLgCdDoc65HtdUgJTVx3twmuA7mp3buRMHkLgE5vcyCQ
	 Y+hXNQX90Z7AnaZhAZqDf2rjYeoR5rT1niXxcMHsbCtaA8hqp4G4uXQXhK9TpCU0VX
	 eWuA1F4ePxXrQ==
Message-ID: <f4a7e47c-f843-43cd-aac2-a98b8153a535@kernel.org>
Date: Tue, 7 Jan 2025 16:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am62p5*/k3-j722s: Add bootph-all
 property to necessary nodes to enable Ethernet boot
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nishanth Menon <nm@ti.com>
Cc: srk@ti.com, s-vadapalli@ti.com, danishanwar@ti.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250106123122.3531845-1-c-vankar@ti.com>
 <20250106123122.3531845-3-c-vankar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250106123122.3531845-3-c-vankar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060247_098614_0AAF5BEF 
X-CRM114-Status: GOOD (  13.24  )
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



On 06/01/2025 14:31, Chintan Vankar wrote:
> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> stage. Add bootph-all property to necessary nodes for CPSW to enable those
> nodes during SPL stage along with later boot stages for AM62p-SK and
> J722s.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                | 2 ++
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts                | 3 +++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 6e3beb5c2e01..96ddc5c17991 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -50,6 +50,7 @@ phy_gmii_sel: phy@4044 {
>  			compatible = "ti,am654-phy-gmii-sel";
>  			reg = <0x4044 0x8>;
>  			#phy-cells = <1>;
> +			bootph-all;


Shouldn't bootph-all be the first property in the DT node?

>  		};
>  
>  		epwm_tbclk: clock-controller@4130 {
> @@ -714,6 +715,7 @@ ethernet-ports {
>  			#size-cells = <0>;
>  
>  			cpsw_port1: port@1 {
> +				bootph-all;
>  				reg = <1>;
>  				ti,mac-only;
>  				label = "port1";
> @@ -742,6 +744,7 @@ cpsw3g_mdio: mdio@f00 {
>  			clock-names = "fck";
>  			bus_freq = <1000000>;
>  			status = "disabled";
> +			bootph-all;
>  		};
>  
>  		cpts@3d000 {
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index ad71d2f27f53..28b08eb79da3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -226,6 +226,7 @@ main_mdio1_pins_default: main-mdio1-default-pins {
>  			AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
>  			AM62PX_IOPAD(0x015c, PIN_INPUT, 0) /* (F16) MDIO0_MDIO */
>  		>;
> +		bootph-all;
>  	};
>  
>  	main_mmc1_pins_default: main-mmc1-default-pins {
> @@ -495,6 +496,7 @@ &cpsw3g_mdio {
>  
>  	cpsw3g_phy0: ethernet-phy@0 {
>  		reg = <0>;
> +		bootph-all;
>  		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>  		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>  		ti,min-output-impedance;
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index 796287c76b69..1785c9848664 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -303,6 +303,7 @@ mdio_pins_default: mdio-default-pins {
>  			J722S_IOPAD(0x0160, PIN_OUTPUT, 0) /* (AC24) MDIO0_MDC */
>  			J722S_IOPAD(0x015c, PIN_INPUT, 0) /* (AD25) MDIO0_MDIO */
>  		>;
> +		bootph-all;
>  	};
>  
>  	ospi0_pins_default: ospi0-default-pins {
> @@ -337,6 +338,7 @@ J722S_IOPAD(0x0140, PIN_OUTPUT, 0) /* (AF24) RGMII1_TD3 */
>  			J722S_IOPAD(0x0130, PIN_OUTPUT, 0) /* (AG26) RGMII1_TXC */
>  			J722S_IOPAD(0x012c, PIN_OUTPUT, 0) /* (AF25) RGMII1_TX_CTL */
>  		>;
> +		bootph-all;
>  	};
>  
>  	main_usb1_pins_default: main-usb1-default-pins {
> @@ -374,6 +376,7 @@ &cpsw3g_mdio {
>  
>  	cpsw3g_phy0: ethernet-phy@0 {
>  		reg = <0>;
> +		bootph-all;
>  		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>  		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>  		ti,min-output-impedance;

-- 
cheers,
-roger


