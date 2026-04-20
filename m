Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89535F588EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXZRxLpksRJWokk37gmnYS6C20P0B+uiVOhrVPLTe1Q=; b=vxMSVFFS9UwkV6M2H+8eV80uXb
	OllIt0nXB4oYn0v0K1y9YK6SdtSekWIAt8xCfi0768tICPqk0bT9MGFXerPPsElF8tOzt6jHIYMK9
	jKDM3N8kgycl+i3+/hz9StGcoMZxnW1HeDF+UMDo6u2nxgfCL93vm0fcdfsjsHK+GZret0iRBUH9K
	G53CNwGHsQNnCHAdrYVvd6mtLk7ruYQRpU0nrly8zl2rR7U/o44L5/8CEN9oDWsulAh+xa2yuPUpJ
	rrH+fM+l7dWwsvpruPxQNIPwtfFQbYpZeBHXu3ZzNCeeYhOR736uD9n+XF6NhErUX1eWzNTyVgkDR
	m0GOogEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErOg-00000007Pzg-1Qao;
	Mon, 20 Apr 2026 16:22:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErOe-00000007PzC-0Jku;
	Mon, 20 Apr 2026 16:22:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6298444400;
	Mon, 20 Apr 2026 16:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2870EC19425;
	Mon, 20 Apr 2026 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776702171;
	bh=YEdo/V0QTAr+NW2dlqYidtGFQZDQxJkbLKbUxoyQ7yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxTKj7PlWluEqHuKTzEen462dAfrv0zZY9/iW/KTchxzdbie0xAcn49tOEIN3vpM5
	 aGzG0ZJn1mUsntJEkhTrtI3/I5Dz7AvBultI6l5O9IapBABCmY+15Cnw7cVQIQjn2B
	 uA9xZr93tge3LmcQ+Dz/swtlU+pjx44PshwqpOyyyHC8qWN1NSXlRQXv54p58pOwlZ
	 1hAXJgHCOBRBt921Q/hIosqWUL1VxjxxrAyohHXLmZ9/EP8WAd3oFDvfXgyWo/AgJ8
	 hhjg/J1tsBpcEJeSnJfk97FV7kmABYjkdDcVFhmJ1OEGlYpXuP2DYoKnfJkEnwiqjq
	 nSpyLSq0InXRw==
Date: Mon, 20 Apr 2026 17:22:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
Message-ID: <20260420-viable-plot-862e0c545837@spud>
References: <20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr>
 <20260417-add-mcu-fan-khadas-vim4-v3-1-a6a7f570b11b@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EN5NAUw4RNBry5U5"
Content-Disposition: inline
In-Reply-To: <20260417-add-mcu-fan-khadas-vim4-v3-1-a6a7f570b11b@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_092252_204248_C55F9EF2 
X-CRM114-Status: GOOD (  16.66  )
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


--EN5NAUw4RNBry5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 06:27:17PM +0200, Ronald Claveau wrote:
> The Khadas VIM4 MCU register is slightly different
> from previous boards' MCU.
> This board also features a switchable power source for its fan.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Docu=
mentation/devicetree/bindings/mfd/khadas,mcu.yaml
> index 084960fd5a1fd..a80718f7595ce 100644
> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - khadas,mcu # MCU revision is discoverable
> +      - khadas,vim4-mcu # Different MCU variant, not discoverable
> =20
>    "#cooling-cells": # Only needed for boards having FAN control feature
>      const: 2
> @@ -25,6 +26,10 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  fan-supply:
> +    description: Phandle to the regulator that powers the fan.
> +    $ref: /schemas/types.yaml#/definitions/phandle

Can you limit this by compatible please?
pw-bot: changes-requested

> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.49.0
>=20

--EN5NAUw4RNBry5U5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZS1AAKCRB4tDGHoIJi
0rq6AQCyNe1h3KXPOtFS9t3ntlaZUO80Ck84GL+I6mmU6358DQEA0hx/x6pQ5aO7
RXk37eL/R10YB9DDqs+wJN/2TnZoxgw=
=ak6Z
-----END PGP SIGNATURE-----

--EN5NAUw4RNBry5U5--

