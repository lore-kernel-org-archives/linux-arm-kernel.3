Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 03:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLSSxNg3dTpdPXjgZLIOhqnXXot5F10MyjFb2gUR874=; b=ZXO+jMLR2Tn/dkrsmu/j0BNTca
	U03X022Tzxo5xpV2xETXSMwYZXSeDOde13LaFa9gnwikQinPmVPm2GYNpq1hqckVO6cSn0aKIcq6W
	g1Bdl/eouL2EPbKTI/XKPj6AtCEBQYaAokvfPhzj/Md2N+HvHxPF2V4A3EVwXMqQNe02xrhXB3o5I
	N3W0TlCkDhcePY0oKRtimVkfJpCYph3PX+lAXAs1OLSnJJ9qw5MZ/sHNoWs5bdIvXzYspgrGUK87a
	B2FzzZAyRDv55tPAv4C1PuyaFdrGRHESyr+2th4/IDDT4iOXNzA4TIze7BfY4fUh81Bec3cXrMOyt
	kIi5a4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zWn-00000002c6E-1zXW;
	Tue, 08 Apr 2025 03:21:33 +0000
Received: from mail-m8317.xmail.ntesmail.com ([156.224.83.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zDI-00000002ZgS-3G9V;
	Tue, 08 Apr 2025 03:01:26 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 110100f9f;
	Tue, 8 Apr 2025 11:01:19 +0800 (GMT+08:00)
Message-ID: <6ccfc126-b009-4ee9-0a2c-3e7faf512751@rock-chips.com>
Date: Tue, 8 Apr 2025 11:01:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Liang Chen <cl@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/2] arm64: dts: rockchip: Add rk3576 pcie nodes
To: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de
References: <20250225102611.2096462-1-kever.yang@rock-chips.com>
 <20250225102611.2096462-2-kever.yang@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250225102611.2096462-2-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkwYTVYZSEtOGEpLGUxCGUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9613585a7e09cckunm110100f9f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSo6OBw*TzJCNUJKKR4eLioX
	FzMaFElVSlVKTE9PS0NKSUNKSUNOVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU1MQ0s3Bg++
DKIM-Signature: a=rsa-sha256;
	b=ZzFcx253Iawa95Ut/zueBk6AOjK/JxZoWLnmw0TH6KDZc8RlQ7YnUlOpTHMHsFffAR/USMj5zUBT2BYglrMvPvoLWOjH7W3Vymu+m1vLvUPHOxBaS5zm/hHV9ejb3E099jnZ3QdUWJospg6rNBs/UVdBG+6V1U/jJHt8Cwql21Y=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SLSSxNg3dTpdPXjgZLIOhqnXXot5F10MyjFb2gUR874=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_200125_409523_D231E10B 
X-CRM114-Status: GOOD (  12.94  )
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

在 2025/02/25 星期二 18:26, Kever Yang 写道:
> rk3576 has two pcie controllers, both are pcie2x1 work with
> naneng-combphy.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 

One thing need to be mentioned, defconfig set:
CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m
CONFIG_PHY_ROCKCHIP_PCIE=m

So the phy is missing leads deferred probe pending.

With setting CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y,
pcie works fine, so

Tested-by: Shawn Lin <Shawn.lin@rock-chips.com>

> Changes in v7:
> - re-order the properties.
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
> - Update the subject
> 
> Changes in v2:
> - Update clock and reset names and sequence to pass DTB check
> 
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi | 108 +++++++++++++++++++++++
>   1 file changed, 108 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 4dde954043ef..79e24b2c3c60 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1127,6 +1127,114 @@ qos_npu_m1ro: qos@27f22100 {
>   			reg = <0x0 0x27f22100 0x0 0x20>;
>   		};
>   
> +		pcie0: pcie@2a200000 {
> +			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
> +			reg = <0x0 0x22000000 0x0 0x00400000>,
> +			      <0x0 0x2a200000 0x0 0x00010000>,
> +			      <0x0 0x20000000 0x0 0x00100000>;
> +			reg-names = "dbi", "apb", "config";
> +			bus-range = <0x0 0xf>;
> +			clocks = <&cru ACLK_PCIE0_MST>, <&cru ACLK_PCIE0_SLV>,
> +				 <&cru ACLK_PCIE0_DBI>, <&cru PCLK_PCIE0>,
> +				 <&cru CLK_PCIE0_AUX>;
> +			clock-names = "aclk_mst", "aclk_slv",
> +				      "aclk_dbi", "pclk",
> +				      "aux";
> +			device_type = "pci";
> +			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie0_intc 0>,
> +					<0 0 0 2 &pcie0_intc 1>,
> +					<0 0 0 3 &pcie0_intc 2>,
> +					<0 0 0 4 &pcie0_intc 3>;
> +			linux,pci-domain = <0>;
> +			max-link-speed = <2>;
> +			num-ib-windows = <8>;
> +			num-viewport = <8>;
> +			num-ob-windows = <2>;
> +			num-lanes = <1>;
> +			phys = <&combphy0_ps PHY_TYPE_PCIE>;
> +			phy-names = "pcie-phy";
> +			power-domains = <&power RK3576_PD_PHP>;
> +			ranges = <0x01000000 0x0 0x20100000 0x0 0x20100000 0x0 0x00100000
> +				  0x02000000 0x0 0x20200000 0x0 0x20200000 0x0 0x00e00000
> +				  0x03000000 0x9 0x00000000 0x9 0x00000000 0x0 0x80000000>;
> +			resets = <&cru SRST_PCIE0_POWER_UP>, <&cru SRST_P_PCIE0>;
> +			reset-names = "pwr", "pipe";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			status = "disabled";
> +
> +			pcie0_intc: legacy-interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +				interrupt-parent = <&gic>;
> +				interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>;
> +			};
> +		};
> +
> +		pcie1: pcie@2a210000 {
> +			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
> +			reg = <0x0 0x22400000 0x0 0x00400000>,
> +			      <0x0 0x2a210000 0x0 0x00010000>,
> +			      <0x0 0x21000000 0x0 0x00100000>;
> +			reg-names = "dbi", "apb", "config";
> +			bus-range = <0x20 0x2f>;
> +			clocks = <&cru ACLK_PCIE1_MST>, <&cru ACLK_PCIE1_SLV>,
> +				 <&cru ACLK_PCIE1_DBI>, <&cru PCLK_PCIE1>,
> +				 <&cru CLK_PCIE1_AUX>;
> +			clock-names = "aclk_mst", "aclk_slv",
> +				      "aclk_dbi", "pclk",
> +				      "aux";
> +			device_type = "pci";
> +			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie1_intc 0>,
> +					<0 0 0 2 &pcie1_intc 1>,
> +					<0 0 0 3 &pcie1_intc 2>,
> +					<0 0 0 4 &pcie1_intc 3>;
> +			linux,pci-domain = <0>;
> +			max-link-speed = <2>;
> +			num-ib-windows = <8>;
> +			num-viewport = <8>;
> +			num-ob-windows = <2>;
> +			num-lanes = <1>;
> +			phys = <&combphy1_psu PHY_TYPE_PCIE>;
> +			phy-names = "pcie-phy";
> +			power-domains = <&power RK3576_PD_SUBPHP>;
> +			ranges = <0x01000000 0x0 0x21100000 0x0 0x21100000 0x0 0x00100000
> +				  0x02000000 0x0 0x21200000 0x0 0x21200000 0x0 0x00e00000
> +				  0x03000000 0x9 0x80000000 0x9 0x80000000 0x0 0x80000000>;
> +			resets = <&cru SRST_PCIE1_POWER_UP>, <&cru SRST_P_PCIE1>;
> +			reset-names = "pwr", "pipe";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			status = "disabled";
> +
> +			pcie1_intc: legacy-interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +				interrupt-parent = <&gic>;
> +				interrupts = <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>;
> +			};
> +		};
> +
>   		gmac0: ethernet@2a220000 {
>   			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
>   			reg = <0x0 0x2a220000 0x0 0x10000>;

