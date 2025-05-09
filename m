Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2142AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hlt61GqgvUxq8BPErozdvm0ae/X6SagRe6G13VwOLvM=; b=Ql5hzTA6WYBQqS7NeRZUmx4ANV
	ofNSAwxnl1cxZsMxw7qw8BslnV5+36i4QYM/EqyIttOAE0GzlY+WZMtIeDq8R5z3ZD1Es7tPAMYlx
	JZUWWfil0oG1DdvDlpdyS0kjsRaeMXBCCNN7Nuk/VtuYUyE6MYAQnbY6tfOiIrvKt9znT6wZ0ZZcv
	P46wlO7ywPkAAZV0g36aJTleSxQGfhvW7455u1nf+9V9L2i9pCjpnu/aNltdJFfUm9sLg1rj+2TlW
	/JtduHBHPI4oYPopCvj5ndDpaSwQF2qkDsiLWUZWzmwE9QiUWh27AYbkXEGIePicYLuhvmm560JJs
	He4e+SYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOQB-00000003tul-3IKi;
	Fri, 09 May 2025 14:09:52 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNWU-00000003i73-25fW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:12:19 +0000
Date: Fri, 9 May 2025 09:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hlt61GqgvUxq8BPErozdvm0ae/X6SagRe6G13VwOLvM=;
	b=uQ5AqAXFVcmHUb0x+rThTA1wu5GMLar705S4fEHg1OWaqDIn856HhShJkRTS/7xYF/H4uj
	FhOOVgXecAgyMVzJGuz54etH4wDaqgWm7dk8ufkJCbswdg8rMSE0QHhRoChDars1v1X6hK
	r7944Dg7mqTEUUV5vA6whCm1ZerKoR7WI4Wlggw5VoJmBMAOIPAzW0LeiNcziVgEnAVeQX
	+JnYZMrwxbPmeNKCgl0KEOszta9ePIn6Grb6uUXi+irvy2ag+72+YLPcGa9lP+iUk1kps4
	sU/JfEVcgiqlzlAmOEPYXZ4pQ1P5qFeuS6fBHfCbb554nNnOn4ldn2bTrx3e9A==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: gpio: Add Apple Mac SMC GPIO block
Message-ID: <aB3_Kw6WDaDAY6Ub@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061218_679840_5B5CB87D 
X-CRM114-Status: GOOD (  15.76  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , May 03, 2025 at 10:06:48AM +0000, Sven Peter via B4 Relay a écrit :
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../devicetree/bindings/gpio/apple,smc-gpio.yaml   | 37 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..07305eeb2595f59d5c28f6e507295b828dafd4a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/apple,smc-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller GPIO
> +
> +maintainers:
> +  - Sven Peter <sven@svenpeter.dev>
> +
> +description:
> +  Apple Mac System Management Controller GPIO block.
> +
> +properties:
> +  compatible:
> +    const: apple,smc-gpio
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio {
> +        compatible = "apple,smc-gpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a70d79a5f6ae98fc0055f1da20dbecc095ea5c65..7f91f0225133490607ba0d79ad4225892ef31a66 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2267,6 +2267,7 @@ F:	Documentation/devicetree/bindings/arm/apple/*
>  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
> +F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
> 
> -- 
> 2.34.1
> 
> 

