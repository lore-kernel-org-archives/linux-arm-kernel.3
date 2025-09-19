Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AB4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iLytlirNj6/dvaBq2PlkRv1BIQb0qRBi5UTVldtijs=; b=4grdSEMxHVW3J+rgq41UL1YaXz
	Gn9at0ty9eQcAbVwsRUYeo99Yl5aNVUbpk6tHnyNQSRcNvgRZCeIdiv/rJe601Fdr/iYQtpaqE26k
	RCSp2+i8w+yZGD6Tt3zW84aD1/GggXgvv65aR4mhMCoCwBF0hqJ2blJdbATEXtIWG2uDJkvET7nGS
	j2AOJmfRohzDv+FjjVs8VMDVRyt5xC4X6ijdTR3HUu8Z4CkO3j6jwarMB3daY4pC8B9cLbCjO8Bzy
	RrwQ0i10Aw7uFnryJGBpmjlY2HiRib1eNVdKkmCSxEIKDi7YMyBkXmG6trisB5oRU4HFdWEjAPGZb
	GH7ksbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeXq-00000003cGJ-1CEC;
	Fri, 19 Sep 2025 17:05:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeXm-00000003cEX-3EOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 17:05:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzeXP-0001QP-4w; Fri, 19 Sep 2025 19:04:47 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzeXK-0028ck-2G;
	Fri, 19 Sep 2025 19:04:42 +0200
Received: from pengutronix.de (ip-185-104-138-125.ptr.icomera.net [185.104.138.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BB2044750C5;
	Fri, 19 Sep 2025 17:04:40 +0000 (UTC)
Date: Fri, 19 Sep 2025 19:04:39 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Oliver Hartkopp <socketcan@hartkopp.net>, 
	Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>, Akshay Bhat <akshay.bhat@timesys.com>, 
	Wolfgang Grandegger <wg@grandegger.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, 
	Yasushi SHOJI <yashi@spacecubics.com>, 
	Remigiusz =?utf-8?B?S2/FgsWCxIV0YWo=?= <remigiusz.kollataj@mobica.com>, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/4] can: populate ndo_change_mtu() to prevent buffer
 overflow
Message-ID: <20250919-portable-rat-of-dew-32b5e9-mkl@pengutronix.de>
References: <20250918-can-fix-mtu-v1-0-0d1cada9393b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idh7qp6reuygcmse"
Content-Disposition: inline
In-Reply-To: <20250918-can-fix-mtu-v1-0-0d1cada9393b@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_100510_807041_82CECA48 
X-CRM114-Status: GOOD (  16.47  )
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


--idh7qp6reuygcmse
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] can: populate ndo_change_mtu() to prevent buffer
 overflow
MIME-Version: 1.0

On 18.09.2025 18:00:23, Vincent Mailhol wrote:
> Four drivers, namely etas_es58x, hi311x, sun4i_can and mcba_usb forgot
> to populate their net_device_ops->ndo_change_mtu(). Because of that,
> the user is free to configure any MTU on these interfaces.
>=20
> This can be abused by an attacker who could craft some skbs and send
> them through PF_PACKET to perform a buffer overflow of up to 247 bytes
> in each of these drivers.
>=20
> This series contains four patches, one for each of the drivers, to add
> the missing ndo_change_mtu() callback. The descriptions contain
> detailed explanations of how the buffer overflow could be triggered.
>=20
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

Added to linux-can.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--idh7qp6reuygcmse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjNjSQACgkQDHRl3/mQ
kZybWwf/dkqGg8VI+ORuB/Iv9jFds/SZ0a+AmPu0ZAlenrV4u1OLUBbd2avtEd+T
KaYO6CuAzlpTZP6vx6S3XQ1M0qy4Z5EtQbgbrVETQ/Z6ZN106WXaOj7iYrGkWc4V
CvSbll8GBD2cP0qQrR+2DAV27Z7UHty6U1qOfqb8y0afoeqh1Bhq3ODivlAtejuE
azZd1kmiX5HdWUD2d7GQBiAZ6cBDWH70C5oMYaH7J9kiCiHKt4yqL1R1o2tlc6n7
WN3xrUIERmq9aM9x7Dh2+67tnEnfZdL10uFxUIq6Z9USZR8hn/oEI/2lOk5Fd3ZK
inQU0iQq8JWngpplUukaDeiKO/EitA==
=2zvn
-----END PGP SIGNATURE-----

--idh7qp6reuygcmse--

