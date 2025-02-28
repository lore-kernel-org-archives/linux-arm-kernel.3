Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9F7C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuBv0dI0/7mGcCyImiY+YF7W4pXWyjFanOGgVtp4H/U=; b=G/1WgouvDlSAKJfxcxKoGcigSt
	HrEEbss6rcBFh/GJvTsov6eZ6dQlByIfzTb1OQB+ps0puJefVWnw4vdG+wh23NX6nd+TBF6ExXuv8
	5VtSFbnNdThxdu7NDAj/kpB4eo0J+xeTAaOzvYaEYG9ga8zccfwRSVSxSSNhp+gkY8S7xUEeCY4Lh
	PoEJTuZ8OJu5p/fsh818ZLNtO26BPLGw6B6KUyi01WDTsU3hh80pn/YO69oKiKWyiXfCwB/tGzX0r
	VuNd6KcOYWxn2+owyyKLsupfJr2sru9DjjArquoPBRCJw5Tk78osSv1uwWydbYNskrRdsBmReLZOB
	7P98aUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5US-0000000CFX6-1T8O;
	Fri, 28 Feb 2025 18:53:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Ga-0000000CBkP-3QiX;
	Fri, 28 Feb 2025 18:39:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CC3C6115C;
	Fri, 28 Feb 2025 18:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50378C4CED6;
	Fri, 28 Feb 2025 18:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740767959;
	bh=AuBv0dI0/7mGcCyImiY+YF7W4pXWyjFanOGgVtp4H/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1gKP1tGmO9TCsk0ojlDHgr7t6xSqubmNlFaFN0Zcjf1EuVDzyjAk3oTvXU6e9Jw1
	 W7jVhZXcLOmbIq5P50+yAmazxWvz/R7piauRNjADNHxPKVmhbVTs8TgtE+LzJdYFYe
	 xxK0pPSnpmJSrMNTZ1x21jqdLlZTCAVcil98FmAb+HeMPSwDXxePWr1HBx6F3mqP+j
	 VEqaObXKSs7/Tkly1YB5VUejsSHz22GCU0PNONVdY7T6EKqgfVRFAv5aijBPSuNb6Y
	 6o2mT5pe0I7Se913Szspc84oA3zbmsMwfqkPdGrlMWHrpcePLCVsVXYEH4BFe2PilP
	 z/MKA2lEywZwg==
Date: Fri, 28 Feb 2025 18:39:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
Message-ID: <20250228-gloomy-revolving-f56eea5ab8ca@spud>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/leG0Q2y3eS4Gkis"
Content-Disposition: inline
In-Reply-To: <20250228064024.3200000-2-jonas@kwiboo.se>
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


--/leG0Q2y3eS4Gkis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 06:40:07AM +0000, Jonas Karlman wrote:
> The GPIO is accessible via ioc grf syscon registers on RK3528.
>=20
> Add compatible string for RK3528 ioc grf syscon.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/leG0Q2y3eS4Gkis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IC0wAKCRB4tDGHoIJi
0jdtAQDGvTMV164jPUzRBKHwNEW+vXfylxVnqteojSFn8YFqRgEA92nhRCxirp16
sRP2GIrG/z+LYbF1tzPyGfKyIy4hpAM=
=njOY
-----END PGP SIGNATURE-----

--/leG0Q2y3eS4Gkis--

