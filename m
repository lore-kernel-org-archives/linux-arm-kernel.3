Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F95ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 10:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKZ5RVgjtYNRNUhJov5Gfl6WEeC8CVyNpV/Jp46kNqI=; b=J5Qtsc63h+5zmM321voegwnA81
	P8FbT7hXHd1QLk27SqrZObkkO6r8rrzmp+s2yIxP+pCbWKsSnEg+jpgbrmwXH84fejupKSmTblj7p
	Gp/Dr2aCd1kvkWpWoelZ20bxojyQ6LTB6k28GIDrB6tl/7YCpHCV//IHgUaUqnVtreZ+Ckr1CcXK5
	+uAgaDQgt/x9JGLksgY4r3nX75+Iybwq5Y5mk+r/leipY1eiAa+eDHFckLHxIKt/6IzgGaK8lyUpF
	Pn7wpfMeBljS7MjNWtZo8GBZa3vU7Yul8JlMCkSrVR1fiiazdFu6dApzQEqZK0BGMyvCdZh0r89ke
	qgv0+5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq82R-000000060uB-23dQ;
	Sun, 24 Aug 2025 10:33:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq7zq-000000060m1-1I7T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 10:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7510F601E2;
	Sun, 24 Aug 2025 10:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9C8C4CEEB;
	Sun, 24 Aug 2025 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756031445;
	bh=9oE5tb2390AHhqVifgcMfJ4rl+xy0eQcN8W0J8YXps8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LwSLN3OLapslV151YMZZEFd20qU2jxZX9ywbmWrIibU8XGlbD+JThPNBekNQDXLHw
	 hSVwVS1HeLtVNXI50c5TI4SusZC8rT0samdJH1/cJQMpwRBVoX8ozNxBIhEcO8gtnE
	 XTBgjeTf91QIwhgvsIJNWPEeLQ5poLtXxwhSEYYgQP4dUOZVzn5yZJd/5eEFFdotE3
	 uDx/Om6bS1ia+F26NDOKNzqs9pm1J6FtV0lPqQtH/+v4h8HXaZ7ukdHUXhji+qRLRc
	 13vQeUvuQDZhDI+rIH1/8J9v40dLvZRrwBLpA08UTwzKCfo4dC5fW0NKEa0p0O72Az
	 +pToygNe2MYgg==
Message-ID: <f28fd898-83f2-46af-9f5d-b98be4518520@kernel.org>
Date: Sun, 24 Aug 2025 12:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] dt-bindings: dma: dma350: Document interrupt-names
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-9-jszhang@kernel.org>
 <eda79403-375b-4d49-9fec-12bc98bf9e47@kernel.org> <aKrgDVaynJxnmR9r@xhacker>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aKrgDVaynJxnmR9r@xhacker>
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

On 24/08/2025 11:49, Jisheng Zhang wrote:
> On Sat, Aug 23, 2025 at 06:09:22PM +0200, Krzysztof Kozlowski wrote:
>> On 23/08/2025 17:40, Jisheng Zhang wrote:
>>> Currently, the dma350 driver assumes all channels are available to
>>> linux, this may not be true on some platforms, so it's possible no
>>> irq(s) for the unavailable channel(s). What's more, the available
>>> channels may not be continuous. To handle this case, we'd better
>>> get the irq of each channel by name.
>>
>> You did not solve the actual problem - binding still lists the
>> interrupts in specific order.
>>
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>  Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>>> index 429f682f15d8..94752516e51a 100644
>>> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>>> @@ -32,6 +32,10 @@ properties:
>>>        - description: Channel 6 interrupt
>>>        - description: Channel 7 interrupt
>>>  
>>> +  interrupt-names:
>>> +    minItems: 1
>>> +    maxItems: 8
>>
>> You need to list the items.
> 
> I found in current dt-bindings, not all doc list the items. So is it
> changed now?

Close to impossible... :) But even if you found 1% of bindings with
mistake, please kindly take 99% of bindings as the example. Not 1%.

Which bindings were these with undefined names?

> 
>>
>>
>>> +
>>>    "#dma-cells":
>>>      const: 1
>>>      description: The cell is the trigger input number
>>> @@ -40,5 +44,6 @@ required:
>>>    - compatible
>>>    - reg
>>>    - interrupts
>>> +  - interrupt-names
>>
>> That's ABI break, so no.
> 
> If there's no users of arm-dma350 in upstream so far, is ABI break
> allowed? The reason is simple: to simplify the driver to parse
> the irq.

You can try to make your case - see writing bindings. But what about all
out of tree users? All other open source projects? All other kernels? I
really do not ask about anything new here - that's a policy since long time.


Best regards,
Krzysztof

