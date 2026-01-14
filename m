Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B494FD29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elYjslV/mRi+jCSSKAj5eqqdxh5kovFx6VFGm6vddUY=; b=oPdBR1v4QsbsPXOd6HDQOp+81e
	GwOkaBknsoojlPmQ2ZpFhvWVX8tyCMxGg8uerauBWK5OnHP2WfrczKNnRCN9Xhpez1s+lC9BMuBI4
	AiUsRwmWQDSNi0fRzBlIU4sQ2oaJE40GYQ4NH8tUSkUi7TPlJJ68RhJi6vRrsqSELit1x0qm5Wd8C
	OLoF8g8Neir/UMH7l0ujnl/WE/jRBJMj+a/KcvEUaljNX+fn4xdm9RZrP/+u+QAQz2rXAwSkNHo23
	Ei2C5haFYZ+lojVrZ15ODl0lUPdGOstkPBRY0FauDjv8/MYdQhD7fvvucOt9xP/GS94xe+x2iAwtx
	YV4KHpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyDP-00000008oXl-1MMf;
	Wed, 14 Jan 2026 10:35:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyDN-00000008oX9-1gKR;
	Wed, 14 Jan 2026 10:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2A5A6001D;
	Wed, 14 Jan 2026 10:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC60C4CEF7;
	Wed, 14 Jan 2026 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768386900;
	bh=Aci1VfUrOZ2vmVbNLWJQMYGWQewDFxkS6jVls4tevd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OEzTGLvYDXEV6L79EExc0h67Wmmw9yYzCqGdEdEmo68q+BecSb2Sgs6upW6aDcIcH
	 +7iUx5JkmePrf5ANUaO+K4cRwmYE0+mMkR2mL6QzVlvPaIF++outnSad3JGIkSJToU
	 Pv1cBpNf6H6TJ0lwoMybO4nQ9RMle2v7HsR40lMgAMu16Utd7lc0YdBgrtaeMZwGlf
	 u1gvWeRegKMa/2f+UqYUUHSV7kjQb5RKxZIslquh4WjOk5YNPCB9iridTElQ8MVggt
	 c+w1K4meVe1yrQlnOABvgu08M/2b2gqKYxtQFW1+NB8PCKbU69k+06mCw65KWa8Hnn
	 P3LsqGkOiUMXQ==
Message-ID: <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
Date: Wed, 14 Jan 2026 11:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll> <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <69676b6c.050a0220.5afb9.88e4@mx.google.com>
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

On 14/01/2026 11:09, Christian Marangi wrote:
> On Wed, Jan 14, 2026 at 10:26:33AM +0100, Krzysztof Kozlowski wrote:
>> On 14/01/2026 10:01, Lorenzo Bianconi wrote:
>>>> On Tue, Jan 13, 2026 at 09:20:27AM +0100, Lorenzo Bianconi wrote:
>>>>> Introduce en7581-npu-7996 compatible string in order to enable MT76 NPU
>>>>> offloading for MT7996 (Eagle) chipset since it requires different
>>>>> binaries with respect to the ones used for MT7992 on the EN7581 SoC.
>>>>>
>>>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
>>>>> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754885c1362b9603349a6353 100644
>>>>> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
>>>>> @@ -18,6 +18,7 @@ properties:
>>>>>    compatible:
>>>>>      enum:
>>>>>        - airoha,en7581-npu
>>>>> +      - airoha,en7581-npu-7996
>>>>
>>>> This does not warrant new compatible. There is some misunderstanding and
>>>> previous discussion asked you to use proper compatible, not invent fake
>>>> one for non-existing hardware.  Either you have en7996-npu or
>>>> en7581-npu. Not some mixture.
>>>
>>> Hi Krzysztof,
>>>
>>> We need to specify which fw binaries the airoha NPU module should load
>>> according to the MT76 WiFi chipset is running on the board (since the NPU
>>> firmware images are not the same for all the different WiFi chipsets).
>>> We have two possible combinations:
>>> - EN7581 NPU + MT7996 (Eagle)
>>> - EN7581 NPU + MT7992 (Kite)
>>>
>>> Please note the airoha NPU module is always the same (this is why is just
>>> added the -7996 suffix in the compatible string). IIUC you are suggesting
>>> to use the 'airoha,en7996-npu' compatible string, right?
>>
>> No. I am suggesting you need to describe here the hardware. You said
>> this EN7581 NPU, so this is the only compatible you get, unless (which
>> is not explained anywhere here) that's part of MT799x soc, but then you
>> miss that compatible. Really, standard compatible rules apply - so
>> either this is SoC element/component or dedicated chip.
>>
>>
> 
> Hi Krzysztof,
> 
> just noticing this conversation and I think there is some confusion
> here.
> 
> The HW is the following:
> 
> AN/EN7581 SoC that have embedded this NPU (a network coprocessor) that
> require a dedicated firmware blob to be loaded to work.
> 
> Then the SoC can have various WiFi card connected to the PCIe slot.
> 
> For the WiFi card MT7996 (Eagle) and the WiFi card MT7992 (Kite) the NPU
> can also offload the WiFi traffic.
> 
> A dedicated firmware blob for the NPU is needed to support the specific
> WiFi card.
> 
> This is why v1 proposed the implementation with the firmware-names
> property.
> 
> v2 introduce the compatible but I feel that doesn't strictly describe
> the hardware as the NPU isn't specific to the WiFi card but just the
> firmware blob.
> 
> 
> I still feel v1 with firmware-names should be the correct candidate to
> handle this.

Yes. What you plug into PCI is not a part of this hardware, so cannot be
part of the compatible.

> 
> Hope now the HW setup is more clear.
> 


Best regards,
Krzysztof

