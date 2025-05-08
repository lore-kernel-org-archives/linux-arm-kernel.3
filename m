Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F60C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 23:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1J+RgdCCF5gSMudsRmJ3/jF8lw+iAAjVr+yWc2RHFk=; b=n3d6De5cYTzTVkRHkxUx2LbIF5
	ughkWc90ZCBRFAm10PoQlT43yCXsX1+Imt7u0jP7ql9gH9f3VChpJLyxEBREwJBBWMxzRyvSUXvOp
	AKy0maJFwogtN3Rc3MHGm/cGpuE+DqNNU+It7dz53nsi6pIOqVWB3YG4zwdnJjntp8ZkwISZJjreF
	WZtLMoLPzkSzSzeJGo/AonwUpFgKkJBcY+MVdWrjBEOvU5C3/8AcX2zOHzt1FYcmd+Hk2bVDNGEYb
	6oF16LL4PQicOBNsxjtrW3c0sNvP/U1hOhWFmJ4T4IQ81NQDHXnT92dTSTJ9bp79r5rVP24zsYhcx
	/0sjSuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDAT0-00000001xyo-2car;
	Thu, 08 May 2025 23:15:50 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDAR1-00000001xjQ-20HA;
	Thu, 08 May 2025 23:13:49 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5FCE826161;
	Fri,  9 May 2025 01:13:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQQXvO6tkiyE; Fri,  9 May 2025 01:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746746021; bh=bB3j8fb6z811VpRpryPJkvawI3jg6GwtmMHB9Bn3MXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZWSyrQuDh5IumxGz2OmiGWHrjY9wXY9i2F/vkQhU93LaOxvGebq9SifRwzhWk1e+a
	 /BCMa9uycuIDQiRlie6FoiyqeYGEwyz9K5Qb/etHmQJ8F0BBbTEd9B1eu/0GPen1Je
	 40bE/cwhkhAWP3IM91TNH0Py/q1Bqxcda/4stYi3S9RoI3C5WgLXHOfzMmdfTetG1N
	 Wthk5CuMo78/PHYXtNtaO9hu/BLtEphcec5uWxKm06pAJbgSqKT3jCSnFom9XsFgTK
	 nyMKN+AGLKfcErTnNtuBj61JeG8QwuQcjvayOpIn+mhVaj9U9RHCj48njfqS8jCbwq
	 BXHAC7VmzKmuA==
Date: Thu, 8 May 2025 23:13:25 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
Message-ID: <aB06lQs9d0q8pMU_@pie.lan>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508135307.14726-1-ziyao@disroot.org>
 <5349721.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5349721.GXAFRqVoOG@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_161347_928401_E198EAC7 
X-CRM114-Status: GOOD (  17.99  )
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

On Thu, May 08, 2025 at 07:26:13PM +0200, Heiko Stuebner wrote:
> Am Donnerstag, 8. Mai 2025, 15:53:06 Mitteleuropäische Sommerzeit schrieb Yao Zi:
> > Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> > PCIe and USB3 mode. The control logic is similar to previous variants of
> > naneng-combphy but the register layout is apperantly different from the
> > RK3568 one.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../rockchip/phy-rockchip-naneng-combphy.c    | 180 +++++++++++++++++-
> >  1 file changed, 179 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 1d1c7723584b..7c92f7ac3c7f 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -20,7 +20,40 @@
> >  #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
> >  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> >  
> > -/* COMBO PHY REG */
> > +/* RK3528 COMBO PHY REG */
> > +#define RK3528_PHYREG6				0x18
> > +#define  RK3528_PHYREG6_PLL_KVCO		GENMASK(12, 10)
> > +#define   RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> > +#define  RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> > +#define   RK3528_PHYREG6_SSC_UPWARD		0
> > +#define   RK3528_PHYREG6_SSC_DOWNWARD		1
> > +#define RK3528_PHYREG40				0x100
> > +#define  RK3528_PHYREG40_SSC_EN			BIT(20)
> > +#define  RK3528_PHYREG40_SSC_CNT		GENMASK(10, 0)
> > +#define   RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> > +#define RK3528_PHYREG42				0x108
> > +#define  RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
> > +#define   RK3528_PHYREG42_CKDRV_CLK_PLL		0
> > +#define   RK3528_PHYREG42_CKDRV_CLK_CKRCV	1
> > +#define  RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
> > +#define   RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
> > +#define  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
> > +#define   RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
> > +#define  RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
> > +#define   RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
> > +#define RK3528_PHYREG80				0x200
> > +#define  RK3528_PHYREG80_CTLE_EN		BIT(17)
> > +#define RK3528_PHYREG81				0x204
> > +#define  RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
> > +#define  RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
> > +#define   RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
> > +#define RK3528_PHYREG83				0x20c
> > +#define  RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
> > +#define   RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
> > +#define RK3528_PHYREG86				0x218
> > +#define  RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
> 
> I'd think staying with one layout would be best, so not doing this
> indentation here. Instead maybe follow the other ones like

Though seems more clear, it's reasonable to keep the style consistent.

Will change it in v2, thanks.

> #define RK3528_PHYREG6				0x18
> #define RK3528_PHYREG6_PLL_KVCO		GENMASK(12, 10)
> #define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> #define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> #define RK3528_PHYREG6_SSC_UPWARD		0
> #define RK3528_PHYREG6_SSC_DOWNWARD		1
> 
> #define RK3528_PHYREG40				0x100
> #define RK3528_PHYREG40_SSC_EN			BIT(20)
> #define RK3528_PHYREG40_SSC_CNT		GENMASK(10, 0)
> #define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> 
> ...
> 
> i.e. register + bits + blank line
> 
> other than that
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> 

Best regards,
Yao Zi

