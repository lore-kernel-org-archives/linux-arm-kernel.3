Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA54DD6AAE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUzutaoUGfk5BxYsbgUd+nfhxGnVqvYrkXneBf/GhJY=; b=nDroOVw48xyvLU74So/Yizs6fj
	EwqtqNgdZyZz4gsptiIlBbFXAk80mOvMkRtHfDJroNwRQoRfa8eQHMfgJfXi2iLMoU6ECfROEvSsW
	2oZ/VEd1NIS/VHhshrilYC+PRTsymqaxvhAt5HuWj+lhm87o+wevDLqO2n44KWDMnzQwX9IQsbJxf
	Vd/A3Kd41bZc+KidsWKQyeGM5K4ZQuEc8iuFbbY7SeH1VltzO3LbQ83Sn4QFq3PN9rk593QkbjWfp
	3E1RhwKpN+WRRSUr4wSVjFL1Fikdk2F71nP5wU17vYBgshx9uhkprVK/CO97hJOqtjnbC/y46A1U8
	FvvlI+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kbf-00000000Ucw-22Kw;
	Thu, 02 Apr 2026 16:09:19 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kbb-00000000UcQ-0j8S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:09:17 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4DC831F8005E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 16:09:02 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8E8C6B40125; Thu,  2 Apr 2026 16:09:00 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C045FB40114;
	Thu,  2 Apr 2026 16:08:58 +0000 (UTC)
Date: Thu, 2 Apr 2026 18:08:56 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for
 polarity/edge
Message-ID: <ac6UmHl86ax5eSVv@shepard>
References: <20260330224619.2620782-1-paulk@sys-base.io>
 <20260330224619.2620782-3-paulk@sys-base.io>
 <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>
 <acvllbRTHyVFTgmS@collins>
 <3b221a4997c367df716bf107a7e98ce10cd6860b.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="er1C6Ur3KOqFT3zW"
Content-Disposition: inline
In-Reply-To: <3b221a4997c367df716bf107a7e98ce10cd6860b.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_090915_564751_3FB4345A 
X-CRM114-Status: GOOD (  39.80  )
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


--er1C6Ur3KOqFT3zW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Tue 31 Mar 26, 18:04, Lucas Stach wrote:
> Am Dienstag, dem 31.03.2026 um 17:17 +0200 schrieb Paul Kocialkowski:
> > Le Tue 31 Mar 26, 11:09, Lucas Stach a =C3=A9crit :
> > > Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> > > > The lcdif v3 hardware comes with dedicated registers to set and cle=
ar
> > > > polarity bits in the CTRL register. It is unclear if there is a
> > > > difference with writing to the CTRL register directly.
> > > >=20
> > > > Follow the NXP BSP reference by using these registers, in case ther=
e is
> > > > a subtle difference caused by using them.
> > > >=20
> > > I don't really like that patch, as it blows up what is currently a
> > > single register access to three separate ones. If there is no clear
> > > benefit (as in it has been shown to fix any issue), I would prefer th=
is
> > > code to stay as-is.
> >=20
> > Well I guess the cost of a few writes vs a single one is rather
> > negligible.
> >=20
> Yea, a few writes don't really hurt. But I don't think there is a very
> good reason to set this register this way, see below.
>=20
> > I'm rather worried that there might be an undocumented
> > reason why these registers exist in the first place and why they are
> > used in the BSP.
> >=20
> > But yes this is only speculation and I could not witness any actual
> > issue. My setup (lcdif3 with hdmi) uses all positive polarities which is
> > the default state, so not a good way to check.
> >=20
> > It would be great if somebody from NXP could confirm whether this is
> > needed or not. In the meantime I guess we can drop the patch. It'll stay
> > on the list in case someone has polarity issues later :)
>=20
> The separate clr/set registers are a rather common design feat found on
> Freescale/NXP IP blocks from the MXS era. On some of those IP blocks
> _all_ registers are presented as a base/clr/set triplet in the
> registers space.

Ah yes I vaguely remember seeing this with units used in the imx6.

> As far as I can tell they are mostly useful when you
> want to set/clear individual bits from a register without having to
> remember or executing a readback of the current state.
>=20
> In cases like the one changed in this patch, where the full register
> state is set in one go, directly writing to the base register is the
> right thing to do.

Okay then if you're confident these registers are just here for
convenience purposes we can continue writing the full register value.

I'll drop this patch in the next iteration.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--er1C6Ur3KOqFT3zW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnOlJgACgkQhP3B6o/u
lQwjGBAAgtXGu1cSXbuSJ7KwVOiUjwsE8Gah6EoF7+WVg7J7uIvfKh3riBOJIhBS
yfzd2AJAH6Wl254sb0XyM78TVShcsTHJxDj8nixyiTUK3IoKeA3pqptePsmcBpp4
gLMLJA6P7f952A2e1Zydtru5y2h9J+mDiIxi2Oy04bahk10xiCC3PeYksX4brVDn
gwXiqQr3CHipcPJ3dSC4LEv5IUnrsuuVfa3q+zCUEmTWKnapjyLhUoilpZWQMW/a
nuOcWeubp2NjdWeJJqFup1F7v2hr5/mwqCzkrF8gvS2QaQGwn9zlDoaZdvieX5I5
Lu/kvYxDAcDEASaU+woFh6aBJZqOTgIHPp35386Ia2sJh88uYyO7ZDsvUvIv69tl
WaWmRqrfjEkORxEOUnXM1cj+Zs5VRIHRbGG1zVCuId0xMKCVSNoDIy0BE7deI2j8
Xilddjk6pV/0Y0NCc7aErn9CMf6DdkiAr+YxzDSxe7UzR93nXxmqXs0Yr1iP0Ben
B0aSIAG+TTxUwOou7VH1qVs1ElFe1E9EnUcJdnpVXiqij2J8kGVaFDBkyES0nuxw
CTGtSFgWCAIQWu3HBgATw1v299f0yVoFpZAzV2JxqWDhszqusdxerv5ccrj+qrA4
e+TSkc/ogX7+e7bMSZro1wozZ1endJJmc+C072FaVLBC98OWUdA=
=gk11
-----END PGP SIGNATURE-----

--er1C6Ur3KOqFT3zW--

