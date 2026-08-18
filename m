Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB40C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX0teEYZDicZcHJo2lDUYkFNlLlxLZ1Jm2aWE8Ry63M=; b=R0hPgFQUBtRlWeRu8ul9lJDQs8
	yqCYvfEZz7MiCi2uB0UFHPyXVkhCJzcOVc7MiYP2bnC1t3QsAJOhSwDF2Aa4zerhecMBftAu7hIpY
	LZBzSqQuUP84HXlFPjSJQd/VFSwFJN148ivMZUY8XQwv+o/JQz0uZw+VogwK/TF0aGbz610Qmenls
	MtC+wBE3mFGYJ6f5l5NvMYq9srPfacylFnbqaenDTTMYnmmxqhLAWvxN17rxLYST1jRs2TfZWC4m2
	stUGd7uF/pmzYjTyc8/OgkRaMrYfQVXaSl43204hGvvYmIrq+5MZYV0GAQuuq+6Rs7qIMBJoBgGBs
	nP84qvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwESk-00000007TI6-21gF;
	Tue, 18 Aug 2026 07:42:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwESj-00000007THu-0rNU;
	Tue, 18 Aug 2026 07:42:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3114243305;
	Tue, 18 Aug 2026 07:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A65A1F000E9;
	Tue, 18 Aug 2026 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787038940;
	bh=LX0teEYZDicZcHJo2lDUYkFNlLlxLZ1Jm2aWE8Ry63M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PZFYfVEy+WZcBBNcSUtD9qhZrqUINBhI+JJRLWmOUm9G58VB38rnMfUQhQq+dHFI2
	 dwtSKT8kSSYEAaLEMeEFUemqRs06m77WO/uriOYiEfp8rTQzsZNJtAA77aiHystCxG
	 g2wwAd6Eo8NZv/BsrnDsOCAlnNjikWR5rhWieIDgQtE7Wb8IBFr3Esso8JJxiozlk/
	 rlMAR6OjuG6dNJ5YGARTQiU9K2iOKDbP/7ykACOza1bb8NLpsENC1G2fcgFedjKFKq
	 kwhpinqSKTFGfC5g1FegwOyeZ4dGl3a9ciGAAtF8avqqEFmXNsygPbNDy5zvCglqb4
	 YUrAl0lkMh8kw==
Date: Tue, 18 Aug 2026 09:42:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Olesinski <dawidro@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Diederik de Haas <diederik@cknow-tech.com>, Eric Biggers <ebiggers@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Corentin Labbe <clabbe@baylibre.com>, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
Message-ID: <20260818-gracious-sincere-limpet-affeee@quoll>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
 <20260816194112.552100-2-dawidro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816194112.552100-2-dawidro@gmail.com>
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

On Sun, Aug 16, 2026 at 08:39:44PM +0100, Dawid Olesinski wrote:
> Add a YAML device tree binding for the Rockchip second-generation (V2)
> cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.
> 
> The IP block exposes AES-ECB, AES-CBC, AES-XTS block ciphers, SHA-1,
> SHA-224, SHA-256, SHA-384, SHA-512, MD5, and SM3 hash algorithms, each
> with a hardware DMA engine controlled via linked-list descriptors.
> 
> The binding covers two compatible strings:
> 
>   - rockchip,rk3568-crypto: clocks and resets are driven directly by the
>     non-secure CRU (accessible to Linux at EL1).
>   - rockchip,rk3588-crypto: clocks and resets live in SECURECRU, a
>     register bank sandboxed to TrustZone. Linux must request them through
>     the ARM SCMI firmware interface (scmi_clk / scmi_reset), as direct
>     MMIO access to SECURECRU from EL1 triggers a bus fault.
> 
> Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,

Nope. Not possible. Drop non-applicable tags.

> NanoPi R5S, NanoPC-T6 LTS
> ---
>  .../crypto/rockchip,rk3588-crypto.yaml        | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
> new file mode 100644
> index 000000000000..32d241c19453
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml

Fallback should be used as the filename.

...

> +  clocks:
> +    items:
> +      - description: Core clock for the crypto IP internal logic
> +      - description: AXI interconnect clock interface
> +      - description: AHB interface clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names:
> +    minItems: 1

Why is this flexible?

> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names

Binding looks the same as
Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml.
Why it cannot be added there?

Aren't the clocks and resets basically the same as in that file?

Best regards,
Krzysztof


