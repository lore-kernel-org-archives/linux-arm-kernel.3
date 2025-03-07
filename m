Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E49FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bczNVcoTFII+wpIctbrNn7C9IZ/Opqlcg9xtqGAnx3A=; b=Zaxnuy+BieHCbyWIPOk0marbyM
	INxr0faMSTd+Kfu1/NyUs9fNdgTnfCN6WX3+PMpG1Nsn+7suGxyLOvq39nY4oRZP73SIzRERwDUjD
	O59pHCzp0DGP474eRp0wu48gmrLwwUnPkmGioP19UkPGm2DFKN9h+UwhgdSNdN/WKbE2gcgstCGBs
	Xtj7ZEjgyHS6wLxof3on+ayMIRY60pjOgThaIiLSmSyLXL97/q1zFuVB5W/GGrUQt76sDUzXJkUjE
	J6Jc3hgmONkjtEI9ANSwpBhYTOEPXoYNf3h8C1MUSKbLykWnEGZHk5t2veqbmi/vHGeEj48Vl8aqZ
	CNYv59Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZuC-0000000EkZN-0uJN;
	Fri, 07 Mar 2025 15:46:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZlx-0000000Ei5H-1UxV;
	Fri, 07 Mar 2025 15:38:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C59FD5C06E2;
	Fri,  7 Mar 2025 15:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A64BC4CED1;
	Fri,  7 Mar 2025 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741361880;
	bh=yN1dKWUGjtltzBE/WNByPB2L5yvAiNaSW2puRpSmGZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hb7UWL5h7uttVEAWxXxcGBZPDwSXkjXXYUYlIGcsycLnWgiNZTrVPf6ahCuMsRcjv
	 YL7tG606+7RziFoN1r5Y9xCm1dqvvYCHAvlsuqr9HZshGJxZfx7YK5UNO6foU2tPUj
	 o6uCDcmyhljV4Uvu2r3WlG66Kt9+Ja4VXchtHgkSvxmB3UEW/hdrdVam1zezjd59In
	 8MmduJpPRfE8P0Td8dbrBkh7vG/A9p9xPZonV8gRJOMKzs+0yum5aPXtvFoQe7rItU
	 39c45ZZMOT7r01FePYgpQ0UBuq82LoXOBUyaIeo2oXStAQGUtXGt9mN7kVmf2bGYcE
	 t6A7lH+GaDgNg==
Date: Fri, 7 Mar 2025 15:37:54 +0000
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: interrupt-controller: Add support
 for Amlogic A4 and A5 SoCs
Message-ID: <20250307-villain-blustery-8668e70cc005@spud>
References: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
 <20250307-irqchip-gpio-a4-a5-v4-1-d03a9424151b@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uCezGwJWEIthy7K/"
Content-Disposition: inline
In-Reply-To: <20250307-irqchip-gpio-a4-a5-v4-1-d03a9424151b@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_073801_490006_7F312F95 
X-CRM114-Status: GOOD (  15.67  )
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


--uCezGwJWEIthy7K/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 04:49:22PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Update dt-binding document for GPIO interrupt controller
> of Amlogic A4 and A5 SoCs
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../interrupt-controller/amlogic,meson-gpio-intc.yaml | 19 +++++++++++++=
+++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlog=
ic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-contr=
oller/amlogic,meson-gpio-intc.yaml
> index a93744763787..3d60d9e9e208 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> @@ -35,6 +35,9 @@ properties:
>                - amlogic,meson-sm1-gpio-intc
>                - amlogic,meson-a1-gpio-intc
>                - amlogic,meson-s4-gpio-intc
> +              - amlogic,a4-gpio-intc
> +              - amlogic,a4-gpio-ao-intc
> +              - amlogic,a5-gpio-intc
>                - amlogic,c3-gpio-intc
>                - amlogic,t7-gpio-intc
>            - const: amlogic,meson-gpio-intc
> @@ -49,7 +52,7 @@ properties:
> =20
>    amlogic,channel-interrupts:
>      description: Array with the upstream hwirq numbers
> -    minItems: 8
> +    minItems: 2
>      maxItems: 12
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> =20
> @@ -60,6 +63,20 @@ required:
>    - "#interrupt-cells"
>    - amlogic,channel-interrupts
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: amlogic,a4-gpio-ao-intc
> +then:
> +  properties:
> +    amlogic,channel-interrupts:
> +      maxItems: 2
> +else:
> +  properties:
> +    amlogic,channel-interrupts:
> +      minItems: 8
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.37.1
>=20
>=20

--uCezGwJWEIthy7K/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sS0gAKCRB4tDGHoIJi
0tLcAP0ab+eCyxWATmSaxQwJSP8SxJFf5vnViJI7+FDedfojRgEAqJJlUHhpTFfu
RHSHT6nbo2scx2atcuuOt9dgB0VPpwA=
=n9nr
-----END PGP SIGNATURE-----

--uCezGwJWEIthy7K/--

