Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVnkYh3O1OzlMTu/ZkpCOz561BiZAmrXwxadUU5mpeI=; b=S8LwDLWwS3mlzgPlii/Y0Q29y0
	4Ssr3EnYpzj9QpH28U0fWR/UEk+P0JU2uy8rXPEo2dY5m4RENQpADgPP2fXxgON2P1f1p6a3Kq+hg
	GC2I6hF1M2CWRQO2yrm5oSejJhIYA/2MJbVQyb5T5olpk5U/YfW5zSGyqFTUf0DK7FuZU2QPCeWy9
	fquaYvGiV3dzV85t5FnES6DqKxaUTM7G3Yg4yCan+P3LxhihLsCtPrZz61+OCqBgDTvF5enjjrST1
	VwoXbXO1wDHjtyt6m298linQLK2/QUKRKn9SsfRXd1umF0jY6y2x0mEV2EA4qRQiL/7kN3hhQAaiU
	ArLsDedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaxz-00000005JRp-0Tzh;
	Wed, 23 Jul 2025 15:01:11 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaU6-00000005Cnm-2os0;
	Wed, 23 Jul 2025 14:30:20 +0000
Received: from localhost.localdomain (unknown [119.122.214.181])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d03a2599;
	Wed, 23 Jul 2025 22:30:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	vkoul@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 07/11] arm64: dts: rockchip: Add USB nodes for RK3528
Date: Wed, 23 Jul 2025 22:30:06 +0800
Message-Id: <20250723143006.1083489-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250723122323.2344916-8-jonas@kwiboo.se>
References: <20250723122323.2344916-8-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaThpCVh1JGRlKGU0dSx5LTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VKQ0pZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-HM-Tid: 0a9837b12a7003a2kunm2a36e8dcff846
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P006STo4ODEpCDEODBk3HUIt
	CQhPChpVSlVKTE5ISUNKS0pOTkhMVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUpDSllXWQgBWUFJTENJNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_073018_910663_F6B00236 
X-CRM114-Status: GOOD (  11.07  )
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

Hi,

> The DWC3 node does not contain any default phys because out of current
> and pending supported boards only one board, ROCK 2A, can use USB3.
> Remaining boards use the Naneng Combo PHY for PCIe instead of USB3.

I have other RK3528 boards with USB3 and can test this in a few days.
Or do you think that usb3-phy should be added in the dts of the device?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 85bc3f5aa2c7..3e51a3f51e05 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -243,6 +243,29 @@ soc {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> 
> +		usb_host0_xhci: usb@fe500000 {
> +			compatible = "rockchip,rk3528-dwc3", "snps,dwc3";
> +			reg = <0x0 0xfe500000 0x0 0x400000>;
> +			clocks = <&cru CLK_REF_USB3OTG>,
> +				 <&cru CLK_SUSPEND_USB3OTG>,
> +				 <&cru ACLK_USB3OTG>;
> +			clock-names = "ref_clk", "suspend_clk", "bus_clk";
> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&power RK3528_PD_VPU>;
> +			resets = <&cru SRST_A_USB3OTG>;
> +			dr_mode = "otg";
> +			phy_type = "utmi_wide";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +			snps,dis-u2-freeclk-exists-quirk;
> +			snps,parkmode-disable-hs-quirk;
> +			snps,parkmode-disable-ss-quirk;

Maybe "snps,dis_u2_susphy_quirk" is needed?
Downstream kernels add this on USB2.0 only devices:
https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3528-demo.dtsi#L474

> +		u2phy: usb2phy@ffdf0000 {
> +			u2phy_otg: otg-port {
> +			u2phy_host: host-port {

I think it would be better to call it usb2phy, usb2phy0_otg and usb2phy0_host?
In this way, we can put these USB nodes close together in the device's dts.

--
2.25.1



