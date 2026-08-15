Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F950C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 19:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMBKU0rITwY608DxPndNNVbf7wU+s4HDR+nTccA0uZk=; b=2Eh+BEWvgaviRwh5e8LGPdcpiC
	Ufa+dsR/qaEnkAUccW3XW2iCa+oNkoEvNkA/PGLt/lwWghyInih7NbjF5NIdyMqqcfXkBGsJ6wrtk
	TAtJepTS+t7dmcmQtRwCIN/8hkxpoRjB5PyIOjK+uK9/N0NiWXXmAnVYn9Y/SYQ0cWydZ0XSpHTSB
	lXoDtznmJqei6ESeGdu0+YWUHobj5C1QsiGIdv4TLSAjaoSQHWCPai7GY4BKFQC5Xje9NtYF3IDLO
	MoL+53tstSZ3PgQyWqDiDx76KDsyd/S+0YiAnUWkmDftCUa7qVreJNcAuj7keqwpaIGxjw7cE4OFb
	KSzgaWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvKTG-000000049hM-0doF;
	Sat, 15 Aug 2026 19:55:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvKTC-000000049gp-3pPa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 19:55:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5977860052;
	Sat, 15 Aug 2026 19:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17101F000E9;
	Sat, 15 Aug 2026 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786823706;
	bh=kMBKU0rITwY608DxPndNNVbf7wU+s4HDR+nTccA0uZk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IvhmSjN8aAXHz8PrcIrzMB3L8dl6qG2M8Zwb+RkTXNfhGQS6qhiYSOCDw6ELzKBmD
	 6To5vP3tkjYUCyWNCCh7B828UbN0ZOSUwG94jsFWD06DtDr7owtOhexlH0l1gIPkri
	 jVO5Cf1Vc6IwNSuKLUvuUMakzljdGJFLIieT1l1FuKBhtc+BzwhwrN4x/ecSmAwitU
	 i6/iUbxrDqZ8pTDddRez90yPqT06Fo0TvsegQ7kMRzm36g4itegxsPwwhh6T2egzwN
	 BOcjI0FwltOeo2CedN42q8n2pZteT/tA0ivEiP3/3yZgh1DWLB90fq8AiocqjhCV1P
	 T0ekcNxNbVmrg==
Date: Sat, 15 Aug 2026 20:54:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
 <joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 01/17] dt-bindings: iio: adc: at91-sama5d2: document
 sama7d65
Message-ID: <20260815205457.6cd30d53@jic23-huawei>
In-Reply-To: <20260806074024.531259-2-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
	<20260806074024.531259-2-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 6 Aug 2026 13:10:08 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add dt-binding documentation for sama7d65 ADC.
> 
> sama7d65 requires an individual compatible to address the differences
> from its predecessor sama7g5. The main difference is the temperature
> calibration layout and its handling.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Hi Varshini,

I'll probably tweak this when applying - but if for some reason
another version is needed please look at the ordering thing below.

> ---
>  Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> index 4817b840977a..e8a65fdcd018 100644
> --- a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> @@ -15,6 +15,7 @@ properties:
>        - atmel,sama5d2-adc
>        - microchip,sam9x60-adc
>        - microchip,sama7g5-adc
> +      - microchip,sama7d65-adc

Alphabetical order.

>  
>    reg:
>      maxItems: 1


