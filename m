Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC87606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ia9rcepe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMNKokdU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dGXUAf3ZvpwCwk6GVJwDfPoTF9MzG91gJCXDDK2/gfI=; b=ia9rcepewwsEFz
	VpLB3brpY8RAXzCu09CMCiUz/jt+g2BfHAGp2pQn6TxdJrQTtQofmvBepz1ui4OZkuSDJs4bwCWtf
	CWRReQJLBNX8Z4r8oZ7GbY0/guIiZ4Uo7z/xUwTbVF93c779eNTPXAqltrIVef8z/8HJncJrbvhPC
	f3CFZNFZfXy2jEkUpSWPUszRJ8YbFPDzXFCnzLY4/8thPTkR+bJAITEc0wav5PicuKOsHUkDTuu4C
	eNjHyQl3KeVJ+gnxw/zZbSo/YzEAMR4hFeSGR3SMjnnAezp7ozIcT4EVUHZ0fo9odnDq3njt6E4sP
	/zM/j40dQmnnkevejLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhwl-0000000FPZc-2QN7;
	Mon, 02 Nov 2026 02:38:55 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhwi-0000000FPYx-2PtS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 02:38:54 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3535a54bed9so3827945eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 18:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587131; x=1794191931; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGXUAf3ZvpwCwk6GVJwDfPoTF9MzG91gJCXDDK2/gfI=;
        b=iMNKokdUl2NHe/Ks1gU0qDDY6y5aTt6BPifjF6x2G6wY+VS177vth0t7J80Sak0TPK
         j6Ne4Z8C8OYRaDVEIpOrs/6oRFp/OZdcdZne3pe6lv6PrgvPZowJiOM2cBJps8NgOfPb
         qdxj4m3MELEz1H+I3kFv0EOjQ0PNDMKCyBsXXYKdAiBy3IMfPC8F1FfsNdp0RbbwvNYq
         ZkwV+eJL326KnK85gvHmKhEg9QZRqLfxVblOjQa5akJSTLJcKzs+PXpIJwEw00JjudK1
         mTKNNV9T3IjOcx201bD3JgiDcAev/TuPueIuxMARimYDZCbT2sVmC8+d0o6utR3k6MXk
         uSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587131; x=1794191931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGXUAf3ZvpwCwk6GVJwDfPoTF9MzG91gJCXDDK2/gfI=;
        b=zcte67/kj6aLwzB8rxpKqfltbP87hsleDYNXiz+S4yk+h0OJcc9o8BeVJQIp99qfhU
         wvTIS+gAvel2xso5ZFWIbc2FA/jHXJ2SMD2Y5jf43U5QkTqfdYWswo4X8yZTsgQcguQP
         tYcU/whfAYXXT5vJuOC4LTtdu0ibjYsM6nGb17x0Jg7W5c5xgS12/TYFQ06hBXf95jXG
         ebXpbjFgRcNbkDM+8NehG9PTJQxbds4wK6JyNCua4NQh1o4iuT3/p4+5UQ++bomuUpSy
         1bXxob6XBQpGA6cTGwynPPEWz7yQeKWSF/nlH//ykjUTT9+t7OQx/HJB7rQNNICPrnEc
         CoWg==
X-Forwarded-Encrypted: i=1; AKwUvBzl6PN6cRtcVdEwzhz5oHrusA+aiR3Cfil0Y8Jj626wrt6u+r8iUZXKxNXUtCd3vZygjol4nSq5bORTy+xB1XZG@lists.infradead.org
X-Gm-Message-State: APuU4Z9A5Br4zf8F9PiHCCMHCH1pRxFBYEyBuvUlD+hQCypUvHhC2AZq
	c39uEI3mDSLrLkYqESlq/9A9RUW/ZUs/ucV4lrS07cNKlA+qEDacIN8f
