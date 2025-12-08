Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF83D3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHyZejooRFFO1zbdDEjiJGV7nsUfnGPrgCNyqVbjP0k=; b=DWYZdrGn0CwsiDAhJwRQ3ntF/P
	f1PX6+0LAkhQCI13+ngx2oQCkxPuu2yBItcLOMtXkkk13tVZEu1BNM5nw/eLWCDusR7piWFBTq9tm
	zq7rCJc2j9myXjIZacQj8ty4gc4cUU0SGMYt25RmnJdt1XUFVVLrgxCf7UvXzutDStItqMphxmDjZ
	bzXL493/gnLYA9UsyVBxtr5MQ4ns3whX1Gv5DU8rB/kc3hbTjkMSZ+7z/0njBZqsAmZ+t625jnFLa
	6GoHC7JP0xhTaAH1tvNchQmOArZBJHAaiDY0maxwemEh/tPamjdThSI2qTN/aaAjfvmDnA5olQ8HG
	BryjH+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSV6O-0000000CiY4-2cOM;
	Mon, 08 Dec 2025 06:52:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSV6N-0000000CiXy-0T16
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 06:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30738600AC;
	Mon,  8 Dec 2025 06:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A24C4CEF1;
	Mon,  8 Dec 2025 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765176725;
	bh=WiykqAdfvwtZNBYSkcwFcQxsD9zJPgq+W1gZ+z+0c6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYt9raRaVMXk/82ZXZgg+KIzuJk6kaFcjjmbzJhOFhDI4UnNS+t4mnbSZwobxIJuB
	 tJXwyNrkghr8pHCPLrP89DrEInA37Jitk0fANArNCa8X/jqAbj/eAGJtXJzkLByKWc
	 UOaCxuiNQ5zb5jvYZEKv0KudwMt1PNFYxmKLYmIcCaQDJXL3Vh3+yyKvAXlKsK0GFP
	 PEQJTRl5p5ab2eiCcUSUB+9j5g2UqqK3hdQrOIyxh5whymTbjEjMMKe3MrupjG811S
	 bR4v8cjcX/0Yzus/XLxqbj9vpuhQKwRscDEN0t8VFRzh5NskIT1bVe4tT3FAYEy264
	 r+2j6HhfUXusw==
Date: Mon, 8 Dec 2025 07:52:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pwm: sunxi: add PWM controller for
 Allwinner H616
Message-ID: <20251208-gorgeous-capuchin-of-protection-4ad0c2@quoll>
References: <20251205100239.1563353-1-richard.genoud@bootlin.com>
 <20251205100239.1563353-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205100239.1563353-2-richard.genoud@bootlin.com>
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

On Fri, Dec 05, 2025 at 11:02:36AM +0100, Richard Genoud wrote:
> Allwinner H616 SoC contains a PWM controller quite different from the A10.
> It has 6 channels than can generate PWM waveforms or clocks if bypass is
> enabled.
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../pwm/allwinner,sun50i-h616-pwm.yaml        | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
> new file mode 100644
> index 000000000000..b89735ad3a43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/allwinner,sun50i-h616-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H616 PWM
> +
> +maintainers:
> +  - Richard Genoud <richard.genoud@bootlin.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Allwinner H616 PWM can generate standard PWM signals with variable pulse width
> +  and period.
> +  Also, instead of a PWM signal, a channel can be used to provide a clock.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun50i-h616-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +

Are you sure there is no first clock? Really, really sure? If you add it
later, I would be pretty sad, because that's unnecessary duplication of
binidngs....

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


