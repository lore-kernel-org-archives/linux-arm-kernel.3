Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15354CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7KAwZZAJhZtKzXaCCO25+o/tdhyNQUizD1vsw7HVAs=; b=11aywOp6FMBOgFgP0d5UifhoE6
	Mg89oU4DgL8pspXJwq6GalASPQjJqVfIbxFPvpJswaoSFJ6z7IxoDt4PMxY8jjSG7NQyzAyA0m7qP
	X7bwE1Ph2dFHnRJ8/cObmXLfwG2Xq9HSySGxJyLp9Metv+E4wQWf/0eq3AB4s4a7xBZer8wy3KI7Z
	gDsXaCfRLVJ1NR3mvvwn7XJEAkeYsjnNXjcKeLKDQuMzCYYZlxs/VM3smPMXfTHBHv2idsLN9nS6C
	9TD2lOfxQaCbOsDeQrg1+jzsMexUZscH+7VLJ0Xx6Rdumcq6xeUYm1si6WbUC9KFJHZBTI/ceDcVZ
	YgnZLT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWv6-00000005UV5-27em;
	Thu, 28 May 2026 09:20:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWv4-00000005UUb-0S8F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:20:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 584FC44714;
	Thu, 28 May 2026 09:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7001F000E9;
	Thu, 28 May 2026 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779960049;
	bh=Z7KAwZZAJhZtKzXaCCO25+o/tdhyNQUizD1vsw7HVAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fHMa1GKgJEMPvnD+F81GppZwBFXbouiOAa2LjDVlpYg3ZXDvliqKxVl4vAFQIiW3w
	 g/qkUqHna0cp11dJMK/FZM/N9DJdT7YyR3DZenv9jarg1sgsaFpewCljU/qF3KsTWV
	 a/Th/beKx6gZ0scg9hupueVAXki/ZapDamHtQACnDNap7KWVbGnEbLoj+ORT7nMxJl
	 0mNg3h/pxcJ+rrOz7dAqjWfAVFUBMbvYb3RWMZ6dywpa51/csFPi7RVyCfwkNQfhAU
	 GKOBOh89EMmrSKMGvvQUutiVTCnVsKk+7JuzEkyrRxP+DoE6SRE7Z6jv5Hdy1sN+pe
	 jUpzwNkvjCTlg==
Date: Thu, 28 May 2026 10:20:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add Axiado AX3000/AX3005
 SARADC
Message-ID: <20260528102034.58fc2486@jic23-huawei>
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-1-345dd5f6608a@axiado.com>
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
	<20260528-axiado-ax3000-ax3005-saradc-v1-1-345dd5f6608a@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_022050_223926_1F90ECE2 
X-CRM114-Status: GOOD (  16.46  )
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

On Thu, 28 May 2026 01:10:23 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> The Axiado AX3000 and AX3005 SoCs include a 10-bit SAR ADC controller.
> AX3000 supports 16 input channels, while AX3005 supports 8 input
> channels.
> 
> Document the compatible strings, register region, clock, reference
> voltage supply, and IIO channel cells.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
Hi Petar,

One minor thing inline. Otherwise looks good to me.

Thanks,

Jonathan

> ---
>  .../bindings/iio/adc/axiado,ax3000-saradc.yaml     | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
> new file mode 100644
> index 000000000000..54592353a7b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/axiado,ax3000-saradc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axiado AX3000/AX3005 Successive Approximation Register ADC
> +
> +description:
> +  The Axiado AX3000/AX3005 SAR ADC is a 10-bit ADC with sixteen input
> +  channels on AX3000 and eight input channels on AX3005.
> +
> +maintainers:
> +  - Petar Stepanovic <pstepanovic@axiado.com>
> +  - Akhila Kavi <akavi@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - axiado,ax3000-saradc
> +      - axiado,ax3005-saradc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#io-channel-cells':
> +    const: 1
> +
> +  vref-supply:
> +    description: Reference voltage regulator supplying the ADC
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#io-channel-cells'
> +  - vref-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      saradc@806a0000 {

Generic names for nodes in DT. So just adc@806a0000

> +        compatible = "axiado,ax3000-saradc";
> +        reg = <0x0 0x806a0000 0x0 0x400>;
> +        clocks = <&pclk>;
> +        vref-supply = <&vref_reg>;
> +        #io-channel-cells = <1>;
> +      };
> +    };
> 


