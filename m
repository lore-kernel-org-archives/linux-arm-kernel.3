Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DCED3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bThuyhzJh56++C+Y7K4chqS3giDBXnc2WHnyYXvta88=; b=a5vdScFKYrUkbe2yWxh/Hmje63
	Q6gUVPtr4tnTXpf25l9rnkDW5r1Nks1EH2OBnNKO4yCqeTUmXcUIw3HstLdycmWv0H7i/A2ou2RKw
	jx6uSaohCgPedyTr7urRgbc5K0ZSXln56H6Ifx9y+rBPVS4+2E0dB5IVY4ydQ+VcN7R6WmdFpOy1b
	bAv99Ow4lKCzFtVrIK9bRDLMwEe0KqpidaWWztw23CdsON1whEDc4PjQvYEBZjpqzEPGub3mWCHtJ
	OQ+REKRVd4zR+qRBG16d0E3DVcyW4I3qwNCgNU/e6e28n3/wyLqLTXst+W0yeIe1PZoG8/xd1VuO9
	SmutA0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrjH-0000000A5LN-3LIa;
	Tue, 26 Nov 2024 09:19:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFri8-0000000A4Vu-0bWl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 09:18:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFri5-0005E2-I5; Tue, 26 Nov 2024 10:18:17 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFri3-000Dyd-2H;
	Tue, 26 Nov 2024 10:18:16 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1ADB937D7BA;
	Tue, 26 Nov 2024 09:18:16 +0000 (UTC)
Date: Tue, 26 Nov 2024 10:18:15 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 03/12] can: sun4i_can: continue to use likely() to
 check skb
Message-ID: <20241126-wooden-cyber-polecat-d96127-mkl@pengutronix.de>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
 <20241122221650.633981-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fklivl3r3m4v2cbu"
Content-Disposition: inline
In-Reply-To: <20241122221650.633981-4-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_011820_181816_9BC752F1 
X-CRM114-Status: GOOD (  13.87  )
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


--fklivl3r3m4v2cbu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/12] can: sun4i_can: continue to use likely() to
 check skb
MIME-Version: 1.0

On 22.11.2024 23:15:44, Dario Binacchi wrote:
> Throughout the sun4i_can_err() function, the likely() macro is used to
> check the skb buffer, except in one instance. This patch makes the code
> consistent by using the macro in that case as well.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I'll apply this one on can-next.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--fklivl3r3m4v2cbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFklUACgkQKDiiPnot
vG9V2Qf9HACb0LFZ2n5t9mhZxL1lJKrvPrG0+M1I2I+az5Kf1ctouzr1D2tj3UCX
1jRQnCniUZWRqagu1R3mc6ih6FQwftuCstvdh/J2+wurmgvs6erlza4FytN/vN91
GzhOEXksFZIJCIKrP0Oj4EOIZZKmc2I8wP3+TV+6V/x+Cb1/yo86+ktgY08/p7CG
PDxBOBnlCF1lwKu1rAIp5TaEkKAWko7SVo2wDrpdAe5H7YI7KOXJvVfkeZvEN3j7
U9i2pdrP9SyWt4Iz6nn2fYbVn2Bez6a2XVd9Vg19eMVzpyhrq6zcxjNo5oleXutW
eve3U2Mo0bP+O0aTxxuAM1H9XDV6dQ==
=b9xE
-----END PGP SIGNATURE-----

--fklivl3r3m4v2cbu--

