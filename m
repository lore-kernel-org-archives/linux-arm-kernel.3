Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050ABF4BB65
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbM5X1ABKGJBM0Lo8ehvx7Mq6JO/Zeb1Ds6co8Wlp1U=; b=jzxnCVByDDqJBntH02E0qDwyQY
	7Qx6evjr1RTgozkZJuCx52uXsMfACn0eTdLAvLm1jnt79S3GYm910c47U7jmatgbg3i76iiV5k+fI
	LCBiiN7Hl+7MjEdeQmQf1vKgcQ1sZa97OwJFsUgmph8jQui4ufiKZZ04c/UKMDQP2G/Ijc8qs7dFf
	L3mIerkQ2pg3DU4jbygjudFfFmcH+BVFq649R7YZuXzWbcIlIlXkqu3pVIfnHb3/wIeBqOUCOoKz3
	5Afsl3V3oSK9g89WpjoAGxRBXa3fFOet8CwtPVmVamOUucxrDAy5Rar9bD8InX9+ClRlwO4QEnxPN
	Zfcle+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwRO-00000002VOG-3MhK;
	Tue, 24 Feb 2026 17:43:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwRM-00000002VOA-2viz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE5A160097;
	Tue, 24 Feb 2026 17:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E186C116D0;
	Tue, 24 Feb 2026 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771954999;
	bh=6W0OxqSdiXXEXOTbMnCNWEv8J0q6IEYD250aoiMd52k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQpBqB5yrBSqnxhrOCutJ6tv/6hR2hQlsDp7EKwCYp2QUy0Ocz8HOX5GqK4jsxevq
	 1Um2cW0arDx6hAkL6GVOQJewt0dsLsNHIx00odNOHIwnI7hp5tvE3nOepxp2zPK1yF
	 ljEbkMLVMhCGzi16WcfxZ2jySb0UFXQAgBP45GHWpMT3kLL6uxmnjPwoqrHNTdTrCS
	 Q3xRTXmT5/4EXRzKmXR30tNbLpYje3yeTkvTCaxFXGENW8GrHEoSrBXdwBMB5TBFS+
	 xtjJQ1aAidZlfWcVRE1/rrYwnKUB/DrjaN7CFukmQAMa65kczzlCkEvfWVVm+34hd+
	 PLdBGN7yogrpA==
Date: Tue, 24 Feb 2026 17:43:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu@tuxon.dev>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Message-ID: <20260224-recolor-hatching-e7d1b1894953@spud>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a9Oce0LrKqM5UBEG"
Content-Disposition: inline
In-Reply-To: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
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


--a9Oce0LrKqM5UBEG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 02:46:45PM +0000, Akhila YS wrote:
> Convert various legacy .txt bindings for Microchip (formerly Atmel) AT91/=
SAMA
> family system peripherals to proper YAML schemas. This includes:
>=20
> - CHIPID (SoC ID register block)
> - PIT (Period Interval Timer, old style)
> - PIT64B (64-bit Period Interval Timer, newer parts)
> - ST (System Timer, including watchdog subnode)
> - RAMC/SDRAMC/DDRAMC/UDDRC (SDRAM/DDR memory controller
>=20
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
> Changes in v2:
> - Change email for maintainers.
> - microchip,sam9x60-pit64b: modify compatible and clock-names in properti=
es. =20
> - Link to v1: https://lore.kernel.org/r/20260217-arm-microchip-v1-0-ae5d9=
07e10e3@gmail.com

Please give me a chance to respond to your messages before sending new
versions. My comment about partial removal of the text file still
applies. You've got to send another version anyway.

>=20
> ---
> Akhila YS (5):
>       dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
>       dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
>       dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
>       dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
>       dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema
>=20
>  .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++=
+++++
>  .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++=
+++++
>  .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 ++++++++++++++++
>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
>  .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 ++++++++++++++++=
++++++
>  .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
>  6 files changed, 290 insertions(+), 48 deletions(-)
> ---
> base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> change-id: 20260128-arm-microchip-c0c0515024e6
>=20
> Best regards,
> --=20
> Akhila YS <akhilayalmati@gmail.com>
>=20

--a9Oce0LrKqM5UBEG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3jMwAKCRB4tDGHoIJi
0qptAPsEZufrKjBwoS35zrrBVn3edjNi+mQl4li5B/R8t4V5kAEAjsa5V4cntrIz
C8Jh6yTdaEQcfyH12xxHsE3pNqhw4wQ=
=Z8VM
-----END PGP SIGNATURE-----

--a9Oce0LrKqM5UBEG--

