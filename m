Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10896C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIgiakxNIvlbIOvXbpa9aAXTvVdIjMv2YRdjshxXmZo=; b=ur5bPeuqKYq0rq0nzCQ3sFa0Xb
	+nccujZ0AR35d2AcxE4UWgyd+4zDd24frcsA2minLHtzPDbmXLeferrrlTnJVJjEATOmEZCBwjPki
	GhhW8zGUvjHL6KXGbj8CYTjhD+ltca2xsaWkmdkemfuu4M4EO4mKIyHOdQaK/LAAqw5deyml3Kb1N
	vYG+zzdKZAgN1XvoTy24MB2GeRaGsoaa5+lQItTqSQ7X5X+Gd2VeC37gjdKwLXHkRR4qFwqhaQ2yz
	nDdSDYBQ1P6GgZ5UZ7l96vRuCeipURF+w3Fmowz23vdVZDav8d5tyvVTPDVK7VLV72VOmCwsyCxJd
	ka2ymQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9VR-00000000Rmq-3sTe;
	Mon, 28 Sep 2026 11:26:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9VR-00000000Rmf-08Y5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:26:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6540840C59;
	Mon, 28 Sep 2026 11:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248561F00898;
	Mon, 28 Sep 2026 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790594808;
	bh=MIgiakxNIvlbIOvXbpa9aAXTvVdIjMv2YRdjshxXmZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahxNhXzBmiYTokoVc3H9EOIJnhTiIRXS8yTi4jkl4NBTZ/Nv4WBvbWNNickZgLD1z
	 tNTkt7Rpv9XxkYAOXiaXinGpn1TVGBrrbxanqOu9maY5zQYsCbj2Kl2WxEpMoLo6lA
	 HyRfdH+ObdVSBA7w4w9JV+SDdnt9JSpXYy2YAyZS9KKWJSWRd9riZxE6F0W6HOVL9X
	 2iAWSuoOVWLw3Ct8h8c7Sh+0rVPFOiRRWCfOZjZSIp8/fNo5+a2/vmeOP2Yj4rEmOJ
	 tDEEBitSlXsbvXPDtbXy8t1DqLoOL26HqgSKvoMF/Kp/L8ROFcPMKaTrW/S34orq3w
	 f7DQ71vdlasSw==
Date: Mon, 28 Sep 2026 12:26:41 +0100
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
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
Message-ID: <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agS6p3a5qSig1fa6"
Content-Disposition: inline
In-Reply-To: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
X-Cookie: All is fear in love and war.
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


--agS6p3a5qSig1fa6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 02:17:27PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.

This and patch 5 are not threaded with the rest of the series which
really upsets b4 :( .  I'll fix it up but please look into your tooling
here.

--agS6p3a5qSig1fa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6TvAACgkQJNaLcl1U
h9AZrgf/VFOKxMUjK6hmwAHkqM+y0Ua45JlbNuxKyoHHyV84DmfhdqY51ofpXfuQ
6N+x6DTT+UZJkw8xrPqdRMRhps2mxGnkl0FdOiqAe1dR/VuGMOAck7lF80PMIOxD
CUljelqNF6bYnmr8MQ5qPzYIUn7VEcvZiirLFwT5OHfi5/x37fQUAFJ1YJFgq8MX
fuuBv1DOxVGdXUD5MsFdkcMfd9617FupVjCOhrZFQpTzj1yEvuAnmnTCs02wF/3S
QjBDyIaaTRdUFDag3qQ/tMKwfIJjvLDrHsp2iXwoQUdoL+Ga6f9W+QJUrBcoiu+B
TkSZSFWED6F7dnYsXunQoC0iWlZFGg==
=A3IY
-----END PGP SIGNATURE-----

--agS6p3a5qSig1fa6--

