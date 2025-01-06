Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282AFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jLNNoS68mqUuAnGJODnzyrSE9CHkQjCVrNAZw1kJxU=; b=GoeKDHTPfDtiEoGv2FWJzYjJza
	K80xlzRBCjIr04EMeVs8U628p0B4nQxj57y9AH5HmMSc6Hdd4eTcvvqVpWYCwVeUz9X7eSsY4ZYU/
	dieLjEfSXi86eEMTAUQZgDgTJicK9y+D2rZtPg0XhH1rtbbVi96q6QbLLnPNG+9QPG00G6C+hA/z8
	G3IffXws83ipS7GtDHvCWa8C0udXbHFFCgn/jeMWlJbHJu4BOq9nunZGOQErQV0une9c1k9WITSrI
	uENiK2pYguQVCcpRznkIDC91e1xI6EAz/o1xdFPJcMowqRXkJChn14ShSimw38f5UVMiXqYQAJPJ3
	X0ixW+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjJG-00000000fEb-3aE8;
	Mon, 06 Jan 2025 09:22:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjGx-00000000efY-2pAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:19:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUjGr-0003ug-Qe; Mon, 06 Jan 2025 10:19:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUjGq-0078rL-02;
	Mon, 06 Jan 2025 10:19:36 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUjGq-000B7m-2G;
	Mon, 06 Jan 2025 10:19:36 +0100
Message-ID: <0b5eaa41745209a5a5368516d8433bb3319ca9b5.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] Re: [PATCH 1/1] phy: rockchip: naneng-combphy:
 compatible with old DT for RK3568
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: heiko@sntech.de, kishon@kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,  linux-rockchip@lists.infradead.org,
 liujianfeng1994@gmail.com, vkoul@kernel.org
Date: Mon, 06 Jan 2025 10:19:36 +0100
In-Reply-To: <20250106075015.1061630-1-amadeus@jmu.edu.cn>
References: <2b04ca7fa5135c1194c39a9fbf2d6ab5630d6ef3.camel@pengutronix.de>
	 <20250106075015.1061630-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_011943_720703_0215BE4E 
X-CRM114-Status: GOOD (  16.60  )
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

On Mo, 2025-01-06 at 15:50 +0800, Chukun Pan wrote:
> Hi,
> > > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/dri=
vers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > index a1532ef8bbe9..372f5c07b5bd 100644
> > > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > @@ -325,6 +325,10 @@ static int rockchip_combphy_parse_dt(struct devi=
ce *dev, struct rockchip_combphy
> > >  	priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-ref=
clk");
> > > =20
> > >  	priv->phy_rst =3D devm_reset_control_get(dev, "phy");
> >=20
> > This should be devm_reset_control_get_exclusive().
>=20
> I will change this.
>=20
> > > +	/* fallback to old behaviour */
> > > +	if (IS_ERR(ERR_PTR(priv->phy_rst)))
> >=20
> > Drop superfluous ERR_PTR().
>=20
> I think it would be better if I changed it to this?
>=20
> if (PTR_ERR(priv->phy_rst) =3D=3D -ENOENT)
> 	priv->phy_rst =3D devm_reset_control_array_get_exclusive(dev);

I agree, otherwise this would ignore a broken reset-names property in
the device tree. When the resets property is broken, the fallback would
fail anyway.

regards
Philipp

