Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FED1C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njHDg9TPmPFOe1xeh0cfM0MOR/WbQxurlE9t/RnZVKU=; b=VEyle/ETZfIjzHlYLdawCP1sDw
	kTTSkL6r4K46WblPCgR9knO1JyYw+0pWd+d18+kiHLSh1kdAjxwZIM/ZNAKDHWXJDpN63XZD8mcIJ
	FYyrJXuwPVwVkgkrITIC1ocII7OVSn2pPFJs5xjEzMj80vt/hDNoXJev+fMXnmYbJDUF2B4LoGBKA
	uhw03lvKFTpoS6O6iU/JoIpmF1+aDlr8+jQhNhSRyRIbNoHbWEYgW2taV5AWSjlCiAjlUiW/uXZCq
	GfBFE+8Ex62M+DpEJWhrhRV/n7RTcIWaiMmUETHXhSpnx3M16IJSdf0UULwjCcscSROvDiRvywsd4
	ozu2PW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8Dp-00000001V9h-0mdC;
	Thu, 22 May 2025 15:52:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7ne-00000001R3O-3omt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 15:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D81C49D13;
	Thu, 22 May 2025 15:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABE9C4CEE4;
	Thu, 22 May 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747927537;
	bh=PcuhumX6z7OaQzA6jK/bl3lCDvqH5Kb6Vjig2je/8Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKMRvHxRtmKr/lsNQjPKEPbn5xtQ8GLH/P5w6I/obPN9BZDaP6jX4qyqkkFnkgZpP
	 RKl0fiXqKKWmtxABF6dauelGdWPCF0s4W+p1y0oThdHlQ2bywos076ZckVCYGyWTTD
	 hW/BhUvoVnjimEOu7CdiYeJ+MpixAo6UEUlUwwDpG2r4UvAz9AsIBweCmR+4GgtAtn
	 QQDW90Fhm/g0JMYn5EwIYcbHJqVt77ZL46PJzTPjB3ZR7WjRQdM4W6dMFbNQ+T+wGY
	 jlHjMRseTDEEBQnmuCr1BFv1Be+m4MQmacQZCUFY9fUjhcax087qbXcuv2j5wjSMFv
	 xSFysuTPSkRBg==
Date: Thu, 22 May 2025 16:25:32 +0100
From: Conor Dooley <conor@kernel.org>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/5] media: dt-bindings: sony,imx214: Deprecate
 property clock-frequency
Message-ID: <20250522-coexist-quarry-46351c8ae247@spud>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fZTA2xJO3DxnrYMl"
Content-Disposition: inline
In-Reply-To: <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_082539_285380_38C76B62 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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


--fZTA2xJO3DxnrYMl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 09:34:27PM +0200, Andr=E9 Apitzsch via B4 Relay wro=
te:
> From: Andr=E9 Apitzsch <git@apitzsch.eu>
>=20
> Deprecate the clock-frequency property in favor of assigned-clock-rates.
>=20
> While at it, re-order properties according to coding style and fix the
> link-frequency in the example.  See commit acc294519f17 ("media: i2c:
> imx214: Fix link frequency validation").
>=20
> Signed-off-by: Andr=E9 Apitzsch <git@apitzsch.eu>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fZTA2xJO3DxnrYMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC9B7AAKCRB4tDGHoIJi
0oFdAQCfMg4K/R8gS988QZ2UFRXB7uW8XASfY+zm2n8l+MnquwEAh+VKDGZfQ5eo
YqZMQl0W5DZWDVKngAmXodEUexISTA8=
=iPFE
-----END PGP SIGNATURE-----

--fZTA2xJO3DxnrYMl--

