Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD76C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsbOD0ovJYP26C+oDXqBau2VZmi+nsbV8iJk5BuDqPg=; b=JS2Ckzh4obcrB9WutklhzIiVYO
	lrLkB4eqCFIZMVpeOeTPV9BSW8U46SMfLJSuo/rLSkd4ENkIox2ymgpN8cuvuJYfB6972UiEICRhx
	KGoPqtRiS0c5YZBZxE23YOtUc0hjk+/RWbldj3/Lb2WUkAg6hlTxFTfJqFEBZk1jE6EN5xHRbfyD9
	9XriNImMw1ffoepI0+1O+Q8G1+8oyJVKFyxNxu9MZ5mWI7tYwTZYJudDHBqeHwjku4SZh0AWe6aWK
	oXoI25+TMW4WxeZoyiiD+RX1ay3SKHrNQFfwpk5iW5CxEhRosYgp8DXPS3YzyuGEqDY6nKDUvIUtH
	DU1BSkiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyS5w-0000000GQB6-0NKB;
	Mon, 24 Aug 2026 10:40:02 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyS5t-0000000GQ9n-08Zb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 10:39:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 890CC201917;
	Mon, 24 Aug 2026 12:39:53 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wyS5p-0035gX-1U;
	Mon, 24 Aug 2026 12:39:53 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 26F6358B2AD;
	Mon, 24 Aug 2026 10:39:53 +0000 (UTC)
Date: Mon, 24 Aug 2026 12:39:52 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: arnd@arndb.de, olof@lixom.net, soc@lists.linux.dev, 
	ychuang3@nuvoton.com, schung@nuvoton.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Message-ID: <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
References: <20260708082457.460710-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="orpiuns42rsyvflb"
Content-Disposition: inline
In-Reply-To: <20260708082457.460710-1-zychennvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_033957_227625_78D4195B 
X-CRM114-Status: GOOD (  11.39  )
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


--orpiuns42rsyvflb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
MIME-Version: 1.0

On 08.07.2026 16:24:57, Zi-Yu Chen wrote:
> Add controller nodes for the four Bosch M_CAN blocks found on the
> Nuvoton MA35D1 SoC.
>
> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
> the CAN controllers receive the required input clock for 50MHz operation.

50 MHz is an unusual CAN clock frequency. Better use a multiple of 40
MHz. Within the limits of the m_can IP core, the higher the multiple the
better.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--orpiuns42rsyvflb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaowfdgAKCRDMOmT6rpmt
0mIAAPsFglUP+fkdaOYrAYAkWdF9FEg7F4iWq6H/hk8EI1q70AD9EjWExtou8CWm
bUAesYOpNW53On7fiKeR6VuPs+71UAw=
=L8lk
-----END PGP SIGNATURE-----

--orpiuns42rsyvflb--

