Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3A7D2ECFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWYGu5J9V5z11TMqc+8jFIAluBajua9+OLQjTlFfPqI=; b=CRuZZtEajGHm00w6z3OUMEHAzE
	CtfQ3kYaKsLVRmO8D6SiUzcpvfKbWQljFxw7OU4Hao0fdhAajMdGUDRVjCeiVyO2DEcCD1fnNnppK
	BHNjoJJEeAjXis1FPGWFtOKLZT7983V5ePY+W6beFc243mqL9wegfhQExWwMpTZdHt3usLxROb2tO
	s4MpiW8YFX/5pix2YTp4dMTcQBvdilm4K7VHkV2k84PGzAHti03DiRC4ID0rFYdbOcfEIpNclAyYv
	0IWmYpG3nFET4YxRnbJq71ZvEDE6m33l67xGxLeOO+oTuaaWmGuzrV/CCelBmXSMNn4J/OkxBYubI
	HrnjxhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0ic-000000033Eu-3Qzl;
	Tue, 20 Jan 2026 01:39:42 +0000
Received: from mail-m32107.qiye.163.com ([220.197.32.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0iW-000000033Di-2wlD;
	Tue, 20 Jan 2026 01:39:40 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3139770be;
	Tue, 20 Jan 2026 09:39:29 +0800 (GMT+08:00)
Message-ID: <6479d7b8-7712-4181-9c82-0021da94d1a8@rock-chips.com>
Date: Tue, 20 Jan 2026 09:39:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Quentin Schulz <quentin.schulz@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly request UFS reset pin on
 RK3576
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bd90e901f09cckunmca3c291e9e5067
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR8fH1ZCHUpMH0hCQk5ISkJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RpwlWdwR4M5y3riZVJjUTSCD/0J510nEIm61VuQOicb7e5VAD7YF+SIKGxUl4BQyEfxSiKNPdjl/C8ma2YRe1ugqLoMFm7WYE/8uLhnPgVaqqq0wnFEqml2qFNTbUTP+/QRcNMRvOZvKiNYk7wfeUHHQAV/yrGWUx5Gtdie/1lU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=aWYGu5J9V5z11TMqc+8jFIAluBajua9+OLQjTlFfPqI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173937_447065_71E38FF2 
X-CRM114-Status: GOOD (  32.74  )
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

在 2026/01/19 星期一 17:22, Alexey Charkov 写道:
> Rockchip RK3576 UFS controller uses a dedicated pin to reset the connected
> UFS device, which can operate either in a hardware controlled mode or as a
> GPIO pin.
> 

It's the only one 1.2V IO could be used on RK3576 to reset ufs devices,
except ufs refclk. So it's a dedicated pin for sure if using ufs, that's
why we put it into rk3576.dtsi.

> Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> hardware controlled mode if it uses UFS to load the next boot stage.
> 

ROM code could be specific, but the linux/loader driver is compatible，
so for the coming SoCs, with more 1.2V IO could be used, it's more
flexible to use gpio-based instead of hardware controlled(of course,
move reset pinctrl settings into board dts).

> Given that existing bindings (and rk3576.dtsi) expect a GPIO-controlled
> device reset, request the required pin config explicitly.
> 
> This doesn't appear to affect Linux, but it does affect U-boot:
> 

IIUC, it's more or less a fix for loader, more precisely U-boot here?
I'm not entirely certain about the handling here, is it standard
convention to add a fixes tag in this context?


> Before:
> => md.l 0x2604b398
> 2604b398: 00000011 00000000 00000000 00000000  ................
> < ... snip ... >
> => ufs init
> ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=[3, 3], lane[2, 2], pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate = 2
> => md.l 0x2604b398
> 2604b398: 00000011 00000000 00000000 00000000  ................
> 
> After:
> => md.l 0x2604b398
> 2604b398: 00000011 00000000 00000000 00000000  ................
> < ... snip ...>
> => ufs init
> ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=[3, 3], lane[2, 2], pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate = 2
> => md.l 0x2604b398
> 2604b398: 00000010 00000000 00000000 00000000  ................
> 
> (0x2604b398 is the respective pin mux register, with its BIT0 driving the
> mode of UFS_RST: unset = GPIO, set = hardware controlled UFS_RST)
> 
> This helps ensure that GPIO-driven device reset actually fires when the
> system requests it, not when whatever black box magic inside the UFSHC
> decides to reset the flash chip.
> 
> Cc: stable@vger.kernel.org
> Fixes: c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support for RK3576 SoC")
> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> This has originally surfaced during the review of UFS patches for U-boot
> at [1], where it was found that the UFS reset line is not requested to be
> configured as GPIO but used as such. This leads in some cases to the UFS
> driver appearing to control device resets, while in fact it is the
> internal controller logic that drives the reset line (perhaps in
> unexpected ways).
> 
> Thanks Quentin Schulz for spotting this issue.
> 
> [1] https://lore.kernel.org/u-boot/259fc358-f72b-4a24-9a71-ad90f2081335@cherry.de/
> ---
>   arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 7 +++++++
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi         | 2 +-
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> index 0b0851a7e4ea..20cfd3393a75 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> @@ -5228,6 +5228,13 @@ ufs_rst: ufs-rst {
>   				/* ufs_rstn */
>   				<4 RK_PD0 1 &pcfg_pull_none>;
>   		};
> +
> +		/omit-if-no-ref/
> +		ufs_rst_gpio: ufs-rst-gpio {
> +			rockchip,pins =
> +				/* ufs_rstn */
> +				<4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
>   	};
>   
>   	ufs_testdata0 {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 3a29c627bf6d..db610f57c845 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1865,7 +1865,7 @@ ufshc: ufshc@2a2d0000 {
>   			assigned-clock-parents = <&cru CLK_REF_MPHY_26M>;
>   			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
>   			power-domains = <&power RK3576_PD_USB>;
> -			pinctrl-0 = <&ufs_refclk>;
> +			pinctrl-0 = <&ufs_refclk &ufs_rst_gpio>;
>   			pinctrl-names = "default";
>   			resets = <&cru SRST_A_UFS_BIU>, <&cru SRST_A_UFS_SYS>,
>   				 <&cru SRST_A_UFS>, <&cru SRST_P_UFS_GRF>;
> 
> ---
> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> change-id: 20260119-ufs-rst-ffbc0ec88e07
> 
> Best regards,


