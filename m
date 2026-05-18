Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E1CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAGzXERG5oNLhxVSrG85EZvGLqcUwrFCSavy/o5fVaQ=; b=rAcXShfeIgw0HzfsADI1R42XGS
	8dxG61U3AQfNDr4gif3XwpdMa6kcOnn4CQqGRd4nypyDf0i1bUY9CyfLSl6hWaRKz77ddn0Odv2+v
	O00pLoYYAG6b6XdmHkPevPLSdnUTWDuBzgDa3fe+8cpru/a/fc+Mf3560kzDEjxqoD1XfRFo8hLS9
	+W4QwDD1t+eaWSYtvsdCJ0fIx/Qls4xr6BYpAHYnbiW0WcQCd8X6LyF5isfnp3IlYimDtODNua9ve
	QkQrism9Bo4h2t8+EGNqRLxJgL/tk8lsPWMQB99MHReL2WrRZ5sWvoqSpbl2mtf4RxysP280w7Wz6
	Daui6jCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwYu-0000000FVvQ-0ynn;
	Mon, 18 May 2026 11:55:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwYt-0000000FVvD-1Bph
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kAGzXERG5oNLhxVSrG85EZvGLqcUwrFCSavy/o5fVaQ=; b=nbjNaZrR4pVxTa7jPydAmBdOwM
	jaE7hxZ8HQ7+a60GbLkz702RHmmsb1933JdJX5h6q/OtniNw9XQPAX9tOtVeecRBJj4sOV3me+sUn
	vAzILDM52wz6Nmpp1DTDP2Iad/KFnM9JBYgCegIa/gM43hkws0bFlawplI0UNwwkq8rUhKxSRE2wy
	Z+JCn22pkPXbxU9kN9raWcp66frsB50DASzkK20pX+CqujeSRm23KdVN0LheKex3hSwmHp5lWzAXx
	/YaBZAZfSpiiiharP+kKIig8k47biWx8SG6td+zlJcNxaqbNp/0ooyZ3gn4eacB0K2ae1JEZGn8XT
	Ifmj7HHw==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwYp-0000000B1T2-0a8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:55:06 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C983B1F8004A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 11:55:01 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 25FE3B407F6; Mon, 18 May 2026 11:55:01 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 10335B407F1;
	Mon, 18 May 2026 11:54:57 +0000 (UTC)
Date: Mon, 18 May 2026 13:54:55 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <agr-D2UD0Dr1dLLn@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
 <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yKavoZ/1HsL3ubxV"
Content-Disposition: inline
In-Reply-To: <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125503_782415_5EECB419 
X-CRM114-Status: GOOD (  27.31  )
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


--yKavoZ/1HsL3ubxV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Le Mon 18 May 26, 13:29, Alexander Sverdlin a =C3=A9crit :
> Hi Andre,
>=20
> On Mon, 2026-05-18 at 13:16 +0200, Andre Przywara wrote:
> > > > And anyway, I see a *dual* USB-A socket on the pictures online, in
> > > > addition to the USB-OTG port. So where does the third USB come from=
? The
> > > > A133 only supports one host USB port plus the one OTG port. So is t=
here
> > > > an USB hub chip on the board?
> > >=20
> > > There are two hubs, one on each usbphy. OTG side hub is even bus-powe=
red,
> >=20
> > What do you mean with OTG side hub, exactly? Is there a hub on USB0? Ho=
w=20
> > does this work, then?
>=20
> the upstream port of this hub is wired to the USB-C connector, one port h=
as
> CH340E USB-UART on it for the console, the other port goes to the SoC usb=
phy 0.
> So it would be "peripheral" only, I suppose.

Yes like I explained in my other email there used to be a USB0 ID pin in
earlier revisions of the board but it was reassigned and USB0 is now
sitting behind the hub so it should be peripheral only.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--yKavoZ/1HsL3ubxV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoK/g4ACgkQhP3B6o/u
lQwT1w//dOWaOoXIX7oAskSSD4md2jxdMx8mlt4NJhi+iEBVB1ygE6+YmG+Q94LB
awQBs/znsdHynNvV/5p7s5+yn3KPbERnXWh/FPh3XW8BoZCAFcwsRC/mgJM+v/89
GsSlcHBXo0X8+ieoMeKizDXQpOCrOCQVtZAqW9w1/yJ5Fs5YdcOM4K11ox69nZug
cNYtCIPqW6QBvRpRYDjYlqQA7L3r4aBilDeuwQ5PAaV9kkGhzjYhNyUqTdbaV1nb
NoWdBq2L4UMn1SMX9sYUakANYpE1RmX07mZk/NQVRsU9Jh05lPTUUvPZlekx42cL
mpV/LIAa1ektsktLQWkjRKK4+uTv80zWxumYb0ZSNUTJ6tP2B0juUeZ7dN0TNBmp
aPv9rbxhD62c3KLDIKMgh9rysJrPiXejpxia+EbaNxEccwvDjKSUwYekexxKWNCp
zWG/PDi4rjcvOMjleICe8P/nvB6RfOtoNDXP4Q8J8cnEHtJUBb24npppd17scOjP
MQBhoREcq615+/ktmsjsf+xRbTwNTKqKjsY1qf1RUfsniWhuTjkP+5cl7EsVHHIf
ChkTtyYKx2BMm5BWuoJ/lsAreGo/ti9QjcgsFWv986RhGGxRL9/g/Q3+FSj22LTA
7SN83I5GsknORm5KcJQ+bI94J3KaKy3hSJJwTQYOswZXJcmRoTg=
=Wukm
-----END PGP SIGNATURE-----

--yKavoZ/1HsL3ubxV--

