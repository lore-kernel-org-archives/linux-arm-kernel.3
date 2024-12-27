Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F1BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CeCv0ODzD7sQaeqNXL6035hFJRgChjWQuvUn4v2CWI=; b=hdQL/pmIYv3tVCJfSmh44oGfB/
	xD7qBE8j+7BPgW8y1UZciUox5fVFGg9HpEB+sO9uke9m17eyspous+swSprJBlUh1LK37pX3xfRuR
	ls2aScD3wtAah6+7KLR4X8cANrhivd40dYd+plc/YLLOvKL6XxHKnLYW7EwPRBr2Jwv9kLSnyzVa2
	U2RXcz9fsrmeWgQ1kP4F1LY9qxv5IVpSmh6FquRp3c/olVqX+XW7hWBz29UWeDez+hqfs4vPT75Ve
	JSmgWcAmQR93LFjGl4URga8N4dOJ+m+0KapTJnTuudMawcOyijlFIIIyKuB7kEEFczTYr3Nf9gjGW
	HVkEf3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4KP-0000000HC7l-36FX;
	Fri, 27 Dec 2024 07:00:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4JD-0000000HC1F-1bgL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 06:58:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A32F5C5679;
	Fri, 27 Dec 2024 06:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B251BC4CED0;
	Fri, 27 Dec 2024 06:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735282732;
	bh=+skvMVjctMEII6DZeZwfBJwzd1xJJNkCvXSJBQAr5Zo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hc3WyDRpBjcD5b/rjtkjC4N7c47DrEa0dvFx77AbUcOGqHSn05nOV6Y56DjHXyDg0
	 R0Du6g/ve/9hUfJWF2PaiUXsWXrmGg+ywTpqOhHomau7eYLCThULxEb7ps7fIUE778
	 ioDBlZ5ZNIJzDT0zqaXfua9Q+oSO5l7CdczrFpHbX60mIhiGLIvYq9rBh5UaE+O7wD
	 gN9JwbPADKf0uuVznNpvscwzbvIHRGqJ/y9qbxYc86b3BUorSwwEjQ5H52L1vCLdnT
	 vQP0YoRoHf5JcDdupS3/nFrmlme0agH89kbzkRAtRqpWIK4aE5o036PdpDSIyZx3/q
	 /JGPTBWCAkYjQ==
Message-ID: <1357f0ff-3493-491b-b06f-976c16a81681@kernel.org>
Date: Fri, 27 Dec 2024 07:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: memory-controller: Document rev c.1.5
 compatible
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20241217194439.929040-1-florian.fainelli@broadcom.com>
 <20241217194439.929040-2-florian.fainelli@broadcom.com>
 <2e33t7ft5ermsfr7c4ympxrn6l5sqdef3wml4hlbnhdupoouwj@gfjpbmowjadi>
 <93a1333d-442f-4cec-b823-9b1a5ff6dc6b@broadcom.com>
 <wxq5zzfh5jesucbbste2j6x2jtj45wjfc5xzjkqbqqta7cprda@oaf5arr3z6pt>
 <f906a056-3c6b-4115-9fd0-e50da8fc049b@broadcom.com>
 <a92ff542-6534-4e2e-bef9-6f10c8362d86@kernel.org>
 <0058c37b-9e7c-4af8-b7c0-c48b5b046d6a@broadcom.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0058c37b-9e7c-4af8-b7c0-c48b5b046d6a@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_225855_526989_89B4AEFE 
X-CRM114-Status: GOOD (  30.41  )
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

