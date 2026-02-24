Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D382F3C98F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/ALwqSEmd1xrHP95AcZQLttaiKilkct1zVnm6N43yI=; b=hWWmv4uz0sOSHflfJ8JZFZcH5a
	QJUhGEzPzSw0mKD/QFf2NKzXabDGHkqRBsOzMCCFIDI+dmXonac2CXd6O5by2MGfpWRAXwAO8TTYJ
	zV5SIr0xIh8saFhUv2feRwN3lYwSoMXxDm8qYrZvXF8H+Y3vNhccw3KR8rlbocsmstCsWBZ6nTt5b
	M9plxp6gOhoUvRGVcEh+KC67OUSGMW0whqqiaPkm5psWQV3gdy0joxn4Bhi9UVkd+ydTAA9LHnE6r
	Q9idGwOpZjiQy3qzOt2yfbg1c4JCNVdHacYHfIE8CzkPDWSAfTX0AKtYh+wMNEizPOVm0B1t58W0+
	/bHksWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutps-00000002HOh-3yC6;
	Tue, 24 Feb 2026 14:56:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutpr-00000002HOB-1sG9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02D9143EC6;
	Tue, 24 Feb 2026 14:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF833C116D0;
	Tue, 24 Feb 2026 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771944986;
	bh=Lg/d0B8W1nMvCvbuD/Qbkg0FKotjZ8MumRGFEal39iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyZZnrZgn00Gv0EvwRSZDoX0PA7XVL7zVcqYoxIyZ5fwNmYwFxsfKjI5UXI4ujfNt
	 gi9Ceqe05JnNFBDMNhqnm05yqMtK5EhTrkCw/MykyO3p6LTPRFVdzNNBU7F9DgFZaq
	 789BfAQdLyPMHUGyNATqcipLlsY/kMoNNYmAYEzs2li0UAXS7E8Dq6mMDWaFgOfeJm
	 N0XnV9LqfB4fXYoHHzG1gIFx4Cc6f2Bd7WW0KfaZou/4lkl6JD49HLZ1IpZvO26OdA
	 4ugXEgSMVa17EyrbH41xmDyEf3IYcFvZTV0yFRUI0JBWKSyEOc6/H+0FSjPB1kKPE9
	 /2T3WMn0Nv7Vg==
Date: Tue, 24 Feb 2026 14:56:22 +0000
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
Message-ID: <20260224-detection-sliceable-a565fb5fb78f@spud>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
 <20260217-cosigner-polka-de13bb9be569@spud>
 <11ab7eb4-5c74-4ee1-b385-a5ab95d23b7c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QZFSn0Phm3TiF6Re"
Content-Disposition: inline
In-Reply-To: <11ab7eb4-5c74-4ee1-b385-a5ab95d23b7c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_065627_537882_71EEB677 
X-CRM114-Status: GOOD (  14.89  )
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


--QZFSn0Phm3TiF6Re
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 08:12:32PM +0530, Akhila YS wrote:
>=20
> On 17-02-2026 23:21, Conor Dooley wrote:
> > On Tue, Feb 17, 2026 at 05:24:18PM +0000, Akhila YS wrote:
> >> Convert various legacy .txt bindings for Microchip (formerly Atmel) AT=
91/SAMA
> >> family system peripherals to proper YAML schemas. This includes:
> >>
> >> - CHIPID (SoC ID register block)
> >> - PIT (Period Interval Timer, old style)
> >> - PIT64B (64-bit Period Interval Timer, newer parts)
> >> - ST (System Timer, including watchdog subnode)
> >> - RAMC/SDRAMC/DDRAMC/UDDRC (SDRAM/DDR memory controller
> >>
> >> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> >> ---
> >> Akhila YS (5):
> >>       dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
> >>       dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
> >>       dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
> >>       dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
> >>       dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema
> >>
> >>  .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 +++++++++++++=
+++++++
> >>  .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 +++++++++++++=
+++++++
> >>  .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++=
++
> >>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 -------------=
--
> >>  .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 71 +++++++++++++=
+++++++++
> >>  .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
> > Is this intentional? They all say "convert", but only one file is
> > removed in one commit?
>=20
>=20
> Yes, all bindings are present in one text file.
>=20

Surely the thing to do would be to remove each section from the text
file as it gets converted, no?

--QZFSn0Phm3TiF6Re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ28EgAKCRB4tDGHoIJi
0hCgAP0f1B3Z0yBDGUqStX/lsN2MJf38AVMZNme4dkmAKQ6sRQD/VlHJf7bYtAF+
etH0/4VjNPWLEsyo/lGYkLHctcgLeAU=
=n5Mc
-----END PGP SIGNATURE-----

--QZFSn0Phm3TiF6Re--

