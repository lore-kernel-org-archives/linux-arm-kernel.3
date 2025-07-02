Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832AEC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk7dR2itmICJrASu1wQYTL0JAgzGuSjOR7cDtLlcqMI=; b=YNRYflOY0cNhT8VrQ7XKoxPThK
	PFbv5l5RXFDzCmzqbto8/sqLl5Gszb2HZfdrdcLPykSRiW3i2jXSKMr4HVOlHxHU2teivE+9Umyyw
	ap0/Wkmr0FfNwx7/rzwInO0SwwOcHnp+fN8bRPsFYC4oFlWIP4od5I1Yjpf8qbx039XgEHEei+kwI
	RRwgVQIQq2By4zS0E+HcK5PGotoOjDyZu8PgBKKE3oQZFbQgcd8IdCJcg7hbz0HL42dFaXUWXQKGC
	/pALXIjFIIb6nl2SC9leGb0Us3RY7SaxrKqj1m/SXw8bYZRulnf8nGncYDZvJcFWSl7fJzyd7BOhb
	69ReghXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqR-00000008LZ4-1JfY;
	Wed, 02 Jul 2025 12:45:47 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwNd-00000008H3u-177V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:16:03 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6E9171F00051
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 12:15:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 89387AC9A6E; Wed,  2 Jul 2025 12:15:51 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B1D2AAC9A5F;
	Wed,  2 Jul 2025 12:15:48 +0000 (UTC)
Date: Wed, 2 Jul 2025 14:15:46 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Message-ID: <aGUi8ot1-0WaReyp@collins>
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-6-paulk@sys-base.io>
 <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VVuCxM2QjPKpSc9g"
Content-Disposition: inline
In-Reply-To: <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_051601_617149_28389F54 
X-CRM114-Status: GOOD (  35.03  )
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


--VVuCxM2QjPKpSc9g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Le Wed 02 Jul 25, 13:36, Maxime Ripard a =C3=A9crit :
> On Tue, Jul 01, 2025 at 10:11:24PM +0200, Paul Kocialkowski wrote:
> > The DE mixer clock is currently set to run at 150 MHz, while the
> > Allwinner BSP configures it at 300 MHz and other platforms typically
> > run at 297 MHz.
> >=20
> > 150 MHz appears to be enough given the restricted graphics capabilities
> > of the SoC (with a work area of only 1024x1024). However it typically
> > causes the DE clock to be parented to the periph0 pll instead of the
> > video PLL.
> >=20
> > While this should generally not be a concern, it appears (based on
> > experimentation) that both the DE and TCON clocks need to be parented
> > to the same PLL for these units to work. While we cannot represent this
> > constraint in the clock driver, it appears that the TCON clock will
> > often get parented to the video pll (typically running at 297 MHz for
> > the CSI units needs), for instance when driving displays with a 33 MHz
> > pixel clock (33 being a natural divider of 297).
> >=20
> > Running the DE clock at 297 MHz will typically result in parenting to
> > the video pll instead of the periph0 pll, thus making the display
> > output functional.
> >=20
> > This is all a bit fragile but it solves the issue with displays running
> > at 33 Mhz and brings V3s to use the same frequency as other platforms,
> > making support more unified.
>=20
> It's beyond fragile, and doesn't have anything to do with the DRM driver.
>=20
> You should set up the clock tree properly in the clock driver, and then
> add NO_REPARENT to the DE clock to make sure it stays that way.

Thanks for the suggestion! I wasn't aware there was a flag to avoid
reparenting, sounds like the most reasonable way to solve this issue then.

I'll send another iteration reworking the clock tree then.

> And then, you can change the clock rate if you want to, but at least you
> don't set a rate and hope that the side effects work your way, and won't
> happen again.

We might as well still change it. To be honest I don't really see why it was
set to 150 MHz in the first place.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--VVuCxM2QjPKpSc9g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhlIvIACgkQhP3B6o/u
lQyH5w/+JIxMLNpE+lve3HbxC4wqX2HIz1pGfWw1ZFhfrKgJmKhN4IiqfmZpGnPe
mC+U8F1T4hnqbmEc57eIo6Q1C3hEncq7EyY3oN0TJj7N5MM81Z/eVP1JUZ7XHq3V
q4Xy9b8/Zm5gDakbUe8ZZD4mLaugMafHA0lQK7OmKd75MeqP+OV68OPpuXCTCQnA
pVL7vDw19P0paH9sIUOe0NQ0SWYbFYZExVsOxoQnfT1BHz6ltM4bCyTdRNKDcakp
j56Yd0hPMnlV0khThy0+3tDenkUjPgiznqTzC6pWzhtysXvT4XRQOWQGXaN9C/w5
BrPbm79yFJ4UOZE0YBIcQNEvpNLP/7ApnMstKs2B4PlU1B6zJeYRWuPWmj7ZJIiO
H4ckfdJN0+KMtWsm/qOGQ95PgfE2ZjZX17NRq742azRJ/i+YvdjLQQS/BkflehU6
PUKcSgVecGQU8FXeU3da6ZMViNjy8xalVFceDaoLOMMruRA7dY1hJnRhawQIGJd1
1soYIRsyZq3y9F+Ij05BxC8TVp5rarfwlwDGdA/53ghGd0/uTikAMzsxpY+HKlCi
z+JXYN6BqGkUQ7YnqtRU0NoDcKwDWjiinOGaypzT9ULFaPhglmUkHfofqP7R1S7w
NCbV9amc9uAOOaFNSLb+zIYpYIPr0UPaQ8xCkwJJ1cPHGTUPQgQ=
=z/Ou
-----END PGP SIGNATURE-----

--VVuCxM2QjPKpSc9g--

