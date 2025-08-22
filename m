Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1EACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLiGvD4WvAmDK4qXbOgWhzUKoNjE8ylXtnD26InYrBE=; b=iigXJxVC7CXCaeCFygi2KPNuxE
	MwY9obo5Jdxvgb/NOAvyYI+axBqd2TUiZmQ7PVDIBfNF8yKoe14ulf8dLrAVn+Bxad+Ft+jMT6RoG
	bOsnUwpMipczv8+lEZCTUnOjRZEsmQYuZA+FP9GjyOA9GOJW2M9WT5pW3IdfMGdcKwWrLePEfW73F
	ZnJkVMzFHtiM78ifab6afLAMY+gUhKUvLopUOOSzZWxxf2x/cJIrGLh5Ac4Cyvw7PDYUqik7A6arv
	OknclHnowjXwLEY8tcqevEz0dA67I2HEvcB9WH2noCAPfwOOJIRwYT5KvHu9dyuuZW6kaAB158IKx
	nGiYcydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfR-00000004Um9-3ZMl;
	Sat, 23 Aug 2025 09:36:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV33-00000003CnN-2uTH;
	Fri, 22 Aug 2025 16:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 216B260203;
	Fri, 22 Aug 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B93C4CEED;
	Fri, 22 Aug 2025 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755881728;
	bh=7g181+bcvmLk/IDiMD7z/zBWKVLYMZ0k6iVC20G+ROU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImHNmKrYF8feUzVfNj1IWZo1oWQKNNbn3adjTQoB1nDREjxrrJUwJELiMyBlaqIL/
	 v6zubrgaab66AjgCvKChDKdkLevu7F63S9hi/fn/5N4SW4kw97wMMIfnzTss/54dmD
	 xjJADDAz6ldRqQdkK9w39f6HrEhYsnfZpy6SuUkFSiYDibUg5w9/uy5EV4GQeoYx6y
	 vDTphXQuMOR0x/TeuO5EmSio6vWckZDaZUieXz4d8Zxq93S/BXdGjHW800HeyDCcZv
	 XY4iacRP9+leHrAcB0ZqwWEmQAPMvAr65AjNjx48yTytmQpfuX7uMBJuC7RcFKMzzH
	 5PSKGfZAW8Bvw==
Date: Fri, 22 Aug 2025 17:55:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA1051/1048
Message-ID: <20250822-crop-ungreased-6494d68e388e@spud>
References: <20250822-can-v1-0-c075f702adea@nxp.com>
 <20250822-can-v1-1-c075f702adea@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LL4e6z1aL4fxQ/Er"
Content-Disposition: inline
In-Reply-To: <20250822-can-v1-1-c075f702adea@nxp.com>
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


--LL4e6z1aL4fxQ/Er
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 12:05:28PM +0800, Peng Fan wrote:
> The TJA1051 is a high-speed CAN transceiver which is a pin-compatible
> alternative for TI TCAN1043 with Sleep mode supported, and has a compatib=
le
> programming model, therefore use ti,tcan1043 as fallback compatible.
>=20
> The TJA1048 is a dual high-speed CAN transceiver with Sleep mode supporte=
d.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/phy/ti,tcan104x-can.yaml   | 29 ++++++++++++++++=
+++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b=
/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> index 4a8c3829d85d3c4a4963750d03567c1c345beb91..de4ab204ec86f91e84eba8f1a=
6343ed137e5cd71 100644
> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> @@ -19,18 +19,21 @@ properties:
>            - enum:
>                - microchip,ata6561
>            - const: ti,tcan1042
> +      - items:
> +          - enum:
> +              - nxp,tja1051
> +          - const: ti,tcan1043
>        - enum:
>            - ti,tcan1042
>            - ti,tcan1043
> +          - nxp,tja1048
>            - nxp,tjr1443
> =20
> -  '#phy-cells':
> -    const: 0
> +  '#phy-cells': true
> =20
>    standby-gpios:
>      description:
>        gpio node to toggle standby signal on transceiver
> -    maxItems: 1

Please put the outtermost constraints here and narrow it down in the
else.

> =20
>    enable-gpios:
>      description:
> @@ -53,6 +56,26 @@ required:
>    - compatible
>    - '#phy-cells'
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,tja1048
> +
> +    then:
> +      properties:
> +        '#phy-cells':
> +          const: 1
> +        standby-gpios:
> +          maxItems: 2
> +    else:
> +      properties:
> +        '#phy-cells':
> +          const: 0
> +        standby-gpios:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.37.1
>=20

--LL4e6z1aL4fxQ/Er
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKig+gAKCRB4tDGHoIJi
0sReAP4445tmzdmWf3M79UC6PC+yh6cXgLj78yyz/06rdvDc2AEA1jcyL7+qJdVg
IM3RILZrUyw345YkF5EtQPKxBWu8dQM=
=tBaH
-----END PGP SIGNATURE-----

--LL4e6z1aL4fxQ/Er--

