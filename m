Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B650FD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znRqW8MB2hKUQcuoDftf0UbuyFnBmsadzxoh2hjrY4U=; b=hLPZdii2S5NeUHAtojegzejUh1
	yeceddPSSlwujSlh9wUeXlaJ//rubnsg5faskNBHwOqDDO4R0kcQOCzfv6SyglAnHGxUv1OG6h7ub
	PgIDkAqiB0wxYAZKl9V7IEWS42KjTXfV/RaXYJbneModigeVTPCgmr9HH/ZHG4RCmLGNfMmSIwDLF
	WRXYt9YZ09790V+fiUiPn9HTn4yNjv+eCVTY/DPQE2dGT7mE7PaYEtRXPQvufmAZElPYLWfaEorxm
	GBn7Xvf/uos5hFzoCW9vTykaYoqTtpXKqpyXqPvwvMLqMenJj1TB1u0KoXvEFSyLG1QhT9wLxU3i4
	UCT2WLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNL9-00000004zrh-3qLn;
	Wed, 25 Feb 2026 22:26:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNL7-00000004zqp-1htL;
	Wed, 25 Feb 2026 22:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772058398;
	bh=k0xNHmg+Rg6PlS1Wra/0RI+5j9ZASPAy6uL892tIiMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DLPQZ1qKtw0UPrCiH2oVW0xmo2GRHB9P+bSqPaE3iHm8F6eBR7XvhpIfEjh3pBidG
	 tmE3bOZ8btb+Vq1Z9DzXcObYLgjLIHlA9tCrVsNQhy886X754qzz6KZogPIQyOFufM
	 fGwKqVnhPWDd7+dt3t3VyHSuXjPXk0G2fyROFV4dgNlNjRmSLxeUReHAOrYF9zWZ0T
	 DbkDx4mCDmCCXHFaIXiDXOXGVu8yaRgEOOEUT5mW0MDS5hbbhQRA7W1cY8674oR0zl
	 VTpL/+73warn2Svdh10gyq2gMHAIcGcpi1r0ep8wCRtPOVWcYlcDsJN9aAmkFvZwY8
	 OSl5n1LiErqKA==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 959D617E03E5;
	Wed, 25 Feb 2026 23:26:37 +0100 (CET)
Message-ID: <72a72c50-4816-47d4-b533-be4b7feee027@collabora.com>
Date: Thu, 26 Feb 2026 00:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
 <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
 <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
 <d5a244f3-5f1b-4bcb-8042-646320a47b6c@collabora.com>
 <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_142641_610495_39D2867D 
X-CRM114-Status: GOOD (  32.64  )
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

On 2/25/26 4:11 PM, Krzysztof Kozlowski wrote:
> On 25/02/2026 14:36, Cristian Ciocaltea wrote:
>> On 2/25/26 2:26 PM, Krzysztof Kozlowski wrote:
>>> On 25/02/2026 13:19, Cristian Ciocaltea wrote:
>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, the
>>>> 'link' and 'cache' register blocks have been provided for the video
>>>> decoder unit in addition to the existing 'function' one, which now shows
>>>> up in between them (from address-based ordering point of view).
>>>>
>>>> However, the binding does not properly describe this hardware layout, as
>>>> the new blocks are listed after the old one.  Therefore it breaks the
>>>> convention expecting the unit address to indicate the first register
>>>> range.
>>>>
>>>> Since the binding changes have been already released and a fix would
>>>> bring up an ABI break, mark the current 'reg-names' listing as
>>>> deprecated and introduce an alternative 'link,function,cache' one.
>>>>
>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>> anymore, while the information they offer is not very relevant anyway.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
>>>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>>> index 809fda45b3bd..3f6072e8baa5 100644
>>>> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>>> @@ -28,16 +28,21 @@ properties:
>>>>  
>>>>    reg:
>>>>      minItems: 1
>>>> -    items:
>>>> -      - description: The function configuration registers base
>>>> -      - description: The link table configuration registers base
>>>> -      - description: The cache configuration registers base
>>>> +    maxItems: 3
>>>>  
>>>>    reg-names:
>>>> -    items:
>>>> +    oneOf:
>>>>        - const: function
>>>
>>> This is confusing, I think I missed that in previous patch because it
>>> did not leave that part or I misread the diff hunk - why do you allow
>>> one entry?
>>
>> That's for the older SoCs, e.g. RK3288, RK3399, as the 'link' and 'cache' blocks
>> are only available for RK3576 & RK3588.
> 
> Yeah, I see in the bottom of the binding
> 
>>
>>>
>>> If the first entry is function, then all others MUST built on top, thus
>>> this:
>>>
>>>> +          - const: link
>>>> +          - const: function
>>>> +          - const: cache
>>>
>>> is not correct.
>>>
>>> No, you don't change the orders. So again, if you have such binding,
>>> then you just fix the unit address leaving the binding as is.
>>
>> Changing the unit address would mean it will point inside the register range,
>> rather than at the beginning of it.
> 
> First, not true. If this was one register range, you would have one
> entry. You cannot split entries. Split entries means you have two
> SEPARATE register ranges.
> Second, it does not matter because main rule stays - the unit address
> describes the main address space. The main address space in other device
> was called "function", so I assume the main address space is also here
> the "function". Which makes sense, because link feels secondary to
> functioning of the device.
> 
>>
>> Sorry, but I don't quite get why would this be a better approach than just
>> properly list the items according to the HW layout, i.e. following the
>> address-based ordering?
> 
> We always expect the list to grow, to have common set. That's rule given
> during reviews multiple times. For multiple reasons, also explained
> (consistency, maintenance and actually proper description of hardware
> like the main reg address space).
> 
> Probably this was also given to that binding during discussions when it
> was upstream, so your change reverts previous discussion and to that I
> do not agree.

Thank you for detailing this, I get your point now.

After digging a bit further, it looks like the "function" naming has been
introduced as part of the RK3588 support via commit c6ffb7e1fb90 ("media:
dt-bindings: rockchip: Document RK3588 Video Decoder bindings").

Morever, it also sets `reg-names: false` for all the SoCs other than RK3588 -
sorry for missing this initially.

Hence "function" wasn't used at all in the context of the older SoCs, while on
RK3588 & RK3576 there is no indication that "function" should be treated as the
main address space or anything like that.  E.g. RK3588 TRM clearly shows the
"link" range at the top of the listing, starting at video decoder unit base
address:

--------------------------------------------------------------------------------
Config Register                         |   Base addr
--------------------------------------------------------------------------------
VDPU381 core0/1 link table config base  |   VDPU381_core0/1_base+0x000
VDPU381 core0/1 function config base    |   VDPU381_core0/1_base+0x100
--------------------------------------------------------------------------------
                                        |   VDPU381_core0/1_base+0x600 for Y channel
VDPU381 core0/1 cache config base       |   VDPU381_core0/1_base+0x640 for C channel
                                        |   VDPU381_core0/1_base+0x680 for head channel
--------------------------------------------------------------------------------

Assuming the reasoning above is now good enough to move further with the
proposed approach, I can prepare a new revision dropping the unnecessary
one-entry item from the reg-names, while keeping all the rest in the series as
is.

Regards,
Cristian


