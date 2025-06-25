Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20621C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMubMqt0B41uAlKb5aE5NWQ2OgKtj3U7wBtBPllI5xE=; b=ytAlnIGIeg27jq21magWcTEZpv
	CNvi7yIduuvjYsSw0siELdgXEOwO7BLpKnD1t9mw84ylKWwOtwzBgOdxjZiExaaltNhAyxEEb8Hjo
	v75niipmXvg51/IFnGr2RMaCmk8J47G1zzY7cOupdbWM1DmKOrz45FtHbDeABk3pys3lKOwout+J+
	SbIDl1/b7yEwpWqFO5PdXhvXu686LYNlo6Swn6N92KuUCeN4SCPCRnGSJFPUpXpEIfjS9VKbKTM3l
	FFCPZ71bo7m8/dRq9580jkRNSmts+9djZzi13RGP8KlBuXJovJiCx2Hs1MorNrMPDEeIedESO+SJ3
	0NqNw9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQAW-00000008o56-0Bns;
	Wed, 25 Jun 2025 13:28:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUN6L-00000008H4t-29mz;
	Wed, 25 Jun 2025 10:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pMubMqt0B41uAlKb5aE5NWQ2OgKtj3U7wBtBPllI5xE=; b=iyzEXZ1fynHPYUJ3w+5Xxl5R+K
	XESQsOmXXEN8WQur1e1fxnpoymdMVjOa32PY8fjUsVZvMU3zDU0T4RZHzg0C1WB82PiuKHAx3mCwh
	y0S31QNoJyCAn7/sI66H07lU2JDFJ9YCqHZ1PH3EyxzbGsmV6WBGiQ1ASOk9a5rDltrrXddU7I/YR
	fpLkYzoWSibNtGfOyVeyPMEQmM1gOTYVecsE88rHsrLzy7kgKGh9LXwmSDe2Cj9omm9WQqflSdwzF
	dPpAJCNX3nibmsT3bCMrLwGtvP2JlPkiS4sUsAzd900GoUKmpeKUwnFBtPQoOSgd6EGC3WC0/Q/46
	6KrlZw2g==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUN6I-00000005m4s-1TRF;
	Wed, 25 Jun 2025 10:11:32 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5AA431F0003D;
	Wed, 25 Jun 2025 10:11:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 34ED4AC7B27; Wed, 25 Jun 2025 10:11:12 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id DA68DAC7B19;
	Wed, 25 Jun 2025 10:11:09 +0000 (UTC)
Date: Wed, 25 Jun 2025 12:11:07 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
Message-ID: <aFvLO6GUY6NezkcF@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
 <aFu3fAMa8KPwjPbX@shepard>
 <9c3ea5fb-a045-46bd-9753-26ffa67fe1bc@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hh+oSgryr9OFE2vD"
Content-Disposition: inline
In-Reply-To: <9c3ea5fb-a045-46bd-9753-26ffa67fe1bc@linumiz.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_111130_661504_58D55B12 
X-CRM114-Status: GOOD (  19.90  )
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


--hh+oSgryr9OFE2vD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 25 Jun 25, 15:06, Parthiban wrote:
>=20
> On 6/25/25 2:16 PM, Paul Kocialkowski wrote:
> > Hi and thanks for your work!
> >=20
> > On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> >> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> >> data 3 lines and lvds1 pins are missed, add them.
> > Would it also make sense to submit device-tree pin definitions here?
>=20
> this patch is already merged.=20
> git show --stat cef4f1b5ba99a964cd6dd248bb373520573c972f
> commit cef4f1b5ba99a964cd6dd248bb373520573c972f
> Author: Parthiban Nallathambi <parthiban@linumiz.com>
> Date:   Fri Dec 27 16:37:57 2024 +0530
>=20
>     pinctrl: sunxi: add missed lvds pins for a100/a133
>    =20
>     lvds, lcd, dsi all shares the same GPIO D bank and lvds0
>     data 3 lines and lvds1 pins are missed, add them.
>    =20
>     Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
>     Link: https://lore.kernel.org/20241227-a133-display-support-v1-10-13b=
52f71fb14@linumiz.com
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> Do you mean the consumer/board devicetree changes?

I mean the pin definitions for lvds in the sun50i-a100.dtsi device-tree.

But maybe you wanted to submit those after the bindings/driver changes are
merged?

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--hh+oSgryr9OFE2vD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbyzsACgkQhP3B6o/u
lQyMGQ//f2vAQYHKFknpEFa9G97bwQAoBFvWmQSD1wmDY326lLbX+9Y05O/nICdQ
datMQbAA6GBDyn///enJBKK2AURU+BrqhBgKbsbBFFSRcfxgqOrBRts1XgjbAA4J
jdl51KH2mhO3rL83JU/DhlwedeW2q/JeZrlFxVV/DL94tc3WRVFHINq3XipGHfk/
l2VdJ9XHwzIz1it4ZG/ypB5reTIvdskJQCjGqqEwpLy2BkYsVvVIW4ASYCWR76A4
CJfYGi3RTEZxDTmiLpLrUiezKLT2y0sZybhIDlFYZG8aVAoMvmDYZafpsotsRD+E
jv9Et5dsl/In0DiCJLdmNGgwdmVgQcn/Ln7D5Ad5hqUqHx5tteJ5Vc+XWVVXTVEh
ngvtcEvY3PornqJ/yAmYqz8UZ0+ZPMjLUM5cBrO0kiVYU6//99FOZRLba7VpDrqt
PpwHreipKusGGSgKjwNU0JBszR61dT9eEBF4CnyTJmsnH/CYgXk3ToqbwYrWInUD
rmClxHtOUwQ+BUAz3GL7YszrAzifLjqmKTFtIydFEIi/xWI/7LDeImEjAjHtk0Vk
eGDxBau9WCqk8IUf7kneF6UcCD2M+9rs8k+2p8rvO6gQOv6I7Ioq1sPfqmWSyA5v
uVQSDI7Amj0SKgFZmKuXry4Qw/EWu+BNGf3Xii0csbO0ZAuxVos=
=Yy5s
-----END PGP SIGNATURE-----

--hh+oSgryr9OFE2vD--

