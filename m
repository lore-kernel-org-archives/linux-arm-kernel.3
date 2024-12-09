Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8818EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8XdFEqpvTx8cUZQaRLgDzSLnKQqy77sFCGLrBuNCbM=; b=gythMyqDLVtPorDycrVBWZkCPp
	XS/ko/QWaZiEUOiZO/1QHQ0cQ299QahyEV7p0t0xx2rs1VbOV7rkIkI2VcrHDb1emeyhSsysY4sRl
	GcobaYSkqF8ricazvckVlF+Zre7Qrzay7bzeurV32eMTfxgRpNenanuVjzhI4gb0jL/bjSh04LK0j
	/UKqoUs1uVCQZHbq8H+NCFB0lF9lGcdX2ni7hDxuWuTi4N/yQFo3zBkJQy0nyDqB320Mbmoaz4EQB
	KR8jJZgJNzptGa8ke3yWMXC0z/K5e5uOaDzmAgLeNvdOTdncr6EKBS5D6Zb4sAbHfxwLRVBT3QoRT
	kmnKIbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeo1-00000008DWt-3Pnd;
	Mon, 09 Dec 2024 14:32:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKemy-00000008DNE-2ihZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:31:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tKemm-00057P-43; Mon, 09 Dec 2024 15:30:56 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tKemk-002Wue-0q;
	Mon, 09 Dec 2024 15:30:55 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8DD5C389BCE;
	Mon, 09 Dec 2024 14:30:54 +0000 (UTC)
Date: Mon, 9 Dec 2024 15:30:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,2} boards and
 add gen3 board
Message-ID: <20241209-magenta-boobook-of-respect-14ec68-mkl@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zcg6nifetr3cb2sn"
Content-Disposition: inline
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_063108_684458_880B27CB 
X-CRM114-Status: GOOD (  18.55  )
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


--zcg6nifetr3cb2sn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,2} boards and
 add gen3 board
MIME-Version: 1.0

Hello Alexandre,

On 19.11.2024 12:34:57, Marc Kleine-Budde wrote:
> Hello,
>=20
> this series fixes some problems found in the lxa-tac generation 1 and
> 2 boards and add support for the generation 3 board. It's based on an
> STM32MP153c, while the generation 1 and 2 are based on the
> STM32MP157c.
>=20
> regards,
> Marc
>=20
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> Leonard G=C3=B6hrs (6):
>       ARM: dts: stm32: lxa-tac: disable the real time clock
>       ARM: dts: stm32: lxa-tac: extend the alias table
>       ARM: dts: stm32: lxa-tac: adjust USB gadget fifo sizes for multi fu=
nction
>       dt-bindings: arm: stm32: add compatible strings for Linux Automatio=
n LXA TAC gen 3
>       ARM: dts: stm32: lxa-tac: move adc and gpio{e,g} to gen{1,2} boards
>       ARM: dts: stm32: lxa-tac: Add support for generation 3 devices
>=20
>  .../devicetree/bindings/arm/stm32/stm32.yaml       |   7 +
>  arch/arm/boot/dts/st/Makefile                      |   1 +
>  arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts  | 267 +++++++++++++++=
++++++
>  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts  |  84 +++++++
>  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts  |  84 +++++++
>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      | 100 +-------
>  6 files changed, 455 insertions(+), 88 deletions(-)

since the merge window is open, can you merge this series please.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zcg6nifetr3cb2sn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdW/xoACgkQKDiiPnot
vG/URgf/dtYmL9iBc+SHfx64MvPmj6DNHBSLqZnmsOY7n3wqlr+iKYz+6cM33m7n
mixEvaSXRcmbC/LnORRf2tRwJKu5d7P13lS88jWSyOPXhyfzcSYfFzKDYURjmNux
UISMbF/3QA12/W11Kks7pl0FFzhSeuHSTek6BSFJ1CmTKYrIQnoZIYAV8MsytUej
4P+MFT0SXYEMgMKObA7uxcSxWlwSFVKv3Kw8Zl8gj3SDsLWmuxdT5f1k/n+EIFmZ
B4BTT4VKiI/aVicjk+Wfa/EE24YtsIZeg3RbR50o04xVlRWFRwzeIfOh2HwH5vmQ
9v692jmzaPq3TR3977WzO0Hkxo+H4A==
=P04U
-----END PGP SIGNATURE-----

--zcg6nifetr3cb2sn--

