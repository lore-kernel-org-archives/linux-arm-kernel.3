Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32DCCC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IamzTMwDU3s6MvPStJCAl2qebcNFfLPCbj0Vniz5KM=; b=ZtOVzTEzILyFRX9Xs+sC6TuO/B
	owYHxs2gmBA9CJWEgRWiPMybJCc1ZdGqhXvkickrJE/Lq7tRE/rYl6wAC1ecjbuEgQTdheKfL5hBL
	ZFy8DtMrBui9E5TGgBWw4kWgBlO6QFKdUhVO1z4enovL0ekEfBXMtdUShZIwXiFOvApqSBBW6Kqmr
	F/8yRqXYKBzY083ssIAek0soMOKQrm01iBJzrMLJHs0wFzuG25v6kzakkDcBR5PrpzSyqupNxCffK
	k08QywCetzXmeP+TmIChnKnGygEl1l6zPq9ccPCOyCPUlP3tXRggtCOgKTwQzS7tRgiZFt3x90TLI
	TZQIgkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CwG-0000000H7xv-3Zoj;
	Thu, 02 Apr 2026 07:58:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CwE-0000000H7xe-36Q6;
	Thu, 02 Apr 2026 07:58:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 027206186E;
	Thu,  2 Apr 2026 07:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2521FC19423;
	Thu,  2 Apr 2026 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775116681;
	bh=dmzEjMz+G0kGZ86c7hnlol8UGuYu8HaYTRIYsCVzu4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjZ/eeqrI8C+38ObBE+mYnEkkApVuzxGZSYasUYMzxD0PNPmUnD+W2Hk6Ea2hW3/c
	 znNaLRljOm1YPBZb9wGOHniUFUR+6DUt7ylQICrDzpOCjkuuPujlh5mPdGHNdVEfQF
	 WhrXmX1DCQXu9MU5Y8xYzu1nUFTA4F/i4dr6h0FSH5j4gOjRdrk0lbr9Ex3/Wv357k
	 1pWmc+CA3gQ8ciQmV2ecQBDGY2yH9diri7j+t8kzcuuFB+kGZ1+y90fPQ45cdbfUkt
	 epc6s7LE2RPsRrKg1z4XWSucu1FQ6JWubSZU7oZJEteDAbzP8UZmC/FYrMoAulyROM
	 Jno7reZ2hfXgA==
Date: Thu, 2 Apr 2026 09:57:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <20260402-towering-transparent-malamute-1e44b8@quoll>
References: <0a951e34b7030e514091d6c0922c5982ae349221.1775090165.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a951e34b7030e514091d6c0922c5982ae349221.1775090165.git.daniel@makrotopia.org>
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

On Thu, Apr 02, 2026 at 01:37:02AM +0100, Daniel Golle wrote:
> Add compatible strings for MediaTek SoCs where the hardware random number
> generator is accessed via a vendor-defined Secure Monitor Call (SMC)
> rather than direct MMIO register access:
> 
>   - mediatek,mt7981-rng
>   - mediatek,mt7987-rng
>   - mediatek,mt7988-rng
> 
> These variants require no reg, clocks, or clock-names properties since
> the RNG hardware is managed by ARM Trusted Firmware-A.
> 
> Relax the $nodename pattern to also allow 'rng' in addition to the
> existing 'rng@...' pattern.
> 
> Add a second example showing the minimal SMC variant binding.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: express compatibilities with fallback
> 
>  .../devicetree/bindings/rng/mtk-rng.yaml      | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> index 7e8dc62e5d3a6..34648b53d14c6 100644
> --- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> @@ -11,12 +11,13 @@ maintainers:
>  
>  properties:
>    $nodename:
> -    pattern: "^rng@[0-9a-f]+$"
> +    pattern: "^rng(@[0-9a-f]+)?$"
>  
>    compatible:
>      oneOf:
>        - enum:
>            - mediatek,mt7623-rng
> +          - mediatek,mt7981-rng
>        - items:
>            - enum:
>                - mediatek,mt7622-rng
> @@ -25,6 +26,11 @@ properties:
>                - mediatek,mt8365-rng
>                - mediatek,mt8516-rng
>            - const: mediatek,mt7623-rng
> +      - items:
> +          - enum:
> +              - mediatek,mt7987-rng
> +              - mediatek,mt7988-rng
> +          - const: mediatek,mt7981-rng
>  
>    reg:
>      maxItems: 1
> @@ -38,9 +44,19 @@ properties:
>  
>  required:
>    - compatible
> -  - reg
> -  - clocks
> -  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:

As requested last time - drop

> +            contains:
> +              const: mediatek,mt7981-rng
> +    then:

missing constraints for mediatek,mt7981-rng. So does it have IO space
and clocks or not?

> +      required:
> +        - reg
> +        - clocks
> +        - clock-names
>  
>  additionalProperties: false
>  
> @@ -53,3 +69,7 @@ examples:
>              clocks = <&infracfg CLK_INFRA_TRNG>;
>              clock-names = "rng";
>      };
> +  - |
> +    rng {
> +            compatible = "mediatek,mt7981-rng";

No improvements.

Also, make the example complete since binding claims you have clocks and
reg.

I am not sure it should be even same file, but if you are making it same
file, then make it correct.

Best regards,
Krzysztof


