Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E90E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlkris1liTVWQjG7xmfJcZ8XhXc2DktuLuR3xmqQa2c=; b=I1uzD5t5VhY93x4+g7XI+6qib3
	GEoYFYB+kabGmLWw94UheOksFxagPKzx+KrD3FlEsQDKzSCQQZgIGRhbKAqcx01QHwgGbaktZeg+z
	dgf2xHUzGb+ifvniafT/W/xcjxbZvEIxhsjwPwngrwgIIYL39r9M5dS3eOHRVc6DWZMavoF/tEaIu
	pPksMIQou0keDaxzJzvYF4KUtBd1eanZRRTW+QicoIdiadXKyeWNugghZv/K/P+GWs/riEM35ARuV
	3nHf3gjEsae0QCAPMOhuluOdWLUSrS+lyXfDKgffObu5+m0QxFuSS8bm1Ldp/ZfLKdu8ynompVevB
	lrxvebug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0al-000000031FF-1l1d;
	Fri, 13 Dec 2024 08:00:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0Zf-0000000314b-2qJW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 07:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 824A7A4279C;
	Fri, 13 Dec 2024 07:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C4DC4CED6;
	Fri, 13 Dec 2024 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734076738;
	bh=Z3DdeUSPj6xptVZW3V6ExHDnuGZdELrNH+NgowrCnR4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=vEBiGmkkD9Lrd9ypPblghpcIlB07uqVWWbbk7FZEd7ZlvuPvr1KYAXQEZBOTrGv93
	 VYi89mQC2flubX2gSCpaSmNhWW092wf77PwwJtiCktsEHI5DtOEOSiwZKsfSQ98006
	 j3nRbdcxdK/fzwM7Jcm12z6IU6m1gJF5ZiaF/9Psg6BE95Gb3WGCjgvfACvQOZfFvM
	 pgH458BT4M4cpkixq9ioqtkAYNcLgrbIMtXS4yMs9+Kg+7UZFdTVqk07jhdSGLJXpa
	 k3rGKdK7X9mOeocl9kCCaFIjIkCHxMZTjmAmKtvdP+a8cJ1I/d32KdRTanfppr8iD4
	 LO1m5C0NeuxUg==
Message-ID: <11ad5a97-b066-4bea-8829-50e0416cea9d@kernel.org>
Date: Fri, 13 Dec 2024 08:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: interrupt-controller: Refine
 size/interrupt-cell usage.
To: Kevin Chen <kevin_chen@aspeedtech.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, tglx@linutronix.de, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, olof@lixom.net, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 konradybcio@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 soc@lists.linux.dev
References: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
 <20241212155237.848336-3-kevin_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241212155237.848336-3-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_235859_863692_AB9E805B 
X-CRM114-Status: GOOD (  16.63  )
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

On 12/12/2024 16:52, Kevin Chen wrote:
> 1. Because size-cells is no need to use 2, modify to 1 for use.

???

> 2. Add minItems to 1 for interrupts for intc1.

???

> 3. Add 1 interrupt of intc1 example into yaml file.

> 4. Add intc1 sub-module of uart12 as example using the intc0 and intc1.

What is all this?

BTW, there was no such patch in previous version and your changelog is
silent about it.

Subject: drop all full stops. Subject never ends with full stop.

> ---
>  .../aspeed,ast2700-intc.yaml                  | 60 +++++++++++++++----
>  1 file changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> index 55636d06a674..eadfbc45326b 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> @@ -31,6 +31,7 @@ properties:
>        type as defined in interrupt.txt in this directory.
>  
>    interrupts:
> +    minItems: 1

Nope, not explained, not constrained. Your schema is supposed to be
constrained.


>      maxItems: 6
>      description: |
>        Depend to which INTC0 or INTC1 used.
> @@ -68,19 +69,52 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      bus {
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +
> +      intc0: interrupt-controller@12100000 {
> +        compatible = "simple-mfd";
> +        reg = <0 0x12100000 0x4000>;
> +        ranges = <0x0 0x0 0x0 0x12100000 0x4000>;
>          #address-cells = <2>;
> -        #size-cells = <2>;
> -
> -        interrupt-controller@12101b00 {
> -            compatible = "aspeed,ast2700-intc-ic";
> -            reg = <0 0x12101b00 0 0x10>;
> -            #interrupt-cells = <2>;
> -            interrupt-controller;
> -            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;


I don't understand what is all this.

> +        #size-cells = <1>;
> +
> +        intc0_11: interrupt-controller@1b00 {
> +          compatible = "aspeed,ast2700-intc-ic";
> +          reg = <0 0x12101b00 0x10>;
> +          #interrupt-cells = <2>;
> +          interrupt-controller;
> +          interrupts = <GIC_SPI 192 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 193 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 194 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 195 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 196 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 197 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>          };
> +      };
> +
> +      intc1: interrupt-controller@14c18000 {
> +        compatible = "simple-mfd";
> +        reg = <0 0x14c18000 0x400>;
> +        ranges = <0x0 0x0 0x0 0x14c18000 0x400>;
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        intc1_4: interrupt-controller@140 {
> +          compatible = "aspeed,ast2700-intc-ic";
> +          reg = <0x0 0x140 0x10>;
> +          #interrupt-cells = <2>;
> +          interrupt-controller;
> +          interrupts-extended = <&intc0_11 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +        };
> +      };
> +
> +      uart12: serial@14c33b00 {
> +        compatible = "ns16550a";
> +        reg = <0x0 0x14c33b00 0x100>;
> +        interrupts-extended = <&intc1_4 18 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +        reg-shift = <2>;
> +        reg-io-width = <4>;
> +        no-loopback-test;
> +      };

And above is not related at all. Don't add entirely unrelated changes. Drop.


Best regards,
Krzysztof

