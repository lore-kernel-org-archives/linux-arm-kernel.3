Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DD1v7WAUfTa8LEsmdnXmo8TZcmGZDr0zVXhLE2Z5xY=; b=jyvajRyRESGq9H2ZojJUc5DqOK
	ru8yRa+recFGK7UqoRdylQGI98NYdd/8gYXRPk9Ch1R99dUJXq07k98e7yHEr7+CK97iSRlETbDUM
	v1wQzo37JT9pTbx5sXa4de1vAwINxmmJ2xIyOLo0Qr5nhh5hGMrLKgeH41IlVy+rdjol6SvNtih5u
	cM4Mj7HvzayRv/kjYK/9nX0vQ0IdHQBijIuqiozSaatxDFXcX0cggKGyPFiisn/fMzfxUa+zJPk5T
	ftV7/qRF5tMqEBml6qFgytFlAPdzu82CAjL6xD51ACVAzlQ9DIxP3zLM/CbubMFfL2TxartVqDBIQ
	5F4UFs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDso-0000000F470-1yOx;
	Mon, 29 Jun 2026 15:26:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDsn-0000000F46p-03rx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:26:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46698600AB;
	Mon, 29 Jun 2026 15:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF75A1F000E9;
	Mon, 29 Jun 2026 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746808;
	bh=1DD1v7WAUfTa8LEsmdnXmo8TZcmGZDr0zVXhLE2Z5xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kIQ37Fhi2asFeMqWXXsLFHsaVl4ib20zlyAFLNPHlXv0muZuUzgETqBfuj/Xy0YSa
	 WJJts9i1xfRTBqy+zfHF5JnBJTN/zs0dNJNhfZhaGXZ8Z19wG+JNMOIwlQY1iqmiff
	 PIziNckrvryuyZfyUnkqvaVrPWY2MHnD/UBExEufw9TxRtRGGQbL03J5eqvKCl69E3
	 pDJ3L5POMusd4aiY7cHf4gavA7VhI/eO9NRlRTEBLytFyr1ZY95b2cvcTvDYFIdKTd
	 hDbN0ncM+iPhk21ehxXhUZxcdXehe4d2QrzD7j+JKWClC5ai3hdfGDw94kMdZ2sphP
	 o+cmD1krgsh/A==
Date: Mon, 29 Jun 2026 16:26:43 +0100
From: Conor Dooley <conor@kernel.org>
To: yc_hsieh@aspeedtech.com
Cc: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 3/4] dt-bindings: ipmi: Add optional LPC properties to
 ASPEED BT devices
Message-ID: <20260629-bogus-vocation-db32e55a595f@spud>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JftmSqqify0j7mOM"
Content-Disposition: inline
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
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

--JftmSqqify0j7mOM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 02:49:00PM +0800, Yu-Che Hsieh via B4 Relay wrote:
> From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
>=20
> Allocating IO and IRQ resources to LPC devices is in-theory an operation
>=20
> for the host, however ASPEED systems describe these resources through
>=20
> BMC-internal configuration, as already supported by the ASPEED KCS BMC
>=20
> binding.
>=20
> Add aspeed,lpc-io-reg and aspeed,lpc-interrupts to the ASPEED BT BMC
>=20
> binding so firmware can describe the host LPC IO address and SerIRQ
>=20
> configuration using the same properties as KCS devices.
>=20
> Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
> ---
>  .../bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml       | 21 +++++++++++++++=
++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bm=
c.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> index c4f7cdbbe16b..1803c6bbae93 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> @@ -25,6 +25,24 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  aspeed,lpc-io-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 1
> +    description: |
> +      The host CPU LPC IO address for the BT device.
> +
> +  aspeed,lpc-interrupts:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      A 2-cell property expressing the LPC SerIRQ number and the interru=
pt
> +      level/sense encoding (specified in the standard fashion).
> +
> +      Note that the generated interrupt is issued from the BMC to the ho=
st, and
> +      thus the target interrupt controller is not captured by the BMC's
> +      devicetree.

Why can these two properties not just be an additional reg and
interrupts entry?


Cheers,
Conor.

> +
>  required:
>    - compatible
>    - reg
> @@ -35,10 +53,13 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> =20
>      bt@1e789140 {
>          compatible =3D "aspeed,ast2400-ibt-bmc";
>          reg =3D <0x1e789140 0x18>;
>          interrupts =3D <8>;
>          clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> +        aspeed,lpc-io-reg =3D <0xe4>;
> +        aspeed,lpc-interrupts =3D <10 IRQ_TYPE_LEVEL_LOW>;
>      };
>=20
> --=20
> 2.34.1
>=20
>=20

--JftmSqqify0j7mOM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKOswAKCRB4tDGHoIJi
0psAAP9G4epdhbKfSpCHpiVzmew6DQEbokTKpL+98RgnG2LBKQD/U3BgoLrNNiQx
n3K2bKbjCnRtMLKQG2R8sbPvLE9VbwM=
=ygXE
-----END PGP SIGNATURE-----

--JftmSqqify0j7mOM--

