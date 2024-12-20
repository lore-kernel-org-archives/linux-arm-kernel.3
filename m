Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC1CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEji9Lk/pLdeX2iw8xpCZ0zV1uqpSfb5ZgA2NAx2XR8=; b=lLqRaRk3Obg0rhnAKjEE+PgLjI
	rd0+EttdHjfEE4Pz+IU8sXjQ7zBl0wxWu3pp1UlzBqnWz7+2qi8iDqmGl70t+QJ7afJWM3fqfxQoL
	zhQccuLlccAAnjw6D3rO0Mp8D6P15HEXyTH5+7XNz0N00naehYVamLgQzggx4xJSl7iZjr9BhNHEk
	xY6QQRgLZM3gk5Okk/F7zu54viE0h0HA3r6BvjaWSoUaQkAFK/lKm/DXguERbu4QKnZ19SJlXoX/k
	O2MCIXm4dvSLnxlYrwyhagMw3T0lo50e+N5rVJnhqOIvl/v6/unKpWjOJt85j7mR9w4FqtdItNt2w
	rZhtWY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObmu-00000004rC5-1z3F;
	Fri, 20 Dec 2024 12:07:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObll-00000004r6n-1KN4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:06:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tObli-0008UH-Kf; Fri, 20 Dec 2024 13:06:10 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tOblg-004Mzd-0v;
	Fri, 20 Dec 2024 13:06:09 +0100
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2E122392EF0;
	Fri, 20 Dec 2024 12:06:06 +0000 (UTC)
Date: Fri, 20 Dec 2024 13:06:01 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, heiko@sntech.de, 
	cl@rock-chips.com, kever.yang@rock-chips.com, linux-can@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: can: rockchip: add can for RK3576 Soc
Message-ID: <20241219-sapphire-vicugna-of-opposition-be748f-mkl@pengutronix.de>
References: <20241219011159.3357530-1-zhangqing@rock-chips.com>
 <20241219011159.3357530-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eudui3nm55akuurq"
Content-Disposition: inline
In-Reply-To: <20241219011159.3357530-2-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_040613_355561_23B1EFED 
X-CRM114-Status: GOOD (  18.18  )
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


--eudui3nm55akuurq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] net: can: rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 19.12.2024 09:11:58, Elaine Zhang wrote:
> Is new controller:
> Support CAN and CANFD protocol.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

Thanks for porting the rk3576 to the mainline driver. Looking at subtle
differences between the IP cores I'm not sure if you want to add it to
the existing driver or have a dedicated driver. But we can decide on
this later. At least the mainline driver has a better structure than
your original downstream driver.

Why was the timestamp register removed from the registers? Previously
the driver supported hardware timestamping. :(

Some general comments here, a more detailed review will follow.

Why have bits been removed from several registers and the remaining ones
moved? That doesn't make it easier for driver developers to cover new IP
cores. :(

Please use FIELD_GET(), FIELD_PREP() macros instead of open coding shift
and mask operations. See rest of the driver.

Have you actually tested this code in both RX and TX direction? I don't
see rkcanfd_handle_tx_int() being called?

What's the purpose of "rockchip,rx-max-data"?

Why do you add "rx_fifo_depth" to "struct rkcanfd_priv"? It's not used
outside of rkcanfd_probe().

Can you configure the IP core for CAN-2.0 only mode, so that it only
receives CAN-2.0 frames only?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--eudui3nm55akuurq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdlXZAACgkQKDiiPnot
vG83mQf/f6DaBGVIT5WusxNppsrY5LvjB2UCWh8j3u0AGBRxOL5ktwa/cZna9O4L
BH0KOBH+K6mUQ6ssME6tH0EYz17DUbaaFnhPjVTRDGAQu0qktLXoFf0cRjiTo4vV
xLLVVPn9++OTYFUQmN+SxWih0MHBK5+HhIUd+HZTw5GGWdt5V+Wh5kkS048slc9E
mP2tspwcyzJaOAXz9zsdxOc540tcT4cfgI8GgzSIFiVtZWoliAEvgHFzNcp6ZZts
GWRSK2Lf/sf6+mmbHNpa0GhG7M6zqu+nC6oVgVuWY23RO6laQvUTSktw0Ek9nq2f
EtgEcqjYtJiSK62wZQ8ijhtgtX6D+Q==
=AKwc
-----END PGP SIGNATURE-----

--eudui3nm55akuurq--

