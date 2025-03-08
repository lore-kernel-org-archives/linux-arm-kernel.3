Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B9FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYiraGWlPW4DWJ0Nap4om7B1ISIymguW/oJ4HMGmsB4=; b=2q0Elg5F4XqhSI/A06YMLJJYFk
	sZhRfioqoX+wIPpsAoJZYPx/suTd68Ox+U7HkHmyvspneU89Mgvh2s4iy0M/eby5rP0woDsOuEtGQ
	Ak5XObiQN21TuTcVyZxg6s60rcqbp3X+d7vN4WOXDSoJ8o/FyTX2XDGK20SAaS0u5eNaAU95zBEHY
	VvVcc/9wRBEfCuP6MiI83JQ5LrWje0vIxXFoVZQ+utAR2w99o8xcqRAgbHaNcfoZrMaD36asmzeBu
	c8e8TFiLkRGl4xxy9zZXNhKJIUF4qB2+JwH8paBUSSaJYe5ssc4wfLNTcBclzGFLR6dxpK6QBI2d/
	6E702/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tquqa-0000000Ghh2-100t;
	Sat, 08 Mar 2025 14:08:12 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tquow-0000000GhaG-0t1R;
	Sat, 08 Mar 2025 14:06:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 211B825D93;
	Sat,  8 Mar 2025 15:06:22 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id preILQABPQVZ; Sat,  8 Mar 2025 15:06:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741442777; bh=kGemAZ9EVDuCpSfW33snc8SJJJ1dseQQAUsecXVAtcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ng0E9bDJucpkyJhzo+6yIzH66iSp0oNsv9ZSg44P/KyxctIGSs9wnhL2rp+IwWsRZ
	 WjkB0pK7LqQxgnt7AgzYku0wiM3bXJIs40NPXJvOyvQd9+0WoeM3Y9FZM7T/foMIJ1
	 RnQGVuXdJpeu5jQULN0gIixh9PFqdOkgC8Nm1Jdd4DTEZ4kPaJZlubQLcSnmRatsXp
	 ZIrM+UHeucNDRvoEqTN27oS7sSEfpJzO6S2j5somCX80RMpci0UnF1vU7StNghauPr
	 4qE7T4/kcmEA2adZg5y0BeH+MtD9exyyXQrYwI3yVigIBd5vToyuAce+4a4WxVmie8
	 LqmTuoIAN7Yvg==
Date: Sat, 8 Mar 2025 14:05:53 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers
 for RK3528
Message-ID: <Z8xOwbfNqBfkRAi6@pie>
References: <20250305194217.47052-1-ziyao@disroot.org>
 <20250305194612.47171-1-ziyao@disroot.org>
 <56181131-3e48-4c76-87c7-2388a9964727@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56181131-3e48-4c76-87c7-2388a9964727@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_060630_664877_AD6BFFD6 
X-CRM114-Status: GOOD (  17.53  )
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

On Sat, Mar 08, 2025 at 12:22:48AM +0100, Jonas Karlman wrote:
> Hi Yao Zi,
> 
> On 2025-03-05 20:46, Yao Zi wrote:
> > RK3528 features two SDIO controllers and one SD/MMC controller, describe
> > them in devicetree. Since their sample and drive clocks are located in
> > the VO and VPU GRFs, corresponding syscons are added to make these
> > clocks available.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 70 ++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > index d3e2a64ff2d5..363023314e9c 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > @@ -130,6 +130,16 @@ gic: interrupt-controller@fed01000 {
> >  			#interrupt-cells = <3>;
> >  		};
> >  
> > +		vpu_grf: syscon@ff340000 {
> > +			compatible = "rockchip,rk3528-vpu-grf", "syscon";
> > +			reg = <0x0 0xff340000 0x0 0x8000>;
> > +		};
> > +
> > +		vo_grf: syscon@ff360000 {
> > +			compatible = "rockchip,rk3528-vo-grf", "syscon";
> > +			reg = <0x0 0xff360000 0x0 0x10000>;
> > +		};
> > +
> >  		cru: clock-controller@ff4a0000 {
> >  			compatible = "rockchip,rk3528-cru";
> >  			reg = <0x0 0xff4a0000 0x0 0x30000>;
> > @@ -274,6 +284,66 @@ saradc: adc@ffae0000 {
> >  			resets = <&cru SRST_P_SARADC>;
> >  			reset-names = "saradc-apb";
> >  			#io-channel-cells = <1>;
> > +		};
> 
> Look like this patch accidentally drops status = "disabled" from the
> adc@ffae0000 node.

It's a mistake during rebasing, I'll fix it in v3.

> Regards,
> Jonas

Thanks,
Yao Zi

