Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD767FD3762
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFxLS33PdhSpznMuzyw3zEVwtXfEKBUhPAuoZQ1rmbY=; b=E1aIIwKveC+W85POhht+ZnpVH2
	LFCmC/lY1IbFuRHrtN/Pqgs4yg+n+gmi1jCjx1ZehkOpijt6UR+q0G2dhpVoMATHE/F79TwMCELs7
	xHewdYL5lOuNuhnBadCkHcr5+8xtr6LwrhdQLnoGOhiqmnCJ9KAeC92WACR/exvwFOFtwp3DZrCt7
	alqFVhTxfd3vicauoZIxPD+uRvaH70rq1SYAiRcpIOyHCyTMNDXKUl5eODaYgknrIXoxy1Nb+wyY9
	PKMoNTgaeTJGSePNc3S+klgDagGmszARSmY2Yf+y1gD93SqEVTa8ggTgEjW1W2trQJ/6XBGFzH42N
	wWEee38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFc1-00000004AbP-1WK5;
	Wed, 25 Feb 2026 14:11:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFbo-00000004AZd-2yaT;
	Wed, 25 Feb 2026 14:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EED59444E7;
	Wed, 25 Feb 2026 14:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C094C2BC86;
	Wed, 25 Feb 2026 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772028683;
	bh=SjklxF5P1ukWq1BdzFbfzWWtsg3DlSbDa9GVYCTfBao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B3ivDnBnOfYCqWXOyOu+/9HdePS1rKGtYvm03h40GTUFPLcP2JpCzl2IQ1ByV0DwE
	 Z7+ITwCMl2tD4W57SVN9g1RujPJIx6cyy/NwFhM0gomZcQ4vrMfzHuJDa6rFGQ55Cd
	 rmkIOeo5l0cy8isgwOJ0GMwOvMoEXQLCJWZ2BEioD5AtCyIRQYj83/9d+Gqg6YcL4H
	 D0oEkp9azfV0rCPDmuV9Vo4TcWYve+f0CnvgssNeBaPTv35f+79+PP467+orGSZOmQ
	 b2idEes6l5kywJrNei3PLGIcH3L2cR5p/8o+eJU0rZAfiwJEDe2BjLgstjmAro4svs
	 R2DBFCUDzNW+g==
Message-ID: <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
Date: Wed, 25 Feb 2026 15:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d5a244f3-5f1b-4bcb-8042-646320a47b6c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_061124_796940_6875604B 
X-CRM114-Status: GOOD (  27.13  )
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

On 25/02/2026 14:36, Cristian Ciocaltea wrote:
> On 2/25/26 2:26 PM, Krzysztof Kozlowski wrote:
>> On 25/02/2026 13:19, Cristian Ciocaltea wrote:
>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, the
>>> 'link' and 'cache' register blocks have been provided for the video
>>> decoder unit in addition to the existing 'function' one, which now shows
>>> up in between them (from address-based ordering point of view).
>>>
>>> However, the binding does not properly describe this hardware layout, as
>>> the new blocks are listed after the old one.  Therefore it breaks the
>>> convention expecting the unit address to indicate the first register
>>> range.
>>>
>>> Since the binding changes have been already released and a fix would
>>> bring up an ABI break, mark the current 'reg-names' listing as
>>> deprecated and introduce an alternative 'link,function,cache' one.
>>>
>>> Additionally, drop the 'reg' description items as the order is not fixed
>>> anymore, while the information they offer is not very relevant anyway.
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>>  .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
>>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>> index 809fda45b3bd..3f6072e8baa5 100644
>>> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>> @@ -28,16 +28,21 @@ properties:
>>>  
>>>    reg:
>>>      minItems: 1
>>> -    items:
>>> -      - description: The function configuration registers base
>>> -      - description: The link table configuration registers base
>>> -      - description: The cache configuration registers base
>>> +    maxItems: 3
>>>  
>>>    reg-names:
>>> -    items:
>>> +    oneOf:
>>>        - const: function
>>
>> This is confusing, I think I missed that in previous patch because it
>> did not leave that part or I misread the diff hunk - why do you allow
>> one entry?
> 
> That's for the older SoCs, e.g. RK3288, RK3399, as the 'link' and 'cache' blocks
> are only available for RK3576 & RK3588.

Yeah, I see in the bottom of the binding

> 
>>
>> If the first entry is function, then all others MUST built on top, thus
>> this:
>>
>>> +          - const: link
>>> +          - const: function
>>> +          - const: cache
>>
>> is not correct.
>>
>> No, you don't change the orders. So again, if you have such binding,
>> then you just fix the unit address leaving the binding as is.
> 
> Changing the unit address would mean it will point inside the register range,
> rather than at the beginning of it.

First, not true. If this was one register range, you would have one
entry. You cannot split entries. Split entries means you have two
SEPARATE register ranges.
Second, it does not matter because main rule stays - the unit address
describes the main address space. The main address space in other device
was called "function", so I assume the main address space is also here
the "function". Which makes sense, because link feels secondary to
functioning of the device.

> 
> Sorry, but I don't quite get why would this be a better approach than just
> properly list the items according to the HW layout, i.e. following the
> address-based ordering?

We always expect the list to grow, to have common set. That's rule given
during reviews multiple times. For multiple reasons, also explained
(consistency, maintenance and actually proper description of hardware
like the main reg address space).

Probably this was also given to that binding during discussions when it
was upstream, so your change reverts previous discussion and to that I
do not agree.

Best regards,
Krzysztof

