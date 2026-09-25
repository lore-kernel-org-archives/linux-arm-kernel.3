Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE74C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIumMAJNznQ9DrE7dU0GPomzZVcUJ+5wdY/jveeHliU=; b=DhAAQcXvmILlioO8YGM7mf/TGS
	5d51/GRHfILEqRvwsHC1CauP6MfkGVqY0fPHLlUrH8AWPlVbaHV3fCg5lBwsKhelx8z2EdhgIPWot
	NyYoXJag9Jnghb1L1IwalNaEoDOtzjTN6S97p56ma3oweHo660nYnv8iuC6Zth0+jFMVWObwIsEGh
	w/NFGk9EIilda5rwKuxiQ7sjdKqu2ooBY2NCUvNQl1xFRry6wwerXQx40g1n8xaED4hV/CR32FDnE
	vKyzXEGuQAT0OLbtYTBYSoNeZijCNJh9u26lk6mMrt9JWUwQb1nmF7pE8FdCEqVkkbWwKaWgzeWiO
	qLNywNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8zG-0000000DyUw-2uCp;
	Fri, 25 Sep 2026 16:41:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8zF-0000000DyUC-0dm1;
	Fri, 25 Sep 2026 16:41:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE6544062B;
	Fri, 25 Sep 2026 16:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F342A1F000FF;
	Fri, 25 Sep 2026 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354484;
	bh=WIumMAJNznQ9DrE7dU0GPomzZVcUJ+5wdY/jveeHliU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AiqBTp5PJEFtVAgYEhZK1Kr/gPKKEYAFDuCmfKxZCB8XSEC2czAdfJwAUmVGRKUCH
	 YDg/+OaB1pAejuH7Rlp6FuiXTjZoVUOBcdbGxCJ0adMEhg1ARtGJgWt1sTRhVw80wd
	 D/glrHY73t8EcqAuZZlmOi9FQJEDABL2PQ4TRzi7xJm5w5qRCGWfaSEnqb5WTmbhEB
	 3XS+TSWamdY6KcEGUaqgp3ixqzCkwuB8/spe5u7Ry8Lw/h9Fo92pGwsRZ8sJs8CBdA
	 4NwoxU7Epd9fSPjbk9OAHiCbxC7creNtk39j4zTormttPoibj/plyefNMlqq0ltDOL
	 Vtcb/JgEyz1Pw==
Date: Fri, 25 Sep 2026 17:41:20 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
Message-ID: <20260925-facial-follow-032de22361c1@spud>
References: <20260925-add-t7-sys-pwm-clk-v2-0-f23a22b71a5c@aliel.fr>
 <20260925-add-t7-sys-pwm-clk-v2-1-f23a22b71a5c@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1HZVlWbgy+JhL9b"
Content-Disposition: inline
In-Reply-To: <20260925-add-t7-sys-pwm-clk-v2-1-f23a22b71a5c@aliel.fr>
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

--i1HZVlWbgy+JhL9b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 05:13:28PM +0200, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> The T7, A1, C3, and S4 PWM controllers have a system clock in
> addition to the two input clocks of channels A and B.
>=20
> The channel clocks are acquired by index in the pwm driver,
> where the core clock is fetched by name, with optional get
> which is silent when not provided.
>=20
> Require clock-names and minimum 3 items for T7, where the
> PWM devices do not work without all 3 clocks.
>=20
> Add an example showing T7 usage with its fallback to
> amlogic,meson-s4-pwm.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 33 ++++++++++++++++=
++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Doc=
umentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index c337d85da40f1..59320f288552b 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -62,7 +62,7 @@ properties:
> =20
>    clock-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
> =20
>    power-domains:
>      maxItems: 1
> @@ -140,13 +140,34 @@ allOf:
>      then:
>        properties:
>          clocks:
> +          minItems: 2
>            items:
>              - description: input clock of PWM channel A
>              - description: input clock of PWM channel B
> -        clock-names: false
> +            - description: gate clock for the PWM controller
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: channel-a
> +            - const: channel-b
> +            - const: core
>        required:
>          - clocks
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-pwm

Shouldn't this (based on your reply on the previous version) be s4?

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +      required:
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> @@ -182,3 +203,11 @@ examples:
>        clocks =3D <&pwm_src_a>, <&pwm_src_b>;
>        #pwm-cells =3D <3>;
>      };
> +  - |
> +    pwm@60000 {
> +      compatible =3D "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +      reg =3D <0x60000 0x24>;
> +      clocks =3D <&channel_a>, <&channel_b>, <&core>;
> +      clock-names =3D "channel-a", "channel-b", "core";
> +      #pwm-cells =3D <3>;
> +    };
>=20
> --=20
> 2.49.0
>=20
>=20

--i1HZVlWbgy+JhL9b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarakLwAKCRB4tDGHoIJi
0o/hAPwOcNkaCJn01XPDJCbfkxs1yGaXBarwQvpIKVoyDyubpgEA1j5tZeRZl1nk
y633urYORlZkdOprR8rhmpHztGEV/AQ=
=noe3
-----END PGP SIGNATURE-----

--i1HZVlWbgy+JhL9b--

