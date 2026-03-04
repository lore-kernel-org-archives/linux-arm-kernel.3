Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4327DEF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnGfWYNz/B8Z/STQ+nxDMrIaxkLZdCmgqwbc8lykD5c=; b=CApRECOZYN+NHTnRUxTEZtyltP
	xjlt0uTsDvhRZUpqPw4wSJgEV4trDvHKIEcdQbuOC1ZYkYab80XffKY/Aj8QmfpSa8fuTxRAP/a9l
	FIXtTfRc6u/K1k5J0Ept4E32hzbl7dWDcIpfhYBeDxk3k57fMHen96Hax0vZ81+R2durpZxu1uc8l
	4eA5THPWPAeJrnKlexxSFKi5XPNhaxgYncuTdEdT7YlYj314ED01UVxLUrbD9upGQH182dUGyL5zT
	hbPkLyn8EJr1Y7omrcxoLEd1F8pcfNq9vWzUEXlSOqlLx2LQRsh2OUqEslvrfWzsBMxyjQpE/zxth
	gyszfBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmjH-0000000HHrC-2LEL;
	Wed, 04 Mar 2026 13:57:35 +0000
Received: from mail-m3268.qiye.163.com ([220.197.32.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmjF-0000000HHqX-084e;
	Wed, 04 Mar 2026 13:57:34 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35bf2f09e;
	Wed, 4 Mar 2026 21:57:28 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 Claude <noreply@anthropic.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
To: MidG971 <midgy971@gmail.com>, linux-rockchip@lists.infradead.org
References: <20260213151452.535527-1-midgy971@gmail.com>
 <20260304132957.684616-1-midgy971@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <7008e941-e4b0-a060-1cd7-55070fd5831f@rock-chips.com>
Date: Wed, 4 Mar 2026 21:57:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260304132957.684616-1-midgy971@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cb923aba109cckunm391357bd122b677
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhOTFYdHhpLTx9PQ0IfShlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ktf65g5fYYif+jmoKTPl+TFmIitwgG8hTrUcgGlxKEahlcwdTROmEuIxYNX4z1HYZJf8N5bUku/XmysBMoLD/Ox5/h7rzbSo/hKOOXLnXdL7nhB7tAGBmz3hsTRmQbu0MwVUTDAx1HSE1zegxhhNvLc984dud6RVqTaRnFuzGJA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wnGfWYNz/B8Z/STQ+nxDMrIaxkLZdCmgqwbc8lykD5c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_055733_291306_FB53B3A5 
X-CRM114-Status: GOOD (  23.77  )
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

在 2026/03/04 星期三 21:29, MidG971 写道:
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
> reference clock, matching the approach used in rk3588-rock-5-itx.dts.
> 
> Signed-off-by: Claude <noreply@anthropic.com>

IIUC, you are using Claude to help generate this patch, please
describe it properly, for example,

Co-developed-by: Claude claude-opus-4-20250514  [1]
or
Assisted-by: Claude:claude-3-opus [2]

[1] https://lwn.net/Articles/1031473/
[2] https://docs.kernel.org/process/coding-assistants.html	

> Signed-off-by: MidG971 <midgy971@gmail.com>
> ---
> 
> Changes since v1 [1]:
>   - Drop phy-supply approach entirely (Jonas, Shawn)
>   - Model PI6C20100 as gated-fixed-clock instead
>   - Wire reference clock to pcie3x2 controller
>   - Follow pattern from rk3588-rock-5-itx.dts
> 
> [1] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971@gmail.com/
> 
>   .../arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index 69001e4..24befc9 100644
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
> @@ -553,6 +562,13 @@
>   };
> 
>   &pcie3x2 {
> +	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
> +		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
> +		 <&cru CLK_PCIE30X2_AUX_NDFT>,
> +		 <&pcie30_refclk>;
> +	clock-names = "aclk_mst", "aclk_slv",
> +		      "aclk_dbi", "pclk", "aux",
> +		      "ref";

There is a missing pipe clock which should be fixed. Please
refer to David's patch[3].

[3] 
https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1

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

