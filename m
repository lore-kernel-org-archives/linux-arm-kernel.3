Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FFFC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJNHuntw5kLiM/ABI6QC8ajHWMQX7EIkqBeEAnVRc/k=; b=uRpEeagfDIZrxHWorxlR2J0RRM
	lPrCTKzrcjhqh412sPdffQcO4AqS720l0dFLo7Cu/Wzp82TfDFctA+59gOIU3LF7nLZCM7JilDBa8
	oL3I4BTYWr3G2AjpPzVWrL+0OmgNqd4ZSFAFFwHPIWuSUoRl+a0BlpeuXTUqF0fL/OAVxOmxUZZOk
	+eEUhuJdNbGLUxKvmP2ZuAH9T79qxHswE4Po0o4g106W1R0oS5eaEI+m8YIkyXWBJcQlQgNaCynT3
	x5zwqwHzdOWteCPwddukael1UBrVa4rfm/mmxSCGFU1DRt3296gBVpqzMHfbCYKz5J/vUeOwpiDHQ
	j/fVVcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5gB-0000000CIWR-2rGX;
	Fri, 28 Feb 2025 19:05:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5dg-0000000CI8c-4A6U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 390155C68D9;
	Fri, 28 Feb 2025 19:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D352C4CED6;
	Fri, 28 Feb 2025 19:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740769391;
	bh=fkRwxASTRhK3CZzhXw1baxiK+9kAKBEvfZLUN9AOx1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tShjH7cEZHyiforgx0ocxgRzr86xXl8LxTLd6sLN4nfpWq2Nvk7kwuu7XSYtuwmmR
	 GeBc4FWAIBs0eaFqOaV8sTR2CN+kOWmNf/AysWKF9bpyDfCYZvHf3RJidF2HlGf3wF
	 Uxi4jVVVQi5fLy1P7P1GhxnLqaa/qeKJIs+dxrgZH36OQRpx/lsVU7q+2K3bgAEW9p
	 s9fVkyUMncr/8YM9Sp4iLbibXI/KQWuuIvAfUImUX4bMiOtecTG5EUPaBUS7xQsbXS
	 /gSteDdJkRGdCwfov7gGInz+mEtxVFjgb0vYgo2/viJLpskpqVGhsMKP4s3N99++ag
	 iWRSGtqrNHeNw==
Date: Fri, 28 Feb 2025 19:03:05 +0000
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	catalin.marinas@arm.com, will@kernel.org, john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Message-ID: <20250228-shampoo-uprising-44ae0d3bd68b@spud>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
 <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VeciV8RQYG2Ieked"
Content-Disposition: inline
In-Reply-To: <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_110313_169379_824B4F32 
X-CRM114-Status: GOOD (  20.50  )
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


--VeciV8RQYG2Ieked
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 01:24:39PM +0100, John Madieu wrote:
> The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time temper=
ature
> measurements for thermal management, utilizing a single dedicated channel
> (channel 1) for temperature sensing.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> v1 -> v2:
>  * Fix reg property specifier to get rid of yamlint warnings
>  * Fix IRQ name to reflect TSU expectations
>=20
>  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a=
09g047-tsu.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-=
tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.=
yaml
> new file mode 100644
> index 000000000000..e786561ddbe3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
> +
> +maintainers:
> +  - John Madieu <john.madieu.xa@bp.renesas.com>
> +
> +description:
> +  The Temperature Sensor Unit (TSU) is an integrated thermal sensor that
> +  monitors the chip temperature on the Renesas RZ/G3E SoC. The TSU provi=
des
> +  real-time temperature measurements for thermal management.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g047-tsu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      Interrupt specifiers for the TSU:
> +      - S12TSUADI1: Conversion complete interrupt signal (pulse)
> +      - S12TSUADCMPI1: Comparison result interrupt signal (level)
> +
> +  interrupt-names:
> +    items:
> +      - const: adi
> +      - const: adcmpi
> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +  renesas,tsu-calibration-sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the system controller (sys) that contains the TSU
> +      calibration values used for temperature calculations.
> +
> +  renesas,tsu-operating-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description: |
> +      TSU operating mode:
> +      0: Mode 0 - Conversion started by software
> +      1: Mode 1 - Conversion started by ELC trigger

Can you make this "software" and "elc" or something please, unless
people will genuinely find "0" and 1" to be more informative.
And why doesn't the property have a default?

cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - interrupts
> +  - interrupt-names
> +  - "#thermal-sensor-cells"
> +  - renesas,tsu-operating-mode
> +  - renesas,tsu-calibration-sys
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tsu: thermal@14002000 {
> +        compatible =3D "renesas,r9a09g047-tsu";
> +        reg =3D <0x14002000 0x1000>;
> +        clocks =3D <&cpg CPG_MOD 0x10a>;
> +        resets =3D <&cpg 0xf8>;
> +        power-domains =3D <&cpg>;
> +        interrupts =3D <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "adi", "adcmpi";
> +        #thermal-sensor-cells =3D <0>;
> +        renesas,tsu-operating-mode =3D <0>;
> +        renesas,tsu-calibration-sys =3D <&sys>;
> +    };
> +
> +    thermal-zones {
> +        cpu-thermal {
> +            polling-delay =3D <1000>;
> +            polling-delay-passive =3D <250>;
> +            thermal-sensors =3D <&tsu>;
> +
> +            cooling-maps {
> +                map0 {
> +                    trip =3D <&target>;
> +                    cooling-device =3D <&cpu0 0 3>, <&cpu1 0 3>,
> +                                     <&cpu2 0 3>, <&cpu3 0 3>;
> +                    contribution =3D <1024>;
> +                };
> +            };
> +
> +            trips {
> +                target: trip-point {
> +                    temperature =3D <95000>;
> +                    hysteresis =3D <1000>;
> +                    type =3D "passive";
> +                };
> +
> +                sensor_crit: sensor-crit {
> +                    temperature =3D <120000>;
> +                    hysteresis =3D <1000>;
> +                    type =3D "critical";
> +                };
> +            };
> +        };
> +    };
> --=20
> 2.25.1
>=20

--VeciV8RQYG2Ieked
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IIaQAKCRB4tDGHoIJi
0h6yAP9mVpIjUx0jaOqOxtaUXN4UN78pR3bAJQoVq1PhhnX9VAD+ILPM3T/hP0Dc
+ShPfuSw2qswD5Gh7yHGz+0ikOGf9w0=
=yvBh
-----END PGP SIGNATURE-----

--VeciV8RQYG2Ieked--

