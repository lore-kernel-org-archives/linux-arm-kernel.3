Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58923C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0VWvTeoPVcBqJv01980GJ2i1/13vuyum4Uo4zxDGh8=; b=uBpYbdaPfyJ2sOLJwvlsFSskN9
	8VxKJTRGa/D7dppOA2yaLdNBwWsRYzPud1ADrQuoLYzITVMVtro2p0mqkr8v/urXa5PZv2Ok81S0E
	AnHDIEppQvjAei7hj0gBvBbVLsU5DU1K2hsfS6kq8sgN5fqvn4Jjn/cTpQW/e8ji0iJ4C8LrdjjiC
	wBVEvBkl56a6SFFCa1yD/AXkIukP4YrFotnze66KANR6MDlDKi9HduAxUEH22T2h2rJSFEvhctYcB
	i0lTeHuJ3a+Uy9l6jKHTw5DLlA5CZ46Y0RzFyXeQvVJQ1cZunbXzttV/N/95PpTdNsTJM/fPLv7C/
	BW41+j3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnk91-00000008j5R-4317;
	Thu, 27 Feb 2025 20:06:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnk7U-00000008isK-261E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F283261136;
	Thu, 27 Feb 2025 20:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614F8C4CEDD;
	Thu, 27 Feb 2025 20:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740686671;
	bh=6GP4AhAYCIY77ceA92Y51zNK7MmiQ9TrM0VgUYibQPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AFK7X9kmlsIRtbfMuC68X0X3gW+Na0qEhy5shqufwWrqbphCI5Ma/ug++aK550cVB
	 QWS+qtvdZMhlsFAPFxK0nXEgqFhBcFA70+8d5mZl0/IWHdSiNW44/8rpO2Rg+ncN3L
	 GT1kwuztWWanBV5L5tuhX72fmrAOuUGBukRTViisY0qaAxAPlUqrl59qJPD1Z4Yp1s
	 uJZT6Ecgg9SbbJVBfFQnoTVgAeafJA1C5LdjbGtTdGFqovibEGbLXoZZRgtTNq50bu
	 6TW0AATqIN7P6CIT5t3+vo6YclyeGnlOjpMn4Yv2wWT+0wUxF4DOS3fsi0yumPKMvq
	 1qj0Dm22odb5A==
Message-ID: <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
Date: Thu, 27 Feb 2025 21:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
 <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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

On 27/02/2025 09:19, Ryan Chen wrote:
>>
>>
>>> aspeed,enable-byte:
>>> Force i2c controller use byte mode transfer. the byte mode transfer
>>> will send i2c data each byte by byte, inlcude address read/write.
>>
>> Isn't this standard FIFO mode?
> Yes, it is.
>>
>> Why anyone would need to enable byte mode for given board?
> By default, it is buffer-mode, for performance, I don't want user enable byte-mode, it will increase CPU utilize.
> But someone want to be force enable byte-mode, so I add properties. 
> https://patchwork.ozlabs.org/project/linux-aspeed/patch/20241007035235.2254138-3-ryan_chen@aspeedtech.com/


I don't see the reason why this would be a board property.

I understood need for DMA because it is shared and only some of the
controllers can use it. But why choice between buffer and FIFO depending
on hardware?


>>
>>>
>>>>
>>>>> +      may require a DTS to manually allocate which controller can
>>>>> + use
>>>> DMA mode.
>>>>> +      The "aspeed,enable-dma" property allows control of this.
>>>>> +
>>>>> +      In cases where one the hardware design results in a specific
>>>>> +      controller handling a larger amount of data, a DTS would likely
>>>>> +      enable DMA mode for that one controller.
>>>>> +
>>>>> +  aspeed,enable-byte:
>>>>> +    type: boolean
>>>>> +    description: |
>>>>> +      I2C bus enable byte mode transfer.
>>>>
>>>> No, either this is expressed as lack of dma mode property or if you
>>>> have three modes, then rather some enum (aspeed,transfer-mode ?)
>>>
>>> Thanks suggestion, I will using an enum property like aspeed,transfer-mode
>> instead.
>>>>
>>>>
>>>>
>>>>> +
>>>>> +  aspeed,global-regs:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description: The phandle of i2c global register node.
>>>>
>>>> For what? Same question as usual: do not repeat property name, but
>>>> say what is this used for and what exactly it points to.
>>>>
>>>> s/i2c/I2C/ but then what is "I2C global register node"? This is how
>>>> you call your device in datasheet?
>>>>
>>> I do descript in cover, should add into the yaml file ?
>>
>>
>> Again, cover letter does not matter. Your hardware must be explained here.
> Will add into commit. 
>>
>>>
>>> aspeed,global-regs:
>>> This global register is needed, global register is setting for new
>>> clock divide control, and new register set control.
>>
>> So this means you implement clock controller via syscon?
> No, it is just mode switch. It also explain in cover. I will add it in commit. 
> The legacy register layout is mix controller/target register control together. The following is add more detail description about new register layout. And new feature set add for register.
>>
>>>
>>>>
>>>>> +
>>>>>  required:
>>>>>    - reg
>>>>>    - compatible
>>>>>    - clocks
>>>>>    - resets
>>>>>
>>>>> +allOf:
>>>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: aspeed,ast2600-i2cv2
>>>>
>>>> NAK, undocumented compatible.
>>>
>>> Sorry, I should add what kind of document about this compatible?
>>
>> You cannot add new compatibles without documenting them. Documentation
>> is in the form of DT schema and each compatible must be listed (in some
>> way) in compatible property description.
> 
> Sorry, do you mean, I add following in yaml or commit message?

You need to list this in compatibles first.

> 
> This series add AST2600 i2cv2 new register set driver. The i2cv2 driver is new register set that have new clock divider option for more flexiable generation. And also have separate i2c controller and target register set for control, patch #2 is i2c controller driver only, patch #3 is add i2c target mode driver.

All this describes driver, not hardware.

> 
> The legacy register layout is mix controller/target register control together. The following is add more detail description about new register layout. And new feature set add for register.
> 
> -Add new clock divider option for more flexible and accurate clock rate generation -Add tCKHighMin timing to guarantee SCL high pulse width.
> -Add support dual pool buffer mode, split 32 bytes pool buffer of each device into 2 x 16 bytes for Tx and Rx individually.
> -Increase DMA buffer size to 4096 bytes and support byte alignment.
> -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> -Re-define registers for separating controller and target mode control.
> -Support 4 individual DMA buffers for controller Tx and Rx, target Tx and Rx.

Does it mean hardware changed on AST2600? Or these are different devices
than aspeed,ast2600-i2c-bus? If this is not a different device, how one
SoC can have two different flavors of same device in the same instance?




Best regards,
Krzysztof

