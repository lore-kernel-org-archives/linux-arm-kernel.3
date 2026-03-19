Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C39B109025C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8GZbHUIj3Y/6Oe1KjBzpKCejXEtNxOlN7IxJAzIK6I=; b=2L/5SMAZH8m+DIDnwgO1JvhoS7
	wTiNB1026Rbepjbq1i2ieae4TLz4o2GzGWhZkF0yWrHCr7zW2QD5gfDIUwi/R1jqHgstEa2Ztn27K
	msTVljQOyFL4bsuUHrN5Ford5lWGPfdGIVPN23tYqDAHn28r9OVDzLmazvIq3eUzzfyz4vNvfPx8s
	LdOUoKhihlXv+PqJ1VJiClDp6dto9srKMDb9+KLU4U3n+ya9sVUXASjn/zUnPoHiSvjRvlBMAVG6V
	FopgVcH712yoIEOmJEkTOHMxxTfwivYmh+g+5FTX4i7DDWktHyVt6Dm4S1Mc0PoyUlazRjPHM+CMX
	JoIK4JUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gw4-0000000BA9x-3zCM;
	Thu, 19 Mar 2026 17:13:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gw3-0000000BA9q-0zEW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E0EE60053;
	Thu, 19 Mar 2026 17:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDD9C19424;
	Thu, 19 Mar 2026 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773940406;
	bh=M8GZbHUIj3Y/6Oe1KjBzpKCejXEtNxOlN7IxJAzIK6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sxc5EeRKYEVN1/A7GFpVO0aQn9D5SKSkzzLWm0iuEEQVCHehSMUzoECwJtxwMBwZB
	 gsthkr54G70IzCRCbHh8NkcGefvZgd6jyL8Ir7cb5G9SmOt/b0kxUf/WRrOlAuSTJI
	 Z+DXTsq67pTpBxjyCzuI5nMb7HYLHQ2F/KkKg/vahYgqDBvYHU58bFUw9/3p9YOLwc
	 hblX9FgB/dQarfekDfGBwOiZ2S7B6EiGR2dwF0lZ/AfdHEHZjDGMfH1+evtNT6Ww47
	 BZRnUjXpEWnL+185d7Pymh/Ne52UIEL85vEL5TOGveS7TrAbH2oPUyBW4YVpYfdDXR
	 6UqHC5Phkx5Gg==
Date: Thu, 19 Mar 2026 17:13:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
Message-ID: <20260319-unranked-bakery-8b735814b907@spud>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-1-2eedc01d8af0@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RTIVsBf3wxPgv8L7"
Content-Disposition: inline
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-1-2eedc01d8af0@nxp.com>
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


--RTIVsBf3wxPgv8L7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--RTIVsBf3wxPgv8L7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwusAAKCRB4tDGHoIJi
0nTEAQDbMCOrg64/o0losQs0rt/kE/TFy9uriXfqdjBLNgK4pQD+O/hOqrhmlk3E
dxsw54Rmx+qQaMs7yj48y2N0Sey4QgY=
=HmHV
-----END PGP SIGNATURE-----

--RTIVsBf3wxPgv8L7--

