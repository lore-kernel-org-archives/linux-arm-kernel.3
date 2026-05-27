Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1579CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+eyeYWDj7Jk/z76utxzNR9wXCHzRmse/hMsH5lp/hw=; b=kd5WSlLjuQ4L3Si5h9VUpwFasV
	TcL2l9IxegKQx1oWmS4f+8rKC4U5Qjg7NDHbBMOIjpaeEf64WuvZ4KBQLWywBhBuWx6MuJv8F3T0N
	kJBhIORD4yrWFhr3ZjoshERTFYjtlpQpJOkaFLUe2jx81WIKaugXgNJenKPEbGaL13xjJ7StMAEPk
	fqySNEUFfnRbYowgy0zYtSohHk76mPBkgZLn4W2qLeDm5Makj2m1lS9/oSB3AvGwP2HnIuP7YUe93
	YmTouffVFH6ETvUsJe8tP3Mz0kg5HS3Lxh97rGZkfXQt0jtah50erJvhw/yuSkdtGYFtGOl8k3etQ
	6bqPi0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBmX-00000003x7k-1Bvs;
	Wed, 27 May 2026 10:46:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBmT-00000003x6z-3rnt;
	Wed, 27 May 2026 10:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N+eyeYWDj7Jk/z76utxzNR9wXCHzRmse/hMsH5lp/hw=; b=ufIdeOKBXO2UAgKnFHGKZVZOce
	BJHUtPuyGZfXt6aUnuQy1ssUjgXdJa2ckiwKiN58DiKNvp8gDD0JOcmqq5+Gs4Aie0QdeOf137K3+
	KnY62JZM4bgs/dyxOeCiGnsoAtnFr8n/FWF8Y+tqH+JmFzzgocUi7+LhjBduBpGp9fxcLo9YgJvpU
	Uxzlz+NnYEBpRANaRal/kDq2mBRPaAafFK0VP1hSejkItP/2fvOe10jE5gE6RindxPRDuTiFIRDL0
	SnbGVwynBOV197K9D2tXyHCNkN5birrETu23YUhMOi1qsAk0QTqFt6a5eiSyrESdtPqlN0bxh5p5W
	l9QIjzBA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se
Subject: Re: [PATCH v2 4/5] phy: rockchip: inno-usb2: Add clkout_ctl_phy support
Date: Wed, 27 May 2026 12:46:29 +0200
Message-ID: <4449069.vzjCzTo3RI@phil>
In-Reply-To: <agX1obJdYdNhnvnN@vaman>
References: <20260505170410.3265305-1-heiko@sntech.de>
 <20260505170410.3265305-5-heiko@sntech.de> <agX1obJdYdNhnvnN@vaman>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_034634_021263_E5D9A407 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Vinod,

Am Donnerstag, 14. Mai 2026, 18:17:37 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Vinod Koul:
> On 05-05-26, 19:04, Heiko Stuebner wrote:
> > From: Jonas Karlman <jonas@kwiboo.se>
> >=20
> > The 480m clk is controlled using regs in the PHY address space and not
> > in the USB GRF address space on e.g. RK3528 and RK3506.
> >=20
> > Add a clkout_ctl_phy usb2phy_reg to handle enable/disable of the 480m
> > clk on these SoCs.
> >=20
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 47 +++++++++++++++----
> >  1 file changed, 38 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/ph=
y/rockchip/phy-rockchip-inno-usb2.c
> > index 7cec45192393..d8879fcd4291 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > @@ -179,6 +179,7 @@ struct rockchip_usb2phy_cfg {
> >  	unsigned int	num_ports;
> >  	int (*phy_tuning)(struct rockchip_usb2phy *rphy);
> >  	struct usb2phy_reg	clkout_ctl;
> > +	struct usb2phy_reg	clkout_ctl_phy;
>=20
> This gives a kernel-doc warning. I have applied please send fix for this

Just if someone reads that in the future, I sent a fix for that last week i=
n:
https://lore.kernel.org/lkml/20260520102859.1357411-1-heiko@sntech.de/

Heiko




