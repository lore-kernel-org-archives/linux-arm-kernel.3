Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412E6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 20:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3EapxNTk591D/UKmWJMKnm2jRTdChxlN4lZS6VQOvY=; b=eMCBEu7uwDCAi/Pz6VxNbHMrMx
	VlYcJlTv37toVzp+dGy8P730oBS3c0xn+fDKmF73m113m28Korkvl3TH4/welesLJRRXoEs7PWGJb
	38izHov/Uif+YEyPLBL9uaVidWr5/f3AaACGA9ThR8TIjC/4dTsLlJprMOvfPYZS4Ciuo7xLfv0Bz
	GxHNGor1dhSdbsiEXF+iXB1b3Zv7wHYFAS8O3qE7R+AqAse5gPiF3O4xkCZ9jnmOCpzOfrD8TKOW7
	vrcnMnFOq7JMsqAyWibcjmYtBv0DBUvDDkLDw9DolVYwseYBPhD5/EPiDgLz3cmrwI9+yvYy84FBH
	4yBNlKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP5jA-00000007NWb-3lmd;
	Sat, 21 Dec 2024 20:05:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP5hx-00000007NQs-2LPs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 20:04:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B4465C3F2F;
	Sat, 21 Dec 2024 20:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA73C4CECE;
	Sat, 21 Dec 2024 20:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734811454;
	bh=ikxOUIOTw9eoWm2o64mcT0oXtU7uwV+VTnKNQ4dtHW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T4azDL64V+kylXHaClVhdTSzV2m1Y+u77wOTDXogL19Qw69EZNIiZF7HUhMZ5JReA
	 8eAFhoDA6HopiwIs3SXeZCpYqBz7pGsw8GZDuvjE/X8FKTFo72E0RAKZKBZjEAr8iE
	 jpCHWb5gSGTe9ZO5KveUHZP7Nb2hCY6hcnps83Z/5+I10XVmm0gfqrXL5uSaUobA6L
	 YxSbBIFILR7DOL8NiL21/Hh5MFWyiuNvLhV/2VR5iok/15CeNLoxluHdWflrDSgaMn
	 y3ku6+35Z7cVqFfyoYkpwYaAXLac3kdNBFOXUlgWqu+q/LmH5ific1ssceOHL8UwLD
	 k7ckbMHas/IdA==
Message-ID: <a92ff542-6534-4e2e-bef9-6f10c8362d86@kernel.org>
Date: Sat, 21 Dec 2024 21:04:09 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <f906a056-3c6b-4115-9fd0-e50da8fc049b@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_120417_702760_5D135C53 
X-CRM114-Status: GOOD (  31.10  )
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

On 20/12/2024 00:43, Florian Fainelli wrote:
> On 12/19/24 00:58, Krzysztof Kozlowski wrote:
>> On Wed, Dec 18, 2024 at 09:15:08AM -0800, Florian Fainelli wrote:
>>> On 12/18/24 03:37, Krzysztof Kozlowski wrote:
>>>> On Tue, Dec 17, 2024 at 11:44:38AM -0800, Florian Fainelli wrote:
>>>>> Document the revision c.1.5 compatible string that is present on newer
>>>>> Broadcom STB memory controllers (74165 and onwards).
>>>>>
>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>>> ---
>>>>>    .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>> index 4b072c879b02..99d79ccd1036 100644
>>>>> --- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>> @@ -29,6 +29,7 @@ properties:
>>>>>              - brcm,brcmstb-memc-ddr-rev-c.1.2
>>>>>              - brcm,brcmstb-memc-ddr-rev-c.1.3
>>>>>              - brcm,brcmstb-memc-ddr-rev-c.1.4
>>>>> +          - brcm,brcmstb-memc-ddr-rev-c.1.5
>>>>
>>>> You should use v2.1 fallback and drop driver patch. Or explain in
>>>> commit briefly why different approach is suitable.
>>>
>>> Are you suggesting that we should have fallback compatible strings, such
>>> that we have something like this:
>>>
>>> compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5",
>>> "brcm,brcmstb-memc-ddr-rev-c", "brcm,brcmstb-memc-ddr"
>>>
>>> and the driver only needs to match on "brcm,brcmstb-memc-ddr-rev-c" and
>>> apply the adequate register offset table?
>>
>> Almost, fallback should be brcm,brcmstb-memc-ddr-rev-b.2.1 or whatever
>> was in the driver first or whatever is the oldest known common
>> interface.
>>
>> brcm,brcmstb-memc-ddr-rev-c is not a specific compatible.
>>
>>> If so, that is not how the current binding, and therefore DTBs are being
>>> deployed, so that will introduce a breakage until we update all DTBs in the
>>> field...
>>
>> No. First, I thought about new comaptible so the one you add here. No
>> breakage, it's new compatible. This saves you these pointless updates of
>> driver everytime you add new compatible.
> 
> Yes, but that is not how the binding has been defined until now, so all 
> of the DTBs out there have:
> 
> compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x", "brcm,brcmstb-memc-ddr"

I don't understand the problem. We talk about new devices here, it does
not matter what existing/old devices have in binding in that matter.

> 
> (where X is in range [1..5])
> 
> and there is no fallback defined to "brcm,brcmstb-memc-ddr-rev-b.2.1", 
> so it is not like we can retrofit that easily by adding one now.
> 
>  > > Second, you can introduce fallbacks to older compatibles as well - 
> there
>> will be no breakage, because you add one more compatible. The old
>> compatibles (covered by fallback) of course stays in the driver, so
>> there is no breakage at all. We did it multiple times for several
>> different bindings in Qualcomm. People were doing exactly the same:
>> adding compatible for new device to binding and driver, without
>> considering the compatibility at all.
>>
>> Except being logically correct choice - using fallbacks - this really
>> has huge benefits when later upstreaming complete, big SoCs, like we do
>> for latest Qualcomm SoCs: several changes will be only bindings updates.
> 
> Yes, there are advantages to using fallbacks and we (ab)use that 
> whenever practical.
> 
> The driver only uses a very limited subset of registers (for now), the 
> registers change between minor revisions as well in a way that using a 
> fallback like "brcm,brcmstb-memc-ddr-rev-b.2.1" is not accurate enough 
> not practical. In particular for some of the changes that I am thinking 
> of adding later on, we would need the precise minor version because the 
> behavior and/or register interface is subtly different that this matters.

Devices work fine now with the same driver data, so they are compatible.
Just because you have some differences or new features does not
invalidate that this is exactly the point for what compatibility was
created.


Best regards,
Krzysztof

