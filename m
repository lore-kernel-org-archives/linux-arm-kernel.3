Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3A4EEF31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2hDVk7MoGPKcJzsuuiN+gEfkiCKeW5o4nvJAeHnfvA=; b=KUST9h4U7bXLMqC6d5JI2i1yaP
	CaejlgWEw9ydbcqt3ek7Tw7+Zmcwudr4qmh1SzJ5gdyjoLWZ3SMWz+5RsGF4zg85AyZWXLcxrn83u
	EachVBTpo48/7AYTfZMCHCsbvbA6u22fHdQgRtUJpdUe5Va2ghOabtZUu1id7zLM4ltdReLxGI9V4
	LjfCKuKU51sf6pLiOne1nJhBwpHtl3ZfPWtEOH1VK15oEeMyFd4gjz8wgL4XbIEeh906fSt9NUXpN
	n+hri9vNK5FjHD5h1VC//XLpjfkyykun1BVKiNjk65uWRIbhJYgvaxdThTT/LGVikHOHogBy27V9a
	6WibrbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4MV-00000001EYB-13eT;
	Thu, 05 Mar 2026 08:47:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4MT-00000001EY0-3Vdk;
	Thu, 05 Mar 2026 08:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q2hDVk7MoGPKcJzsuuiN+gEfkiCKeW5o4nvJAeHnfvA=; b=ENWvTV8Kjrfvybph96slwlmHRd
	RapJMjCSbMm8ODoOD4N+zUPQbG3qIv4lmuV+3t3RxVgf4VfzSIVgDq87VvRG+ACKBibhtzClTJT4r
	QVYVQ5XPI3qvbLzCpD5P6lM0HdPeM8hSZ0DKB+7cBcd0Adf4O4oyNuLCizFp3B9etiNZCTAhiFmb9
	rVuVohdai89bymC5U+ZansvKJ3OypFRp+amiA0ZHCUBn8u4jkD149WpkUom839EnEn54gl8Cp8G5m
	1zkk82RWjRMrUOwqUqnshtZruW6l5aOd3NVKq4tZAi7iZVGRKVCdlT6PkUl1lmYgwEfP5OqF0ixgH
	mgNN6Bdw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4MQ-00000006Et4-1zAw;
	Thu, 05 Mar 2026 08:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B327141841;
	Thu,  5 Mar 2026 08:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CD4C116C6;
	Thu,  5 Mar 2026 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772700426;
	bh=gsMJJgM+sLQv9rst3VO6I/wn5nnKEdijZ7APePySFCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ct5SFawGnA/+5V2qUS3BhhIEvFOJJLJ3BxGblhVFI1uw3uV/pfGxqY2MWnQ7Ay4q3
	 ODRaryMaSmOBl9rJe3yUTKHGWiucwTdwyDJzmR0M341bxqDyNHzl40JfHZA2yTt/gI
	 YyV5QMAJOFKsggf5gO74TxD8eJmH8ntaW4LYi7/7vaQLFyoJq2gfgU3UlPp7Kq/OY8
	 qEfdRtOGudInbsKoHZOeiUw7Yaw8hCtw0OY3NaqcpdBRu9tCIRKSdBnf+/Um5peutI
	 nNeaz+U/TJYde3ViIhck6TdnyhNjVY74ku3hZHqT4pFcNRrX6yvPlIICkRmU+aAZS4
	 uZeket75KD0FQ==
Date: Thu, 5 Mar 2026 09:47:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bayi Cheng <bayi.cheng@mediatek.com>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
Message-ID: <20260305-inquisitive-spider-of-glamour-28b9db@quoll>
References: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_084710_891762_F9BE3336 
X-CRM114-Status: GOOD (  21.98  )
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

On Thu, Mar 05, 2026 at 10:27:36AM +0800, Meiker Gao wrote:
> Update mediatek,spi-mtk-nor.yaml to add conditional clock and
> clock-names bindings for the mt8189-nor platform. The mt8189-nor
> controller requires five specific clocks and corresponding clock-names
> ("spi", "sf", "axi_f", "axi_h", "axi_p"). This change enforces these
> requirements in the device tree binding schema.
> 
> For other platforms, the minimum number of clocks and clock-names
> remains unchanged. The patch also adds an example for mt8189-nor,
> illustrating the new clock configuration.
> 
> This update ensures correct hardware description and validation for
> mt8189-nor, improving compatibility and reducing configuration errors.
> 
> Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
> 
> ---

Not tested so limited review.

>  .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 78 ++++++++++++++++---
>  1 file changed, 68 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> index a453996c13f2..7e551f2cb52c 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> @@ -17,8 +17,6 @@ description: |
>    for devices other than SPI NOR flash due to limited transfer
>    capability of this controller.
>  
> -allOf:
> -  - $ref: /schemas/spi/spi-controller.yaml#
>  
>  properties:
>    compatible:
> @@ -39,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8188-nor
> +              - mediatek,mt8189-nor
>            - const: mediatek,mt8186-nor
>  
>    reg:
> @@ -56,14 +55,12 @@ properties:
>                       design, so this is optional.
>        - description: clock used for controller axi slave bus.
>                       this depends on hardware design, so it is optional.
> -
> -  clock-names:
> -    minItems: 2
> -    items:
> -      - const: spi
> -      - const: sf
> -      - const: axi
> -      - const: axi_s
> +      - description: clock used for controller axi fast bus (axi_f).
> +                     Required for new platforms, such as mt8189.
> +      - description: clock used for controller axi high-speed bus (axi_h).
> +                     Required for new platforms, such as mt8189.
> +      - description: clock used for controller axi peripheral bus (axi_p).
> +                     Required for new platforms, such as mt8189.

No, I don't understand why you remove names. This is not expected.
Please also read writing schema and writing bindings docs explaining how
to organize properties with variable lengths. There is plenty of
examples to follow.

>  
>  required:
>    - compatible
> @@ -71,6 +68,42 @@ required:
>    - clocks
>    - clock-names
>  
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8189-nor
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5


> +        clock-names:
> +          minItems: 5
> +          maxItems: 5

Pointess. Drop.

> +          items:
> +            - const: spi
> +            - const: sf
> +            - const: axi_f
> +            - const: axi_h
> +            - const: axi_p
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

ABI change without explanation. Don't mix multiple changes into one
commit.

> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - const: spi
> +            - const: sf
> +            - const: axi
> +            - const: axi_s

Plain wrong. So either 2 or 4.

> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -97,3 +130,28 @@ examples:
>          };
>        };
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/mt8189-clk.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      nor_flash: spi@1100d000 {

No, drop entire example.

Best regards,
Krzysztof