On 26/12/2024 19:50, Florian Fainelli wrote:
> 
> 
> On 12/21/2024 12:04 PM, Krzysztof Kozlowski wrote:
>> On 20/12/2024 00:43, Florian Fainelli wrote:
>>> On 12/19/24 00:58, Krzysztof Kozlowski wrote:
>>>> On Wed, Dec 18, 2024 at 09:15:08AM -0800, Florian Fainelli wrote:
>>>>> On 12/18/24 03:37, Krzysztof Kozlowski wrote:
>>>>>> On Tue, Dec 17, 2024 at 11:44:38AM -0800, Florian Fainelli wrote:
>>>>>>> Document the revision c.1.5 compatible string that is present on newer
>>>>>>> Broadcom STB memory controllers (74165 and onwards).
>>>>>>>
>>>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>>>>> ---
>>>>>>>     .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
>>>>>>>     1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>>> index 4b072c879b02..99d79ccd1036 100644
>>>>>>> --- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>>> @@ -29,6 +29,7 @@ properties:
>>>>>>>               - brcm,brcmstb-memc-ddr-rev-c.1.2
>>>>>>>               - brcm,brcmstb-memc-ddr-rev-c.1.3
>>>>>>>               - brcm,brcmstb-memc-ddr-rev-c.1.4
>>>>>>> +          - brcm,brcmstb-memc-ddr-rev-c.1.5
>>>>>>
>>>>>> You should use v2.1 fallback and drop driver patch. Or explain in
>>>>>> commit briefly why different approach is suitable.
>>>>>
>>>>> Are you suggesting that we should have fallback compatible strings, such
>>>>> that we have something like this:
>>>>>
>>>>> compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5",
>>>>> "brcm,brcmstb-memc-ddr-rev-c", "brcm,brcmstb-memc-ddr"
>>>>>
>>>>> and the driver only needs to match on "brcm,brcmstb-memc-ddr-rev-c" and
>>>>> apply the adequate register offset table?
>>>>
>>>> Almost, fallback should be brcm,brcmstb-memc-ddr-rev-b.2.1 or whatever
>>>> was in the driver first or whatever is the oldest known common
>>>> interface.
>>>>
>>>> brcm,brcmstb-memc-ddr-rev-c is not a specific compatible.
>>>>
>>>>> If so, that is not how the current binding, and therefore DTBs are being
>>>>> deployed, so that will introduce a breakage until we update all DTBs in the
>>>>> field...
>>>>
>>>> No. First, I thought about new comaptible so the one you add here. No
>>>> breakage, it's new compatible. This saves you these pointless updates of
>>>> driver everytime you add new compatible.
>>>
>>> Yes, but that is not how the binding has been defined until now, so all
>>> of the DTBs out there have:
>>>
>>> compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x", "brcm,brcmstb-memc-ddr"
>>
>> I don't understand the problem. We talk about new devices here, it does
>> not matter what existing/old devices have in binding in that matter.
> 
> It does matter, because the DTBs that contain this compatible string are 
> already in the field, we cannot retrofit them overnight with an 
> additional compatible string in order to provide a fallback. Because 

Then they run downstream and it does not matter whether you change here
something or not. And anyway downstream choices do not shape choices
here. We never accept bindings just because downstream already shipped
something.

> this is submitted now does not mean it is a new device, this was part of 
> my backlog to get submitted earlier on.

Well, that's great yet is not an argument in the bindings.

> 
>>
>>>
>>> (where X is in range [1..5])
>>>
>>> and there is no fallback defined to "brcm,brcmstb-memc-ddr-rev-b.2.1",
>>> so it is not like we can retrofit that easily by adding one now.
>>>
>>>   > > Second, you can introduce fallbacks to older compatibles as well -
>>> there
>>>> will be no breakage, because you add one more compatible. The old
>>>> compatibles (covered by fallback) of course stays in the driver, so
>>>> there is no breakage at all. We did it multiple times for several
>>>> different bindings in Qualcomm. People were doing exactly the same:
>>>> adding compatible for new device to binding and driver, without
>>>> considering the compatibility at all.
>>>>
>>>> Except being logically correct choice - using fallbacks - this really
>>>> has huge benefits when later upstreaming complete, big SoCs, like we do
>>>> for latest Qualcomm SoCs: several changes will be only bindings updates.
>>>
>>> Yes, there are advantages to using fallbacks and we (ab)use that
>>> whenever practical.
>>>
>>> The driver only uses a very limited subset of registers (for now), the
>>> registers change between minor revisions as well in a way that using a
>>> fallback like "brcm,brcmstb-memc-ddr-rev-b.2.1" is not accurate enough
>>> not practical. In particular for some of the changes that I am thinking
>>> of adding later on, we would need the precise minor version because the
>>> behavior and/or register interface is subtly different that this matters.
>>
>> Devices work fine now with the same driver data, so they are compatible.
> 
> For now they do, but not for other features that will be submitted 
> later, they will not be, and at that point we will need to know that 
> this is a rev C.1.5 controller versus say a rev C.1.4 controller.

Which is exactly what compatibility is for.



Best regards,
Krzysztof

