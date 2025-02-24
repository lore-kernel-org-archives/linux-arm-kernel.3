Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E2EC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n8xmeVnIYK+qUv4a3XKOCWPAYrS0FhZhKI75bd5GAI=; b=yGDwyJs2wfN/JLg9kWFhGRODI9
	PGTI47iBVyYETMtFyw/d9rWnd9d93xRh9KQlU8fYBIe9NiUSx7zcmuCmcLwpG1btFn0AK1l1crsL2
	VLCJ7FPQmssuPMggF1oa+DI38TRJUEeFceXuLutwy1f19QxNoKrTg7vaVYx6yyNxss5cqCJeXZRYK
	u4wjRfkOU7+b7rAhAznKuimjxUOnIUELAyWZ4CTwyuxLwJiC91asy4vbs7zISmc+GLd+URTeybD3+
	992DfCr1W0f6Jee1yUh0MokCmSzDPmA5uhLwSHHeY1vLh3ymERdMYoemWP88ATxoD8CIzx3cYVOM3
	ZYo5uz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYpa-0000000DxrW-1Eta;
	Mon, 24 Feb 2025 13:49:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYma-0000000DxFq-2eip
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:46:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tmYmO-0007oj-Pq; Mon, 24 Feb 2025 14:45:52 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tmYmO-002bVW-12;
	Mon, 24 Feb 2025 14:45:52 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E8E753CA816;
	Mon, 24 Feb 2025 13:45:51 +0000 (UTC)
Date: Mon, 24 Feb 2025 14:45:50 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Enric Balletbo <eballetb@redhat.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
Message-ID: <20250224-quizzical-tasteful-chupacabra-acf14d-mkl@pengutronix.de>
References: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vdjp2jj2cgfxv3yv"
Content-Disposition: inline
In-Reply-To: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_054604_668361_931F5C47 
X-CRM114-Status: GOOD (  12.43  )
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


--vdjp2jj2cgfxv3yv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
MIME-Version: 1.0

On 24.02.2025 15:40:16, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> Add FlexCAN[0..3] for S32G2 and S32G3 SoCs.

The dt-bindings patch that documents support for the S32G2/S32G3 is in
net-next/main: 51723790b718 ("dt-bindings: can: fsl,flexcan: add
S32G2/S32G3 SoC support")

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vdjp2jj2cgfxv3yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAme8eAsACgkQDHRl3/mQ
kZzAFwgAkC2NY97unwSJJHjQK4vv1/t6fMnSIY0SgTnQ8Ch+OBenrj0ykSdhSdB4
spt7Ly83UumxmXfGM/1IWobj4tyx63ryqWEztyV5WojY8I+VpN4BoVLY9q1U58oH
ia1Ns6+5XSh3cUacaMn4pCOf3gJbjlGZxy0Yomp9QiaSDondf/osnjCVVTA59Zjj
q7yGEuUT83Q877UM39YCc/h7z1qFnmJV8av6IyrQoZLn8oX3bx8HIILM1PIJ6D5M
eLhwB7Mr2Oh5G20vDoq+VYNVxn7Uuwzd9lzOcm3g7DoQ5l+iLsaxQG7+aXOAV4o+
5YZzZNaiLlbyD3ZjL59b3PFtRefIwQ==
=98NH
-----END PGP SIGNATURE-----

--vdjp2jj2cgfxv3yv--

