Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB0EFD8FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zjcuBvR+39VN+vclMg/rYQGCXP+6h/DH3P0TO+cbI8=; b=T1c3WrTA+yu6bcLF65TfO3RVM8
	18tKfsgmd6Fr0gOhikzYZgyedNJJ+gHfj9D/e8gwBz7jQieqHRwtJgD/xpUNaOQd4VUI5aIlHjgQg
	ghsKruqq/8uVgtNiUFS8kVYW5bbvpuYE8nhfJhgENH08SR1CKyEV+Aay9GwVZbnjuiHpQ46b1pS8P
	Evy5ur75qEnmVViSudN3dYmHu3s/0N6haqY+J7jAX0PaNqHtpco1UH4UrlJVAZlQX9WKpwTewzD0K
	1bwApWqK8hQcZW2ThrS0VteqP0a7puuGeOd/zFpWJ3A8pGxClEw8A/QxDH7eohjcY0Yt6SYUkJGHn
	4RV4M+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfr5-00000006vuH-2ood;
	Thu, 26 Feb 2026 18:12:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfr4-00000006vtd-1RUL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D68660138;
	Thu, 26 Feb 2026 18:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48938C116C6;
	Thu, 26 Feb 2026 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772129573;
	bh=WUYyF2WtAffAbwhiOnEY2tBDs0aGrX2kCfm11ewGIGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrDAUXnv+bnDBv/x/6bpLGm97GuZvxPD9PrHzgq1cfZzFE1V1EGTQpYi5FcTlPy71
	 4ToiIM4o6DkiEQpkW3d+bVYeB+NXjXK3T05SpYyUCqtadLXieW8JlY+7HausUeHBhx
	 SY/CcwDInTSNIESHXe6mjTq+JW7XFS5a6dCwSJdxMMHHtxruGOJrH1jKGsMWwiKODy
	 JDsaIAUYQnZUKa3RHduxKskqEvXdVFwsoLmsB77k4S8tljrd2qZLGtN43o+5ix1Koq
	 SmSlZQGJ7Vnd8sBlsHQ58sqWQbclNKTKRePV3F6GjYY0qDnYnER6NcZX2yKjxJ5Xx0
	 3DTvCwdWFB1tw==
Date: Thu, 26 Feb 2026 18:12:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Message-ID: <20260226-bony-mom-820bee185dc0@spud>
References: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ed8MFy4aWBBGpUIz"
Content-Disposition: inline
In-Reply-To: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
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


--Ed8MFy4aWBBGpUIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 04:13:32PM +0000, Akhila YS wrote:
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
> Changes in v3:
> - Change email for maintainers.
> - atmel,at91rm9200-st: redefine watchdog node as a pattern property.
> - Remove corresponding binding node from txt document for every yaml patc=
h.=20
> - Link to v2: https://lore.kernel.org/r/20260224-arm-microchip-v2-0-8beda=
cd2cdcb@gmail.com
>=20
> Changes in v2:
> - Change email for maintainers.
> - microchip,sam9x60-pit64b: modify compatible and clock-names in properti=
es. =20
> - Link to v1: https://lore.kernel.org/r/20260217-arm-microchip-v1-0-ae5d9=
07e10e3@gmail.com
>=20
> ---
> Akhila YS (5):
>       dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
>       dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
>       dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
>       dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema

These first four patches are
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Ed8MFy4aWBBGpUIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCNIAAKCRB4tDGHoIJi
0viAAP41vu2f70QGXvgA/IVTXHfAYNYPX+iAi0Fi+75bqRX2wQEA3RGCGNDE6Mzz
10ZmJhYUrsyVlpd7VCsW12Xz0tdm5wY=
=KM/w
-----END PGP SIGNATURE-----

--Ed8MFy4aWBBGpUIz--

