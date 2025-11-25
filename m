Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A46AD0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXijMCYNnJdE7UQPk8RxSZXhsEest8tLZXPwXBE3hnU=; b=OvbbiS+Tc4YeUaorLXp9n9nzzx
	fN6si1jl22kqzFPXW0gtAdMYg1I1rFQnK+Lwoid8+p04fSM/AdI8acpDLjWmu4KbBqlUZ3nhPkyWX
	wGI9PMkHSRZ0cnEbTSLsov+NHxNJAXP4V60+SXALNcInPG1aKtKHLqAsiaC0rvgXtlIJ585oJstUF
	r23Zuw0YSUyPOmv+cJbdRMe0E8Aem2H1HQpIPWEP8Qda7q9jNRThUCmFydblfhhzaG3m1KPkvTLSg
	wSDHBaIiT6IdF1t36/u+yARVfpggqHYhqoboxQCGmqD7xZ9W8EkqDwacbMFX8PBBFSB8tOkQanWfT
	MFCVw0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxCY-0000000DhuD-08fW;
	Tue, 25 Nov 2025 17:51:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxCX-0000000Dhty-1rym
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95219601AF;
	Tue, 25 Nov 2025 17:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BD8C4CEF1;
	Tue, 25 Nov 2025 17:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764093100;
	bh=EXijMCYNnJdE7UQPk8RxSZXhsEest8tLZXPwXBE3hnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6croIvphLl4gz0XbFJY54LXqq0XY8YQnGOW/3gdhkbNJrInNGzkVsMn/781hYjPL
	 tIIO3mbTV9JdfZzJ2zS9lZRW6QDnWbZTtkkWaHTPsdRnMiDw01jVABM9q/lMmis013
	 klu+MH/QI13gsHLdbHSWrmKy1/RU0kzCUwMUnpcJbDf7Wd2B7FgPJ0fnN+ic9oOxsw
	 6HDqL523hn85QspY7WFq41nuBuedq9KMJjiJokgWObDqfe7DRjI5OgNhbFFJPP29jO
	 mv/DAGskmVQHwXBc1iKrsWd6czN+ram1OOTS8dqgtqN0bvA8WWJByAXbqfyU7AGQ8R
	 KHmYScGnorgmg==
Date: Tue, 25 Nov 2025 17:51:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	frank.li@nxp.com, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: spi: Document imx94 xspi
Message-ID: <03542bc2-b124-4c18-ab3d-f18905814591@sirena.org.uk>
References: <20251125-xspi-v6-0-22b22de50cda@nxp.com>
 <20251125-xspi-v6-1-22b22de50cda@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ec2hrEYWTjbUPiDe"
Content-Disposition: inline
In-Reply-To: <20251125-xspi-v6-1-22b22de50cda@nxp.com>
X-Cookie: Too ripped.  Gotta go.
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


--Ec2hrEYWTjbUPiDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 25, 2025 at 03:42:18PM +0800, Haibo Chen wrote:
> Document imx94 xspi that supports interface to serial flash
> supporting following features:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Ec2hrEYWTjbUPiDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkl7KUACgkQJNaLcl1U
h9BcQAf/esEN6KIUbIfcZ4CNvRd6y+jdOFjQMquv3oexP3VS3Gmu17eBz/Ld8kmw
b+2E1ycOtyleZkpbynrc4ozmb09WJ2M6BW/pQ8RDsaDuDvBVVI9WfM7AeocRmcNK
7ftB1tU9MjVkyJCJ9lDXVqQLJw3KfxbEa+xfdvP7Fg0LI6gQjTpAcTPd148z5Uql
aliiQJiI/T/gnYERisrOzNd0AMkODKy1L5X5Te4S6K2chWaNJHGlM8j3xBOvl7vR
71Try90Vi9hJqAdAUvfEGs8mAixJIJgUhujASO8QX0e5M+SZpY8PwneSM2LYJm/o
2in9Dupq1yTlsZ7M2QMz7lhwUcezTg==
=YLuU
-----END PGP SIGNATURE-----

--Ec2hrEYWTjbUPiDe--

