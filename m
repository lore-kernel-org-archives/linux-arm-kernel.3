Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1AFEF48E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jz7vtUwnkx90fQXLmbBVcLdhqYtGqJ/IOHriRInnSbM=; b=lyRh2UwzzGaeAY1x0ALvBCXUBD
	djwlGP/JRTofx75h2QSnGOXHbkG+N6xMaiMwt80C9Opt9m9JZWAxAKN7SLPbYQ+BizTr9OecZ9mg/
	y6rLfeyecRW5saOjbcn0m1kQL7JFAlqFLZnjmg3OoN+NLaj+ekUbo2+Fvadt1PrFdY1A8se+udZ5m
	Ss2xgmgTDOvYkIPtgagm+CmLRfC+WNUcSbvDTqH2VKEfdtdA+rkOowgCPtr8pSsxomONYAA0FR0vA
	GlhxZLZ6K4A6CRK175voC7eD3/Svx+5gKTLkKEK+4bZMxjXMhiITR+AwG+LHjse1tELvLBlIr71BR
	j8+cykGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoMM-000000039ey-2dKg;
	Fri, 13 Feb 2026 08:17:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoMK-000000039ei-2elp;
	Fri, 13 Feb 2026 08:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 049546001A;
	Fri, 13 Feb 2026 08:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB68C116C6;
	Fri, 13 Feb 2026 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970623;
	bh=hbYAQt6TNDZ/qXSwhJHkgExQTtHCoS7ggq1824ovTnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sz+4oPuwy6Y0e3rrzOZBPH52OtlvC18v6Q17Tg/0qckunMalGdoOMAKPS5BvhWe0t
	 E4XmiXd7zeq3gP8n6EJbjnWlMIh/kcAmlTPfX1oViwtfCtJkPYHif3MKg87/BnLhmn
	 H0lo1MtX65GWK640lVwPj32jkNsBZb1TkxlNoFuOgpIT5swr6mWpIZBgSc6aNR+YOU
	 zNJ1WZJ5nLj/JBh7IzaM6ILk7wvcEfk+q3CvzLjGl8zbLmMndKlw3RAOBoTtlhCWsI
	 flAX+O9Cxh9tBV18rzv2V8XYRTUvbPKPlBZU8lnpl1TiiZVMQaIh6L/nNjh/GuA3x0
	 kti5SGsXOxbmg==
Message-ID: <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
Date: Fri, 13 Feb 2026 09:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 13/02/2026 09:02, Zhentao Guo wrote:
> Hi Krzysztof,
> 
> 
> 在 2026/2/13 15:35, Krzysztof Kozlowski 写道:
>> [ EXTERNAL EMAIL ]
>>
>> On 13/02/2026 06:12, Zhentao Guo via B4 Relay wrote:
>>> From: Zhentao Guo<zhentao.guo@amlogic.com>
>>>
>>> Describe the initial support for the V4L2 stateless video decoder
>>> driver used with the Amlogic S4 (S805X2) platform.
>>>
>>> Signed-off-by: Zhentao Guo<zhentao.guo@amlogic.com>
>>> ---
>>>   .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 96 ++++++++++++++++++++++
>>>   1 file changed, 96 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>>> new file mode 100644
>>> index 000000000000..88780514d06c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>>> @@ -0,0 +1,96 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>> +%YAML 1.2
>>> +---
>>> +$id:http://devicetree.org/schemas/media/amlogic,s4-vcodec-dec.yaml#
>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Video Decode Accelerator
>>> +
>>> +maintainers:
>>> +  - Zhentao Guo<zhentao.guo@amlogic.com>
>>> +
>>> +description:
>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>> +  It supports stateless h264 decoding.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-vcodec-dec
>> Why do you repeat "dec" twice? codec means decoder, so what is the last
>> "dec" about?
> In fact, codec means encoder+decoder, and dec is short for decoder.

Yes, that's what I meant, so why do you repeat decoder?

>>> +
>>> +  reg:
>>> +    maxItems: 2
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: dos
>>> +      - const: dmc
>>> +
>>> +  interrupts:
>>> +    maxItems: 3
>>> +
>>> +  clocks:
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: vdec
>>> +      - const: clk_vdec_mux
>>> +      - const: clk_hevcf_mux
>> Name them based on their role/name in this device. Why this device would
>> care that it receives a mux? Not a div? or not a gate?
> Ok, previously we overlooked this. We will improve it in the next version.
>>> +
>>> +  power-domains:
>>> +    maxItems: 2
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: vdec
>>> +      - const: hevc
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  amlogic,canvas:
>>> +    description: should point to a canvas provider node
>> Why? What for?
>>
>> What is canvas provider?
> 
> The canvas provider is: drivers/soc/amlogic/meson-canvas.c

What is this "canvas" device.

> 
> In short, canvas is a hardware IP inside the Amlogic SoC. The decoder IP 
> needs to access DDR through canvas IP, so we need to reference the 

Why decoder cannot access DDR directly?


Best regards,
Krzysztof

