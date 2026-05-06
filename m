Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A5BCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjm7NoGgKSxevgsF+2TQsRrcA7FECgBjprgUC8nh9mo=; b=Ki/4wGd3TlnKsfaBy8jbcncuBZ
	Ms9WmLsEQzbwW8hSOiMbu+9M5WmCYOX/UcgJ15UJIzeR8n+HmDCPhmJLDgl5uAE5B366FDXz9lq6+
	8F3qpS4AJKiBMUi/KF4l+ID1+0sE5oxnMlYwuK9eLUstU+zfWBHAAs4ap9sh0x/dbpnzaZ13aK1ED
	x2QVNdtBg2wvnAD99q90qt1xe1hn7O75BpuNuq0WOsgRUU2fkUNofgm851zWr7F8oFOj6aW/HV/da
	NGXC5/3P7aKtN6P3gnddaz88CgBWQn+Z2y7VsqZ9E1JGJicVdeMnHP8e/vEjzF7/ijYOQD6cOOv4w
	UsjZo/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg66-00000001fNe-1eh7;
	Wed, 06 May 2026 17:31:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg62-00000001fN5-2RFj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 17:31:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D90B241501;
	Wed,  6 May 2026 17:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E85C2BCB0;
	Wed,  6 May 2026 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778088701;
	bh=IXW/gs6w5MDeR9oMEXijuhUMUHTh6E+zU+M+iFLMlpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dx4isqLgc1x044bHqO4HPhxPHkU5q1I21A0oaqtU2HF+Qa84+yMomcDCGJSrY6DCM
	 Zb9Tzppb8RpJElwMjzQywDASxzwAiwwct4qwAhHBN/TZCbPCirZbvLIMkWVFB0dZK0
	 Q1h6UUI7HDoETh2igqwGdFUSasl4gESt2HcrFSyNi+2ElnAqA6SsgivETY/ljf/59z
	 n2YyKpEG9jUDsUJ5geeKAAeGL1QEjWKTc4zP3MIRPjGb9oZPBuLHRu4SI36cxq54bQ
	 OHCyMLHWA0RlzmbzCY2422zCZp6NLoN7VZWr+1mKDzUaCSBcL25H5ooE6cD4WrkFn/
	 jGaeq/kaWyDAw==
Date: Wed, 6 May 2026 18:31:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema
Message-ID: <20260506-turmoil-chef-81946165534a@spud>
References: <20260506170236.2610955-1-kernel@rembrandt.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RGBws5Tk3qhVLKYL"
Content-Disposition: inline
In-Reply-To: <20260506170236.2610955-1-kernel@rembrandt.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_103144_552153_01300448 
X-CRM114-Status: GOOD (  20.15  )
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


--RGBws5Tk3qhVLKYL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 07:02:36PM +0200, Andrew Rembrandt wrote:
> Convert the ST Nomadik boards binding from free-form text to DT schema.
>=20
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
> and keeps the existing example.
>=20
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
>  .../devicetree/bindings/arm/st,nomadik.yaml   | 36 ++++++++++++++++++
>  .../devicetree/bindings/arm/ste-nomadik.txt   | 38 -------------------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 37 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/st,nomadik.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/ste-nomadik.txt
>=20
> diff --git a/Documentation/devicetree/bindings/arm/st,nomadik.yaml b/Docu=
mentation/devicetree/bindings/arm/st,nomadik.yaml
> new file mode 100644
> index 000000000000..9a6d1458cad3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/st,nomadik.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST Nomadik SoC based Boards
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: |
> +  Boards using the Nomadik SoC platform
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - const: st,nomadik-nhk-15
> +      - const: calaosystems,usb-s8815
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    usb-s8815 {
> +        ethernet-gpio {
> +            gpios =3D <&gpio3 19 0x1>;
> +            interrupts =3D <19 0x1>;
> +            interrupt-parent =3D <&gpio3>;
> +        };
> +        mmcsd-gpio {
> +            gpios =3D <&gpio3 16 0x1>;
> +        };
> +    };

This example should just be removed, it has nothing to do with what's in
the binding above. The text binding describes it as a "required node",
but no node by the name appears in the kernel sources.

With it gone,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested

Cheers,
Conor.

--RGBws5Tk3qhVLKYL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaft6+QAKCRB4tDGHoIJi
0uk7AQDoPwVpfTCEtPu/YLhKAFhJCyzqRG9Psyh7SjBjLJQSDQD9GvcsDxGN1a6P
GpyjKA5lv3Ffwr4tM+0mwUmH6KsHywQ=
=37OC
-----END PGP SIGNATURE-----

--RGBws5Tk3qhVLKYL--

