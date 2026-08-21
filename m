Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93A2C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei+B8ocDD8dYcFQzb2AT0WGx2IPkB//7Ko8mka3Bc/I=; b=K7Yu9ZNC3BqsKD3XHvidyfZcEk
	EWc0Y7j/APfgwHbOVp8db9hKWMEABM+wLhAb9oa2TMz1cZhsKN9kb7TNR91+DXqx3QdvgFTBn5IkI
	XFfgqnA3lJnMdm9Gt4nApej+ad0ZVCDlaTnsLBOxoib6y/olHnf7HxpynQipC40Pe07kfKRhTSwQ3
	qp7IrhGdHX18iYnzhE9Gmp9UNEsDCYlxnfBQVGOsw7Om9YNovrK99b0R0nvah/7yGBnoRAszKsve9
	iDPas64+sg5j7V221zHLFLCLfJj2E6lyB8/+0gpH5LnqkxHIcN551p+FfomOYWNGPp1WS9AjN9/Sm
	Yok5xd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJsN-0000000Cj56-0JJM;
	Fri, 21 Aug 2026 07:41:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJsL-0000000Cj4x-3qMc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:41:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 985974141B;
	Fri, 21 Aug 2026 07:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C7F1F00A3A;
	Fri, 21 Aug 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298077;
	bh=ei+B8ocDD8dYcFQzb2AT0WGx2IPkB//7Ko8mka3Bc/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZc6U6O2lQzWmS5s+LLmj/Gi/1BmdrFqSe5tbnWw3zjZJeqwfUXu8ymjBpDaS62wP
	 t8wonbpR8B4UK08unCgqNsjyV0Y6TSA/84NeEVE/b3PRRpaWisweinjBKE+JwIs0+0
	 6BL243QSHh+mALBxe3+shcHOOvwGdQ8YatAfRZ+Jk2y9qhMAdL4QzYPQ/sCu7Hym6i
	 sf2u8F5S1t0iBQNHvExFkWQWqA9mAwAbJn+eRjcgTqZFzO66tkzQchUXqcw+TNUNUL
	 EXgT4NicoPCIORRz2BRR8HDKk0oiRq7jhmBr/fc+5DRWL1ucyr612bZREAk0e79MtM
	 j3xPUGe3KBc0w==
Date: Fri, 21 Aug 2026 09:41:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Cc: Krutik Shah <krutikshah@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Message-ID: <20260821-woodoo-enlightened-bobcat-9315cb@quoll>
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
 <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>
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

On Mon, Aug 17, 2026 at 10:57:13PM -0700, Naveen Kumar Rajgiri Bassappa wrote:
> +title: Axiado AX3000/AX3005 USB Device Controller
> +
> +maintainers:
> +  - Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> +  - Krutik Shah <krutikshah@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +description:
> +  Axiado USB Device Controller (UDC) is used on the AX3000 and AX3005
> +  SoCs. This controller is based on a Corigine USB IP core and provides
> +  SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, selected by the
> +  maximum-speed property. It supports control, bulk, interrupt, and
> +  isochronous transfer types across multiple configurable endpoints. The
> +  node describes the memory-mapped register region, interrupt line, and
> +  other required properties for the UDC hardware.

Did you implement my comment?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: axiado,ax3000-udc
> +      - items:
> +          - const: axiado,ax3005-udc
> +          - const: axiado,ax3000-udc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  maximum-speed:
> +    enum: [super-speed, high-speed]

You miss referencing proper schema to get such property or you should
not come with own generic properties. IOW, look at other bindings how
they define a proper UDC device schema.


I also do not see a need for this, compatible defines max speed.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb@81200000 {
> +            compatible = "axiado,ax3000-udc";
> +            reg = <0x0 0x81200000 0x0 0x00100000>;
> +            interrupt-parent = <&gic500>;
> +            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;

resets, phys. Make example complete.

> +            maximum-speed = "high-speed";
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a674e36529f7..36af69fb965b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4468,6 +4468,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
>  F:	drivers/spi/spi-axiado.c
>  F:	drivers/spi/spi-axiado.h
>  
> +AXIADO USB UDC DRIVER
> +M:	Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> +M:	Krutik Shah <krutikshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
> +
>  AYANEO PLATFORM EC DRIVER
>  M:	Antheas Kapenekakis <lkml@antheas.dev>
>  L:	platform-driver-x86@vger.kernel.org
> 
> -- 
> 2.34.1
> 

