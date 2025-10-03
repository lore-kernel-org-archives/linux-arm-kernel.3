Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86379CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPeMK+aPi3Ea6pKnys1Zt7heTc1Mex9kTE3qfEXv6vc=; b=e8vQBZ0y6SjmMzsmJmrXcCTA+3
	kjxAp1p0/1PUV7FoZjcsUacNIo3APiAEEmoXt5RHp3g80ogkd/HCcAkOoTEQBnXUW5UgJoL46uZIU
	mdLOHJ4S/0QTTbAU0SX890ySG+Wpx/Wg4cSHyyxkGea+MrLOaCyMhVFHwdR6AJfdQmpu+U8+2fENJ
	3d8+efhga8pknC5gXw/9rF0TQtV6uMLz6I4RUFn0CHtsxYIDuROhWv0pLN4OCgrYbkLysS8ZgEZw5
	Zfti/3byJ6vWMbBuXayyeYUhj/ilRTk9Zcf1oRpzMzz81WKarFEDaamD5duR9DfrFu5zhcPOjThtt
	THE9J8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mjj-0000000D7bO-1hdF;
	Fri, 03 Oct 2025 20:50:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mji-0000000D7bI-0lp9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 20:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51BCE61FAF;
	Fri,  3 Oct 2025 20:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E7FC4CEF5;
	Fri,  3 Oct 2025 20:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759524640;
	bh=1p94Kd/jPrr2ZswfHfsej8PaEZcEH+oj56Meu5Y2CAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4enKN8j2eK1CuI01fDM+arTXjdajKM5HCHwySG5f+hXMd/308SPC3ZKY+m6hNJIn
	 rj1I1cP1ma/1XbdRYYoKhtL3/WAFyYK9PlKxHPvi8YXtKR3g4C8pO96B6ICtkj/3j4
	 fZVMVsb1JIlKqs9WL2yWndnGpXEJc4Ch+t7KHUiWtyPtfiLKw+3ydxhQWqaNADC4sp
	 Sri0fUxt0pBeYaMDyKbnTI25jupqutIRZAlLpvrL1JMfl2BG7ITjoava+9x+YDL/q8
	 DohfD3vWnSDAiwoa8sfKlZVsB4MAoZ+CiR4ArHYivxgxrMcuDRW+GYUMf/sOgrVKWz
	 ilHIilMvIjqkQ==
Date: Fri, 3 Oct 2025 21:50:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: aspeed: Add VIDEO reset
 definition
Message-ID: <20251003-winking-surround-d047d3c90fd3@spud>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
 <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
 <20251003-paralyze-herald-f9ef464d43e2@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GbO01kysT0Oxu35+"
Content-Disposition: inline
In-Reply-To: <20251003-paralyze-herald-f9ef464d43e2@spud>
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


--GbO01kysT0Oxu35+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2025 at 09:49:00PM +0100, Conor Dooley wrote:
> On Fri, Oct 03, 2025 at 09:58:44AM +0800, Jammy Huang wrote:
> > ASPEED clock controller provides a couple of resets. Add the define of
> > video to allow referring to it.
> >=20
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > ---
> >  v2 changes:
> >   - Update index of ASPEED_RESET_VIDEO
>=20
> Ah, so here is the next version. I don't see how this can be correct if
> 21 was correct before. Was 21 wrong?

Given the driver has mappings, I guess this is actually correct.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> > ---
> >  include/dt-bindings/clock/aspeed-clock.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bind=
ings/clock/aspeed-clock.h
> > index 06d568382c77..671e5a476eae 100644
> > --- a/include/dt-bindings/clock/aspeed-clock.h
> > +++ b/include/dt-bindings/clock/aspeed-clock.h
> > @@ -53,5 +53,6 @@
> >  #define ASPEED_RESET_AHB		8
> >  #define ASPEED_RESET_CRT1		9
> >  #define ASPEED_RESET_HACE		10
> > +#define ASPEED_RESET_VIDEO		11
> > =20
> >  #endif
> > --=20
> > 2.25.1
> >=20



--GbO01kysT0Oxu35+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOA3HAAKCRB4tDGHoIJi
0vYZAQCmKLwDhm+cuPWduwkWTnpOANP4HjnQu7jEQpxmnAp8vQEA8Hg6Ok19zE03
5dhdXT+b7zt9X10JDsEcH5iw3pm2rgU=
=lZUw
-----END PGP SIGNATURE-----

--GbO01kysT0Oxu35+--

