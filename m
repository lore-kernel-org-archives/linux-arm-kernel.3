Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1332DE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAZxstMBwtp068+dFx6qblxYvg4So9+kHdTcwBrchkE=; b=iQiaPpN3S+lGE4eRRFK8XWGn81
	LhKw3q9xLdhR3+AXnfEz8Tcl0x6c27+6gikzIea9K1b8vjukjmadXxvjJC8W2sqgzl/6TkjP4652r
	QypiA0JPN4+RDpF/BBvoSofQ9hnTN6oorDsiQ5vdIYsGEQbzHa9ggvBTh2gZ4c+MrqP9B/pvTBa69
	+6kldOXLXA+yZZX2RKIXUXvKEsjhBMUxM6xEmHn3/ljU1bduMKrAllPGzfUVab2+a+mPCavAi0voP
	tj802MrasQ0SEuJnXgL6msgySSedxtnoZ2bIsCaqe9uHjkf0tdp1aPBxC/HCxfL9vdiyJm2h0u3ED
	UvMI5NTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNy6y-0000000HLSC-3iyG;
	Wed, 18 Dec 2024 17:45:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNy5s-0000000HLGP-3gXR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 17:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 359885C640C;
	Wed, 18 Dec 2024 17:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ABAC4CED7;
	Wed, 18 Dec 2024 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734543860;
	bh=rTcxLZxc1NVV02BJgqNuS1VtkPBBSvcdEkB1BNiPiJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEhl/WdFIaJyw7lBwtWwPuzbVHe7lVVU+sWy37usJKjbxayNGr7uI82IK7wEeZxD9
	 COiNqZtkMzFkVZs3kHx5mjtaAFKQS8rXQBrCuAFUXO3TxYeVWdRIA1tE/0eFlw8O1M
	 B5aB5ZmWZ8t4VVLNbOstjyTVnUxlHE5nXIqU3BSsmuv4q0327hyWd5fLj7Vz8obgzo
	 sx4u8pStgZHI2f4UCyNCGDlgResLojIh6pB2ovwtIhd2rUtV4U54Oop7jCc7M/W2xm
	 6YWBa2Ej6mnAdP7YdUJsDIiO05xOvCilhsEWl1FbA+svk71wjCDohPSqsSNrkAZChP
	 f88iHEQE1nUAw==
Date: Wed, 18 Dec 2024 17:44:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: atmel,at91sam9260: Convert to json
 schema
Message-ID: <20241218-effects-apple-2ac14c51d21d@spud>
References: <20241218-matrix-v2-1-f3a8809ee5cd@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ASrU/zTO3rF6WGbw"
Content-Disposition: inline
In-Reply-To: <20241218-matrix-v2-1-f3a8809ee5cd@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_094421_001601_9A8D223B 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--ASrU/zTO3rF6WGbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 09:24:54AM +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> Add a missing fallback `atmel,at91sam9x5-matrix` for
> `microchip,sam9x60-matrix` which is not defined in the text binding.
>=20
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
> ---
> Changes in v2:
> - Modified the commit messsage.
> - Replaced `anyOf` with `oneOf` in compatible under properties.
> - Removed additional items group and added both `microchip,sam9x60-matrix=
` and=20
>   `microchip,sam9x7-matrix` as an enum under one items group
> - Replaced `matrix@` with `syscon@` in examples.
> - Link to v1: https://lore.kernel.org/r/20241211-matrix-v1-1-5ef0104a3af4=
@microchip.com
> ---
>  .../bindings/mfd/atmel,at91sam9260-matrix.yaml     | 52 ++++++++++++++++=
++++++
>  .../devicetree/bindings/mfd/atmel-matrix.txt       | 26 -----------
>  2 files changed, 52 insertions(+), 26 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matr=
ix.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.ya=
ml
> new file mode 100644
> index 000000000000..447b3a3edbfc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/atmel,at91sam9260-matrix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip AT91 Bus Matrix
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +
> +description:
> +  The Bus Matrix (MATRIX) implements a multi-layer AHB, based on the
> +  AHB-Lite protocol, that enables parallel access paths between multiple
> +  masters and slaves in a system, thus increasing the overall bandwidth.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - atmel,at91sam9260-matrix
> +              - atmel,at91sam9261-matrix
> +              - atmel,at91sam9263-matrix
> +              - atmel,at91sam9rl-matrix
> +              - atmel,at91sam9g45-matrix
> +              - atmel,at91sam9n12-matrix

FYI, the sort order is alphanumeric, which means your 9rl should be
after g45 and n12. Not worth resending IMO.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers.
Conor.


--ASrU/zTO3rF6WGbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MJ7wAKCRB4tDGHoIJi
0nZSAQDszAknuVXXPukTIlWxrYGujyuWJ/RMl0ZtGWbHTgqYpwEAw30t96xqzhfH
RSiM6tmhmHmnzrv09I3YPoEBnL5myQ8=
=iLT0
-----END PGP SIGNATURE-----

--ASrU/zTO3rF6WGbw--

