Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDDBE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23jRwZFARyquCxtW7ly3sjynKDV3/raUeCnhohv8HGI=; b=bbHb58kLlYEvbiGm3u9ffmX2oY
	LMZbiqIefQusjJz/sobKq1IL2f+Rz9fDBLUP6IfMuUKcRO3wFRSj3Ie7MAE9t7897d4XnHup/k3xs
	wycTlou6p9MCA/heDRNEEBzY/YQX7rsgVm+ftQ/cEWWRN+JPYFhgOoeiGgPZKQ93NBScZl3Q8XuTp
	3ShpAnDCPnrJKeg6Iu1vXSodnwkgjW416ocYlrrlKAEevOvysr659yJ3jniomnT8yqTXlGVQVsEYv
	hJonLgVR3bbhaK8z2xvjfVfhBBGuy6PA6LIR4QbCNQhjO1ZFLsb5ZcMDAmZqJtNp1B7tPK5i7+qPc
	UbTiRkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqHH-0000000G4Pu-30xP;
	Wed, 18 Dec 2024 09:23:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqGB-0000000G41N-35kw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 293D25C38CC;
	Wed, 18 Dec 2024 09:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A48C4CECE;
	Wed, 18 Dec 2024 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734513746;
	bh=bG/W66dEi/LFJfO8SPmj2MLLiUu+QmDsy4zds5+lgr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F8+dU9opxtu9EWSBN6gpRvf3iDnEOKI0E2uH3R1IrKUHewRcKvPTF4cy7bv9vUtVH
	 WwRDSIgjhYPffP48cvBd7SklG5n2Px2TzENThGJd0dYg4eByUkVbsr7nBss/ntVusM
	 33mHAcHNUxmpseLlIvRQYD7SKve/YLfCQ0QlfQmEaqCktBttddmXHND6EVX07NJ6WG
	 5IBz01ldNXNeQ3f3PduLnO6NoTT6Yvi3+R2suRLREFxS6sr52/a2yaKg+ub+anUPF1
	 iGz/N358Tbz+VpmMs+p5XmuXP2LqnPSKfGPjrEIaViNZ22BOyJDcOgWISFH+MZ580X
	 7PIxF0vhPFKsA==
Message-ID: <3fb8ba3f-3016-4823-bf48-130f173c8f66@kernel.org>
Date: Wed, 18 Dec 2024 10:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
 <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
 <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
 <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
 <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
 <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
 <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
 <17fbfcdd-8b79-4907-a4c8-798da0ef0526@gmail.com>
 <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
 <d8d0a1c8-f2b4-425a-858b-610ae7291ebc@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d8d0a1c8-f2b4-425a-858b-610ae7291ebc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012227_866272_7772D10E 
X-CRM114-Status: GOOD (  13.56  )
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

On 17/12/2024 11:04, Ivaylo Ivanov wrote:
> On 12/17/24 11:43, Krzysztof Kozlowski wrote:
>> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>>        - items:
>>>>>>>>>            - enum:
>>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>>          - clock-names
>>>>>>>>>  
>>>>>>>>>      else:
>>>>>>>>> -      properties:
>>>>>>>>> -        clocks:
>>>>>>>>> -          maxItems: 1
>>>>>>>>> +      if:
>>>>>>>>> +        properties:
>>>>>>>>> +          compatible:
>>>>>>>>> +            contains:
>>>>>>>>> +              enum:
>>>>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>>>>> +
>>>>>>>>> +      then:
>>>>>>>>> +        properties:
>>>>>>>>> +          clocks:
>>>>>>>> Missing minItems
>>>>>>>>
>>>>>>>>> +            maxItems: 2
>>>>>>>>> +
>>>>>>>>> +          clock-names:
>>>>>>>> Ditto
>>>>>>>>
>>>>>>>>> +            maxItems: 2
>>>>>>>>> +
>>>>>>>>> +        required:
>>>>>>>>> +          - clock-names
>>>>>>>> I don't understand why do you need second, same branch in if, basically
>>>>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>>>>> On Exynos8895? Where? With the same compatible?
>>>>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>>>>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>>>>> they need a different compatible though? It's functionally the same i2c design
>>>>> as the one implemented in USIv1 blocks.
>>>> If one block is part of USI and other not, they might not be the same
>>>> I2C blocks, even if interface is similar. If they were the same or even
>>>> functionally the same, they would have the same clock inputs. However
>>> I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
>>> something like that?
>>>
>>>> user manual also suggests that there is only one clock, not two (for
>>>> both cases), so they could be functionally equivalent but then number of
>>>> clocks looks incorrect.
>>> That'd be weird. Both according to downstream and upstream clk driver,
>>> for the USI-implemented i2cs we have a pclk and an sclk_usi.
>> Something is not precise here, as usually with Samsung clock topology.
>>
>> First, the non-USI instances have the IPCLK as well, e.g. things like
>> PERIC1_UID_HSI2C_CAM1_IPCLKPORT_iPCLK
>>
>> USI have BLK_PERIC0_UID_USI03_IPCLKPORT_i_SCLK_USI, but that's USI
>> clock, not HSI2C in USI. Datasheet mentions this is UART and SPI special
>> clock, but not I2C.
> 
> That's weird. Don't we need the clock enabled in order for the
> USIv1's HSI2C to work?
The clock goes to USI, so it is enabled, no?

Best regards,
Krzysztof

