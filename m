Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E62C4452C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGgq0kgANQfSfLYugyd1czX94b3DsWuJoJbSm/P4QPY=; b=zAnhHOlBK/x4Ag+OKKPR1SoWTi
	1OPlXNbdf83h664FfLQMNXN0249D/+1Z2NZbv3vlfbqjgIbhbnvspDNutsNxkZvO5OXxYzeFgV+Mr
	lRO1JNCiGp+mD2nG8ZPbh4Dtlos7NymrhyiTrakOkUsoEgbwAu+a8cRZE8/vUy+7OHHuY5JqcBLGC
	4RDiZ7pP8kzWoaxF9nB7T1Ct1WZ9kLGxgkrXTJ54SENjnrZQGn/MjMHRCv3Cm2HQ5Esi8YWdX2gZV
	mb42iVGYWcDA8Dh/dhL9kHFY7u1lcmSWylRSfXZwSdtEDChFeEb1vD8nR1QR7MOvpTb7uWt9LVnit
	CqXteDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloz6-00000006y1t-3NmW;
	Mon, 20 Jul 2026 14:28:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloz5-00000006y1k-2vqz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0826C41093;
	Mon, 20 Jul 2026 14:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40541F000E9;
	Mon, 20 Jul 2026 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557722;
	bh=YGgq0kgANQfSfLYugyd1czX94b3DsWuJoJbSm/P4QPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mmjA/ibQFEKvbtDANfHjDwYzondvF8dCGbOlKvcYXhqfyoFvsJWBlVT3fMQ4CW2dV
	 EsVz1jSEX9nkyB2WD2Kp3gIZPs9paB0Ex9FU6eEBnLbe/2SYPmdcBX8juues0+1VNL
	 dMhG7MgxWgHpzUCpZQZlbgxXCNh3a5jbFg2UrmL4BDOwV1BKNxBAV0mHb5i2JqpxsF
	 QREQ1LPDXsK1d/CsVddkt39zQPKqPhUzNy+P9b+IpoZcw46UMTuiGuR+6xPoeKbed3
	 RSyVwbN5yXBs/7n0Ss5NcADewMl+VwdXAExwUvQ+oRbA71IAIlG/zoPt2nMGWzHetl
	 OVpuzQYTUwazw==
Date: Mon, 20 Jul 2026 15:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port
 binding to support multiple pairs
Message-ID: <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UXRfRhuyL0flFFDD"
Content-Disposition: inline
In-Reply-To: <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
X-Cookie: Caution: Keep out of reach of children.
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


--UXRfRhuyL0flFFDD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> The existing binding exposed only a single generic audio-graph port,
> which cannot represent the individual pair endpoints.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--UXRfRhuyL0flFFDD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeMJMACgkQJNaLcl1U
h9Ctbgf/aH7yDt8XXrgvezUpFfpFQ5mZqqk3wPckaCo6daYpU4BG1u+NUAKBzvhl
muNUxzj7qKiFil/axJI6oSs/DwlazpzaLVOVlZI+GiLaec8Dv9QaKqpQFs7E4lAF
/V1cjx5SJ716WveCM914F7i8GWb8H2XLBo++jlEyTgOE3JRiiewPmrLl9HgSaA8B
ZxIIA+4GBGrmjPn22q4Sbs+orGPuVYBQuqyrsJYi5aGn6ANHdl/Qv2lEleJwqgWG
XcAMLGE16UceqIkZyJOQZf16dODg0S7zSLSJ8UuujFWFfxmDNuSs2Hm+X1eY7A4V
Sgyi6yiw5s3KskslFOtv5jPz7bNC1w==
=Nq5N
-----END PGP SIGNATURE-----

--UXRfRhuyL0flFFDD--

