Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=714y3A3V2HhQzTBCArswFPgqwcIAsycvl1HvTDwmRSs=; b=dPCCIZ1RyXb/40uNWbCYarkr4X
	vA9gDQh/Uhc4xbxYLWuQzJCT3tAfEpKBfiEJ2VWU/KY5iKpdGPyuAaKuXLvo/m0V8Nsdz394qkHrL
	1dqnjXiNe4v9IWyqqsvmNGZefqebnn/UAGoEFHxJhecVyHjx2ulX+enui7RngMswPiKf3P+DPQqin
	EDbBnVawif3skSJ8Bp6GTntYzOGmeNdG5KMtjYGdW3dpippciiAmAglWHf6sFT4OxWhCR2pv8zePF
	oTHd8iuj1af5/PEYFVAjLSDihK4npSNZv1fzvdbP6iBwGU8uDXWGa66Ps/NJnsB9H8ANMymQyPkEI
	FWZcPh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCaE-00000003pBP-21jS;
	Thu, 02 Jul 2026 08:15:42 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCaA-00000003pAh-2Y60;
	Thu, 02 Jul 2026 08:15:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6AF33200F84;
	Thu, 02 Jul 2026 10:15:36 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wfCa8-005iP3-16;
	Thu, 02 Jul 2026 10:15:36 +0200
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 0C16455E028;
	Thu, 02 Jul 2026 08:15:35 +0000 (UTC)
Date: Thu, 2 Jul 2026 10:15:35 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: heiko <heiko@sntech.de>, linux-can <linux-can@vger.kernel.org>, 
	mailhol <mailhol@kernel.org>, kernel <kernel@pengutronix.de>, robh <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] can: rockchip: add RK3588 CAN-FD support
Message-ID: <20260702-deft-grebe-from-camelot-1bf360-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <tencent_534F9A1699EA04B091BF8003C479BFA32607@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vcp7brl22t3ha7yd"
Content-Disposition: inline
In-Reply-To: <tencent_534F9A1699EA04B091BF8003C479BFA32607@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011538_798646_2A66F725 
X-CRM114-Status: GOOD (  17.95  )
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


--vcp7brl22t3ha7yd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] can: rockchip: add RK3588 CAN-FD support
MIME-Version: 1.0

On 02.07.2026 10:53:53, Cunhao Lu wrote:
> That works for me. I will prepare a v2 with:
>
> - the binding schema changed to use enum as suggested by Krzysztof
> - RKCANFD_QUIRK_RK3568_ERRATUM_6 enabled for RK3588v2
> - your Haikou patch added to the series

Is the SoC you're using actually a 'v2' silicon revision? At least on
the rk3568 the downstream kernel has code to read the revision.

> > But if it actually works, then personally I'm more than fine with
> > enabling CAN-FD :-D .
> >
> > I guess Marc might have more insight where the FD issue triggered on
> > the RK3568.
>
> I will also double-check that CAN-FD still works with the v2 changes and
> wait for Marc's feedback on the CAN-FD issue before deciding whether
> RKCANFD_QUIRK_CANFD_BROKEN should stay disabled for RK3588v2.

Compile the latest https://github.com/linux-can/can-utils/ and test:

$ cangen can0 -I 2 -Li -Di -p 10 -f -g 1 -c32 -b
$ cansequence -rv can1 -f

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vcp7brl22t3ha7yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCakYeJQAKCRDMOmT6rpmt
0ijEAQCCAxydwZ3i3hutlhk/dlVU3grIENXTT9QhVTiaGUAU4AEAg2reTTImi5Jb
Wd8vJRDW/vzbjqvE0edXoMky/cI/Ggo=
=ZccD
-----END PGP SIGNATURE-----

--vcp7brl22t3ha7yd--

