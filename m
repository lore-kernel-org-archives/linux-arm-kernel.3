Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3586FD8FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCoCG3Ok7nW/o16b9nWgmLc3dgITUgeZwEqBinhLuec=; b=yJRWl8QLsgMqR0LdzqBF9Wkn16
	lDapFOD83Q6v0fBpuvUVux0v33XD5yPfXswOIufhHQR9iHAQN0t5Br+o0VvtZqmFqE5Vk9dbzHZox
	ZGPuWmigWjGcU6wUzCsQ5GDJ/4yIkKuoc+A9q5tTSpynH5OSuJBChCJAHx9BDJAA+1BhCFi/M3IuG
	F64Y6ahNtIR6Kz9dURVh7V2xOGP4FpbMI4lvUuOhWrh0xi73t268HhGAgIbE6ENu1jwtgydWj/U5N
	fXAbBLbr01WUW5KwEGFJjA8jyZ3h5+Au44Bk+S4qw2SP/Kx9uqZJOYddzO+aN4nuxHLMnEEvNV8Qc
	yBu3YR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfqc-00000006vnv-1TMn;
	Thu, 26 Feb 2026 18:12:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfqa-00000006vnM-0g8L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7EA743844;
	Thu, 26 Feb 2026 18:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D7AC116C6;
	Thu, 26 Feb 2026 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772129543;
	bh=pwv4c3DZNyODTHone22LzNjJgvcn88A3kBVODStq6jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ef3D++YuYVHUjD/BDgy/GJUCMcNqZRydCEr/+xhCiox6mAyUPg5/sqgekTGUcJNxH
	 U9XEBXFQFSkJr/+YeU/z7Ust1K3J4KWcb+5YoQLaqyPz3O0y/uoEoICtvAGYJmH8ZH
	 gJF0i17JytseYoJ5aXgS65WaOy5F0Pbu8ARFjvsPM6fa7O7vSmL1YHzhYCq4X0UGb/
	 bbIpPfVDt2caWbtntPkd6yLpVWWlvUSdAuecKNhHy+aDph3xB7ebXDzvt9ox9oW40p
	 LTDVzQeO4RDyGUFNa8RHGhu9aDOthLfCl3tUn9m1OQYFiGJpJQp97A0FzPPly31SSc
	 JLFknbjhLAUtg==
Date: Thu, 26 Feb 2026 18:12:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc:
 convert to DT schema
Message-ID: <20260226-escapade-staff-4f2842222b3e@spud>
References: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
 <20260226-arm-microchip-v3-5-0bda15abd922@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xblG4IE1HbojiYMm"
Content-Disposition: inline
In-Reply-To: <20260226-arm-microchip-v3-5-0bda15abd922@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_101224_239052_FC35810B 
X-CRM114-Status: GOOD (  17.11  )
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


--xblG4IE1HbojiYMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 04:13:37PM +0000, Akhila YS wrote:
> Convert RAMC SDRAM/DDR controller binding to YAML format.
>=20
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++=
++++++
>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 20 -------
>  2 files changed, 67 insertions(+), 20 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdram=
c.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
> new file mode 100644
> index 000000000000..1516fc8e09e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip (Atmel) SDRAM / DDR Controller (RAMC / DDRAMC / UDDRC)
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +
> +description:
> +  The SDRAM/DDR Controller (often called RAMC or DDRAMC) in various
> +  Atmel/Microchip ARM9 and Cortex-A5/A7 SoCs  manages external
> +  SDRAM / DDR memory. It is typically exposed as a syscon node for
> +  register access from other drivers (e.g. for initialization or mode
> +  configuration). No interrupts or clocks are usually required in the
> +  binding.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: atmel,at91rm9200-sdramc
> +          - const: syscon
> +      - items:
> +          - const: microchip,sama7d65-uddrc
> +          - const: microchip,sama7g5-uddrc
> +      - items:
> +          enum:

Whoops, sorry for not noticing this earlier, but an items list with one
entry can be reduced to that one entry. For you here that means that
"- items enum:" becomes "- enum:".

--xblG4IE1HbojiYMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCNAwAKCRB4tDGHoIJi
0qtpAP9APtvalgzi0zvyIeO61JzAAmgR5MhmOEmLmbI/hapjCAD/Xmuxw6uLJVCq
SsgDnOlRaH/Sip9zrvYl75+sAEQyBQA=
=PX69
-----END PGP SIGNATURE-----

--xblG4IE1HbojiYMm--

