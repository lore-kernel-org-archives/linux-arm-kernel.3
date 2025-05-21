Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A9C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF1du0dS/A8Mo6eXYoEZsKDk/uxv9rVDXUcbZZVzWJw=; b=udqNsMAw4euQ+puEpgudaC5c0C
	PuYzP3hXxEO0tAFQVZoYZyNqEfUIC66bVixwiVphRXqCWQ4NF8JWQ5SEwVZ4OLoG/eWmkphm9S0KY
	br1c0YCrV91Q49NeWh7sE5wxJU0v1/GKj/Mswn/L/SUQGDzPQKATODqgnVA3b04eQ2zRQAt1tpeGq
	bdm8sfZ4yxq+5tYCr4aXLDBOC4tCD0VVz/Su8cRfZ56wjZ3vvkprTp9JeLJ/FRYlUKbNMODJzUIBL
	oFah2Bnt48QfLWD79o+3/w42FkbrTpj+MdSa84YiHwRZUcf4jMCqb3qHS/i6qNvuieWkb6B7qM/rn
	HA8I9uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdkX-0000000F2x6-3WsW;
	Wed, 21 May 2025 07:20:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdYP-0000000F1GW-2B55;
	Wed, 21 May 2025 07:07:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5107A4E2FC;
	Wed, 21 May 2025 07:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85ABC4CEE4;
	Wed, 21 May 2025 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811272;
	bh=96Md/VEB9O7eASfK338AzVXaq8Pdtv6dMy+GnK3LdD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riByxiuNfv/MNrR4LU1FCcXQFSsPBgNZ7hKDVpykbrHvPiAgxgsjX+6iOgDEcNAzT
	 GT/YCJeec/oKBkNY6TZdQJHUXS6cxsNa9G+zeKJoegioii5KY56Q5k9k9MssgXX0jl
	 FGwk6o+NWcO/Au5VzLoVOg6jL5kk782k3gocXOCGcbYdHmqWrKzFliUQeL7QRmbKqA
	 Xq259qQQy3IxX10P0UiAMQLEhB7ZUcH++38ruHqKSaKyFgLRgt/A+rK6aO8uVnnv9o
	 NShUOmNENCedEECbslDDTp31ST0W2tX8sjfOCjRxjEdZYiWWZcvov+GbTDaO1rhMHz
	 8L8N7j/JPvp5w==
Date: Wed, 21 May 2025 09:07:49 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: Add EN7581
 memory-region property
Message-ID: <aC17xaFuF7-1Sf0F@lore-desk>
References: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
 <20250509-airopha-desc-sram-v2-1-9dc3d8076dfb@kernel.org>
 <20250514200816.GA2934563-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tSXozertU+zsFhIv"
Content-Disposition: inline
In-Reply-To: <20250514200816.GA2934563-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_000753_712923_BB9FAD4E 
X-CRM114-Status: GOOD (  21.44  )
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


--tSXozertU+zsFhIv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, May 09, 2025 at 04:51:33PM +0200, Lorenzo Bianconi wrote:
> > Introduce the memory-region and memory-region-names properties for the
> > ethernet node available on EN7581 SoC. In order to improve performances,
> > EN7581 SoC supports allocating buffers for hw forwarding queues in SRAM
> > instead of DRAM if available on the system.
>=20
> But 'reserved-memory' is generally for system memory which is DRAM=20
> though we unfortunately don't enforce that. For small onchip SRAM, you=20
> should be using the mmio-sram binding and the 'sram' property.

Reviewing the vendor sdk my understanding was wrong (sorry for the noise).
Here we just want to add the capability to allocate hw forwarding buffers q=
ueue
defining the memory region in the DTS instead of using dmam_alloc_coherent()
since in some configurations QDMA blocks require a contiguous block of
system memory for hwfd buffers queue.
Moreover, EN7581 SoC supports consuming SRAM instead of DRAM for hw forward=
ing
descriptors queue. This is managed in hw, we just need to request it in the
flowtable entry configuration.
I will fix it in v2.

Regards,
Lorenzo

>=20
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/net/airoha,en7581-eth.yaml          | 13 +++++=
++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > index 0fdd1126541774acacc783d98e4c089b2d2b85e2..6d22131ac2f9e28390b9e78=
5ce33e8d983eafd0f 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > @@ -57,6 +57,16 @@ properties:
> >        - const: hsi-mac
> >        - const: xfp-mac
> > =20
> > +  memory-region:
> > +    items:
> > +      - description: QDMA0 buffer memory
> > +      - description: QDMA1 buffer memory
> > +
> > +  memory-region-names:
> > +    items:
> > +      - const: qdma0-buf
> > +      - const: qdma1-buf
> > +
> >    "#address-cells":
> >      const: 1
> > =20
> > @@ -140,6 +150,9 @@ examples:
> >                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> >                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> > =20
> > +        memory-region =3D <&qdma0_buf>, <&qdma1_buf>;
> > +        memory-region-names =3D "qdma0-buf", "qdma1-buf";
> > +
> >          airoha,npu =3D <&npu>;
> > =20
> >          #address-cells =3D <1>;
> >=20
> > --=20
> > 2.49.0
> >=20

--tSXozertU+zsFhIv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaC17xQAKCRA6cBh0uS2t
rFV3AQCwSAkPgSXG/RyB/TBSGzLQUzuQ1DO+anR9XFemzgJlGwEApgIOqZxT4P/6
k6/EaUKbliUTPhf1joJ1o/xHxlCu9Q0=
=j8mL
-----END PGP SIGNATURE-----

--tSXozertU+zsFhIv--

