Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F96E9A026
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PztaC61r8T/agLhxr+VFP5jBKRPKcCHks9q2YF1Murw=; b=pulZnMQij7qMFnFrvfaD3bHoYS
	Pa5lPzPKCNaPc9bfdTuCT/YKdjYoK9Sm59vY0lh7W7sE9a3sGDEMSS8I0cAZUeAdMMCwMeoIGW8nB
	AGrhjev/uqahRJwXRwcHc1QTQvRSndQS/wvBC8MzcDpymLY2viY0hjDWEYy//bP+V0MzKko+GS0kT
	DpaHFrGiWSHhnpEtf1uQpdimveWw6UoY8k1KNLmo0jNDh1r3+FE3pN+FqzSlbVuVxlbyMrof6QN14
	/iwdoH2hn2ZUt8Z01IgPK5OwY/tOO8Ra2nGL2fz72l4BxlRP3/lYdWTgswPBW4YI8FB3Z492+cFq4
	NVpr27zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPE5-00000008fxb-27pk;
	Tue, 17 Feb 2026 17:51:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPE3-00000008fxP-3Q9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C415A60053;
	Tue, 17 Feb 2026 17:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAD0C4CEF7;
	Tue, 17 Feb 2026 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350666;
	bh=RohvUrABE3ONA2kD5YM2rA0XvwklkYs+Ttxew6GqdNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQX2u1Sljt6+W1rO3TGqvEeMKWhfzifUi6l+evzSC1hEQW3/km3YRP4f9HgUJS9rD
	 +8zu+KKD/ZP3cCc6egcr4pG3MGPd8ot9PgCY46FtHZNldAIMx6issJ3ZKNrUaAi3oi
	 1uzNzWdhZX1xnut1wMy5DKP8ABef6E/XutX52FVtXSt8p36l9JkYE1I67odN8Ixr6E
	 kiBJLz8V27vxMM2wcFjA4Et2MTZeGeiQl3bo9OA2dzwnvbbiP0xpiysyxDsTrmn5fs
	 z8UMZrhGKPGdjZ1dad0wcPX8ASWuUHKkilaJwOwrebBarOqSBOMkZ6i2xQ2PIgtR94
	 7QhnVIl7Pt56Q==
Date: Tue, 17 Feb 2026 17:51:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Message-ID: <20260217-cosigner-polka-de13bb9be569@spud>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EW0cnvbyt9G3Knl/"
Content-Disposition: inline
In-Reply-To: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
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


--EW0cnvbyt9G3Knl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 05:24:18PM +0000, Akhila YS wrote:
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
> Akhila YS (5):
>       dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
>       dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
>       dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
>       dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
>       dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema
>=20
>  .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++=
++++
>  .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++=
++++
>  .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++++
>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
>  .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 71 ++++++++++++++++=
++++++
>  .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++

Is this intentional? They all say "convert", but only one file is
removed in one commit?

--EW0cnvbyt9G3Knl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZSqhgAKCRB4tDGHoIJi
0nHEAP9pWj/18OTsKIU4OHlqjX4JDifXepNVguER5eS6+e6fMgEA3nMnIhpB9wQE
1zw796iOZW9pOAf7LNYcUOR1P2FJ3QI=
=aoNg
-----END PGP SIGNATURE-----

--EW0cnvbyt9G3Knl/--

