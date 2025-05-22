Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CCC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYgdYMD4nl8RSbx4G4+TswzTUFW0mTExeNOlROMkvNQ=; b=Wxb64MI2tHiPaDMwjBf05rZbom
	I88qhKokhJUviDy3CFo3gJmUE4l0YqlUgHH4fwIUtD/EhuSkRvkml2goHTXSV9II0HAyhWQimLJO7
	ujyAZkSLf6Ya/scr4VPyVgVjgR0H9/X6ZblkWiGHIr0ZPmaesjoGx9ygXr9hu0ScCx5aAUUiSt4em
	gPyW1LGBBHOnZXzlrUdtD5QoBdkmE7YUsUdaUjZ5nMHoox4tPJQPivHgeEf0ZWpxMNuPqLFIpmGZ+
	BQht5AApfg4hnjXOT9YcMo0fk+uYv0ehiNtlwQqMt/1JE4etwSAavG+3bFPiW571R/Sd8gF37CEs1
	U7XOLYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1sC-00000000QHO-2diB;
	Thu, 22 May 2025 09:05:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1pA-00000000PZh-1wu5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 09:02:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI1p5-0003f4-CQ; Thu, 22 May 2025 11:02:43 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI1p5-000huU-0F;
	Thu, 22 May 2025 11:02:43 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2264D4175E8;
	Thu, 22 May 2025 09:02:42 +0000 (UTC)
Date: Thu, 22 May 2025 11:02:41 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: rk3576: add can dts nodes
Message-ID: <20250522-poetic-sloth-of-memory-3c2e33-mkl@pengutronix.de>
References: <20250522063232.2197432-1-zhangqing@rock-chips.com>
 <20250522063232.2197432-4-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t63acjbvqvulm4br"
Content-Disposition: inline
In-Reply-To: <20250522063232.2197432-4-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_020248_500531_62DC8028 
X-CRM114-Status: GOOD (  12.41  )
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


--t63acjbvqvulm4br
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: rk3576: add can dts nodes
MIME-Version: 1.0

On 22.05.2025 14:32:32, Elaine Zhang wrote:
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Please upstream the dtsi changes via the rockchip soc tree, once the
yaml changes are in net-next/main.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--t63acjbvqvulm4br
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgu6C4ACgkQDHRl3/mQ
kZyRDwf/WT5jFUA6f9sJPzL/R7UCu5fTOaxRuiSdEflm/vzbTA5jgKIwjp1GV2E7
BtTYgX5bKQ5f4jUlt9OYozeFVHpXcuxvGHaCHV8tdIq2jDZI+RXazlNOMouRWgxw
+SKGlXbV5sCVxa5DObzCjvZsgZhaEsXm+vYGuuWZfYVbfnn/oqMcoZrGe+DvdpR3
glDLQA7Ikz6JFh1HwlShFnW3EvB9f7NkRelHm/DGigbLxtx+FEFENtW7/xFmEeML
rMkNT3XcFMq6y6MhtssU78OWaJod6LvAfwR2xcYJY68jACl6oGr8uzVOpZcPnPIn
WtU9JbU0AsDZntgGtlbiTH+uBxLPAA==
=ku/M
-----END PGP SIGNATURE-----

--t63acjbvqvulm4br--

