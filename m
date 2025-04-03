Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0337EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GdaiwumNl9tjxYsVYIC1X0Y4b04WgRBhlet0G1nlFs=; b=yXhLE6wMpHcf47HJZugoARREak
	DDm0po2W2TkAE3xSUayP0A+lrmDQQuc8JcYiLZWJCK7mYc0bIOsHNp4hTNWaSOEahEJV17U+UDM+6
	P9GKrvpzQcMiIKzCx1zLXZs/za6gWxxsW4+xRmbU+p993El4JszjD9hpyqvrSiTHq6LlSenaDqrfO
	OPBgGrDH8Lox8W5b6rPfL2SfITvclKRH6rsfHlyjGv//XkvoSS2/nNKrLmvCkSo0T2r0ObbTLVtFI
	NKyQYAhqGnB+Mdxv7ZMG6jj/hKkK5iJSs/DynGUQsWCvf9hWJw9tKt8uRwt3RKsPJrtsBmaElG6uw
	dErgGmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0IXV-00000008fTr-2Nxa;
	Thu, 03 Apr 2025 11:15:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0I0x-00000008bNS-1AjM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:41:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29686434B6;
	Thu,  3 Apr 2025 10:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E034C4CEE3;
	Thu,  3 Apr 2025 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743676898;
	bh=ARN7XYpJRXpPUgyngwnAGIRk8k4S5YsMIgbo9WqpgfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckurg04xFgrLpfddbO8QPSoQYfrfzaJcxIUOBontZFAP6RGupO0YJBUx/d+JJcEIy
	 tc1l9Ppp0XmyNnrrbWoGS4+zpsZM95IPZRptSZjHfA+NGCH75ugxh7WWn5DJg/8udh
	 TcOL/6vLc0NAWHobSEHkDRMNSQJphTrR0eZ41R2SCeP7kBmItxK4YkWb0fmNFfOqV3
	 ugcOyTVT3RwbUeW9O//xcOz0bpP4He1DxlKFJcR6raDepdmpOfhPjcQSUJoQV/oqEA
	 UEa9zCfszRIHTu693zOmLW70OVnVQiwLHCg24OXDb8C9zG80R+3Q0NWpYbGzeMR/wp
	 wVAONWe4keXmw==
Date: Thu, 3 Apr 2025 12:41:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vz@mleia.com, 
	piotr.wojtaszczyk@timesys.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
Message-ID: <76ovkshf4dr6egh72uiigsugdqsin6zwy3skksldhhh2goer6x@gsp3qkhqdtev>
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eprp56w3poiehbc2"
Content-Disposition: inline
In-Reply-To: <20250312122750.6391-1-purvayeshi550@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_034139_356185_5AD5BDF9 
X-CRM114-Status: GOOD (  18.34  )
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


--eprp56w3poiehbc2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
MIME-Version: 1.0

Hello,

On Wed, Mar 12, 2025 at 05:57:50PM +0530, Purva Yeshi wrote:
> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
> YAML schema (`nxp,lpc3220-pwm.yaml`).
>=20
> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.
>=20
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>

I suggest the following commit log:

    dt-bindings: pwm: Convert lpc32xx-pwm.txt to yaml format

    Convert the existing plain text binding documentation for
    nxp,lpc3220-pwm devices to a YAML schema.

    The value #pwm-cells wasn't specified before, set it to 3 to match the
    usual value for PWMs.

> diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b=
/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> new file mode 100644
> index 000000000..432a5e9d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/nxp,lpc3220-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LPC32XX PWM controller
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vz@mleia.com>
> +  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3

The PWMs defined in arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi also have a
clocks property and in the driver it's not optional. Can you please add
it (here, in the list of required properties and the commit log)?

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwm@4005c000 {
> +        compatible =3D "nxp,lpc3220-pwm";
> +        reg =3D <0x4005c000 0x4>;
> +        #pwm-cells =3D <3>;
> +    };

Best regards
Uwe

--eprp56w3poiehbc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfuZd0ACgkQj4D7WH0S
/k6jEwgAuuRJwfaakekR1Dqz//WqYnO+LEZGbZQSLnf9kWKg3A6eJQvWxfblNhGK
BrrDx9siqqccakNGayyBWd9dQG4NVgIUeoB+QtdYwzvhVaAnyVN4Nr5b4Wda/Go4
d7vsQMK5ge8KwAghxML75LcllDxXs0aDeiexAmKJmEa2folRYG5O2FfAGp/AhzBi
s39SvbuaWbdLkd7d5NzKStU2BoxUMTu/dk9stu1QIK12150syUUPLpJtyeXWP8tk
Hmss1Y5ayRyVpgwN8rHHM6N8UOZHmFdf0EahDHesj5gcPrfSH1jTUzds8VlhCjSv
ECAEuNX2TFAi+9eqc7/tUoPSFkgO1w==
=0WCU
-----END PGP SIGNATURE-----

--eprp56w3poiehbc2--

