Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEB9CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVLuPSwVempVOh4OjB6BMpRx1NMTNlQPkqfhkemv5r0=; b=SA0w4JroV0u5uWJoURRzRSQlCY
	5PbV77I1uEY703vK9vvgdr6dwdQFcoBeasSlRLObb6YBjEGmm9PrQUnBOs/chunhuAN4HtumghjtP
	lNhgK976a6QzM2PpG+pVKgLVrYYE+m8Cz+Iowp3vrDFpeqkuBvIPmtlV4y7DfCUBFRd1orjquOhGi
	h05nnPIRGz05e6nMnACJLiPDiBjf+LIh3AY0s1Uk1TDgIrOZGb6JD/W/XNyq7DGsJKDaRovKZc39X
	QZPnIjUPAiw+V00iTBrTUYdziJ2CgnAmAzlEkxCbvIXFXGYZspQD83UuSsZJd6CeED4Lm26HhUSHp
	zKE1U1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoaV-00000007r1n-2iI7;
	Fri, 15 May 2026 09:12:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoaT-00000007r1H-21eC;
	Fri, 15 May 2026 09:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30E0542A9B;
	Fri, 15 May 2026 09:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D50C2BCB0;
	Fri, 15 May 2026 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778836324;
	bh=ezInJyFm/d7b/zaAGKXD/lqLjaLONJlsN86X11bWh9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLeGmsfC42LmUDWjMf22yS8ryXFBK3vitMGaWOkpBa7G1omlyYY2fM7uSiv9gkZQi
	 z1gjt0dJl6Q9G+PdpJby27SceI9nJRtTw07Q0jbkHqik1WyMPysHoRkkbvElLPvaC+
	 wQU3yCrKOYSBeev1ZVhMP545xJVWernWYlLBboa4xapfiDpM+AYe2DHwcCYZsbYHMX
	 UGmDx7bj3Xvyt53FNtS2jkYjVUMVd+CnVjxc+5lmS4hEWhE7nh/i9+2WtBYFlSDJM8
	 DNMrNPmSQqy18YShS05KIHUQ9f0kMdxTBeZTDQeH4zsVv6uQkHqpx5/D89qtE9LKFA
	 eR/FYsG1SKqlQ==
Date: Fri, 15 May 2026 11:12:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v6 01/12] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
Message-ID: <agbjYLb3FeFSVoyb@lore-desk>
References: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
 <20260511-airoha-eth-multi-serdes-v6-1-c899462c4f75@kernel.org>
 <20260514140130.GA257001-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0BJ5H8Z2afeCFdbr"
Content-Disposition: inline
In-Reply-To: <20260514140130.GA257001-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_021205_601152_D15FF53A 
X-CRM114-Status: GOOD (  23.37  )
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


--0BJ5H8Z2afeCFdbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, May 11, 2026 at 12:49:27PM +0200, Lorenzo Bianconi wrote:
> > EN7581 and AN7583 SoCs support connecting multiple external SerDes to G=
DM3
> > or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
> > As a result multiple net_devices can connect to the same GDM{3,4} port
> > and there is a theoretical "1:n" relation between GDM ports and
> > net_devices.
> > Introduce the ethernet-port property in order to model a given net_devi=
ce
> > that is connected via the external arbiter to the GDM{3,4} port (that
> > is represented by the ethernet property. Please note GDM1 or GDM2 does =
not
> > support the connection with the external arbiter and are represented
> > by ethernet property.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/net/airoha,en7581-eth.yaml | 64 ++++++++++++++=
+++++++-
> >  1 file changed, 63 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > index fbe2ddcdd909..642f300c0945 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > @@ -130,6 +130,50 @@ patternProperties:
> >          maximum: 4
> >          description: GMAC port identifier
> > =20
> > +      '#address-cells':
> > +        const: 1
>=20
> blank line

ack, I will fix it in v7.

>=20
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    allOf:
> > +      - if:
> > +          properties:
> > +            reg:
> > +              contains:
> > +                items:
> > +                  - enum:
> > +                      - 3
> > +                      - 4
> > +        then:
> > +          properties:
> > +            '#address-cells':
> > +              const: 1
> > +            '#size-cells':
> > +              const: 0
>=20
> Why do you have these twice? Drop this one.

ack, I will fix it in v7.

>=20
> > +
> > +          patternProperties:
> > +            "^ethernet-port@[0-5]$":
> > +              type: object
> > +              unevaluatedProperties: false
> > +              $ref: ethernet-controller.yaml#
> > +              description: External ethernet port ID available on the =
GDM port
> > +
> > +              properties:
> > +                compatible:
> > +                  const: airoha,eth-port
> > +
> > +                reg:
> > +                  maxItems: 1
>=20
> Instead, 'maximum: 5'.

ack, I will fix it in v7.

>=20
> > +                  description: External ethernet port identifier
> > +
> > +              required:
> > +                - reg
> > +                - compatible
> > +
> > +          required:
> > +            - "#address-cells"
> > +            - "#size-cells"
> > +
> >      required:
> >        - reg
> >        - compatible
> > @@ -191,9 +235,27 @@ examples:
> >          #address-cells =3D <1>;
> >          #size-cells =3D <0>;
> > =20
> > -        mac: ethernet@1 {
> > +        mac1: ethernet@1 {
>=20
> Just drop unused labels.

ack, I will fix it in v7.

Regards,
Lorenzo

>=20
> >            compatible =3D "airoha,eth-mac";
> >            reg =3D <1>;
> >          };
> > +
> > +        mac4: ethernet@4 {
> > +          compatible =3D "airoha,eth-mac";
> > +          reg =3D <4>;
> > +
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          ethernet-port@0 {
> > +            compatible =3D "airoha,eth-port";
> > +            reg =3D <0>;
> > +          };
> > +
> > +          ethernet-port@1 {
> > +            compatible =3D "airoha,eth-port";
> > +            reg =3D <1>;
> > +          };
> > +        };
> >        };
> >      };
> >=20
> > --=20
> > 2.54.0
> >=20

--0BJ5H8Z2afeCFdbr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCagbjYAAKCRA6cBh0uS2t
rOXiAP44pwN0k6371R9brljGliJaHzd+jLmOlP+Fz+duEXskIwEAx58Rf002P7nU
Tst7hPK0DwlRxEsE9KgSF4NcFS/08A8=
=EZ9T
-----END PGP SIGNATURE-----

--0BJ5H8Z2afeCFdbr--

