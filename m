Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6A5CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhkqJSMJRJ9caAgyYTXvXdZyQrFlJPUeu7FGKIdRg8U=; b=RrmJ2lopwVRoxwCTeVJFHj0HeG
	Lvo2EfOwtRRJXjrlsHCeWFr1C2zCCdoZN50JxKN3laCjIc4pBEPTOK1lTXyiqLLLjqxIL4q3uHl4u
	qI/0cpau6OAEowKwnjFatrbkgeizLyExxSiUcWHT7VnmpLPgiviY/1zWWzrHENTXlV0klHX9QI3/J
	jEt+VoqMaLeCgwCfm1aCJd6nQD4AlXT07dzdHhPAOjwXdAqhnELkZp1NoSGHQN5nt7f+gi1RZYid7
	ppgrZj6FWDOFhqGoETukwz0GugahELRp0sze0QfFxQrvTcUZE1PBGUpGc4KnCEnJNq7DQLGAFItiw
	ATVYIdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzO9-0000000G3zh-122h;
	Mon, 18 May 2026 14:56:13 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzO6-0000000G3yg-1hft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:56:11 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C90391F80044
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:56:07 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D0654B407FC; Mon, 18 May 2026 14:56:06 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6410AB407F3;
	Mon, 18 May 2026 14:56:06 +0000 (UTC)
Date: Mon, 18 May 2026 16:56:04 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <agsohFpjuGqRRDO-@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <agr9m_tidBr6Cu2h@collins>
 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
 <agsezxcxjQlBmesm@collins>
 <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fo0QafIQlmgBpWCX"
Content-Disposition: inline
In-Reply-To: <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_075610_607320_20BB88E8 
X-CRM114-Status: GOOD (  22.38  )
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


--Fo0QafIQlmgBpWCX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Alexander,

Le Mon 18 May 26, 16:40, Alexander Sverdlin a =C3=A9crit :
> Hi Paul,
>=20
> On Mon, 2026-05-18 at 16:14 +0200, Paul Kocialkowski wrote:
> > I also have a U-Boot config ready for it, which I could send once the
> > device-trees are merged on the kernel side. I could send it to you if
> > you're interested.
>=20
> I do have one as well, I'm testing all open-source ;-) from ATF-upwards,
> just thought U-Boot would require ATF merged and kernel DT merged
> because of OF_UPSTREAM in U-Boot. But I'd be happy to sync when we get
> there.

Sure, let's keep in touch about this!

I also have the 7" LVDS LCD that goes with it, which was supported by
Parthiban's initial series (but needs rework, and it seems that he's
unlikely to do it). I also have the 5" MIPI LCD but it's less likely
that it will be supported, although I have seen dirty patches to make
some other MIPI panel work with A133.

We'll need PWM for it which should be a follow-up to the current H616
PWM series from Richard Genoud.

Other than that there is a PCF8563TS RTC on the board, audio stuff:
speaker (which I have) mic and headphones and a GPIO beeper which could
be added.

Do you have other A133 boards that you're interested in?
I also have:
- KICKPI K5C
- DshanPi-R818
- Logicom La Tab 129
- Trimui Brick

And have some WIP device-trees and u-boot for most of them.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Fo0QafIQlmgBpWCX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoLKIQACgkQhP3B6o/u
lQwSBA/8CUU8/y0NALKPJHPsGl+f83F2Juxadi4mbIE/AM3g6XK+OJR2fdBq5JyM
qiww0A8jbvT/MfTj6pDVg3HnEU2cmcT4AjRdE5l3EfmL/LwfzA91VYlETXOkEhe6
ropZY1h8IZl8cGgfUkM21KwsNekBYG81HFkNVvgykMuYoGx45rsPcQ+Yva1PHWhk
Yv7/LTzf0dL5wENDQMCmoddeKK5USopdJ4qi9PE5q8YbvKmDwS0yoI5QHPMWUJ4J
digD+MWXanhgqyRNl4LIlJrloXfd/iCjWrFhbEnoZV2Ytr19x+GX7JP3cUS+IeQO
v6ELDislalhuic327sfGUIlaaFQL3SKV9GjTygAgQzWAo9UoFxLh8aDSLp6dZ8D6
byy9KCvOKaIkoHqyT5fw/4SQa2UvJIKmjh1LrW2p4AbM+g2v2z1T+/8CiVk04bYg
eyWE7TyQ2csO+YK1COX0NmueP6CWm3GTJ7qg1rFMgED4B9Taz/zIze1oQOyKM+59
5ZslqkdHlarotx/s46ZOoyMGa5eeQdwcJBOoCXJ0Vrs2HCZQzaGotOfa0XdW+nze
r7/DN6LOlHYqiFmd/+tbCOMnb7HSzTiCQ7mbjj6Ei9vQhEgMk1okU9f86CgewsJr
wXdISV+lrAQWWzHxhGKAnmKJ8Um79u/Exrf5UKLnK15T0/KbsMg=
=S0BY
-----END PGP SIGNATURE-----

--Fo0QafIQlmgBpWCX--

