Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B2DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48wXuXFUcpkxyYEqMjrHLtrbLxlwqOJwN2nUnKPwy9M=; b=Fx04jGI90cZYrQJc9pk2JVoWDT
	h7dAGDT5k0m/jJLM5iKwsRNGp8K48G5Lza5IwGirflkj9iobzjYsyrNpNfWg1Y1vgtmaxc1iKBTZn
	uINF4gifLoWYK10NXQxsKvF8x6oX7tKDLjOQ0uD8YcRNrh4HUWMAyLA/NvdPWWS/ujeZCRakv2HFK
	eEX6gjXfatLAa66u7IMXBhbINMrBf4nniHjEr9CQCOyR3ene72ESTQOQ0Wejl6aUwC4zfBBqB1Dxl
	+2YEiXQlEo9nh0ZH7XjoYe3hZNwT7ndCnVeprkfgfPg5flX4B33KgenoTHvHeZtti1/gyccXehwiV
	P/2GLquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVALs-000000058oy-3kV0;
	Tue, 07 Jan 2025 14:14:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAC3-000000056Eh-0eOT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 765965C60B4;
	Tue,  7 Jan 2025 14:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D84C4CED6;
	Tue,  7 Jan 2025 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736258666;
	bh=zpLPFk4V34ySX+QVzjn/D76/5f0os4lfSRGEnv0cZmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cPQo+dryUksVlvwsThdiPNcOZjdgy2GBgF3ugnnXcIkb3I+4cu5UyoC3C0sRbzziD
	 rgfw+OHTNySl15kiH2dUtB8Bcxd4mBdGfn4c4IFS4eZnywBoDaanhMCg3C109EA3Ef
	 +V1DgZCfPEx+TfI6tIcP2v5AkFXkivpV+nDMPSmWd2sczNoWVRj7BNsaSJRLD2Rc8s
	 3RCD44TYL5VjhWXrvz4s4Oyw2ejFXNXoHTULojlXW4qy+A5O1FNbn2IeVOQXIlyo0X
	 ogdQk3zA1gQJt67myyI8Tht5FBrpkHs3340hAbGhNqfWgcTKBlUhahZT5fKbwEWpOg
	 yQ6bEymwnXo7g==
Message-ID: <dcbda522-eeed-43a9-ab34-a41e5239c6e8@kernel.org>
Date: Tue, 7 Jan 2025 16:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am68-sk*: Add bootph-all property
 to necessary nodes to enable Ethernet boot
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nishanth Menon <nm@ti.com>
Cc: srk@ti.com, s-vadapalli@ti.com, danishanwar@ti.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250106123122.3531845-1-c-vankar@ti.com>
 <20250106123122.3531845-2-c-vankar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250106123122.3531845-2-c-vankar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060427_286293_49AB9E6C 
X-CRM114-Status: GOOD (  12.97  )
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
> nodes during SPL stage along with later boot stages for AM68-SK.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 5 +++++
>  arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 11522b36e0ce..f1f8b228926d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -333,6 +333,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
>  			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
>  			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
>  		>;
> +		bootph-all;

Shouldn't bootph-all be the first property in the DT nodes?

>  	};
>  
>  	mcu_mdio_pins_default: mcu-mdio-default-pins {
> @@ -340,6 +341,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
>  			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
>  			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
>  		>;
> +		bootph-all;
>  	};
>  
>  	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
> @@ -610,11 +612,13 @@ &main_sdhci1 {
>  &mcu_cpsw {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
> +	bootph-all;
>  };
>  
>  &davinci_mdio {
>  	phy0: ethernet-phy@0 {
>  		reg = <0>;
> +		bootph-all;
>  		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>  		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>  		ti,min-output-impedance;
> @@ -624,6 +628,7 @@ phy0: ethernet-phy@0 {
>  &cpsw_port1 {
>  	phy-mode = "rgmii-rxid";
>  	phy-handle = <&phy0>;
> +	bootph-all;
>  };
>  
>  &mcu_mcan0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> index bc31266126d0..cfae226d3c63 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> @@ -154,12 +154,14 @@ mcu_conf: bus@40f00000 {
>  		cpsw_mac_syscon: ethernet-mac-syscon@200 {
>  			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
>  			reg = <0x200 0x8>;
> +			bootph-all;
>  		};
>  
>  		phy_gmii_sel: phy@4040 {
>  			compatible = "ti,am654-phy-gmii-sel";
>  			reg = <0x4040 0x4>;
>  			#phy-cells = <1>;
> +			bootph-all;
>  		};
>  
>  	};

-- 
cheers,
-roger


