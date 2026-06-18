Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB3CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEo2H5hPXP7wiwlAi8r1q5W+2AonGUAeCyv2FcsB3Ts=; b=Yq/nbyDpcVroLD45BKigWRdHd6
	8iOWM9reyw4jAo1SJeUCdyqvoYXw5gk/sRMNaoa+1XbTtnucx+nAyTPzVvoZNGEcb6mR2ZhKn5L3D
	3aLA1AupawYz/nf9cTYaW5OX0NxBHhlUrhokfrVsvpHMLhf2NQT5ej9HLMvlGNyiBzt3hw8hEyMOq
	KVeHLCvbsIdv7KV17eshgNS5cIMPrf0wkyB3bKIT8HZWwxlTmHcdK1mbQ/DNexwrQF3DXUK0MPiHG
	3VZ5h7j9EcAlnA8eyeKvV7ibE7wv2PL1yUdIzCp168WHECHT03UBnOfcrj7CGE9hH2w8/Fh/93Bhk
	J/A3zqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF52-00000001XF0-38Rd;
	Thu, 18 Jun 2026 15:55:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF51-00000001XER-1dik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:54:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E74760008;
	Thu, 18 Jun 2026 15:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D19C1F000E9;
	Thu, 18 Jun 2026 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781798098;
	bh=cEo2H5hPXP7wiwlAi8r1q5W+2AonGUAeCyv2FcsB3Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cAHndvHTgH7xsgDq9U73etZp+681CtliqAEu36HI1QzOWh1HxyT9At83/hweDyiKb
	 xb6X8GYrQ4yKia8uHOVg9IeJaNM+T+IMoRe62xIo0xr78jZSfg2yaFuNbeeKTv1YM2
	 70hDFZox8lumOvxviceVy/NGxaArMkbQX2XooEOOLXh47TyUtyPaKLTio+/hZ6bwlN
	 2ibZXdfnix47KdUA18XxnI7K187ocx7OT5+dLLT4tS9Ayz2UM6oVb1FQLWZjEb9jh4
	 MymIW7Q1sxYLtd5IelO/VxzRWk562dgPDDPscz2mVmCs3u7SLuHgplyiEQ6o+3ksme
	 zBb+wlo0pAhZA==
Date: Thu, 18 Jun 2026 16:54:52 +0100
From: Mark Brown <broonie@kernel.org>
To: han.xu@oss.nxp.com
Cc: Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: spi: nxp,imx94-xspi: add DMA properties
Message-ID: <df5eed08-3be3-4ddf-bde3-97d5d02cf865@sirena.org.uk>
References: <20260617215520.3327836-1-han.xu@oss.nxp.com>
 <20260617215520.3327836-3-han.xu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yxnX1CTfXzVl5TLQ"
Content-Disposition: inline
In-Reply-To: <20260617215520.3327836-3-han.xu@oss.nxp.com>
X-Cookie: This unit... must... survive.
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


--yxnX1CTfXzVl5TLQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 04:55:19PM -0500, han.xu@oss.nxp.com wrote:
> From: Han Xu <han.xu@nxp.com>
>=20
> Add dmas and dma-names to describe TX and RX DMA channels for the i.MX94
> XSPI controller.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--yxnX1CTfXzVl5TLQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo0FMwACgkQJNaLcl1U
h9B0IAf/QVSaTxukEen1yvTKMq6oJ86umcRRPCGK0btvDvQrNLogVv+/AOqZpjz3
5eyYCQ4F08jn3BoBFQI86/2Hld9C0pefI6XE1zuQt6yLNn6iks2oXu4KZyIp+Ae0
QXUz0eXIWZtZFpJWgOoEp9TsO1D03xi9UOyzXBiOPHAPfNEDpEKa1MRp6t2/V0XK
9Wf1lVqkOSn+YSwJhIh9ic/fBB7NjN2wR4YjPDoAel6g8GY37wMI1DDKK8uJ1r/0
dhl/yWklxqirmX2/YC5pq6jGyEHgpHYIqFc1vTaE7spOsKec1NNkfhGRzH2WxbUS
utYfVKotCNqFm45IMmlQTiURwsTUXA==
=yx4k
-----END PGP SIGNATURE-----

--yxnX1CTfXzVl5TLQ--

