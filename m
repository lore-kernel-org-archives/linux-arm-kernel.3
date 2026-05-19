Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D20CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo1Wkn9Q9Yi+rEuSZAgffOMU0CLdX5BnjN/6P4181c0=; b=BicnubrOp8fLPcdkiuPXwbJ2m2
	9NmIyXz3gnvPHEnpYH03rTBerbE808jyCcJaQwYLKJ5GYRHH5sr7X0NET1MRNJTwIvoKQIx3v3l6y
	7rWVbkAuBzlIWou1iyozv5N9ikpg3R6Y6tXANU0B9MsKUvKu96h/RqE8NffMa/JCAsunuvhPCr+hc
	m5/AFots1EhMca9CkSxkvMci9ePGMhXSzB2Q+zIqljN/5oXBzr+zuTsfTIlqRYSBXqsu2g6r/CVws
	YuwPFM7jFFjfnea6InjwoM3U/Hs0hVQ80Ovg2WAN6B/V5So92GJSnYKSXim+bTRXQMm7Xr/OTBduA
	ch+1GPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLYG-00000001r9q-0QzA;
	Tue, 19 May 2026 14:36:08 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLYD-00000001r6J-1Awk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vo1Wkn9Q9Yi+rEuSZAgffOMU0CLdX5BnjN/6P4181c0=; b=Mscudf2zUIY6UO0zgo3eOvO19h
	Wdd4SvcqM02kuxZoTzYuBPIhGGwDfomKgXtrRWboagLKtkdUQiALDKky1bwRkJ0dna2q36IdaZ5z1
	LZtH4KicmiUrwllBHM2A4IpTJu6VYYWXYHH3IYzJIT8YtF248ekMzW9FZazpngRTH1+lklM2Mh+7n
	ZH6u7BLCbMP4fnOiRa4GMBLqdSBj+qf9EbFJ6ObMSpzotKA5RPthCfrA+zUMd5NChniqzeS0FzVGo
	lEOjCC99Jbua7qsMWinmvsBYBV9Jv1kGl0sjaV7+ImENJAeqO8kxYzh6dh+kHEthL86ti58EH+VFh
	8961wucA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPLA3-0000Px-10;
	Tue, 19 May 2026 16:11:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPLA2-000A6s-09;
	Tue, 19 May 2026 16:11:06 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for TQMa8MPQS
 with i.MX8MP
Date: Tue, 19 May 2026 16:11:05 +0200
Message-ID: <5102480.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
 <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>
 <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4736401.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28005/Tue May 19 08:25:42 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_073605_428936_AEF61233 
X-CRM114-Status: GOOD (  10.17  )
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

--nextPart4736401.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 19 May 2026 16:11:05 +0200
Message-ID: <5102480.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
MIME-Version: 1.0

Am Dienstag, 5. Mai 2026, 17:02:12 CEST schrieb Andrew Lunn:
> > +/* GBE1 */
> > +&fec {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&ethphy3>;
> > +	fsl,magic-packet;
>=20
> One of my FAQs: Has WoL been tested?

Well, I can "wake" the system per WoL. But resume stucks after CPUs are up
=2D-8<--
PM: suspend entry (deep)
=46ilesystems sync: 0.000 seconds
=46reezing user space processes
=46reezing user space processes completed (elapsed 0.007 seconds)
OOM killer disabled.
=46reezing remaining freezable tasks
=46reezing remaining freezable tasks completed (elapsed 0.001 seconds)
fec 30be0000.ethernet end1: Link is Down
PM: suspend devices took 0.040 seconds
Disabling non-boot CPUs ...
psci: CPU3 killed (polled 0 ms)
psci: CPU2 killed (polled 0 ms)
psci: CPU1 killed (polled 0 ms)
Enabling non-boot CPUs ...
Detected VIPT I-cache on CPU1
GICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000
CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
CPU1 is up
Detected VIPT I-cache on CPU2
GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000
CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
CPU2 is up
Detected VIPT I-cache on CPU3
GICv3: CPU3: found redistributor 3 region 0:0x00000000388e0000
CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
CPU3 is up
=2D-8<--

=46or that reason, I would keep that property nevertheless.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart4736401.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmoMb3kACgkQaS+g2M0Z
/iXlegf+Jah/HxtzA8FMQx4UsXpxX78jUNG5hFcKoA1eMRtaVk+YHJ/ULn/kGr/l
2RsVe5e9IuzB3VyOqnX1P2U8oEBbMj4plC1VZI8MrU+gDEW989eX0RAJ98y4TW9X
wbQqMG93B+fUZc15khg9MekjJeu2s4wgm0qsGDjZd799NtEof6vDH5nB5dqekI9I
yt9RO81MMxpxfpmyC4sPPUiLCoE3LQlmLQ4sG+oP97mjPfKidplrWNUZbuFkQMh4
3tTsBJETKIuuy+u/rNnDh0n/EiSAd41wpNvQrwCKNGBL1Y5QFJKIkPyRKe1M1OoX
nzHArj1V/uKHScvzjX7xdQSgFFzsFw==
=ozu8
-----END PGP SIGNATURE-----

--nextPart4736401.LvFx2qVVIh--