X-Gm-Gg: AYBFou15jyvZ/hr9isPR9GW2Vi2xQMmcm0newz8ugylIg5lD24brvw/lGM2EFIAt8FF
	+yeG7W97uI6rdau+39YYPWfkWyIXfZrW/6UcbdKGGKruHtGTuLA3ZY37uSQ7pfPdwfW81+6jHfv
	BZFV7g81pMz6wBGhejZM62nKGwtd4coll4Q842e5HFIYQe56uTqrugK3RmyYpX0w8tCZl+nKMjL
	UObaXy3BOEXMeNFNz7Q77iZQV0RTosu06HyZ17gPFue9NkT3VteVYWD8hlY/ZpuCXZHMZCbODh8
	by79u2a+D4kq3CWoMHK1kYEk9lfh3J/KG8R2u0GwRxu4bZyFaVK5R+nMSFhwYN6Iw4ZtToqWnJQ
	EUbQX2RU8epaq30CAcK3+idPF3LFat91YyGA6HV6LgKSaeA47WxBay3ZGJJBT4MaIBuGouItFKM
	aFnVsKo6R0I1LFx3E9Agzg+EVtyWMxBOOuSficFJ64DmjoA0K/27XQjY3CEKYGB1SU2kU6DtB7y
	jqef+f2YNTOo7rNSm2eF5wcqLd9BZN7GbL6Gxz6E7p7pq5i2wAwfdkPOib48h//zGUyw8a6spAo
	ycqokRVzoLz+gRWj086BBZ9IpK4BtMMN/oaHQa9YjVVnkG+Ha4LRmlAgtSb1l+MiQs9qTJRbVwC
	Rzvo=
X-Received: by 2002:a05:7300:f149:b0:36a:1104:5fb5 with SMTP id 5a478bee46e88-36a4221a8demr14296245eec.1.1793587130960;
        Sun, 01 Nov 2026 18:38:50 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm37003471eec.11.2026.11.01.18.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:38:50 -0800 (PST)
Message-ID: <6b1f4008-c6dd-4e81-8a6a-43ea45c7eb15@gmail.com>
Date: Mon, 2 Nov 2026 10:38:47 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
 <20261101001934.23588aa2@jic23-hlaptop>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261101001934.23588aa2@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_183852_651117_96BD0D2E 
