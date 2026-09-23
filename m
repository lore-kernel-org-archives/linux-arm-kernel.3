Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAFBC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmYOP4c+ppHWZuCNjkFN4BLZ0XGCSmx7SrEAzuxj6XM=; b=MVn92gVQR2KYWbWdrYBq4QSfIm
	rC3/2wSQm83IqFeDeYb0hTU6QKwbhiSutNAXX2t3w3/zwGjTks7c8dbVaAok6J+nopmg52z8MXP2H
	oH3fYYSf50HAindxzB4bS8Ig1UUqEksMt+bHb4mV8PK8cK1Re54cgG+LgcvPyll049PDKB36mXuSJ
	v31E3MEY1JVVMCboYbjUF959uTtAQ+x+EYKamwx3b8qu542yb7C3u8NcsSLyXq8k1MJEpWau0OE+3
	9ePsLBr27ye7KcgZm5JQrxfRKq7PxrcMqH0i3fJ1vcDa2Bkc+1rJr/ME6R6GL3xsJJMiRtiQ+ozPy
	D+Cf1zuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TE3-00000009OPR-1PGI;
	Wed, 23 Sep 2026 20:05:55 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TDy-00000009OMy-13Tf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:05:54 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 960F83700ED9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 20:05:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8D15DB648EE; Wed, 23 Sep 2026 20:05:35 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 821CCB648ED;
	Wed, 23 Sep 2026 20:05:34 +0000 (UTC)
Date: Wed, 23 Sep 2026 22:05:32 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E
 support
Message-ID: <arQxC3DmDyVIGdqq@collins>
References: <20260522101653.2565125-1-paulk@sys-base.io>
 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YpsFhTt6LiRNuQKC"
Content-Disposition: inline
In-Reply-To: <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_130550_472222_FFCE419C 
X-CRM114-Status: GOOD (  13.67  )
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

--YpsFhTt6LiRNuQKC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Le Wed 23 Sep 26, 14:10, Michael Nazzareno Trimarchi a =C3=A9crit :
> I tested on px30 and achieved working H.264 encoding with some small chan=
ges

That is a bit surprising, the Rockchip PX30 should come with a Hantro H1
(using a modified register layout) while this driver is for the
Hantro VC8000E, which is a newer generation with very different registers.

Maybe you ended up using CPU-based decoding when testing?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--YpsFhTt6LiRNuQKC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmq0MQsACgkQhP3B6o/u
lQzbyw/+JH2RNX4Kk6NdjJGNFdRjLhYBLJnKUnz2uM6eXMwFt15zNIpFBI0ZT4bq
zCuPHz7SWLYYx5ZZw4svtA/I5qKT6rCXL5YkoO68/vdPg6g2lMqi+4ebUh50MtUg
il1jhBcRPKEIm/J3WwdPj0KWgV4TCiOU2jOqzHHADtPsec1nMw2pswsE7Y8F84tK
P0gBcsej7mQ52N/hoKBIFIqA76jgHv8WhdueJAQ+KN2miFQsLFh6BgdZKATAK7uL
131FKYzgkZlFAcgPUxVOCS8jJ34D5S9T+tkcgzDOFM5GcwpDOXyXBwtPe9q/CgEA
KXN+h/fAiQAUrQsIS1s7C1JQYT5c6Ax3dTqMzMkVusd464Az6fyy/JNpEKLjblou
T4u2oLA0dW/kBDUzmMle0IS/d3DJ+IoGkrjy4OaViVXtK3t0FmT3RhNbmbDssrzy
NciorGD2EhSmyrCTS2JKSyXHXGM2Q9jFsSe0LBsmSBHEkMEvA/aTHcl8Jvo3hv29
QzMCH4UeWzDSQKAEgQb+Rv0NnWQjpNJq5w8gRyomdHiPzReaPy3DpA2DVXoNkxq1
g8+QEVaDWo4Ov1D/+TzIsqw8kG5CbgcuhfmACnD9UHt8sOvR6rQD5cTghJcUHKrd
J1WCWIcYp88yfa7ayCxI5jfpRofBO5OsFxsyHOGbi+c9/w9n6I0=
=Plja
-----END PGP SIGNATURE-----

--YpsFhTt6LiRNuQKC--

