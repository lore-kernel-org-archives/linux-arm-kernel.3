Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA21C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Owzto5RJpsaGdDWQuvd8vx3DnYx5//26ShytlrfPA+w=; b=QE9TXAUgIaB/d6+scinB+2QoX0
	eObw6Z372XN1qXsT3k2Z+qaAjF/urEiyd/lwaXhjz1lm7onZXkfHk1BInAsqodeIhadEOC4foz2iv
	QIOhQ5IlUGfj5WW41yPqaQTqDG9heSPnCNc6KpZQDWXCo/ByTtTVlD1QE0vsmZn6VC5HH6LzqAoQx
	LYvcBd8LQbasz65OF9+/hUk+algxirNcjTZKIUqZtPZSOCQKq3mu31rfUu3c9jlFYFiCt2AYPkmMs
	xtbGrfgnaa6vI9YAACJvHHHIp61J47PyoCOJ3pGOvGiPzrycnySqTHn/Jb5eK2GTE6Ary2WeCjl5g
	9/RCTWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55gW-0000000HPsv-1jqW;
	Fri, 11 Sep 2026 18:09:12 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55gU-0000000HPrV-2fFS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 18:09:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 799BE10327B;
	Fri, 11 Sep 2026 20:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789150138;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Owzto5RJpsaGdDWQuvd8vx3DnYx5//26ShytlrfPA+w=;
	b=TBlPm9NCuoQ4uKoJYJuqPB4sCc1c0v60uLv0xCUrF72laLt7/Y0NIUqXimUHGa9CeYwmS4
	eaEzokHM+oJ2En+aTkAtK2qW9UtlVkut7uL1aGWjD18GkBtRKez/izcKMTGkPala4s+lc1
	OYDTYpdLtv8bemIRQP5T3hiIsoumUz12NXH2UdyuVpYDePLpHwMIT9yuIpP6YinKggPa9p
	lGPF1/pscNWrIiZ0r6KwqfKF1JzIdNfz6lluF5siaDTV2DQl7KnA0+pMq9Of902IsT02+A
	uXL7/0evjaaO9qOF+ow0jxNmLGxRgS2LRkeXkRQXY937n1cVciSIS8zLAr+byQ==
Message-ID: <2904b225-e45f-41ee-93ca-794d1b62e1a9@nabladev.com>
Date: Fri, 11 Sep 2026 20:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: iio: adc: stm32-adc: add support for
 stm32mp23 and stm32mp25
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Cheick Traore <cheick.traore-ext@st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
 <20260911-adc-stm32mp25-v1-v1-1-cef26eecdef2@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-1-cef26eecdef2@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_110910_904005_E67B6E88 
X-CRM114-Status: GOOD (  10.92  )
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

On 9/11/26 5:51 PM, Fabrice Gasnier wrote:
> Add stm32mp23 and stm32mp25 compatibles. Three ADCs can be found on
> these SoCs, split into two blocks:
> - ADC12 are tightly coupled (common registers).
> - ADC3 is managed independently.
> Each ADC is a 12-bits successive approximation analog-to-digital converter,
> with up to 20 multiplexed channels that can be configured as single ended
> or differential.
> 
> New property "st,adc-trigger-sel "

No need for space before "

> allow to make the difference between
> the ADCs and to apply the correct trigger configuration.

I think "st,adc-trigger-sel" needs an example in the example bindings below.

> STM32 ADC may be in a power domain: allow a single 'power-domains'.
[...]

> +      st,adc-trigger-sel:
> +        description: Selects the HW trigger configuration available on this ADC
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        default: 0

What does 0 and 1 mean ?

[...]

