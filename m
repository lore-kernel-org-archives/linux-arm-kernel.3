Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B307EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQPhfD23YTFu2k8PG7PzToLjH9H9SzaXg3NW46Iyzwk=; b=yr0bbaE4R1l97h4ZiUCBsfLnHG
	ESFSD9GWHeAyICt/rc4QtN7+UVG+5dGS22a53+Ef+SgqKCmJ/KXCsgMHz+vB4efE0t4Ju211bUilQ
	0aa26K5QHAyzGkNF80M7T57WSgH1gzyO2vfQDxl9KLcTos8Kk26Vjxr4VszmOC9Ko8aybiDvM8uEX
	3Nw/hg8OVO6GwiU0yYrnTv6ySRHaSKoY/bDfuwtOSBw2lTu0Ov2fsW1W+wUXpYEMs1OaQOyxSIzgw
	GzKMphjxLprgCD4Bb+75zuLtiepkvZdcg4Dqd5vXH/pS6yIxX+SxxXytxJLnZBs/ZzWPkMZ1b6uov
	30l6VGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcH9-00000002Mjm-0Ug4;
	Fri, 06 Dec 2024 17:37:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcG6-00000002Mdw-2AJQ;
	Fri, 06 Dec 2024 17:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jQPhfD23YTFu2k8PG7PzToLjH9H9SzaXg3NW46Iyzwk=; b=OAsSaXPmNKWbDvZAt2FfJrx+NN
	INUzGPq8N1RuCnmRfnPcnrecc3H2wSuYkENTEjfdewM3VyK/Ta145Y7zhhTcdaWfHXXpYcz4er1Ol
	mcWZFZtppOyfOt+L0KXOI9MLHQntSMP38xR/IOMzod27BqxmTJ3dGavZmQorAtPvY31bRmcC7eR2i
	r6WrGUjO46+7E6vTrc4oLURq4lgF7mj56R4Z4997/z2/UrS+zpBcfqAVZISIOszZRRfKMfowKEBET
	Uc3qFkGmmBCuRfF+DCzrOwDMWB+ho1+Id9Ey2E/MGzXC+x4YZV9DlSG1LhENOUcXRQkxhZ1hDSyHj
	9KxtPopQ==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJcG1-00032U-VI; Fri, 06 Dec 2024 18:36:50 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/2] phy: phy-rockchip-samsung-hdptx: annotate regmap
 register-callback
Date: Fri, 06 Dec 2024 18:36:49 +0100
Message-ID: <2287157.Dhsi8hcfAM@diego>
In-Reply-To: <e6172204-2f3f-4a9c-892c-be85d19ad031@collabora.com>
References: <20241206103401.1780416-1-heiko@sntech.de>
 <20241206103401.1780416-2-heiko@sntech.de>
 <e6172204-2f3f-4a9c-892c-be85d19ad031@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_093654_576853_71191BB4 
X-CRM114-Status: GOOD (  19.74  )
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

Am Freitag, 6. Dezember 2024, 12:18:56 CET schrieb Cristian Ciocaltea:
> On 12/6/24 12:34 PM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > The variant of the driver in the vendor-tree contained those handy
> > comments in the regmap register callback. Having the different ranges
> > describe what they are looks helpful.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > index 4ced1479e2dc..c5c64c209e96 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > @@ -766,13 +766,13 @@ static struct tx_drv_ctrl tx_drv_ctrl_hbr2[4][4] = {
> >  static bool rk_hdptx_phy_is_rw_reg(struct device *dev, unsigned int reg)
> >  {
> >  	switch (reg) {
> > -	case 0x0000 ... 0x029c:
> > -	case 0x0400 ... 0x04a4:
> > -	case 0x0800 ... 0x08a4:
> > -	case 0x0c00 ... 0x0cb4:
> > -	case 0x1000 ... 0x10b4:
> > -	case 0x1400 ... 0x14b4:
> > -	case 0x1800 ... 0x18b4:
> > +	case 0x0000 ... 0x029c: /* CMN Register */
> > +	case 0x0400 ... 0x04a4: /* Sideband Register */
> > +	case 0x0800 ... 0x08a4: /* Lane Top Register */
> > +	case 0x0c00 ... 0x0cb4: /* Lane 0 Register */
> > +	case 0x1000 ... 0x10b4: /* Lane 1 Register */
> > +	case 0x1400 ... 0x14b4: /* Lane 2 Register */
> > +	case 0x1800 ... 0x18b4: /* Lane 3 Register */
> >  		return true;
> >  	}
> >  
> 
> Nice finding!  The HDMI variant of the driver which I used as an
> implementation reference (i.e. phy-rockchip-samsung-hdptx-hdmi.c)
> doesn't provide these comments.

yep, those comments were in the displayport variant of the phy-driver ;-) .
I don't really understand why the vendor tree contains 2 separate drivers
written by two different people, but at least it looks like we're getting
one driver in mainline, thanks to Damon's work :-)




