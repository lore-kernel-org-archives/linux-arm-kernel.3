Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C031CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCWKASf+QXghLO//1IetgRVHQ9nJg/t6JBeEDHM8x2c=; b=wyhMlRoOIPK+NKpTUAslEhwlEF
	vpHimNGvTF3njTavUEgr3riVUVOdfqxyOD8Mw/9nJfi1NtAuUhhKx9F/BCvUwPKob/2KT2GZMzhj9
	DCaLRHTj/wtgidcLhbIZzgQPQ1KYld11vfpDqJt1aWen7KGFVSBKdoxICxGh51r6JQfL8E2NKb06G
	XnY/1FBvsHUrikAS7bwlLi0nUSlF5YXZg9IeyJXqURYzJrwUukm8mZ4o7DCY2S5rM9mCj2qFizuo0
	9laKutMkC1itMh84ZU7L7p6Sa11T2gI0D7F0LT3fHru7JqzKnuPfW/QBCKoKjWTVe2oG9Uu8ywHWl
	44RPCTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgOt-00000003rBC-29gV;
	Fri, 19 Sep 2025 19:04:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgOq-00000003r9X-48fe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:04:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgOp-00026Z-CN; Fri, 19 Sep 2025 21:04:03 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgOn-0029YZ-1s;
	Fri, 19 Sep 2025 21:04:01 +0200
Received: from pengutronix.de (ip-185-104-138-125.ptr.icomera.net [185.104.138.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A27B74751DB;
	Fri, 19 Sep 2025 19:04:00 +0000 (UTC)
Date: Fri, 19 Sep 2025 21:03:59 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Andrea Daoud <andreadaoud6@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, kernel@pengutronix.de, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Possible race condition of the rockchip_canfd driver
Message-ID: <20250919-lurking-agama-of-genius-96b832-mkl@pengutronix.de>
References: <CAOprWosSvBmORh9NKk-uxoWZpD6zdnF=dODS-uxVnTDjmofL6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gge37mtwq6wtzjdu"
Content-Disposition: inline
In-Reply-To: <CAOprWosSvBmORh9NKk-uxoWZpD6zdnF=dODS-uxVnTDjmofL6g@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_120405_024858_792C910F 
X-CRM114-Status: GOOD (  21.29  )
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


--gge37mtwq6wtzjdu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Possible race condition of the rockchip_canfd driver
MIME-Version: 1.0

Hello,

On 18.09.2025 20:58:33, Andrea Daoud wrote:
> I'm using the rockchip_canfd driver on an RK3568. When under high bus
> load, I get
> the following logs [1] in rkcanfd_tx_tail_is_eff, and the CAN bus is unab=
le to
> communicate properly under this condition. The exact cause is currently n=
ot
> entirely clear, and it's not reliably reproducible.

Our customer is using a v3 silicon revision of the chip, which doesn't
this workaround.

> In the logs we can spot some strange points:
>=20
> 1. Line 24, tx_head =3D=3D tx_tail. This should have been rejected by the=
 if
> (!rkcanfd_get_tx_pending) clause.
>=20
> 2. Line 26, the last bit of priv->tx_tail (0x0185dbb3) is 1. This means t=
hat the
> tx_tail should be 1, because rkcanfd_get_tx_tail is essentially mod the
> priv->tx_tail by two. But the printed tx_tail is 0.
>=20
> I believe these problems could mean that the code is suffering from some =
race
> condition. It seems that, in the whole IRQ processing chain of the driver,
> there's no lock protection. Maybe some IRQ happens within the execution of
> rkcanfd_tx_tail_is_eff, and touches the state of the tx_head and tx_tail?
>=20
> Could you please have a look at the code, and check if some locking is ne=
eded?

My time for community support is currently a bit limited. I think this
has to wait a bit, apologies :/

regards,
Marc=20

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--gge37mtwq6wtzjdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjNqRoACgkQDHRl3/mQ
kZyo+Qf/T3m3vtjMMPeAzZSo9sBY5Ua+T7LYK3oU4OfY2FXjMwtwj7KG1YlMzZfB
EnKx8YEiYzxOsDhgPPMATwByRfx4MDXOTmpP/VkU6+bQJsNbJ5uox/LR56/Ss8wU
kiB1pcPpvnqaxLiVGStJ1Hy/LyKACHaKsXsFiBiUDCCovrz6Ogk1NTp9s5sa5HZC
piCOg4cdZqaNlC7P2tBa1hU9HrkdUn/bP+VYqdzzk85Z0DFsCi3WpdMkN/Dhymf+
eOoJ7pRSoKbUAiO+OMoGtxYgjtNKHW1GYhg3Q6BuLn+OFoNhigDhoeF62IJpGofO
lJKKMXeaO9WXM4ryfvXl6ra4MYxvSg==
=R78M
-----END PGP SIGNATURE-----

--gge37mtwq6wtzjdu--

