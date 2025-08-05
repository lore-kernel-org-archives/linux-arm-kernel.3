Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AB9C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27kqNJN7iPPLBJA6KujUnlLrt2xnXrxosvNXZ9Hkmpo=; b=XO9Zxuw0bjxIy814qplEWEdizN
	zr4bFYSmY9qQUuz6x2u0uvgocV7AVUR67Y8Jz3G6UiRHaqu3vaG1FMSbxaOwFNnAuWNue2wv4G6WH
	FWY/NmeQuLxAeaHJPouqqyH72eoSNN09o+vZQH87Y0GyORTcTm/7CD+b+Ykh5SGS1+wSrZx8X3Q/I
	SFfOUhFao9giuuNI36pXNxrywB5A5p5FB3dreozgslw4H68RnqhjHvYXE4FbZ5JXgazhWYyzbEzgJ
	nlLokNj3biW0ExyNlZdEv4XYjcRgBsoicySNlkghOQ95gb5XU3aj0bxMMLh0hibYbJbluUv89Whme
	btEkg/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMX8-0000000DYgX-27nj;
	Tue, 05 Aug 2025 18:37:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLxu-0000000DUwQ-18te
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 18:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA38E601D5;
	Tue,  5 Aug 2025 18:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49ED5C4CEF0;
	Tue,  5 Aug 2025 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754416845;
	bh=ln/2JVk6NhVsQlWmJ0evfyIiDUEGD4I1liy5tXtZuD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHTMyxGFQQfgBiaX7nV3hZMsQsP0NpZz6nRiI8HdmNNfiscY6MXw04aK7hY6kH/qj
	 Cy1suNpKCB1VUqy3Brcn+gQOX0I0HH6qET2dp4Cc7Mit1jS0JzLKxSbuFDY6qTyeBE
	 mx1EITer5jd8EgHB0IZaJMuuscpLCK//s3SUpmOXM91CtLO+6C9+BZu2SVhmjtpSY3
	 AD2IP2ObVh7++LSiBvKKMJPOhv2h+k3d4ZIAFyO5wggV3tTGO/KF2swc8jHputQFm/
	 h1Cb3Yh1RJXJiL/S/1OfP4N8Rw/95v46g45YOWbq1prYPpbm6fXUodBa1iOD+E9vR9
	 CcSatEMMhK6iA==
Date: Tue, 5 Aug 2025 13:00:44 -0500
From: Rob Herring <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ryan.wanner@microchip.com,
	tudor.ambarus@linaro.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: atmel,at91rm9200-spi: Add
 support for optional 'spi_gclk' clock
Message-ID: <20250805180044.GA2012043-robh@kernel.org>
References: <20250805102510.36507-1-manikandan.m@microchip.com>
 <20250805102510.36507-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805102510.36507-3-manikandan.m@microchip.com>
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

On Tue, Aug 05, 2025 at 03:55:09PM +0530, Manikandan Muralidharan wrote:
> The Atmel SPI controller supports both the peripheral clock and the
> Generic Clock (GCLK) as sources for SPCK generation. On platforms like
> the SAM9X7 SoC, the peripheral clock can reach frequencies up to
> 266 MHz, which may exceed the maximum value supported by the Serial
> Clock Baud Rate (SCBR) divider, leading to SPI transfer failures. In such
> cases, the GCLK can be used as an alternative source for SPCK generation"
> 
> This patch updates the Atmel SPI DT binding to support an optional
> programmable SPI generic clock, specified as 'spi_gclk', in addition to
> the required 'spi_clk'.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> index d29772994cf5..11885d0cc209 100644
> --- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> @@ -31,11 +31,16 @@ properties:
>      maxItems: 1
>  
>    clock-names:
> -    contains:
> -      const: spi_clk
> +    items:
> +      - const: spi_clk
> +      - const: spi_gclk

Well, "spi_clk" was a terrible name as it is completely redundant as 
this is the "spi" block and everything in the list is a "clk". So don't 
continue it and just do "gclk".

> +    minItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    items:
> +      - description: Peripheral Bus clock
> +      - description: Programmable Generic clock
> +    minItems: 1
>  
>    dmas:
>      items:
> -- 
> 2.25.1
> 

