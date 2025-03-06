Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFCBC28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVEpok7Jq/pR9D4OxI8t9lorKkgNneTeJS5BiycIbU4=; b=iU7Nkvb1V3JwYXa08VS3NRQnX9
	xq1nfu2KgeZ84k1UtS3i1J0HLNfkGnKQadpkta/U36j1llrM0LbYpD68Wn2n/pvyd8uiFPdxCLSXu
	fIq+GLqDDv4pHT/sB/gS6vX+r/djbaDm6mS2CQryBxRE0zpwshLWh6h+R2KoETTnLYz8w4eHeMQJR
	wwjg4UdeP3K3wzdU7mtA71i7S0HooPOqL1Z9s2ISKPmB9fRITAnD+OFIPC7Q9XpyPRgt+Bw4WLhCS
	+Sch3/bMrqiBe3zOs3x5z3TvdWV25Dl6XnTmMdkdbGRt6JlpHJiiMCl8rvF0VCCsg/3DW0iB57VG+
	v5zqSwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEMN-0000000BYwE-0R7U;
	Thu, 06 Mar 2025 16:46:11 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEKi-0000000BYYC-32BO;
	Thu, 06 Mar 2025 16:44:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BD6D02024D;
	Thu,  6 Mar 2025 17:44:23 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSLASKqzoBGZ; Thu,  6 Mar 2025 17:44:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741279459; bh=7IP4WYiQ3uqZxjps9WZ0ItIBn+105bQ4pKd1dSZCV54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jf8ScI9jkEuLiR/sOtykcPvGSgXJ8+inW3qRRiIdlp/sxGRUyevCKvAsAZcbAFGQR
	 BbU895Oxz+Lxg7MULJW1vdE+AzEoAAZPVRbw0L8biaaaWthW7Q6d0mPfl2jkqMAoPN
	 8FT8KXjH//vrtkR4LGJWJwoR40wQ9QSmTkfgGGaHENKCm57Wua+d1ShJBLnKS/cDOz
	 5Vg3S5nSqtEkWFKQgzirDV2umLYIP9/4kICm/iH4CxucZsn/laSVkvJ8K3MntZMC+C
	 PZCWaAHnWlBSYJnsdfNBnjcvkkF4nd2eO+uRjVavp4dU5/auz0LwTgKT22+MYP05hp
	 f1P9lVdmK7Zhg==
Date: Thu, 6 Mar 2025 16:43:54 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com, devicetree@vger.kernel.org,
	heiko@sntech.de, jonas@kwiboo.se, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers
 for RK3528
Message-ID: <Z8nPjjbZvpRJ2R5B@pie.lan>
References: <20250305194612.47171-1-ziyao@disroot.org>
 <20250306140009.384469-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140009.384469-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_084429_167148_55C07EFF 
X-CRM114-Status: GOOD (  13.23  )
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

On Thu, Mar 06, 2025 at 10:00:09PM +0800, Chukun Pan wrote:
> Hi,
> 
> > +		sdio0: mmc@ffc10000 {
> > +			compatible = "rockchip,rk3528-dw-mshc",
> > +				     "rockchip,rk3288-dw-mshc";
> > +			reg = <0x0 0xffc10000 0x0 0x4000>;
> > +			clocks = <&cru HCLK_SDIO0>,
> > +				 <&cru CCLK_SRC_SDIO0>,
> > +				 <&cru SCLK_SDIO0_DRV>,
> > +				 <&cru SCLK_SDIO0_SAMPLE>;
> > +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> > +			fifo-depth = <0x100>;
> > +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency = <150000000>;
> > +			pinctrl-names = "default";
> > +			pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>,
> > +				    <&sdio0_det>, <&sdio0_pwren>;
> 
> The sdio module is usually "non-removable", no need det,
> and pwren may be other gpio (use mmc-pwrseq). So it should
> be `pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>;`

This doesn't affect the fact that these two pins are assigned as
functional pins for SDIO0, as pointed out by the datasheet[1].

But with more digging, I found the reference design[2] of Rockchip
actually uses the two pins as normal GPIOs. This is more obvious in
downstream devicetree of an EVB[3]. Most of the existing boards (Radxa
2A, ArmSOM Sige 1) follow the reference design.

For me, it's kind of surprising that the SDIO IP functions with two
functional pins assigned as different modes. I'm not sure whether we
should apply pin configuration for these two pins in the SoC devicetree.
Jonas, what do you think about it?

> > +			resets = <&cru SRST_H_SDIO0>;
> > +			reset-names = "reset";
> > +			status = "disabled";
> > +		};
> > +
> > +		sdio1: mmc@ffc20000 {
> > +			compatible = "rockchip,rk3528-dw-mshc",
> > +				     "rockchip,rk3288-dw-mshc";
> > +			reg = <0x0 0xffc20000 0x0 0x4000>;
> > +			clocks = <&cru HCLK_SDIO1>,
> > +				 <&cru CCLK_SRC_SDIO1>,
> > +				 <&cru SCLK_SDIO1_DRV>,
> > +				 <&cru SCLK_SDIO1_SAMPLE>;
> > +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> > +			fifo-depth = <0x100>;
> > +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency = <150000000>;
> > +			pinctrl-names = "default";
> > +			pinctrl-0 = <&sdio1_bus4>, <&sdio1_clk>, <&sdio1_cmd>,
> > +				    <&sdio1_det>, <&sdio1_pwren>;
> 
> Same here.
> 
> > +			resets = <&cru SRST_H_SDIO1>;
> > +			reset-names = "reset";
> > +			status = "disabled";
> > +		};
> 
> Thanks,
> Chukun
> 
> -- 
> 2.25.1
> 

Best regards,
Yao Zi

[1]: https://github.com/DeciHD/rockchip_docs/blob/main/rk3528/Rockchip%C2%A0RK3528%C2%A0Datasheet%C2%A0V1.0-20230522.pdf
[2]: https://github.com/DeciHD/rockchip_docs/blob/main/rk3528/RK3528_BOX_REF_V10_20230525.pdf
[3]: https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3528-evb1-ddr4-v10.dtsi#L128

