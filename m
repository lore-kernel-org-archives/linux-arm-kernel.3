Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A75FCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 23:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6Mjuz44jhVXyauOhN+61cS7re30V+H///vAdi2DPkI=; b=hgOzoTzAN7SelUcGusT0KqSRmt
	cSJzGTRB2ivJnZgcZyPzQqZmTT0OtbIf7fBh9jaxnuCBWspNUGSs6ilhOcs5cFawMqnyhv06Y0hvt
	hzbBQG1Xte6JIu+VbhfpIFlGW1LaRRknK9b4ibkpPdlwM2bIKdqk8kUqbdaXv20L/3XTXsYXljrx3
	VM140uHsm8YWhP2pqEzATwtG9oW6+8zSXM2wbPY3B0eiFeFttNYGAtwEH01vo5a3IyAMsFOE0W1hR
	v0slaGviQj66KQaZnrNap+LR4+MKILhKKRIjnykjWYeLr+jM+CChtRwm5/lZ9eehPFb930kLYjI8t
	b3n2D1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJl-0000000Dw13-0xlC;
	Tue, 02 Jun 2026 23:14:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJj-0000000Dw0G-3nr1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 23:14:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECE4F601E7;
	Tue,  2 Jun 2026 23:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2091F00893;
	Tue,  2 Jun 2026 23:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780442078;
	bh=m6Mjuz44jhVXyauOhN+61cS7re30V+H///vAdi2DPkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fL8Y+yVX9SmkbBoY+D9EPXdESehFBu0phiVB525xdhVBGSQ/T/Ylmm4OVlT7X1M7t
	 uZDXWLmoWaKR9JNVPUji+tceqM0xf9WNILK/UI3dQIzEw6Lg8Qn78Ocowa6kQpxSgM
	 s7Oh3D2O2LxQwrWAq1GPqDJpolj6DGGDPxwK7hpfWZ4fy0weNr6MfRpAgRQ7M7NcOG
	 UrMj2oFEp01AqMGA5ehd1zay++jjfq5OXvB9X+se2tMuaQLw+eLFXIee91oBqSw/u8
	 TKX22MPJGg1R0HH8eruDly/Cu4QFZvpbSpgw1V/1PIZAizgzhS/OVZoU34tr7L+8lK
	 hKgqD8Rui7Hew==
Date: Wed, 3 Jun 2026 00:14:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings.
Message-ID: <20260603-half-almanac-29c5729834cd@spud>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
 <20260529-multiply-engraved-aab583ea4519@spud>
 <B8509E97-D235-4373-B29F-B7C79B96FB93@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4loMvBYm8Rw8TaVP"
Content-Disposition: inline
In-Reply-To: <B8509E97-D235-4373-B29F-B7C79B96FB93@gmail.com>
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


--4loMvBYm8Rw8TaVP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 10:09:57PM +0300, Stefan D=F6singer wrote:
> Hello Conor,
>=20
> Thanks for the review!
>=20
> > Am 29.05.2026 um 19:48 schrieb Conor Dooley <conor@kernel.org>:
> >=20
> > These are not permitted in bindings, please remove them.
> > Half the time they end up changing because people find other clocks, and
> > they never actually get used in a dts. If you need the definitions, add
> > them to the driver.
>=20
> I changed the drivers to derive the number of clocks from the clock table=
s in the driver, as seen e.g. in mediatek clocks.
>=20
> Before I resend with your suggestions and more Sashiko findings (that thi=
ng is good!): Do you have any advice on the questions I raised in my cover =
letter?

Resend whenever you get around to it, don't need to rush into it. Can
wait for others to give feedback on those questions, none of them seemed
particularly relevant to me, more of something for Stephen or Brian etc.

--4loMvBYm8Rw8TaVP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah9j2gAKCRB4tDGHoIJi
0v77AP0XojIIrfX5OHFQwKXe8wuWUvX0flFO/csA20plynl3GAEA0mMpHaQKjkSe
dtvsAzCjEcrp1w7R08y/m/rNy7m9MAk=
=ZROx
-----END PGP SIGNATURE-----

--4loMvBYm8Rw8TaVP--

