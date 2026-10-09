Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A29CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzN4CB+A0HAdRCT2F/Svd9zdUa6iTetFlzv03wkDw5E=; b=tQK7vrzjbEx/06MoQNDf8BnF+O
	umZYe+EQFRT0qJeUBeJwowh5Nd+MsNwIoyg7NlKwfIvRn3P18SUC033DzVwmKZ67rUdpVqYbcRH+N
	wOMOmAMTPixEGhq2UVK9yNQIUB2Y0Le0795NR5H410xwMRm36hsaZGSv44wFzuAr/z0ovw5jIETKA
	fKw4KIxXjqU8SbF1y7NXlxt6ds0kB9/gFxarkASrnyx7VNKqE5ime5QsuErICtpyt5cGThvs2rT5F
	QviAbV0aIC/6ScpbXrIUzDPFsExAqG63F7FXcGqaWChxBvQZeH19YpuTtf3w9LwyT+SvR3NX46Lde
	6zw3Czew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCZN-00000006XDe-0dfC;
	Fri, 09 Oct 2026 15:31:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCZL-00000006XDS-2wsj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:31:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A1B860098;
	Fri,  9 Oct 2026 15:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A3E1F000FF;
	Fri,  9 Oct 2026 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559894;
	bh=uzN4CB+A0HAdRCT2F/Svd9zdUa6iTetFlzv03wkDw5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R533SftOEk1e2agMf6GN47JaFth1UmEJ8PxwvEKze8o2BCUeI3+uE7DjP23vLV52R
	 DChBvnUySPFvtxmqEtx21vq0RxLBnV49PU6CZdd5EJTBgqejDOMgbGox+ebwgaftDg
	 s7R1T8htqmopYsrG2LGlh00D96R73fPZyXFhf99f/XBuvN/Yi7NxqEulA/0zcTbNFs
	 fs3LdyhRbOxxeVwiGaqP3LpF09DkP2au90Z/TmRH+RKIX1Yhdz5HukO4jDb1lWBv+b
	 XwiCRHq1402dIwR6w+DmlWHVd6JgyMPwlm+Ksog12I9tTnyp8L8jI5ru5uvMvXoOgb
	 WI4IIyqq0kX3w==
Date: Fri, 9 Oct 2026 16:31:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261009-e284e1844269292657604ec7@squawk>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F6ICfzGMXDwCSKuy"
Content-Disposition: inline
In-Reply-To: <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
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

--F6ICfzGMXDwCSKuy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 01:18:44PM +0800, Jelly Jia wrote:
> The CIX Sky1 DMA-350 integration is the same device with SoC glue around
> it, so it is described by the arm,dma-350 node itself with an additional
> "cix,sky1-dma350" compatible rather than by a separate wrapper node.
>=20
> Extend the binding with the CIX compatible and the resources the
> integration needs: a clock, a reset, an optional reserved memory region
> used when the controller cannot reach all of system memory, and the
> syscon that routes the channel interrupts to the AP interrupt
> controller on Sky1. The cix,irq-router property is only valid together
> with the CIX compatible.
>=20
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
> v1 -> v2:
> - Folded the integration into arm,dma-350.yaml: the Sky1 DMA-350 is the
>   same device, so it keeps the generic compatible plus a device
>   specific "cix,sky1-dma350" compatible, and the integration resources
>   are described on the controller node.
> - Dropped the separate cix,sky1-dma350.yaml wrapper binding.
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Doc=
umentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..3b991985c416 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,23 @@ maintainers:
> =20
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: cix,sky1-dma350
> +    then:
> +      properties:
> +        cix,irq-router: false
> =20
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma350
> +          - const: arm,dma-350
> =20
>    reg:
>      items:
> @@ -36,6 +49,24 @@ properties:
>      const: 1
>      description: The cell is the trigger input number
> =20
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Reserved memory region used for DMA allocations when the controller
> +      cannot reach all of system memory.
> +
> +  cix,irq-router:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Syscon phandle for the CIX Sky1 subsystem register block that rout=
es
> +      DMA-350 channel interrupts to the AP interrupt controller.

See comments on the driver for more on this, but I'm not convinced that
this should be in this node - especially if this thing controls other
device's routing too.

Thanks,
Conor.

> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.54.0
>=20

--F6ICfzGMXDwCSKuy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaskIzgAKCRB4tDGHoIJi
0onYAP4yCAErULolgU18TX/15DolYA6bb5xPSN6uypp8TiIi6gEAi7eNathXzHwJ
aqeYLo23GAW24JOwI2TzAyK7dXRu5gk=
=TyQ6
-----END PGP SIGNATURE-----

--F6ICfzGMXDwCSKuy--

