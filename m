Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE25CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCl2h1w1gG7xQ2IOq1++c0XrFQCqGCY1qfeW5ss3aJU=; b=31OyJEyDJg8M2eOTxcKcR2//zO
	vRkwJofq+ut6RJHKptOC75FMuShR9geGgwklxmYleZ++Tl06+9brzrD9OEUal+TmRDFIbEpzyy9HU
	RCFi/RmzjPNLjrYGHAW7U8BzkjLSLRpml/V9a3/ruzydZuyfaBV3xJekwXAkOAWZCLHJpmYWSGxql
	dLBedQPZvOsgm+DGPsm1SISGK7YLyfZPSnqVwQ50WJCnrybK5qLaagm1QgK1YDpAwUotlwv7Rs3Gu
	3mdazEqxzuu1kz/vu9/ibzYEZULans3EIYMEXElC1dJkg+dH3tDBl5YJfgk+ZQziOmCCOAygHHB5b
	Na3QYIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVWa-0000000BmET-2dLN;
	Fri, 22 May 2026 19:27:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVWY-0000000BmEB-2gVX;
	Fri, 22 May 2026 19:27:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDA2F60136;
	Fri, 22 May 2026 19:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0483F1F000E9;
	Fri, 22 May 2026 19:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779478029;
	bh=FCl2h1w1gG7xQ2IOq1++c0XrFQCqGCY1qfeW5ss3aJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ds6ZMMcgx5EDAgUl1oWgYyadlaRI2Wa4jbbhZo8AQztef+B93krJNaxzks2mO5nGN
	 zs3brK3XUN3Vkp7C69SA4iKK0s59G61zOndjX8ehKMihlTbCJyLAatdcDbqsjdswgF
	 yd/SApE5kY4Y8oQhvlSUYujUIEvHc2S+06ugEXPAMAx8i7bS+ba85G20ioe/s1AoVa
	 4jN4HvjZ4qUijyR5GPyHyYif4NaXLCivIk7qhJiirKJQcd9u999dSwTrR8+m5VVcvS
	 3d3zfANxA6AE7SjyUCYvMqzgPTfTNkjy8qosxmUDrPtZX4BpfwZ81971jS1Z0/Qfdt
	 KtTHxsV04Ln4g==
Date: Fri, 22 May 2026 21:27:07 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v8 01/10] dt-bindings: net: airoha: Add GDM port
 ethernet child node
Message-ID: <ahCuC3TgK3Pnuz_w@lore-desk>
References: <20260519-airoha-eth-multi-serdes-v8-0-6bd70e329df6@kernel.org>
 <20260519-airoha-eth-multi-serdes-v8-1-6bd70e329df6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qZn/vsQETJzcLfna"
Content-Disposition: inline
In-Reply-To: <20260519-airoha-eth-multi-serdes-v8-1-6bd70e329df6@kernel.org>
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


--qZn/vsQETJzcLfna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> EN7581 and AN7583 SoCs support connecting multiple external SerDes to GDM3
> or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
> As a result multiple net_devices can connect to the same GDM{3,4} port
> and there is a theoretical "1:n" relation between GDM ports and
> net_devices.
> Introduce the ethernet node child of a specific GDM port in order to model
> a given net_device that is connected via the external arbiter to the
> GDM{3,4} port. This new ethernet node is defined by the "airoha,eth-port"
> compatible string. Please note GDM1 and GDM2 does not support the
> connection with the external arbiter and they are represented by an
> ethernet node defined by the "airoha,eth-mac" compatible string.

Hi Rob, Krzysztof and Conor,

do you have any comment about this patch? Thanks in advance.

Regards,
Lorenzo

>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-eth.yaml | 56 ++++++++++++++++=
+++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index fbe2ddcdd909..17fe2edf4886 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -130,6 +130,42 @@ patternProperties:
>          maximum: 4
>          description: GMAC port identifier
> =20
> +    allOf:
> +      - if:
> +          properties:
> +            reg:
> +              contains:
> +                items:
> +                  - enum:
> +                      - 3
> +                      - 4
> +        then:
> +          properties:
> +            '#address-cells':
> +              const: 1
> +
> +            '#size-cells':
> +              const: 0
> +
> +          patternProperties:
> +            "^ethernet@[0-5]$":
> +              type: object
> +              unevaluatedProperties: false
> +              $ref: ethernet-controller.yaml#
> +              description: External ethernet port ID available on the GD=
M port
> +
> +              properties:
> +                compatible:
> +                  const: airoha,eth-port
> +
> +                reg:
> +                  maximum: 5
> +                  description: External ethernet port identifier
> +
> +              required:
> +                - reg
> +                - compatible
> +
>      required:
>        - reg
>        - compatible
> @@ -191,9 +227,27 @@ examples:
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> =20
> -        mac: ethernet@1 {
> +        ethernet@1 {
>            compatible =3D "airoha,eth-mac";
>            reg =3D <1>;
>          };
> +
> +        ethernet@4 {
> +          compatible =3D "airoha,eth-mac";
> +          reg =3D <4>;
> +
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          ethernet@0 {
> +            compatible =3D "airoha,eth-port";
> +            reg =3D <0>;
> +          };
> +
> +          ethernet@1 {
> +            compatible =3D "airoha,eth-port";
> +            reg =3D <1>;
> +          };
> +        };
>        };
>      };
>=20
> --=20
> 2.54.0
>=20

--qZn/vsQETJzcLfna
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCahCuCwAKCRA6cBh0uS2t
rFFmAP9bCqqNxm9iUo7L09S4mXpuCBZOetsy0kzJc0wz9A/t/QEAheGcPN75acWD
xrt8EQrZhwP7W2N6/vJzmXpYge3IQQQ=
=NoQd
-----END PGP SIGNATURE-----

--qZn/vsQETJzcLfna--

