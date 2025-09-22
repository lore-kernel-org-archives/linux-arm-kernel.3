Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFADCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7pqyN+Z24wldmlTOpFZF0TNsqoEvnNHZvrjYMilkQ4=; b=HK861PqvGkpZzJnVVK5bY7c8+l
	kmkPu6WAwecBR6YI/tgg6/KV08sqzBy8uD39uhVoU8tN0UIUge3gfvjA8Ui/ygf50dKcKf8fqAUaL
	KPCTcI5CTnY7pwvqbhwgpU7cBSRjruBKf/G8hVUiuu/Ls2tG4tJN9XmtquVgMCSNcerWUMth/l0EV
	4+y24Yuv63LEe3Z5mNalDvFyyoQ2O/9KDoPV/KuhFyRpilnVRORfhBcPPT3MBOcUlTUIpKMwO4bAq
	oZS4dHYRfCSJYbA6agKzYLf5AhICcJ+69h2e/Lja7kCVcaR24hM30uEXzysxuwMzxXq+AM9enfpeE
	WwOdf4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gLe-0000000AR89-0XLA;
	Mon, 22 Sep 2025 13:12:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gLb-0000000AR6L-08s1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:12:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1v0gLU-0003pc-1P; Mon, 22 Sep 2025 15:12:44 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1v0gLS-002bMp-1J;
	Mon, 22 Sep 2025 15:12:42 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 06C7C477022;
	Mon, 22 Sep 2025 13:12:42 +0000 (UTC)
Date: Mon, 22 Sep 2025 15:12:40 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: can: rockchip_canfd: add rk3576
 CAN-FD controller
Message-ID: <20250922-secret-visionary-macaque-4f52a7-mkl@pengutronix.de>
References: <20250922071543.73923-1-zhangqing@rock-chips.com>
 <20250922071543.73923-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ta3ykn3sqrxc7f3w"
Content-Disposition: inline
In-Reply-To: <20250922071543.73923-2-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_061251_070045_F2DBC00A 
X-CRM114-Status: GOOD (  10.87  )
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


--ta3ykn3sqrxc7f3w
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/4] dt-bindings: can: rockchip_canfd: add rk3576
 CAN-FD controller
MIME-Version: 1.0

On 22.09.2025 15:15:40, Elaine Zhang wrote:
> Add documentation for the rockchip rk3576 CAN-FD controller.

Please make DMA optional, I'm not convinced that it brings any benefit
for the system.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ta3ykn3sqrxc7f3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjRS0QACgkQDHRl3/mQ
kZzmYgf/XGDJsCLS4h1r22LbETIcTtzkKskRIg8uS4VtJ6+B3fpEpeSdiurlbgLJ
H2Uk60UC2qwtfCGX34k3W/KUZAcMiWUF0uSwIey54+V/47Z57T7tyF+qlLXavAJg
EvMzEqQBXo/HF7qKjn5zwGt/cfJzkaZ0gQurGnuGcVfQCtVh6yyjRK7zA3az9tso
9aeJjgqJxCR2Eu41e1X5ch1iFULgtRXPhzeUi1ApANoiqWy10XR1GpCRvOlMYxQo
d4Ss493hcO5HefbgwTXnJ12waxg3YZSOSfV9iRdiZoSdgeGZyYKd+Ffeyps8Ep34
DZMvjmPilwpExGCnFVr7LJBfrco1Ww==
=/ET9
-----END PGP SIGNATURE-----

--ta3ykn3sqrxc7f3w--

