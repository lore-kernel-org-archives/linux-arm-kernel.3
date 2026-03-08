Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE9BF55132
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlWXu/rLAS3mBKEqNx4CTWv/+cZnwHU9vXsidCDVTkE=; b=pWHBjjg6rwlYwPAwh8C5ZY3mPj
	brcVTG2AeRbpnwu2KvRk11QUhN5xxhStu9aOBlH0+xPM0VUDGoU7qs2AZAqgoROdMU+git+3RSTGF
	HFtSSk0KBglED5xrjBcZ+z+v+EwvqU1MGTn2kab+n+bmWxbBTKoQF8qoIMuY+iyEcYPL/c8KVZFgy
	xR3hCg81/zJaa3YyMjLs+J3VxCp+Shv4SzHip/bZnCHQNhgGApE30jN99U4i8+4oEcOnRJPFpbyuK
	bd1px7bu6R06ez1SvELGiqhHuP5CAg+/gJUxbkQJushgu8U+/AbuG7RkUqTsjtkh5GsxfZLwBDaZG
	AFPXXpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAQC-00000005qHF-30Ql;
	Sun, 08 Mar 2026 09:27:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAQA-00000005qGu-2kIK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 09:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9699141632;
	Sun,  8 Mar 2026 09:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D6EC116C6;
	Sun,  8 Mar 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772962053;
	bh=FmWpFmZ13fR3hYtUujD4lsXKYHTLZYGMygU0qXXXEnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpOmJHC1w17i0api2p0aZyqZeZltSaCZ/xrlRba3HtrZxGZRB9cnlDc/Ls/M7T+j9
	 BjFD0/L6ekeegL5mTx/AivoGnLp37E3cfTCsQuTc3XzHp8HZ/Dz1sQxvawDl6iNp1t
	 9I3MO+lFWC7acPhS86o6Yf/ULWIltpIeu5eWHR/jK7ZtDgtR3QPawSCm+2Zyip10e2
	 FJ1B5WUNqYM8mlRbSbUtQy2mWGG8ZWTzj/RkPagWDcOJgDEJqbX29BDkUdZD+7Y3w3
	 6fr9P9dgIBQpGDjJTp21UOMh8AEQiORi+3C7UrgOALC0qXUxLyRzG+l5gpVIaq2ZtI
	 TbrBiEAjcbHdA==
Date: Sun, 8 Mar 2026 10:27:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Herve Codina <herve.codina@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert
 to DT schema
Message-ID: <20260308-nifty-honest-buzzard-ccde9b@quoll>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_012734_766930_1D7C0A59 
X-CRM114-Status: GOOD (  18.85  )
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

On Sat, Mar 07, 2026 at 09:16:21AM +0000, Charan Pedumuru wrote:
> Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
> Changes during conversion:
> - Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
>   they are required by existing in-tree DTS definitions.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++

Where is the actual conversion? You are supposed to remove other file
for this to be a "convert".

>  1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
> new file mode 100644
> index 000000000000..6961cd5d5d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel AT91 USB Device Controller (UDC)
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +description:
> +  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
> +  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
> +  clock for operation and may optionally control VBUS power through a GPIO.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91rm9200-udc
> +      - atmel,at91sam9260-udc
> +      - atmel,at91sam9261-udc
> +      - atmel,at91sam9263-udc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: hclk
> +
> +  atmel,vbus-gpio:
> +    description: GPIO used to enable or control VBUS power for the USB bus.
> +    maxItems: 1
> +
> +  atmel,matrix:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Atmel bus matrix controller.
> +
> +  atmel,pullup-gpio:
> +    description:
> +      GPIO controlling the USB D+ pull-up resistor used to signal device
> +      connection to the host.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false

additionalProperties

Best regards,
Krzysztof


