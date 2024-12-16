Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A26E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Urcfzo6WdsffsY+BPLog1lEae7R1dbUuXiUJn46hIL0=; b=wzkbZI1mUnRCRdDC5JljN6CH5V
	/FEsLtHlJqnbVfD4nEKuv9ahj45/YInC3hFnz+ksc4JLv07Vt+iQn8GC3AJwdlO/UGJOX2cayaukE
	5tTBwPb+HA93Fd50l5IUa6+EVQomSYQe9G8km/xlSwDVQvyvaLmGDA6RrcRLGT9gniXVKFcARdJPC
	shxCmJkCaqrpTnPZqEmgNJCeVBQczovwElYDqHxroqFrq35AFG4vtpEK7hc2DD/BW8FEVtQ6LQ5Wc
	HPHH9oS/HZlvGISRQAp1UTw3q14sys5ejAC8HvPgpS2KblcgkZTyGH8bTnA/lotctNyBfDd3u49rF
	SnpVJ3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN88X-00000009fmj-1P3i;
	Mon, 16 Dec 2024 10:15:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN87A-00000009fSF-2P8D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:14:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6C285C56B3;
	Mon, 16 Dec 2024 10:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BD8C4CED0;
	Mon, 16 Dec 2024 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734344051;
	bh=neQjXpprVKKr7+IF1BUgJEHAPq3M8lzz9xydrcqWFo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsWn6z+kYzVCL1d/ttsn3cAwhLsTJnrZKePws0DMQfCcdZfxqUGa1c+War27UfG/b
	 EccRMYa4nAOQhmutyTjfkJaoZ5nCS2WY34x6FY3kLKB+/XRi5L9KGJyx1M8RkFQ9ge
	 TIzi1EebQwjW7soX8CPxHJjUTYHCzpEWB5YVzsN3r0Gbaqj7NQMPUHIaTPxuWVo1H8
	 WpS5l+LFSQAOVxngrZiOu5Nz4rxePRs3grq767Af1lYipAbKKa3vFgRwNwEaWT+G2I
	 276CiLDsXZy728PqRvP18pQKkVyFP9Iq7ipiHqsspb0DyYjkJkdqTDLX7mEWvA4ejH
	 cUUX07hmt4mUQ==
Date: Mon, 16 Dec 2024 11:14:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH] dt-bindings: mfd: atmel,at91sam9260: Convert to json
 schema
Message-ID: <dxgqkdo6ulmqfa5vyerwta3vubuy32gzzu2cxfwwtespydfc4b@5wjrno3lgjsp>
References: <20241211-matrix-v1-1-5ef0104a3af4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211-matrix-v1-1-5ef0104a3af4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_021412_696149_917157CB 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2024 at 04:59:22PM +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> Add a fallback for all compatibles as the IP core is compatible
> with `syscon`.

I don't understand. The syscon was already there. You added different
fallback, so provide explanation why do you think they are compatible.

> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
> ---
>  .../bindings/mfd/atmel,at91sam9260-matrix.yaml     | 54 ++++++++++++++++++++++
>  .../devicetree/bindings/mfd/atmel-matrix.txt       | 26 -----------
>  2 files changed, 54 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml
> new file mode 100644
> index 000000000000..0e827882823f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/atmel,at91sam9260-matrix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip AT91 Bus Matrix
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +
> +description:
> +  The Bus Matrix (MATRIX) implements a multi-layer AHB, based on the
> +  AHB-Lite protocol, that enables parallel access paths between multiple
> +  masters and slaves in a system, thus increasing the overall bandwidth.
> +
> +properties:
> +  compatible:
> +    anyOf:

oneOf
See other bindings for preferred syntax. There is never anyOf.

> +      - items:
> +          - enum:
> +              - atmel,at91sam9260-matrix
> +              - atmel,at91sam9261-matrix
> +              - atmel,at91sam9263-matrix
> +              - atmel,at91sam9rl-matrix
> +              - atmel,at91sam9g45-matrix
> +              - atmel,at91sam9n12-matrix
> +              - atmel,at91sam9x5-matrix
> +              - atmel,sama5d3-matrix
> +          - const: syscon
> +      - items:
> +          - const: microchip,sam9x60-matrix
> +          - const: atmel,at91sam9x5-matrix
> +          - const: syscon
> +      - items:
> +          - const: microchip,sam9x7-matrix

So that's just enum with previous group.


> +          - const: atmel,at91sam9x5-matrix
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    matrix@ffffec00 {

syscon@
or system-controller@


Best regards,
Krzysztof


