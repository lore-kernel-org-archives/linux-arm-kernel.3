Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F19C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PO2K4Ssqg7RBGCwe5X9pMMcZOtrjhgedkVtiGNfQ+k=; b=c24R/SnhcEVWQ058dVsWSVGin6
	FaXBoYXlx5errMfiX7HE4u+99NY1VzU1O7W+DVsqWXxDR/0+vqogq541Vjhtl/RFhTIfMlQs2gibO
	zP/bUJoliXqQCt0wCp9hQv2n35R/kd9DuJ/rW2Vd/qiqVRlcMOm6/Oq/GHJdCiYEFVplDg92GO6+a
	qsxklNzILguhxjCpdbuhl7UcR0JM5XxpDXbTnYs835AlmKT6aAA25B57JflXstKv/Rp3LF/lhYMtM
	1ir+w/Mzj7WCwV+/9UVV4rwVvDHTkyZWM/O58l/ghEqotc9WXxSUddgV3gS+BiQwYNryMFXQ/72e5
	97q/NYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRW7-0000000AiWO-2IxW;
	Thu, 30 Jul 2026 14:13:47 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRW4-0000000AiUf-3wAd;
	Thu, 30 Jul 2026 14:13:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DAD15202C77;
	Thu, 30 Jul 2026 16:13:37 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wpRVx-0023ms-2a;
	Thu, 30 Jul 2026 16:13:37 +0200
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7902357706C;
	Thu, 30 Jul 2026 14:13:37 +0000 (UTC)
Date: Thu, 30 Jul 2026 16:13:37 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
	kernel <kernel@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-can <linux-can@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip <linux-rockchip@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
Message-ID: <20260730-defiant-mahogany-cow-60152b-mkl@pengutronix.de>
References: <tencent_BE229ADF4693078DBBCC6C02CC0855C01E06@qq.com>
 <2b7519cc-9e22-45de-940e-2996c2423de5@cherry.de>
 <tencent_415F4BD31A0D950C4202CC08424010A28106@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="acta2h3uc54gwlp3"
Content-Disposition: inline
In-Reply-To: <tencent_415F4BD31A0D950C4202CC08424010A28106@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_071345_148957_4F72AE89 
X-CRM114-Status: GOOD (  14.27  )
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


--acta2h3uc54gwlp3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
MIME-Version: 1.0

On 30.07.2026 22:03:15, Cunhao Lu wrote:
> Hi Quentin,
>
> > Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Jaguar
> >
> > where we have all three CAN controllers accessible (two via an adapter
> > board). See
> > https://lore.kernel.org/linux-rockchip/20260730-jaguar-can-v1-0-9b566bd=
785da@cherry.de/
> > for more info and the test setup.
>
> Thank you for testing all three CAN controllers on the RK3588 Jaguar.
>
> I will add your Tested-by tag to patch 3. I am preparing v6 now and will
> post it shortly with this update included.

Please put your S-o-b last.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--acta2h3uc54gwlp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCamtcDgAKCRDMOmT6rpmt
0p1sAPUY4G1w3X2EqPgOZ9cXCnSglJTueBasAi2owfSEAwLgAQCzRXSnS1tT/dKq
jVnAyxj9YeLicq7OPQLH1eAL4l9VAA==
=/TNY
-----END PGP SIGNATURE-----

--acta2h3uc54gwlp3--

