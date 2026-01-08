Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACCDCF6A8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+hVed87OfApMySpEx6PH9laP/aFmRdX7gSUbiiQOZY=; b=IA7bBuetHAA89Fzt09YTC+FAH2
	z6tIX2Ku0Ljct6hrBiuiJofmYNZ3Sz4tapSQYkkt2KbfV+xo2IOP7i3W2Galp/FG9l1/rD+9N9Dhi
	f/3XhANrPuhP+VWGpYP0h6JhTcTlni0Wk7V6p1yxqTx7+ekl1KARh4uFvRxvRcQ8Megwz/7QQ8FFy
	ywcU8crT1KvgdjZbhSVVXLY34WbgIhm68rT+ZmXbPZsp59JrvYxtG9Vwfq9JikmZ1qyK2zGLAZgWJ
	m8LYA4+2mqDgzSBSPL1plIxqa9mudLZrYSyekWdv+YAVimnPQsY3UXq+BEWr17SQP1YqyIGiivkaK
	WGKsSOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmJc-0000000GSii-1ver;
	Thu, 08 Jan 2026 09:28:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmJa-0000000GSiJ-2f82;
	Thu, 08 Jan 2026 09:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12D2460053;
	Thu,  8 Jan 2026 09:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB09C16AAE;
	Thu,  8 Jan 2026 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767864500;
	bh=CzOR5Mo+mYtepiOYY1ecX1LmQjainZbbcck/O7x/XDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOLwTJ82cNAml2g2cb6dK9D7rQ2YvjF3kp/sdo+s/8MW3JPM/Fs5NPkkeCBBQ/9q+
	 FxS2bu7EZzZAI11eUgpGvOGa6gmMczcKD/oTQVtGwzrwl9hjT3cDmQJppyBnEnoqNW
	 qgu3aidAUq/1NXFjtzADRKx9wVlgOR74rYaVGV5740SrS42MrdypX0UWqB15pgB/Dv
	 HJ0EwXKOyqS7iZRf6b2w7VBT0hBLtawEyQOfRqxuuymoQioTSdIbqM0ZCwiDFym1Yh
	 rWUkGWL5JuDyLwI8DSfVxZfAuZbEM9RHRYPzvexHuIasiYoz4YZVpDDyyYByNJnGYr
	 zf7fYG89TNmJA==
Date: Thu, 8 Jan 2026 10:28:18 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add BA
 memory region
Message-ID: <aV94sru3D6xX39du@lore-desk>
References: <20260107-airoha-ba-memory-region-v2-0-d8195fc66731@kernel.org>
 <20260107-airoha-ba-memory-region-v2-1-d8195fc66731@kernel.org>
 <20260108-shaggy-smart-okapi-efd3b7@quoll>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gSaQBVJTSebgApU5"
Content-Disposition: inline
In-Reply-To: <20260108-shaggy-smart-okapi-efd3b7@quoll>
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


--gSaQBVJTSebgApU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Jan 07, 2026 at 09:29:34AM +0100, Lorenzo Bianconi wrote:
> > Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/net/airoha,en7581-npu.yaml   | 20 ++++++++++--=
--------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..42bc0f2a42a91236c858241=
ca76aa0b0ddac8d54 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > @@ -42,14 +42,13 @@ properties:
> >        - description: wlan irq line5
> > =20
> >    memory-region:
> > -    oneOf:
> > -      - items:
> > -          - description: NPU firmware binary region
> > -      - items:
> > -          - description: NPU firmware binary region
> > -          - description: NPU wlan offload RX buffers region
> > -          - description: NPU wlan offload TX buffers region
> > -          - description: NPU wlan offload TX packet identifiers region
> > +    items:
> > +      - description: NPU firmware binary region
> > +      - description: NPU wlan offload RX buffers region
> > +      - description: NPU wlan offload TX buffers region
> > +      - description: NPU wlan offload TX packet identifiers region
> > +      - description: NPU wlan Block Ack buffers region
> > +    minItems: 1
> > =20
> >    memory-region-names:
>=20
> missing minItems here.

ack, I will fix it.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--gSaQBVJTSebgApU5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaV94sgAKCRA6cBh0uS2t
rIlVAQCZgQxfdfODxTpxJs9Ji5KYlAl4J4HPbwd9W6YBJbAT6wEA7S2y5npM/cw/
AL+VbyT0J3hgG0gmMffWbDag5gofHwg=
=c8nu
-----END PGP SIGNATURE-----

--gSaQBVJTSebgApU5--

