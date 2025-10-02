Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6525CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO1LnekXZXs5OC6s4+89X/AETD36EzX1wvYZOnIKT3o=; b=3fBpgY/56xzI68f1x/6fjoO7SC
	gSg+HtsyOCjTsstJAaZnzrNl4vlLu6olDYEhWWqnnGUcFNxG7txgi4FaKSu4V4naEXSd+p1xrELvP
	azsFkENrMIfyLCUKGMfxwGq2ATz+TysYp8RM7TPadjVfJs4W4Ly2rTzrKiETmHM6ReP0WJPV6fV/r
	z2/IjwDtfH2tqATkV5ekoknAfXFJcDaWZCNAjvm0ER5XoNVQb/qrnt13i+L3EG5Nk4vSNePzkXAvf
	oGNYSF8AdBjiTYkyXBOxwIFnNVQT6vOaUHAt1Fr01vjoU84faEIoIlcfJXP9pKLsrdKyWEwa5klpf
	O31auLDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4O9I-0000000B2gd-01lR;
	Thu, 02 Oct 2025 18:35:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4O9G-0000000B2gX-3Euh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 18:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3636D611BD;
	Thu,  2 Oct 2025 18:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44C8C4CEF4;
	Thu,  2 Oct 2025 18:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759430125;
	bh=zHJ1GL2dHHNTvje7wfAsF9YbHWtTxN7jX71+3I/wsHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t08FxlBeAOkMnjhbkf8zCIx5OpnQBktugZTsxCd4Tgd6msXMaoGiYZNwwoXi/1m08
	 EycjQh3GLFu5QzD1tlYBZKlY2QpP0xmjwRFgherDKSmdu2nq1v0ymqW5GIxx8CU6Xx
	 x8qgVnGh4GZJumMlTZJtQuDdSjFYpFMwGS+BthR4QsoNAiJmXTq3SlHllrB8yGtxDP
	 tnSKBW9gQsyPA+HIpWpGtAcY+1qWOUZcmsVztryCEIYrwYkHyqRn9zCLUW6xDhTHkE
	 AmReNgMl4mIkh6TfSolIRy4+aKZ/hKgNGHuNKnaRegTr6pXt1FqUxe0SAwXoyimlKf
	 dHfaDyEh4Q/fQ==
Date: Thu, 2 Oct 2025 19:35:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Amithash Prasasd <amithash@meta.com>,
	Kevin Tung <Kevin.Tung@quantatw.com>,
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Message-ID: <20251002-outmost-epic-9cb3bab4d352@spud>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
 <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>
 <20251001-bonding-surging-af8cd0d09e07@spud>
 <CABh9gBcKt1zqvMQ=390HESPR5KrA42jaMFj9Ca4qmeS0d0ToAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y+7trX4Eurr9Vg9P"
Content-Disposition: inline
In-Reply-To: <CABh9gBcKt1zqvMQ=390HESPR5KrA42jaMFj9Ca4qmeS0d0ToAw@mail.gmail.com>
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


--y+7trX4Eurr9Vg9P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2025 at 12:23:47PM +0800, Kevin Tung wrote:
> On Thu, Oct 2, 2025 at 2:33=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Oct 01, 2025 at 04:47:50PM +0800, Kevin Tung wrote:
> > > Document the new compatibles used on Meta Yosemite5.
> > >
> > > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> >
> > You've repeatedly ignored my ack, so I assume you don't want it.
> > Maybe you want a nak instead?
> >
>=20
> Apologies for ignoring your ack repeatedly, that was not intentional.
> I truly value your review and will make sure to include it. Would you
> suggest that I send a v4 to pick it up, or is it fine to carry it
> forward in the next revision?
> Thank you again for taking the time to review my patches.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

The maintainer will add it when they apply, there's no need to make
another version for this alone.

>=20
> Kevin
> > > ---
> > >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml=
 b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175=
e109a78d931dffdfe28 100644
> > > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > @@ -89,6 +89,7 @@ properties:
> > >                - facebook,minerva-cmc
> > >                - facebook,santabarbara-bmc
> > >                - facebook,yosemite4-bmc
> > > +              - facebook,yosemite5-bmc
> > >                - ibm,blueridge-bmc
> > >                - ibm,everest-bmc
> > >                - ibm,fuji-bmc
> > >
> > > --
> > > 2.51.0
> > >

--y+7trX4Eurr9Vg9P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7F6AAKCRB4tDGHoIJi
0sRwAQCwFXlCkLmxyD0w0Te9XN21MKFsXX3OKi+6iraKLaemqgEA9P77/sCLgfDi
ArNrGiKmZ7zFrzI9JsZPFV6Lu0VuBwE=
=wXDY
-----END PGP SIGNATURE-----

--y+7trX4Eurr9Vg9P--

