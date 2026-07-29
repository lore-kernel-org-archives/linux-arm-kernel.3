Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76184C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 23:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9Svtv5xJgiEssnTFNDznw1qw14m87xNi/ervmSa4Ig=; b=SFr0Arf3gKJndjWe5JNF1kw5pP
	yoH5wglRZ2q6drY3iE4ZYEW6YMA5kDeK6kvDCeMiW/G8X6ozjhVm6bgvn285araBHa7VDyTmw1bkV
	5tGPR974pf0M6nicggx/4rONXMRAFWkNcAKmgRQeGe6PU8wff+Y8ECAhDSiz2hKXx/oWdWwZoXHoq
	qeIHU49duOvgujlBtTzDviJL0oYrd2JERAHGwn+IBo6imyeop6dBdRmzRqI2+yqfJxHOKuufaFgzJ
	35e59RlZOlRx67Y0z2wuPwA7CH/mtbmAApY31EPP+Q9Kkfrdoe3u43DYOo+K5F65XIS1ZO/I24RrX
	Q0N0oG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDT4-000000095uT-27GX;
	Wed, 29 Jul 2026 23:13:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDT2-000000095u0-1sie
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 23:13:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 022D4600AA;
	Wed, 29 Jul 2026 23:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153D71F000E9;
	Wed, 29 Jul 2026 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785366817;
	bh=o9Svtv5xJgiEssnTFNDznw1qw14m87xNi/ervmSa4Ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bNio5Y033V0Vie0ZdYUZuAymrfsWpj5fpHgNbirTdCY3zPksNQg0zMqHKVhtCkJ1I
	 Vgtyzr4XM2m0nVkvXB0qopqmtKc4cHrZBhTyiw3WPsC60BG2Xdo+nGwXKHczyizH57
	 bA1Eyox/z7C2eg1e1cO7GY7HNuggj1wRm/sNJvRYmIEegCJ5oGgNM8zkvCu127mHWc
	 X05sPjCwRGzuehsIE2Yz+WctQcg2FqdhxuTTusyz/KDfxV+3dJ2Ferg7+k9yRgUoEJ
	 BIRl/nRR0K9sE/SDkJa1fDw9IcW7YRX4AKtSXhuZ4htVJ+sebKgXDKlprkUs5A8cSE
	 Q5Pr4I9RCn1DQ==
Date: Thu, 30 Jul 2026 00:13:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
 <Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
 <joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 01/16] dt-bindings: iio: adc: at91-sama5d2: document
 sama7d65
Message-ID: <20260730001333.7d094acc@jic23-huawei>
In-Reply-To: <20260727122633.117435-2-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
	<20260727122633.117435-2-varshini.rajendran@microchip.com>
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

On Mon, 27 Jul 2026 17:56:18 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add dt-binding documentation for sama7d65 ADC.
> 
> sama7d65 requires an individual compatible to address the differences
> from its predecessor sama7g5. The main difference is the temperature
> calibration layout and its handling.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Trivial but prefer alphabetical order if you are respinning for other reasons.

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
>  
>    reg:
>      maxItems: 1


