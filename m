Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBAF10854D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91vt8+tPv/jxW775EoJRQVELCIpxi7wPQqegSZPeGGo=; b=IGr8EueSQ0MqBwX/kvKoJTkeeQ
	b3QjPsj4s9jpGuvaoBfDOOGA46SejYDByYT12pO6CdqA8OPDRNNvvmPq/xookGzF3BTJyUHHm5Oi6
	4DkCia1q0mnTzyrMuaEO1ZitW/P+JbXeHLXfo5metvJjrDYv1Oxvmgyblr4mhVJ5uiC8NDOuRWm9q
	Yz1uY+Y6sCZLy3MIFjSB8g6A8NWhA0yBv43lAZFOdl8/StUpfoaV8/b1FjpY7oLemZ2qT01dMZ4zp
	UavyS1mNh/LkUM6jv61lw68qXP0+Ka8wTVXGlS+hUpLjfDyUU/G1RKmYUjcrUGO+Ox8bI6M0rHOBo
	l/y4i/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ce8-0000000AcGn-3d1f;
	Thu, 19 Mar 2026 12:38:40 +0000
Received: from mail-m49233.qiye.163.com ([45.254.49.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ce5-0000000AcGL-1KSu;
	Thu, 19 Mar 2026 12:38:39 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3792bf95a;
	Thu, 19 Mar 2026 20:38:33 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
To: MidG971 <midgy971@gmail.com>
References: <20260319102247.32260-1-midgy971@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <21dda954-8821-d6fa-a17a-68c4a256910f@rock-chips.com>
Date: Thu, 19 Mar 2026 20:38:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20260319102247.32260-1-midgy971@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d061accfa09cckunm4b242d8a662e73
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh5JGFZLHU1JTh5IThoeTEJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jhsRo+TkAin0Ilaq5fdC01jbcgKkLr7LOnjclk26cla4Cr8i2/ckUBhoZn1z/Rep1vNsN9y7MtJ99IYRlwQ5A8554w1QOMRA115FHgqDggZSBAOzxJvWbF8ylU7obMdunFs0BR/7uyph+oWDqywpk8WU11c2vx2eMw1uOpG08hE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=91vt8+tPv/jxW775EoJRQVELCIpxi7wPQqegSZPeGGo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_053837_875511_574A5EDA 
X-CRM114-Status: GOOD (  22.72  )
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

在 2026/03/19 星期四 18:22, MidG971 写道:
> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
> This chip is currently modeled only as a fixed regulator
> (vcc3v3_pi6c_03), with no clock output representation.
> 
> The PI6C20100 is a clock generator, not a power supply. Model it
> properly as a gated-fixed-clock, following the pattern established
> for the Rock 5 ITX and other boards with similar PCIe clock buffer
> chips.
> 
> The regulator node is kept as-is since it controls the power supply
> to the PI6C20100 chip via GPIO0_D4. The new gated-fixed-clock node
> references this regulator as its vdd-supply and provides a proper
> 100MHz clock output. The pcie3x2 node is updated to include the
> pipe and reference clocks, matching the approach used in
> rk3588-rock-5-itx.dts.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Assisted-by: Claude:claude-3-opus
> Signed-off-by: MidG971 <midgy971@gmail.com>
> ---
> 
> Changes since v2 [1]:
>   - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Shawn)
>   - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks
>     override (Shawn, referencing David's patch [2])
> 
> Changes since v1 [3]:
>   - Drop phy-supply approach entirely (Jonas, Shawn)
>   - Model PI6C20100 as gated-fixed-clock instead
>   - Wire reference clock to pcie3x2 controller
>   - Follow pattern from rk3588-rock-5-itx.dts
> 
> [1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971@gmail.com/
> [2] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1
> [3] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971@gmail.com/
> 
>   arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index c5f67dd6dfd9..1a2b3c4d5e6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -56,7 +56,16 @@
>   		};
>   	};
> 
> -	/* pi6c pcie clock generator */
> +	/* PI6C20100 PCIe reference clock buffer (100MHz) */
> +	pcie30_refclk: pcie-clock-generator {
> +		compatible = "gated-fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "pcie30_refclk";
> +		vdd-supply = <&vcc3v3_pi6c_03>;
> +	};
> +
> +	/* PI6C20100 power supply - active-high GPIO0_D4 */
>   	vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
>   		compatible = "regulator-fixed";
>   		enable-active-high;
> @@ -553,6 +562,15 @@
>   };
> 
>   &pcie3x2 {
> +	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
> +		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
> +		 <&cru CLK_PCIE30X2_AUX_NDFT>,
> +		 <&cru CLK_PCIE30X2_PIPE_DFT>,
> +		 <&pcie30_refclk>;
> +	clock-names = "aclk_mst", "aclk_slv",
> +		      "aclk_dbi", "pclk", "aux",
> +		      "pipe", "ref";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pcie30x2m1_pins>;
>   	reset-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
> --
> 2.39.5
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

