Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5BEC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTfkshiArVRAYh51613C3b2kBb6YwvK06RN+ASyZtXs=; b=ONpCXr82+MhVTWpsIur7O2cQLD
	WFgNqwWMD1oP1yk6kxJ5tJM38r/XSWSjpD0n0KdGQi8sfEW9Yw4/Um4hiMZ315Ls6mLUpa/R8HpjS
	hB0xzp0ahAFFv5+kJN8GgtpV8WHbFJKDaCmcV5PJ7royCIVjzlZJjuUf6/+SX6EP9RJuLVvL1Aa9r
	A3ykkSedxuPUjnl/aQTn3i5vLwHuKrxSm8OLVAiD2Ci/BGNqdM8AuUkCw5GgsLQZ2s2veTbF2q5R3
	tY9NJLp1BAlVEFc5JNUZ5n/7b2EtG8bY0Vd59WWp0Y9zsJ+5BNQ6uKHctDQ52jZOBIJ2M29XNT9Dl
	Q/jXZSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQ9L-000000094HP-3UGD;
	Mon, 12 May 2025 10:12:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPPe-00000008vD3-344S;
	Mon, 12 May 2025 09:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D97BF4A999;
	Mon, 12 May 2025 09:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A94C4CEE7;
	Mon, 12 May 2025 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747041929;
	bh=VeGFxthv7PYqrI06vu6pYTa8wWVH2rxaKIjcbEO/qxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLUm+jqxbtWq86ypa0XoBzPu4HEk5uslYonS1yB/ZBGc+js+JwiFqlmb4H+LWXXAW
	 b90v9LD9PruGgAdjKSB4vs3Vg5Ntz3OcylUUrEbuG8WFS8NVkHQ1XXKoJuS9UXozDK
	 GBUccOqaE4m+qiffJUQuXtgPcR+MZtETgEmu4IUNRu5SnbliuA4SQZx+g9OLw0U3s6
	 g3TMXzvPfN5/IMHGQjRbSGeAlHt4hgkeCp+rkt3fEOMtj6FLjDp+33it5OEg2o/caW
	 FSzjSWBml7EQZfovpHIGSCTROUn5w84u3qLmoLYO154FgVGjWxioH+0yXvACj+z9uY
	 o2NrfaT6csJZA==
Date: Mon, 12 May 2025 10:25:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: John Clark <inindev@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: vendor-prefixes: Add luckfox
 prefix
Message-ID: <20250512-unshaken-educated-12738a347257@spud>
References: <20250509122637.26674-1-inindev@gmail.com>
 <20250509122637.26674-2-inindev@gmail.com>
 <e3339dfd-7d79-4d86-b522-d6b31976cd2e@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GU6PMH/TcwUywzE1"
Content-Disposition: inline
In-Reply-To: <e3339dfd-7d79-4d86-b522-d6b31976cd2e@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022530_797101_D50E5982 
X-CRM114-Status: GOOD (  17.97  )
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


--GU6PMH/TcwUywzE1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:12:24AM +0200, Quentin Schulz wrote:
> Hi John,
>=20
> On 5/9/25 2:26 PM, John Clark wrote:
> > Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
> > produces development boards like the Luckfox Omni3576.
> >=20
> > Signed-off-by: John Clark <inindev@gmail.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 86f6a19b28ae..9391e0c31bb8 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -892,6 +892,8 @@ patternProperties:
> >       description: Liebherr-Werk Nenzing GmbH
> >     "^lxa,.*":
> >       description: Linux Automation GmbH
> > +  "^luckfox,.*":
> > +    description: Shenzhen Luckfox Technology Co., Ltd.
>=20
> Looking at the file, I think we order the vendor prefixes alphanumericall=
y?
>=20
> So this would be the wrong location for this new vendor prefix and should
> rather be between lsi and lunzn?

Oh, I missed that. Yeah, alphanumeric ordering please.

--GU6PMH/TcwUywzE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCG+gAAKCRB4tDGHoIJi
0tsqAP4ixoSNyieeRkbazndj3nNkW+K7Q1diS68t1I/8BNuNcQD/SXduhZflon2y
JiZDzqW/LhScPYo34ESbXVbqz9G1AwY=
=cMJa
-----END PGP SIGNATURE-----

--GU6PMH/TcwUywzE1--

