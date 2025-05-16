Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04912C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 06:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+UaICaY0s/OArooOcb2t4M7eoaqS2pUhicQAElmF10=; b=eQGDl6PrpklPnNmMt/ue96GBXe
	tMmtrhDEDSQ//yxxl/HOhkbEOsy1Tg/PjDXgFcwiGRZOsVgRSRBYyn/u3rctVwhY3LuIXbSkYS1Rt
	qwe7JkPq4EDzVADTZPl09Pg+yRnbcOlLp0Q32EvDt2aCkOBRS9f1U65sU/sN0qbnvBJtWlYl0+KBN
	6IWdyju4ihTgp1T7g8UNrUDtnRKYq7njEEuOmAB5rzigYpE39PdoEYMHsyjUfNEW/abM3JA3ANam8
	BM22KiiwMhb4LHqoZ1t8HwzExNC9HKUV1faFBbUyIe4efV6xdlYLcg02deJDydQ6gxeExhFTTHbZY
	VvXR9cCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFobC-00000002Zes-2L2I;
	Fri, 16 May 2025 06:31:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFoZ3-00000002ZV9-36E0;
	Fri, 16 May 2025 06:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB656A4E559;
	Fri, 16 May 2025 06:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C86C4CEE4;
	Fri, 16 May 2025 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747376940;
	bh=+pKFCaJzpi3RXKEOsIsDQB809uH9lChwZMdgj0ruLfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TEQyfGs9yj3sOyJCGe3v3OeFiaTgXo7fiD2eMDAmxT6SxUWT9TLRlI6XB+seY0n3B
	 nW/+XVkR3XFCcobCBC9o12uJDnsR3uXUhQO9uIPcSAg2g5Wqul+kXDvKU8z6RRH6CK
	 0LQ/mw1xKscs8kF7pdUqHmh8r9wvxVtCFb2F7pOeP7DqsN/OZ1MR67MTok3/mgWPvy
	 uh1JJ9WEAvPXX5Kj0YNbCENBZ37uckpxlR7/LS65Za8kqjWzjlveEoJogA959iim+W
	 wEOebNE2C00cAgzasgDbnhz+EsgHv0EVk5a599z67eEtCd5y3dDGBu+HbayB41C9QW
	 zIM6HNdW1eHug==
Date: Fri, 16 May 2025 08:28:57 +0200
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
Message-ID: <aCbbKfpsKoDK8cuW@lore-desk>
References: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
 <20250509-airopha-desc-sram-v2-1-9dc3d8076dfb@kernel.org>
 <20250514200816.GA2934563-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aID1bXHpUUZXCMrP"
Content-Disposition: inline
In-Reply-To: <20250514200816.GA2934563-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_232901_914076_E2BE2F69 
X-CRM114-Status: GOOD (  19.14  )
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


--aID1bXHpUUZXCMrP
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

ack, thx for pointing this out, I will look into it.

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

--aID1bXHpUUZXCMrP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCbbKQAKCRA6cBh0uS2t
rN6TAP9Z+nC7Q2ksXcMUfrSAkCjOIrRj47Vf5ANb+75cp7DY1gEAiYs5yFLjSGez
2D3qidhzzh0w41nH19Ti61rMTknwIQM=
=5mPp
-----END PGP SIGNATURE-----

--aID1bXHpUUZXCMrP--

