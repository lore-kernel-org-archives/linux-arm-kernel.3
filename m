Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45B0C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMa2zhq3ZerGD73Uf6y9ZbPQmbKFQg31K4vzGtJ/TX8=; b=FfyIGFmGkdsiEUoZvgszZSwUJL
	Y3iP9DFQZr5kYN94tIbjyrjT+c5zHPt9q4cPjo7JfebgMT/zNrRFVJt3L18j/MzPQhQJQK3qsCfsM
	UdHWCJYNCXnHLvtlsa0jP7bEIKQ9ZObttNOpaghgjG1EtwPe+yiclfRIhrydXqiJLc241pUO9E1yE
	9qa1WGtTplt1FeSvcgBfoiRKVz/zkMSCpL52W3XGlq6u6jvudnJLd1TZrxuPm3jW0zGEfEdypvjRB
	IDIApdfus5k082GRg6T8Rwc5dr/nTj17EPFSQot/dPpvyCY4h5MrLJBdn8ZAkR+ECl7TD/EJdP3mW
	NNDGjryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1q9-00000000Prq-0bkQ;
	Thu, 22 May 2025 09:03:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1m1-00000000Obp-4732
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 08:59:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI1lv-0002vJ-Hh; Thu, 22 May 2025 10:59:27 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI1lu-000huF-01;
	Thu, 22 May 2025 10:59:26 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1844F4175DB;
	Thu, 22 May 2025 08:59:25 +0000 (UTC)
Date: Thu, 22 May 2025 10:59:22 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] rockchip: add can for RK3576 Soc
Message-ID: <20250522-idealistic-khaki-tuna-91290d-mkl@pengutronix.de>
References: <20250522074616.3115348-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sa6ejazolcmnr6ge"
Content-Disposition: inline
In-Reply-To: <20250522074616.3115348-1-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_015934_016105_AF3EAC9A 
X-CRM114-Status: GOOD (  13.54  )
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


--sa6ejazolcmnr6ge
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/3] rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 22.05.2025 15:46:13, Elaine Zhang wrote:
> rk3576 can is a new controller:
> Support CAN and CANFD protocol.
> Support Dma.
>=20
> There are major differences from the previous rk3568. All errata on the
> rk3568 have been fixed and redesigned.

Which tree does this series apply to? Please rebase to
linux-can-next-for-6.16-20250522

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--sa6ejazolcmnr6ge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgu52cACgkQDHRl3/mQ
kZwdfgf/d8vv4Y+eCOIDpy04JenmxN8n8PZDriO0bTQAcrysrzSwWUfkouJA9sI5
avJL3hLCOVrSRzmvh/lkkW4voCfIfki7FI/STC/LeEpri85JOxOQfYLw1FgZ1Oeu
/b70nkM8d5A06HIVBB6WpUuj9B3B06p58KMlvSySaiK1EtfyIzZZ5O8LPmvzGLBZ
Nn9dbaH7KmSHboVpsx21zOyAIu1yAeu1Shl62nWBuFCBT1RYIpOWAKUX7cLpH4Dd
WTzeBnQxhzNKvLV91+pM/W0t89/tH5L7UfyhOHH3F1y4owdA2InWkOkYj22yTFiL
rNz898AB9XRisrl8I6jjG3Xp/yVvMA==
=7M2p
-----END PGP SIGNATURE-----

--sa6ejazolcmnr6ge--