X-CRM114-Status: GOOD (  40.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Jonathan Cameron 於 2026/11/1 上午 08:19 寫道:
> On Fri, 30 Oct 2026 11:15:00 +0800
> Chi-Wen Weng <cwweng.linux@gmail.com> wrote:
> 
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Enhanced Analog-to-Digital Converter
>> (EADC) found on Nuvoton MA35D1 SoCs.
>>
>> The controller provides eight external analog inputs which can be used
>> as single-ended channels or as four fixed differential pairs: 0-4,
>> 1-5, 2-6 and 3-7.
>>
>> Describe the four hardware interrupt outputs, ADINT0 through ADINT3.
>> ADINT0 through ADINT2 are associated with the corresponding conversion
>> interrupt flags, while ADINT3 is shared by the ADIF3 conversion
>> interrupt and the ADCMPF0 through ADCMPF3 result-compare interrupt
>> sources.
>>
>> Also describe the functional clock, optional reset, optional external
>> reference supply and optional DMA request.
>>
>> Expose the controller as an IIO channel provider through the
>> DT #io-channel-cells property. The cell identifies the logical EADC
>> channel selected by the reg value of the corresponding channel child
>> node.
>>
>> Restrict the channel binding to features supported by the MA35D1 EADC
>> hardware and use the common single-channel representation for
>> single-ended inputs.
> This description seems a little verbose.  Maybe only talk about the
> stuff we can't tell from the patch.
> 
> 1. Why it needs a new binding and isn't similar enough to existing
>     ones for reuse.
> 2. Any unusual aspects.  Calling out the stuff that I note below on
>     the per channel binding oddity more clearly would have been helpful.
> 
> For the other stuff the reader can just look at the patch,
> 
> Thanks,
> 
> Jonathan
> 
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++++++++++++++++
>>   1 file changed, 175 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> new file mode 100644
>> index 000000000000..97144a8eeb5c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> @@ -0,0 +1,175 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +description: |
> 
> I think you only want to keep paragraphs. In which case > rather than |
> 
>> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
>> +  12-bit successive approximation converter with eight external analog
>> +  inputs and one internally connected VBAT input.
>> +
>> +  The external inputs can be used as eight single-ended channels or as
>> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
>> +  connected VBAT input is not described by a channel child node.
> 
> How would you have a consumer of VBAT given the io-channel-cells
> comment about using the channel reg values for xlate?
> 
> 
>> +
>> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
>> +  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
>> +  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
>> +  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
>> +  compare flags.
> 
>> +
>> +patternProperties:
>> +  '^channel@[0-7]$':
>> +    type: object
>> +    $ref: /schemas/iio/adc/adc.yaml#
>> +    unevaluatedProperties: false
>> +    description: |
>> +      External EADC channel description.
>> +
>> +      For a single-ended channel, single-channel specifies the external
>> +      analog input number (0 through 7), while reg provides the logical IIO
>> +      channel index.
>> +
>> +      For a differential channel, omit single-channel. The reg value selects
>> +      one of the four fixed hardware differential pairs: reg 0 selects 0-4,
>> +      reg 1 selects 1-5, reg 2 selects 2-6 and reg 3 selects 3-7.
> 
> Sorry, I wasn't paying attention on earlier versions.  This is a very
> unintuitive binding particularly as we may want to have a single channel
> before a differential one.  Better I think to use the differential
> channel bindings and restrict which ones are allowed to this fixed set.
> 
> 
>> +
>> +    properties:
>> +      reg:
>> +        maximum: 7
>> +
>> +      single-channel:
>> +        maximum: 7
>> +
>> +      # Differential pairs are fixed in hardware and are selected by reg.
>> +      diff-channels: false
>> +
>> +      bipolar: false
>> +
>> +      common-mode-channel: false
>> +
>> +      settling-time-us: false
>> +
>> +      oversampling-ratio: false
>> +
>> +    allOf:
>> +      - if:
>> +          not:
>> +            required:
>> +              - single-channel
>> +        then:
>> +          properties:
>> +            reg:
>> +              maximum: 3
>> +
>> +    required:
>> +      - reg
>> +
> 
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        adc@40430000 {
>> +            compatible = "nuvoton,ma35d1-eadc";
>> +            reg = <0x0 0x40430000 0x0 0x10000>;
>> +            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "adint0", "adint1", "adint2", "adint3";
>> +            clocks = <&clk EADC_GATE>;
>> +            resets = <&reset MA35D1_RESET_EADC0>;
>> +
>> +            #io-channel-cells = <1>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            channel@0 {
>> +                reg = <0>;
>> +                single-channel = <0>;
>> +            };
>> +
>> +            channel@1 {
>> +                reg = <1>;
> 
> This looked very odd and is why I had a closer read of the docs
> above.  To make this a reasonable binding to read this
> needs to do the full differential channel binding from adc.yaml
> with reg just being an index and not specifying channels at all
> (same as for the single channel case).
> 
>> +            };
>> +        };
>> +    };
>> +
>> +...
> 

Hi Jonathan,

Thank you for the detailed review.

I agree that the current channel representation is unnecessarily
unusual and does not make good use of the common ADC channel binding.

For v4 I will rework it so that reg is only the logical channel index,
while the physical inputs are described explicitly:

- single-channel for a single-ended input
- diff-channels for a differential input

The differential channels will be restricted to the four combinations
supported by the MA35D1 hardware:

   <0 4>
   <1 5>
   <2 6>
   <3 7>

I will also require each external channel node to explicitly describe
either single-channel or diff-channels, instead of using the absence of
single-channel to imply differential mode.

This should also make the example clearer, for example:

   channel@0 {
       reg = <0>;
       single-channel = <2>;
   };

   channel@1 {
       reg = <1>;
       diff-channels = <0 4>;
   };

so that reg is clearly independent of the physical ADC input selection.

I will also switch the channel schema to additionalProperties: false
and only expose the common ADC properties supported by this hardware,
rather than inheriting unsupported properties from adc.yaml.

For the top-level description I will switch from the literal block
style to the folded paragraph style and shorten the commit message to
focus on the unusual hardware aspects rather than repeating information
visible directly in the schema.

Regarding VBAT, thank you for pointing out the inconsistency with the
#io-channel-cells description. The internal VBAT input is a fixed
hardware connection rather than a board-routed input, so it should not
need a channel child node. I will rework the provider/channel numbering
description in v4 so that the internal VBAT channel, if exposed to an
IIO consumer, has an unambiguous channel specifier without requiring a
DT child node.

Thanks,
Chi-Wen



