Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B5ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBWsjCFrH9n831mWGNuiepEV6u0UFeNqezMi0WiliNU=; b=qgILcpRWyEUhFKaLOyIwYioTQH
	9fNKFvGnyw5gSzTR1SmdMJZZwQ5+laCiNyDm3e7ObP/hF8amuLlyIFNwW/kSfXeMc43Gq+Md6vokF
	Apk3ioEkWoffTLql3aKRTvxpnbf4OHUiuKcLRHt7zfqnvXyU0Knuc1C7VIgH0lFAQZgK8B1VoMnPr
	wxV6xhFUeBK3BHBX0Ip1itDMsLvfqP1xNmuxVFXbMSgT9YZZv/JPhP6mG8vgtXzzSOfRXSFs/tH30
	JIxA9hpr5B0qaOdHbS2n46VO15LT+MmoNVrCgmkFkpQvu6yX2Nn4goW4Yiw4IV7Yxjd/KcFx0G9hf
	alQiUiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEoH-00000000wgj-23sF;
	Thu, 21 Aug 2025 23:35:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9nj-000000009Hd-0hwF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B80D43FCD;
	Thu, 21 Aug 2025 18:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7FEC4CEEB;
	Thu, 21 Aug 2025 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755800053;
	bh=nBWsjCFrH9n831mWGNuiepEV6u0UFeNqezMi0WiliNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8QczOCu3hUV3EkOPZUZoDb6NG/gF9OkmSC6u9l6/LSrHjBoxfoLrnSur8aZwduuU
	 3iBm5CHqlpmIp88XTqjKZmv56SEDkoMIwKB2Ury1FTapOrxBWHEbdLwRuYdKd4AUOK
	 ECVewGg3dzWJSlvysrqItlyGL5U4TaDsfXFPOCohGVwnOhM2K98k5wSsBVdjuWHWwL
	 lkmvza+LcbhIy1RtJ698Ce0Vdty77capjEf3jmeFMQbXOGb4BG146PftJmWFViZxV+
	 x+Z36fIOs9cMxtOvAtI1JXK12jGd7IBeIFKv8Sn3QrmQ+N4fMSYSUUAvERID6foUmk
	 UM/Dc2Lidj0Rw==
Date: Thu, 21 Aug 2025 19:14:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 7/9] dt-bindings: pinctrl: add compatible for
 Allwinner A733
Message-ID: <20250821-pancreas-unadvised-301d1c97d893@spud>
References: <20250821004232.8134-1-andre.przywara@arm.com>
 <20250821004232.8134-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fN0j2auDIV16SvDf"
Content-Disposition: inline
In-Reply-To: <20250821004232.8134-8-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_111415_226696_63C5DF50 
X-CRM114-Status: GOOD (  13.37  )
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


--fN0j2auDIV16SvDf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 01:42:30AM +0100, Andre Przywara wrote:
> The A733 contains a pin controller similar to previous SoCs, although
> with a change in the MMIO register frame layout.
> This SoC uses the new style of DT binding, where the pinmux values for
> each pin group are stored in the new "allwinner,pinmux" property in the
> DT node.
>=20
> Add the new compatible to the existing A523 binding, since they share a
> lot of features, including the number of banks and clocks.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fN0j2auDIV16SvDf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdh8AAKCRB4tDGHoIJi
0lKcAQD8RyJydvqrkR+jJa3Wl0CkRS+neXINdwjdjqrN8vpVvwEA5y2g4dnXspVS
iaMQLZXHzU4D05bspJveUFNNS+RimgQ=
=OXBk
-----END PGP SIGNATURE-----

--fN0j2auDIV16SvDf--

