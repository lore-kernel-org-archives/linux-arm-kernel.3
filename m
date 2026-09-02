Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E24C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIddQ1SliQaGMK1VaNKY8IERnraAm91/zZYjC7XzicA=; b=WcLSC6+5qxcfljz5WPZ/cr1hvE
	WKXkf0HHEKOPDEezIALKGrTWvuBDAKs578TUJblQf2OcrWY6WBk1nPhaJTnFmogAiZcM93xuMCpSZ
	hQvvzXkQtgfCka8sjO7T7h//dHNaM4GlPZR6RuKQcdvITJQjCyrTR/PrPJCDfHW9RvJ+cGCV16LMy
	iGGWXH2s+W4qn842CyYv0WvzrOwzEqvJju3Oma5uMFbyOH/njMo/EgJfbXeKItBJueD+hu/0tC6Kv
	BlhDBD7TXsxev87Z5dNNSxTpEdiQfGlf3W26UnGXwy0yEIrT2Ipjl8Vs4pzrrUIm8X9joIYx6s5jX
	DKUJzs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1z0i-0000000GKVy-2GzK;
	Thu, 03 Sep 2026 04:25:12 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1z0f-0000000GKVV-49zc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:25:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E74311D0C9;
	Thu, 03 Sep 2026 06:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788409503;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZIddQ1SliQaGMK1VaNKY8IERnraAm91/zZYjC7XzicA=;
	b=Dv53Qqh/YafM1I2dkKKtJWgdlMB8VcuPZr0Ifm4V59ATOz441kkTRA8RU+PE/jZKjXXZwU
	tvM/gc5eKwTpOIZ3f2B6Efb2fKvm2KWdVLbM16OdWSw5ICL0tnI4LxK89CdbWuZka7htlP
	SsZXQBbjlUer8y7oabE/xs2VbodIbIWpT5l6IFT7/xH2OPr/ED09LXgiXVcZOgaCpAeIZe
	RsEFw4R+EPmyJdgwq4PeXOzN2Nokh5617Xx7OGBf6xcVSLloqqHy9yvJR62Nmk1H+b6pJG
	sYd7ZERT2J6g0T0C7Ujc92l9EAfXHJpZtfhtcHP5s7wc44ANRv/ITdUGo1B8KQ==
Message-ID: <c3bad2f4-d371-4254-a6db-0af31fcf1a41@nabladev.com>
Date: Wed, 2 Sep 2026 16:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: usb: generic-ehci: Document ST
 STM32MP2 SoC compatibles
To: Conor Dooley <conor@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260831231814.137120-1-marex@nabladev.com>
 <20260831231814.137120-3-marex@nabladev.com>
 <20260901-buzz-mousiness-96fa5be618eb@spud>
Content-Language: en-US
In-Reply-To: <20260901-buzz-mousiness-96fa5be618eb@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_212510_254388_2DFC8630 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On 9/1/26 7:54 PM, Conor Dooley wrote:

Hello Conor,

>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp23-ehci
>> +              - st,stm32mp25-ehci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: PHY clock
>> +            - description: Bus clock
>> +
>> +      required:
>> +        - access-controllers
>> +        - clocks
> 
> Since the property is new, I think you should add
> 
> else: properties: access-controllers: false
> 
> even though it may mean a bit more of a restructure if another platform
> wants access controllers.

I think Greg already picked the V5 in some form, I'll see what lands and 
either send a V6 or a follow up patch, whichever you prefer.

Thanks !

