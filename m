Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1AECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBpfXDlZ/XrStmRn55CLSXGQ6Ii3N/XIU6wBgfoOEII=; b=1v5OZFwehKdF1FKnU9Q4n5CFNr
	S7TR+py0EfVWC/VgmcSFc8zvC02d4/FemOSa+47yXdkC8uQRlsqEsZn4tTiUit51vsr9LRTjWw9Yd
	UbwzDrWeD/QTwfFuY+F3XxYNu6pVnPqzlm/a+6ciP2EIvmyc8YyKXFodFn5D4OgdXQFGKctFuRXAH
	u0fApo5Yyeikh633A+nqPdianDJZztL0t6duwzVU4SloI6iAErPEKQtnf3ld4RB6n8idjT380R6Dy
	yqBNtbNYsL16rPtFtDOpvxvgfG9aB9eZMvnVsjJm/eINZ48LfMHqYWg3a1QC864dFO0QmkN/xYpm8
	tVbafL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArfb-0000000E6BR-3DBn;
	Mon, 20 Oct 2025 15:19:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArfY-0000000E68m-1HEh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:19:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vArfT-0003vB-7G; Mon, 20 Oct 2025 17:19:27 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vArfS-004ZTW-1I;
	Mon, 20 Oct 2025 17:19:26 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1DBDB48B56C;
	Mon, 20 Oct 2025 15:19:26 +0000 (UTC)
Date: Mon, 20 Oct 2025 17:19:24 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Vincent Mailhol <mailhol@kernel.org>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Stefan =?utf-8?B?TcOkdGpl?= <stefan.maetje@esd.eu>, socketcan@esd.eu, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH can 0/3] can: drivers: drop skb in xmit if device is in
 listen only mode
Message-ID: <20251020-electric-dramatic-cow-e8178b-mkl@pengutronix.de>
References: <20251017-fix-skb-drop-check-v1-0-556665793fa4@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l5m4fvbx7vmqre5l"
Content-Disposition: inline
In-Reply-To: <20251017-fix-skb-drop-check-v1-0-556665793fa4@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_081932_338523_60D975B3 
X-CRM114-Status: GOOD (  14.32  )
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


--l5m4fvbx7vmqre5l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH can 0/3] can: drivers: drop skb in xmit if device is in
 listen only mode
MIME-Version: 1.0

On 17.10.2025 16:59:58, Marc Kleine-Budde wrote:
> I notived that 3 drivers (bxcan, esd and rockchip) use the function
> can_dropped_invalid_skb(), that doesn't check if the device is in listen
> only mode. This series converts these driver to use the new
> can_dev_dropped_skb() function.
>=20
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

Applied to linux-can.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--l5m4fvbx7vmqre5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmj2UvgACgkQDHRl3/mQ
kZwysQf7BA83gk3POJDewYtZEMQHNZnob1qHnopUO8DyF+bSAr7qCymLLwpj2R7p
shOie/EQ8QeEeWPeVYQS4u1kjbO5xRtQ8bmQCgDcOnpg6JXX/zZ9/8yGgeJhzMoo
aE7MnZEV1C9jA5MVXNVyfCGtAJizWWPHyf5R8mwDSqAJmm3UlXtx8UEL8b7tCaEB
Hhg/LmIL2BLWZC9l+IS78R8CUFRKVq3RjLK2nyzCb4SYGJfuxXzoF2rQUBGseTL+
MFPb1SW/15f2f2GJzdqPdgW2nhy2S7NxGrWCqs+J27GTySr20aW4poTMBtU7+KvL
U+/LpZDPJ1qd4ljdZ8WxHeUiaWQ++A==
=5pMM
-----END PGP SIGNATURE-----

--l5m4fvbx7vmqre5l--

