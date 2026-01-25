Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B673E63CA0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:Cc:To:From:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2uhhbpesDEO2hlyJwaE7Co6xlX913kY2j+ChemzF44=; b=EZ4KTY8HMfoKqFRifEtsaPGKSm
	Dr+assk3gPy77c5vUPJMrrCBzzxKZOcR17vGSgN2PoeeJQyj4Yfg2QsljLeyEk1DdM+BuQr8NG7+U
	b4UPLMPUY4lqs0ds7eLnRyiNO0ZfVcELxaQEdeNSGAUYMq3UXwmIupOQH0s8juOQHzK41ipiEK5s4
	w8iM7F403K+MKigv21JgYUuUl0GaP1bSelvDE7kkf5zg8xZepMZGpNKf1rC3PMVar9WbZo9AM2Mag
	62DdT6bdmLHEbQ+SPP4Jul/GLVxdYYs6KpakFKhhemowvdOYknORPnWoNnrcnqGpvODpNjqSK1E27
	+guJvgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyPO-0000000B7yB-2Wau;
	Sun, 25 Jan 2026 11:35:58 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyPL-0000000B7xk-0M8D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 11:35:57 +0000
X-KPN-MessageId: ff7bb1a8-f9e1-11f0-af3f-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id ff7bb1a8-f9e1-11f0-af3f-005056994fde;
	Sun, 25 Jan 2026 12:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=C2uhhbpesDEO2hlyJwaE7Co6xlX913kY2j+ChemzF44=;
	b=J7U6GeFBfHZekGCsacdE/iT7EZ9FUCJsz4y5x2bkdMDu6Fad8FKwpUnoXvEhzhx6dPN9Mm36esMIz
	 XLt1B5xRxdQAiVq1he29e+owMNiMnnfAfQGWob/wDP0B8+2IOvK2TJOMpm5n9hnT3BH3QxhrTeNhKC
	 JF9j9c5/htiO43wkAAZ9y/JlwyFRx7AK8IQsqxU8gTZ+V1619BcUXaZCeSdICiAh0CIGlFPFOLbbGG
	 Y+lx2PhwGd5+yaW761CymxptYbmjuFrawrcbo1PIfCm0r8VfoC59VPK/8mzDXQfeIRiJwoefmbOkR8
	 Gvqg43NOgJPwbx8Ie3n5htkgKEDgV7g==
X-KPN-MID: 33|/pHX2bq9n4RcDNp+f2+9ka8ELQ8Pa5m+MZj5XpzdczBT8yEB4c3RCzrj5zUu76D
 EKmODw9EpoAKiIcvYfAAopUZ7VvNPHg6O156MN1kJN0Q=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|kSstmqaLKwUNjg6gbcB4irGicZr85Vqo9NR1Vbh17a2/iR+zxb1i/xOZMLVHJJ0
 d9WIeZ6a6FvDT2z2mLuR1bQ==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id fefb5643-f9e1-11f0-8d40-00505699b758;
	Sun, 25 Jan 2026 12:35:49 +0100 (CET)
Date: Sun, 25 Jan 2026 12:35:48 +0100
Message-Id: <87y0ll6i23.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: sven@kernel.org, neal@gompa.dev, tglx@linutronix.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	j@jannau.net
In-Reply-To: <20260125-irq-apple-aic3-v1-1-a2afe66a6ab9@jannau.net> (message
	from Janne Grunau on Sun, 25 Jan 2026 12:08:45 +0100)
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net> <20260125-irq-apple-aic3-v1-1-a2afe66a6ab9@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_033555_557614_0BD55007 
X-CRM114-Status: GOOD (  21.74  )
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

> From: Janne Grunau <j@jannau.net>
> Date: Sun, 25 Jan 2026 12:08:45 +0100

Hi Janne,

> 
> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> in its base functionality. It can use the same device tree bindings as
> AICv2 so add it to the AICv2 bindings.
> This interrupt controller is used on all Apple SoCs starting with M3 up
> to at least M5.
> The only apparent difference is the increased IRQ config offset. Apple's
> device tree codes this new offset as property of the "aic" node but the
> value stayed constant for all SoCs with "aic,3". Since the SoC specific
> compatible "apple,t8122-aic3" will be used in the driver this offset can
> remain a driver implementation detail.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  .../bindings/interrupt-controller/apple,aic2.yaml  | 29 +++++++++++++++-------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index ee5a0dfff437816056bda0de5523bf38be4f49ba..933e134d82bb599a68707ba34e04ea55d61050b9 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> @@ -4,10 +4,10 @@
>  $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Apple Interrupt Controller 2
> +title: Apple Interrupt Controller 2 and 3
>  
>  maintainers:
> -  - Hector Martin <marcan@marcan.st>
> +  - Janne Grunau <j@jannau.net>
>  
>  description: |
>    The Apple Interrupt Controller 2 is a simple interrupt controller present on
> @@ -28,14 +28,23 @@ description: |
>    which do not go through a discrete interrupt controller. It also handles
>    FIQ-based Fast IPIs.
>  
> +  The Apple Interrupt Controller 3 is in its base functionality very similar to
> +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
> +  found on Apple ARM SoCs platforms starting with t8122 (M3).
> +
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,t8112-aic
> -          - apple,t6000-aic
> -          - apple,t6020-aic
> -      - const: apple,aic2
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t8112-aic
> +              - apple,t6000-aic
> +              - apple,t6020-aic
> +          - const: apple,aic2
> +      - items:
> +          - enum:
> +              - apple,t6030-aic3
> +          - const: apple,t8122-aic3

I think this is missing a

         - const: apple,t8122-aic3

otherwise, the non-{Pro/Ultra/Max} M3 can't have the simple

    compatible = "apple,t8122-aic3"

>  
>    interrupt-controller: true
>  
> @@ -117,7 +126,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: apple,t8112-aic
> +            enum:
> +              - apple,t8112-aic
> +              - apple,t8122-aic3
>      then:
>        properties:
>          '#interrupt-cells':
> 
> -- 
> 2.52.0
> 
> 
> 

