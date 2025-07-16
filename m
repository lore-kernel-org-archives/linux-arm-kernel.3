Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831DDC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beDH1djxjwbdzaBE6mYd3Nli2+ei9cRKQUUea5uZ9pA=; b=fPD9auO4yA4jcVCELiZJrZRK0x
	yMDliMzUOgQJeXY2Q7jhg7XFqCkJv3Ub1ejtuk2eOdkeKJN5+HXggbwVYCnToQ2fC+0M0y29DZ1Hb
	7UX7wZco9qUvxqq5YgoSs7tR1nt260ZsneGHcTCikhI4RBSyUL6fyU89ZCUimbm4J3/o3ky8MXEU+
	Gn3Su1XuEoJdJyn2MlFugeEklyoHaY3qK+x2Lida4yZIFYO+dpLsjXjZWndHir1Kfofy9Wm8aV1aN
	nB7rrRAjbuqotfbUQJklqiD+PAoi5V8FVb9mRk9I2a/U//74NZoFrd5KKeKp8VUv8MMXtCFnDoyiv
	Y6omGMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc044-00000007WcZ-0iHX;
	Wed, 16 Jul 2025 11:12:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzn2-00000007TrL-2gER;
	Wed, 16 Jul 2025 10:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2ADF643428;
	Wed, 16 Jul 2025 10:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F36C4CEF7;
	Wed, 16 Jul 2025 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752663308;
	bh=s/qODGloHS8A6X+Kd2P5c0fXlx0swt4d3mPhst1www8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AaXmIeDzxUjpLD8/kVuv5Q1vETO0s8srl0M9EM7uqSBrWlApGEhJfzRcbLg6dOJwc
	 98V+b2Z1PuIGvxxsXXVD0zRWhiBMQFP6kvJeMEaoBGBnWihHDU6j1hSAyHPRBTAK7N
	 a3GZ70moRvWKjvOhLPD1QTxrKyEOGAGiUYetPArroJrH1f6m9scc9YjT/yebas3Gyn
	 sTfA/IU/xK7Ei0ABIImay2LjcKYvFfzkX1Th8Br8XFoAvjXBGWq7Ei1XUsPKWtMqsv
	 3JpFXSMGYJqjCNjY0ay5541eMU2BkoKYcda3dV9BZYU+KrJxh/bx8aJXFXqBjkyoKl
	 lYtZR/m0gU6Og==
Date: Wed, 16 Jul 2025 12:55:05 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/7] dt-bindings: net: airoha: npu: Add
 memory regions used for wlan offload
Message-ID: <aHeFCZ3Z9E15pSeL@lore-desk>
References: <20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org>
 <20250714-airoha-en7581-wlan-offlaod-v3-1-80abf6aae9e4@kernel.org>
 <20250715035419.GA11704-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ejVKjvWudJw3Rkcf"
Content-Disposition: inline
In-Reply-To: <20250715035419.GA11704-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_035508_722336_2A562C16 
X-CRM114-Status: GOOD (  16.26  )
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


--ejVKjvWudJw3Rkcf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 14, Rob Herring wrote:
> On Mon, Jul 14, 2025 at 05:25:14PM +0200, Lorenzo Bianconi wrote:
> > Document memory regions used by Airoha EN7581 NPU for wlan traffic
> > offloading.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/net/airoha,en7581-npu.yaml    | 19 +++++++++++=
++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..f99d60f75bb03931a1c4f35=
066c72c709e337fd2 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > @@ -41,9 +41,18 @@ properties:
> >        - description: wlan irq line5
> > =20
> >    memory-region:
> > -    maxItems: 1
> > -    description:
> > -      Memory used to store NPU firmware binary.
> > +    items:
> > +      - description: NPU firmware binary region
> > +      - description: NPU wlan offload RX buffers region
> > +      - description: NPU wlan offload TX buffers region
> > +      - description: NPU wlan offload TX packet identifiers region
>=20
> 1 entry was valid before, but not anymore? If so, justify it in the=20
> commit message.

ack, I will do it in v4.

Regrads,
Lorenzo

>=20
> > +
> > +  memory-region-names:
> > +    items:
> > +      - const: firmware
> > +      - const: pkt
> > +      - const: tx-pkt
> > +      - const: tx-bufid
> > =20
> >  required:
> >    - compatible
> > @@ -79,6 +88,8 @@ examples:
> >                       <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> >                       <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> >                       <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> > -        memory-region =3D <&npu_binary>;
> > +        memory-region =3D <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
> > +                        <&npu_txbufid>;
> > +        memory-region-names =3D "firmware", "pkt", "tx-pkt", "tx-bufid=
";
> >        };
> >      };
> >=20
> > --=20
> > 2.50.1
> >=20

--ejVKjvWudJw3Rkcf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaHeFCQAKCRA6cBh0uS2t
rAnDAQDc4K8cm9ezsu4s25+kmtqhZht/BBBftBY73/9r+XfLhgEAz5X7/1w62Db+
3oZ18L1Bo0L+qo8227Ivg56sgkDPXQ0=
=YHee
-----END PGP SIGNATURE-----

--ejVKjvWudJw3Rkcf--

