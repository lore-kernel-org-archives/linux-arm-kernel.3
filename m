Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2652DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 00:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZLBxTdoAxSzyUSYoSMbEsd2IPxJg7JN1l5wS5wjtHs=; b=jcoEctfCaGJnG4c4Oj09bTvqIZ
	9gondM9rw9G8qCOjNaPn+YlYBzNzfTA+aWWCKR7sDf5RRAEfBfb+OdiXiZzkLVsnrldTimAvXSPXA
	eoMMmN94z5NTuXs2lzVJ6rTu0kbbgSQM4EmEBjcvG8/YOFh17Pl6kuDizLkP/PXMQKAt3BdCxRvhk
	x+zt9EKVolWClO3Fus2/7793IalRw/rv2tz4z+EpjxfHv4Ldq9NjtJRYGOsttxhN3X3HUxA6oO2Kf
	V8qw1oECj1p9NUcl/57on7byZ8FCJ/3MDV1FelqF7Z9fMd1lcY9Ox8w0Ae9lagyQEkfLsf6bMdMoz
	pxzJkAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwxr-00000002PEK-2TXe;
	Mon, 15 Sep 2025 00:21:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwxq-00000002PE6-03PP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 00:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4553B601B0;
	Mon, 15 Sep 2025 00:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F0C4CEF0;
	Mon, 15 Sep 2025 00:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757895660;
	bh=jIKHdqElknDnPTieRU6zG8Uq19qV/zonRqCxBWTWitE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6OOs+Zo/WJvM6d6bPGrcarVIPqo05utsZL+1nJT3L4z/CQkMijenUq294d7SDjJJ
	 n58ow0SYNdrLe/6MtNUZboGBYNQXDZ5CKUrklbhqItdrpqf6fhz/9yJPX3iv+yhW93
	 iKwZvBBGxP2usDJ4efxIftIPBi7XELzXpi95tHDZefVia+Tm/sMAXqBzCtoi+JeKGU
	 XmqwQsbm2CCUS6FCU/LxvcjKmsCjwXVr35y6MehwRgskVoOkpsIV0KBEeisB8uaNlN
	 xiQcJybxjgJM9LWKOKugrckBQdk6Hf0zrbbaClPUtn64eu/sX7zxJbhlHdf6LmHy2U
	 aFowKv4VKbDIg==
Date: Sun, 14 Sep 2025 19:21:00 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: claudiu.beznea@tuxon.dev, sre@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, linux@armlinux.org.uk,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: Re: [PATCH 1/4] dt-bindings: power: reset: atmel,sama5d2-shdwc: add
 lpm binding
Message-ID: <20250915002100.GA2297583-robh@kernel.org>
References: <cover.1757519351.git.Ryan.Wanner@microchip.com>
 <71c7d25f64612ca9571aa544be8f2651be8fe33e.1757519351.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c7d25f64612ca9571aa544be8f2651be8fe33e.1757519351.git.Ryan.Wanner@microchip.com>
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

On Wed, Sep 10, 2025 at 09:20:36AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Varshini Rajendran <varshini.rajendran@microchip.com>
> 
> Add microchip,lpm-connection binding which allows to specify the devices
> the SHDWC's LPM pin is connected.

What is LPM? It's not defined anywhere in this patch.

> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> [ryan.wanner@microchip.com: Add sam9x7-shdwc SoC to properties check]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../power/reset/atmel,sama5d2-shdwc.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
> index 9c34249b2d6d..b1a8ccd0873d 100644
> --- a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
> @@ -56,6 +56,10 @@ properties:
>      description: enable real-time timer wake-up
>      type: boolean
>  
> +  microchip,lpm-connection:
> +    description: list of phandles to devices which are connected to SHDWC's LPM pin
> +    $ref: /schemas/types.yaml#/definitions/phandle

This only allows 1 phandle.

> +
>  patternProperties:
>    "^input@[0-15]$":
>      description:
> @@ -96,6 +100,18 @@ allOf:
>        properties:
>          atmel,wakeup-rtt-timer: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - atmel,sama5d2-shdwc
> +              - microchip,sam9x60-shdwc
> +              - microchip,sam9x7-shdwc
> +    then:
> +      properties:
> +        microchip,lpm-connection: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.43.0
> 

