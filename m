Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74290CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/ngmsSQi9KM9Pk6vqx2NoKv6kDaqakL5ZWKZuh+ogY=; b=DAUNoDTvKyd+6DZxZCmSE+wB3t
	vxQ7Ges8LWL1SJz6VXaEE3DXGwpIpbpjZ25UxJfnRkUrcGfpfkzxtT9agkzFSg1uJAJd8B3XIo97E
	XJxMvy9qjXqlnYZh/FPIJo+U4GxT8FTYEG3xzpItAuS0X7Fmh2JcukF2NoGoW/DG3lnbaDRG4fzFB
	ss6N7r6VRom6cV+WSZkz8CMaoEGeiKWmG9PqlxAv5LQrSrwhGGmpGxBOCLSz+wn5GJmFTlkFVW7t1
	+EQgUvV0RvnR8sX2QSm9TBOElz/x5bD7/DF/bSI1KZ0VJfBcT9c4Fl9iTSqid7I9oenIw9CyC5b9B
	LIynIqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqgO-00000006IIV-0cDk;
	Fri, 31 Oct 2025 15:04:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqgM-00000006IIM-2eL3;
	Fri, 31 Oct 2025 15:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0B9D60277;
	Fri, 31 Oct 2025 15:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2A1C4CEFB;
	Fri, 31 Oct 2025 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761923089;
	bh=abvCv24Xykh2zMnbow02BKPEdSW0lshmPG5OcfXFUUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsTz/Cp++0swcNCc25qYTvDYYyFsuMx1yzIbuqupV+UMJxOdNxkGL/I1ZNGNwacJ7
	 rAIisu/ZFnoyzsfS1jNl2MhHYU4JawMAWniVGUFUvBjao73krdR705gmzFsQaiZjGn
	 vDKXps+a/U1wjkEoYnVwIPOyHZ5c8GtQZ3RXC8hyM/z3/tpuwwh0pbW+70UD+Bz2pL
	 jqiW/Kqu3tcfSUR/hh54eBLTlpm4nteul4pfH6PCY8gojN/2oneyWCWElbD6Ww4ZNH
	 9M6Ig+x5gKbkWyyG4gUop6ep19GG64vXkP4A/ywcwjtwKP2Pz4Xp4t18Zm4BkOA3F+
	 6wsi4YElvDgkw==
Date: Fri, 31 Oct 2025 15:04:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Willow Cunningham <willow.e.cunningham@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: bcm: Add bcm2712 compatible
Message-ID: <20251031-icon-woozy-58061dd3d4b4@spud>
References: <20251031102423.1150093-1-svarbanov@suse.de>
 <20251031102423.1150093-3-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eLR4aUssiEfZ2HhD"
Content-Disposition: inline
In-Reply-To: <20251031102423.1150093-3-svarbanov@suse.de>
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


--eLR4aUssiEfZ2HhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 12:24:21PM +0200, Stanimir Varbanov wrote:
> Add bcm2712-pm compatible and update the bindings to satisfy it's
> requirements. The PM hardware block inside bcm2712 lacks the "asb"
> and "rpivid_asb" register ranges and also does not have clocks, update
> the bindings accordingly.
>=20
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 38 ++++++++++++++++---
>  1 file changed, 32 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.ya=
ml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
> index e28ef198a801..ce910802ee9d 100644
> --- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
> @@ -13,23 +13,21 @@ description: |
>  maintainers:
>    - Nicolas Saenz Julienne <nsaenz@kernel.org>
> =20
> -allOf:
> -  - $ref: /schemas/watchdog/watchdog.yaml#
> -
>  properties:
>    compatible:
>      items:
>        - enum:
>            - brcm,bcm2835-pm
>            - brcm,bcm2711-pm
> +          - brcm,bcm2712-pm
>        - const: brcm,bcm2835-pm-wdt
> =20
>    reg:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
> =20
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - const: pm
>        - const: asb
> @@ -62,7 +60,35 @@ required:
>    - reg
>    - "#power-domain-cells"
>    - "#reset-cells"
> -  - clocks
> +
> +allOf:
> +  - $ref: /schemas/watchdog/watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2835-pm
> +              - brcm,bcm2711-pm
> +    then:
> +      required:
> +        - clocks
> +
> +      properties:
> +        reg:
> +          minItems: 2
> +
> +        reg-names:
> +          minItems: 2

> +
> +    else:
> +      properties:
> +        reg:
> +          minItems: 1
> +
> +        reg-names:
> +          minItems: 1

This else has no impact, was it meant to be maxItems?
pw-bot: changes-requested

> =20
>  additionalProperties: false
> =20
> --=20
> 2.47.0
>=20

--eLR4aUssiEfZ2HhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTQCwAKCRB4tDGHoIJi
0u7TAQCmY6ZrffsQeMrCOnwJwR+6+0PBxTS+VmwCXHJmSg55VAEA4E7lbHlwkUcC
Yp1juErjw5xEnoaFEYM/iaJJlh3erwY=
=eDwv
-----END PGP SIGNATURE-----

--eLR4aUssiEfZ2HhD--

