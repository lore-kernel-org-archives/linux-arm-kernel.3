Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A52C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHwCLJyDeuWx/JjQt62OR0Vto9JTS8LaVyPorlwv61A=; b=LVtlEepTD6e4HX9v91obR1pxVD
	ACZ0jf0didWZxHaxpDYpJTyOb6K2JjwiNFVad1a3tVUAK03dTzcCZ0eB3fokMzpM32Yus8zaSyQVu
	TyKjafwjGZpdKROk5ZFO9YSO21KKm0tOzYJCuAPqs2ApfofweTNvidnzpCPPyTVNERnYs5lGaKANl
	t34db/T7nqKp0nVhZGkGzoURwpznBLwPCQQ1Cl2yapb2p6yg7VTJ5hazcK8tzHwI7C/MiSmxOyz0b
	IDd6QmABOz7u71NpAJba4qLGQZfNl3VPm0bANBmT3AS1YSv6U8Xcumdz/k5QbsVWj2U3nmaEY/HZD
	08Jxnp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IuC-0000000BvlU-0sPR;
	Thu, 17 Apr 2025 06:39:24 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IrJ-0000000BvHh-2f9t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:36:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44F5A1039EF2D;
	Thu, 17 Apr 2025 08:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744871783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=MHwCLJyDeuWx/JjQt62OR0Vto9JTS8LaVyPorlwv61A=;
	b=CM81Wz43G51dxJmGWG9E5VZzgOMqy4v5uVBHebc1PWgR3tHIRJsqZDPs6Ru/+Nn6K3N4eq
	778byT4teaB7knzj39mpJEAmHTEzPQlc+ZlRGVNB7SincnzMDsbjOIUMMQV35fCD08jmev
	OlG5jmPXKJ/qhY/9/9AhFUHGThrWc/5ADIa4t2rHhKYDzfEWNdYEm45+r5Mok+hF/V7OLv
	pki+AWGnMrJe1xoBEYrdazf/AMGQx/tiUN4kD/zEC6kyzWbW3NufDoGuyb0wbZ3DAkoaZK
	XQgao5QjAYa5hGeo+DQwuY0DDh3A2zqRC9Dbb/zI/Gb681FIfC4ghL0l3QA68w==
Date: Thu, 17 Apr 2025 08:36:20 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Simon Horman
 <horms@kernel.org>
Subject: Re: [net-next v5 2/6] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2
 switch description
Message-ID: <20250417083620.6322d9a7@wsk>
In-Reply-To: <6511c88d-7876-4f69-81f1-1206056d061a@gmx.net>
References: <20250414140128.390400-1-lukma@denx.de>
	<20250414140128.390400-3-lukma@denx.de>
	<06c21281-565a-4a2e-a209-9f811409fbaf@gmx.net>
	<2c9a5438-40f1-4196-ada9-bfb572052122@lunn.ch>
	<6511c88d-7876-4f69-81f1-1206056d061a@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OP3qBt+f/mJ28tgoAZOMfOc";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_233625_965674_489211E3 
X-CRM114-Status: GOOD (  34.30  )
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

--Sig_/OP3qBt+f/mJ28tgoAZOMfOc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Hi Andrew,
>=20
> Am 16.04.25 um 23:58 schrieb Andrew Lunn:
> >>> -		eth_switch: switch@800f8000 {
> >>> -			reg =3D <0x800f8000 0x8000>;
> >>> +		eth_switch: switch@800f0000 {
> >>> +			compatible =3D "nxp,imx28-mtip-switch";
> >>> +			reg =3D <0x800f0000 0x20000>;
> >>> +			interrupts =3D <100>, <101>, <102>;
> >>> +			clocks =3D <&clks 57>, <&clks 57>, <&clks
> >>> 64>, <&clks 35>;
> >>> +			clock-names =3D "ipg", "ahb", "enet_out",
> >>> "ptp"; status =3D "disabled"; =20
> >> from my understanding of device tree this file should describe the
> >> hardware, not the software implementation. After this change the
> >> switch memory region overlaps the existing mac0 and mac1 nodes.
> >>
> >> Definition in the i.MX28 reference manual:
> >> ENET MAC0 ENET 0x800F0000 - 0x800F3FFF 16KB
> >> ENET MAC1 ENET 0x800F4000 - 0x800F7FFF 16KB
> >> ENT Switch SWITCH 0x800F8000 - 0x800FFFFF 32KB
> >>
> >> I'm not the expert how to solve this properly. Maybe two node
> >> references to mac0 and mac1 under eth_switch in order to allocate
> >> the memory regions separately. =20
> > I get what you are saying about describing the hardware, but...
> >
> > The hardware can be used in two different ways.
> >
> > 1) Two FEC devices, and the switch it left unused.
> >
> > For this, it makes sense that each FEC has its own memory range,
> > there are two entries, and each has a compatible, since there are
> > two devices.
> >
> > 2) A switch and MAC conglomerate device, which makes use of all
> > three blocks in a single driver.
> >
> > The three hardware blocks have to be used as one consistent whole,
> > by a single driver. There is one compatible for the whole. Given the
> > ranges are contiguous, it makes little sense to map them
> > individually, it would just make the driver needlessly more complex.
> >
> > It should also be noted that 1) and 2) are mutually exclusive, so i
> > don't think it matters the address ranges overlap. Bad things are
> > going to happen independent of this if you enable both at once.
> >
> >        Andrew =20
> i wasn't aware how critical possible overlapping memory regions are.
> I was just surprised because it wasn't mention in the commit message.
> As long as everyone is fine with this approach, please ignore my last
> comment.
>=20

Just for the record - there was an attempt to "re-use" FEC enet driver
in switch [1], but this approach has been rejected as one not very
robust and "clear by design" (i.e. similar to cpsw_new.c driver).

And I do agree with Andrew - that approach presented in this patch set
is the correct one.

Links:
[1] -
https://source.denx.de/linux/linux-imx28-l2switch/-/commits/imx28-v5.12-L2-=
upstream-switchdev-RFC_v1

> Regards
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/OP3qBt+f/mJ28tgoAZOMfOc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgAoWQACgkQAR8vZIA0
zr3Z0AgAjNWeG5547C9lxo+unXs8/onbMnCfQDJ3YSeCUfVD1VDsiEa2t0Mo/Fog
nX9eR7DL85CJOQE3xlThujPztb/8w18Kf8J1ABg53mDanqEvgcABhF0fxyBOlWsP
gSJ3fWaVflKSf43uvylKO0OoEU6Dzy26YRX3CaM3nHcBJL3YatBiXxZH/m/lGS5S
2qqjLyTj1751iu1Q0euhZkxric47TZkMqDh1oARuNu4LjMX3n1/RkoZPuHH+AS8E
8tmfzKYa3GDNF15Kkv2sx2QnljPfEA9kVLNrXB/adUESTwgVhH22GdIbSF7wYwus
6QupQoOBSRICo3cnVGDHkY4J6nSz7w==
=4Q3t
-----END PGP SIGNATURE-----

--Sig_/OP3qBt+f/mJ28tgoAZOMfOc--

