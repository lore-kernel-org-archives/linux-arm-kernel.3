Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC554CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1qJC9FEBLStLZYadjJB0z73Wt4b9XJZv0+3sG4ijwk=; b=lSbJkFZtv3CteOCO9xfz8vXn5B
	EnZDN/rsN1d3LWw1PBQ6Za07Ixr3nCW3Cb3L+5qbrWiLK5pr036YABBiJeyzNoFtfI1RTAtJI5MT7
	W0ZhpKqWO9cE2JXclUYZKMAfCiukjc0fr/9zOzvZJlfXgSQ+V2DxWthei2PvzOr29WuwdjAT2LOtg
	Gigi9YE5jEAIpwcRA2EhhkYs6fm5UfXwFUgD8wq6Z2b0mIaxWVJqi7w9lJckKAAORD1KwexvgkuLu
	wL164u5pqnjMGwdbicitWTZLwGTpJwd9OkN3FMaH/OA2VnjIUTYhPysBeija4PAOXFbAX7eiBoRHX
	QiTT4wRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLM4-0000000BLjk-1OI0;
	Mon, 12 Oct 2026 19:06:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLM2-0000000BLjO-1RqL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:06:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF4F741225;
	Mon, 12 Oct 2026 19:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D65E1F0089B;
	Mon, 12 Oct 2026 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831993;
	bh=V1qJC9FEBLStLZYadjJB0z73Wt4b9XJZv0+3sG4ijwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MlI4FjyE5ljwjZrb5hrekRS2ygoFn1xYSJeVgPuCBBQ/L+VQJBDcdaaKHzLq8udjB
	 7C7Zqwo5qA10b0N8+zo/3WFhTXbw6InEzCqF6XUpiCOTcUKHvfQNWbV6dV3BhYMeNL
	 iwVciTYvYfCvTS26VRHYWYhEudBeXwRlYFtpMUwCX9AITvR3EY4OyVNmeT8OA+ktAX
	 la4SofIIcl2N+6A1BPKRoBOgYSvJb4I/91g3qngRinat2L9nLbEWu/5vRCQvvUqNky
	 1C9oEpqItY2jPU7yCQdRokC7Peqrr6r/f6q9kkqFj2chcgewJ/ZZs3M+oltc6Ip+mb
	 S2NcM0bA6Exkg==
Date: Mon, 12 Oct 2026 20:06:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261012-twisted-cavalry-b52b5043fd5d@spud>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LbBYOngj9q7cuBu2"
Content-Disposition: inline
In-Reply-To: <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
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

--LbBYOngj9q7cuBu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 04:41:53PM +0800, Jelly Jia wrote:
> The CIX Sky1 DMA-350 integration is the same device with SoC glue around
> it, so it is described by the arm,dma-350 node itself with an additional
> "cix,sky1-dma350" compatible rather than by a separate wrapper node.
>=20
> Extend the binding with the CIX compatible and the resources the
> integration needs: a clock, which the CIX variant requires, an optional
> reset, and an optional reserved memory region used when the controller
> cannot reach all of system memory.
>=20
> v2 -> v3:
> - Drop the cix,irq-router property and its conditional: the Sky1
>   interrupt gate it described is set up by the boot firmware and is not
>   configured by Linux, so no property describes it.
> - The CIX compatible now requires a clock.
>=20
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Doc=
umentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..4e0f9ffb0039 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,22 @@ maintainers:
> =20
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-dma350
> +    then:
> +      required:
> +        - clocks
> =20
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma350
> +          - const: arm,dma-350

Provided the device is actually functional if the fallback compatible is
used, this patch is fine. Otherwise, please drop the fallback from here.

Thanks,
Conor.

> =20
>    reg:
>      items:
> @@ -36,6 +48,18 @@ properties:
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
>  required:
>    - compatible
>    - reg
> --=20
> 2.54.0
>=20

--LbBYOngj9q7cuBu2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0vtQAKCRB4tDGHoIJi
0nx0AQDB5r7oymsF6TAu0ttlEHIJipo6PrYdifW37NZxxwRGFgEAxKFlJzEToRQY
OfEGN5uC5Lzaagf0eTACGFQ70vFmFwk=
=mNaw
-----END PGP SIGNATURE-----

--LbBYOngj9q7cuBu2--

