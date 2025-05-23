Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755C5C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjFTQYCih9CGeZnO+hmXcoyW+SdJJ+1DXHbGfsPJbrY=; b=DoChMLR7WfkzqNNesvsqD19PBj
	K2bkwHX5EJZmCuwVOy5ukGwXWGFOLyGkotetYXav+a9NnwWjlCpU5w1OTaqqCY9U17J+G3QGCR38s
	Xt8dC9kikCE/jQwX0aPrB+PhHD0b6+sV26W1XZR14ApmYPmdgFpJp/VDZ4RH1R5bkVgbtduVOIS2G
	CyoJI69KOb5xUYH6SSmZcMkKyIPAXvfRR5WZnYMLSg/FTYDUDYLEsi5dYZ+oll2eC4boq1rAymsEi
	HWYPABKizP5KPvk+hJ8RyinCJr8dAzrDIwIzOxCOV/y3a5C+ccSm/be+0NHjBWU+aV+zfdQ7KaASh
	ivNIj+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1W-00000003KdT-29qJ;
	Fri, 23 May 2025 08:45:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINZJ-00000003HjE-2Xq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:15:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uINZE-00048L-H1; Fri, 23 May 2025 10:15:48 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uINZE-000s0g-0C;
	Fri, 23 May 2025 10:15:48 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1562B418169;
	Fri, 23 May 2025 08:15:47 +0000 (UTC)
Date: Fri, 23 May 2025 10:15:46 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/4] net: can: rockchip: add can for RK3576 Soc
Message-ID: <20250523-elegant-elite-iguana-8b4116-mkl@pengutronix.de>
References: <20250523075422.4010083-1-zhangqing@rock-chips.com>
 <20250523075422.4010083-4-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c5dnlywm7hswlywp"
Content-Disposition: inline
In-Reply-To: <20250523075422.4010083-4-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_011553_645592_B273F8B9 
X-CRM114-Status: GOOD (  12.87  )
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


--c5dnlywm7hswlywp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] net: can: rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 23.05.2025 15:54:21, Elaine Zhang wrote:
> Is new controller, new register layout and Bit position definition:
> Support CAN and CANFD protocol, ISO 11898-1
> Support transmit or receive error count
> Support acceptance filter, more functional
> Support interrupt and all interrupt can be masked
> Support error code check
> Support self test\silent\loop-back mode
> Support auto retransmission mode
> Support auto bus on after bus-off state
> Support 2 transmit buffers
> Support Internal Storage Mode
> Support DMA
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

Compiling throws the following error:

| drivers/net/can/rockchip/rockchip_canfd-tx.c:173:18: error: variable 'skb=
' set but not used [-Werror,-Wunused-but-set-variable]
|   173 |         struct sk_buff *skb;
|       |                         ^

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--c5dnlywm7hswlywp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgwLq8ACgkQDHRl3/mQ
kZxFJgf/RJLII4jmWOIO0Kb32Hp9dCsN8hBYODQ+RosNpTkM/rBDuyJtV6a8RjoA
QkGvGiZgji4sv3G5o/kWmggUz4OIY7hbqzKWy4wy3rRVLeotubC/O4Fw7q5tYBCv
uX7C4eiAJKBiJvnnAT7qiQ4jc4foCQqZgh0b73GKu2oUmYoN7kTfl6yF/yICbbSq
sMMteatdKMyTwn5zbgSp3+QnxqWD8rnEU8eDyPOrZBhQ1PVS9Ck5prYF7e5erxEw
OpfsaJRJXfjf0h1ZTZiNbOlKvtqnUWFCDwUV/ScZ/wP94vdiRSrJfWrsKn07KjQa
rljIHYoxSu7aVhIUgk/71QvejRHWOQ==
=egoG
-----END PGP SIGNATURE-----

--c5dnlywm7hswlywp--

