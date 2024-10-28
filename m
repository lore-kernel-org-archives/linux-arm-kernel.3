Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467DDD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eec3/hgtOskNnavO9iZ9Pai/zF/+x4ygGxVLf4dVcM=; b=diDhpVp+DMQZbib7EkV3Ygw0lT
	1gPjcw6+WzKP5g1jNDgksVyi2c9RbMBpvplkLSSAEI/AsA0UKoyAgE8H4Bw9ZVF5CadyV6ZxTEH/x
	S14e9TpY4olXcP6zeMr9bcGPmmsYDivgT7TpfKzlDyrHfXRUPSSKAcYXrBwABgyDE0uiyCX/lv9SH
	lAL9anKv/WpbCwNBd2E0mpe9BB7bqJXwys0AqLVviUSHibIhzwXxDmsHAtckPolqB7vimeAFeIuvb
	VCcWYQOhFOoOXvCu+MtCisw2IwQBJjgYWNC7uvvOiEFhYX/aCucBvYhj3zR+hfPXdzhIO6pZSNpo9
	ugLr1p+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JpR-00000009nz3-45sH;
	Mon, 28 Oct 2024 07:06:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JnW-00000009ner-0ag0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D33735C03CC;
	Mon, 28 Oct 2024 07:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B18AC4CEC3;
	Mon, 28 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730099056;
	bh=IFtzioYoMCrWC81G9MYTULX0ymqOZQrC+0Er2G6w02s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s4JENpkiaVagP4ja3lR3I/+eQ6q0RnPMxEF0weztAm4glUbkwNhX6ODVee7gm34aB
	 54k/A7nxVQjMkDPBsRrWLzBXwZ8Lq7ZcTULRvGwBe5tHuDSdyZLS201prRhaTVauoM
	 VY8SuVXmzHbZVK/pjChwG4MYIFPfKGP5fZcXkgTEIfftnd1KBUUOkPpmOrfmn+FtgR
	 Z+6zw/ioIE92FHeeVxNdS/f6z13dclVmSOAKOV/9ICygTPBwOzVJ2W5OZ2VRTiV2SE
	 cBFGFdtFy4H0f5sbmbLuhS1cJQd0oifmfnNJe749lULfjkHFwvEhgJwg/7smM4nmvL
	 aK54ya6O5Pe0A==
Message-ID: <9b0a508e-d9ae-45ab-882f-5bc1f03e13db@kernel.org>
Date: Mon, 28 Oct 2024 08:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Ming-Jen Chen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 dmitry.torokhov@gmail.com
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-2-mjchen0829@gmail.com>
 <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
 <871e9a4c-7a3c-4a24-8829-a079983033da@gmail.com>
 <ef407e89-950f-4874-9dca-474d107f6a52@kernel.org>
 <984781ba-9f4c-4179-84d5-4ab8bbe4c3c6@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <984781ba-9f4c-4179-84d5-4ab8bbe4c3c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_000418_293906_44E68BA1 
X-CRM114-Status: UNSURE (   9.68  )
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

On 28/10/2024 02:15, Ming-Jen Chen wrote:
> 
> On 2024/10/25 下午 07:42, Krzysztof Kozlowski wrote:
>> On 25/10/2024 07:36, Ming-Jen Chen wrote:
>>>>> +      0  = 0 clock
>>>>> +      1  = 0 clock
>>>>> +      2  = 0 clock
>>>> Heh? So this is just 0
>>>>
>>>>> +      3  = 8 clocks
>>>> This is 8
>>>>
>>>>> +      4  = 16 clocks
>>>> 16, not 4
>>>>
>>>>> +      5  = 32 clocks
>>>>> +      6  = 64 clocks
>>>>> +      7  = 128 clocks
>>>>> +      8  = 256 clocks
>>>>> +      9  = 512 clocks
>>>>> +      10 = 1024 clocks
>>>>> +      11 = 2048 clocks
>>>>> +      12 = 4096 clocks
>>>>> +      13 = 8192 clocks
>>>> Use proper enum
>>> I will update the definition to specify the debounce period in terms of
>>> keypad IP clock cycles, as follow:
>>>
>>> nuvoton,debounce-period:
>>>       type: integer
>>>       enum: [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
>>>       description: |
>>>           Key debounce period select, specified in terms of keypad IP
>>> clock cycles.
>>>           This value corresponds to the register setting for the keypad
>>> interface.
>>>           The following values indicate the debounce time:
>>>           - 0 = 0 clock cycles (no debounce)
>>>           - 3 = 8 clock cycles
>>>           - 4 = 16 clock cycles
>>>           - 5 = 32 clock cycles
>>>           - 6 = 64 clock cycles
>>>           - 7 = 128 clock cycles
>>>           - 8 = 256 clock cycles
>>>           - 9 = 512 clock cycles
>>>           - 10 = 1024 clock cycles
>>>           - 11 = 2048 clock cycles
>>>           - 12 = 4096 clock cycles
>>>           - 13 = 8192 clock cycles
>> No. 0, 8, 16, 32 , 64 etc.
> 
> I will change it to the following content:
> 
> nuvoton,debounce-period:
>    type:  integer
>    enum:  [0,8,16,32,64,128,256,512,1024,2048,4096,8192]
>    description:  | Key debounce period select, specified in terms of keypad IP clock 
> cycles. Valid values include 0 (no debounce) and specific clock cycle 
> values: 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
> 
>>>>
>>>>> +
>>>>> +  per-scale:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
>>>> Missing constraints
>>>>
>>>>> +
>>>>> +  per-scalediv:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description: Per-scale divider (1 to 256).
>>>> Missing constraints
>>>>
>>>> Both properties are unexpected... aren't you duplicating existing
>>>> properties?
>>> pre-scale:
>>> This value configures the IC register for the row scan cycle
>>> pre-scaling, with valid values ranging from 1 to 256
>>> per-scalediv:(I will change pre-scalediv to pre-scale-div)
>> Please look for matching existing properties first.
> 
> I will change it to the following content:
> 
> nuvoton,scan-time:

Why? What about my request?


Best regards,
Krzysztof


