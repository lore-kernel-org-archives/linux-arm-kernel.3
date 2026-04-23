Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48114FDEE2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQ6Ky3WjGYf4LUysBDTDBus+iswRNk1X1pdxZjl7Sl0=; b=etdVrtgWDhuxhGDecWY1NHE9mU
	XJtWhsMzxXADmBRaRRVHrTOiHkrGbVZDDgVN6yhXUcK0cUKPVMPnHA+FLRm5E4Rsnend8PniLc41u
	+yKBph7wHE6GLHlw1s1QwJ35bHAVAKCAFDpDZNpuMpMoY4EeKIVWxMBnhh6b26ootsW2cH22yfRQL
	V9xMTb91EwaRAcQL1aI/rW7/ORuicIfu4IsIlB5D+1/T5d0kRR8o9/ht4WRhCBtuWkuYC9VrL72sx
	84qQD1+ivKffAv9bkPRZNuidDlE8+X/1DyRo/M/jhtFd7ofpCfFWWcdckk2UzKqtVv9h5aXinZcJH
	R58tnVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxp9-0000000C3Aa-1f4F;
	Thu, 23 Apr 2026 17:26:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxp7-0000000C3AE-2rbD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63F754380F;
	Thu, 23 Apr 2026 17:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8622DC2BCAF;
	Thu, 23 Apr 2026 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965205;
	bh=5O8Pu9rzdsB9K+KmJxOw52mdQijp38BM1eFTkjsoGqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ba1U/IaJlcZ1l/JeSrnr4NIDGkzgFc4g9l3Rq8qG/Mpz3XYh/h1keBamOAAsQjun7
	 ZrHHcZuzZi2suKArogvaKvWzhmLI5GOd2wuN29XyeNbcs9f+zC9dut6LhKnX2xzuOC
	 a4XqA4njK+f19ul4q195AaL65RpkpCsuYBFj0LIcTHlm0u9vIBxWtl+pYHt8WPeKbC
	 my8w3fZksi5tFPBHflIFaQDWSfwKTJmDH4pY14Rjw72fDGaWWl45MeSY10a61ZXKWW
	 DObElYhaPnbOL5KFO81BjonhDQKy9AVFi7E0qAJ9r2WDZbFvcfA7ewT/l+L3eitQ8+
	 qQ6fEW3ORbL+Q==
Message-ID: <eac0f387-c38a-44eb-aed4-6c4022f01777@kernel.org>
Date: Thu, 23 Apr 2026 19:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 ben.levinsky@amd.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
 <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
 <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_102645_774564_B94C4F70 
X-CRM114-Status: GOOD (  23.15  )
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

On 23/04/2026 17:14, Shah, Tanmay wrote:
> Hello,
> 
> Thanks for reviews. Please see my comments below.
> 
> On 4/23/2026 4:09 AM, Krzysztof Kozlowski wrote:
>> On Wed, Apr 22, 2026 at 01:25:57PM -0700, Tanmay Shah wrote:
>>> Add auto-boot property to notify that remote processor is setup and
>>> ready to boot. Linux can attempt to boot or attach to already running
>>> remote processor. "firmware-name" property is used to mention default
>>> firmware to boot when linux starts the remote processor.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>> index ee63c03949c9..0d27260e3baa 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>> @@ -135,6 +135,14 @@ patternProperties:
>>>            - description: vring1
>>>          additionalItems: true
>>>  
>>> +      auto-boot:
>>
>> Last months, I have been asking AMD to follow writing-bindings doc or
>> other DT guidelines way too many times.
>>
>> Or you just sent us downstream... Do you see anywhere such property?
>> What properties do you see? How are they named?
>>
> 
> I should have put note about this. Current auto-boot properties are
> named like st,auto-boot fsl,auto-boot etc. but nothing vendor specific
> there. Can we have a common auto-boot property? Similar to
> firmware-name? If we agree to it then what's the correct location? New
> file remoteproc.yaml is okay?

Common properties go to dtschema, so it would need to go there, but the
point is that it's way too generic - every component with FW could be
called "auto-boot". This should stay vendor property, IMO.

> 
>>> +        type: boolean
>>> +        description: remote core is either already running or ready to boot
>>
>> And why is this property of a board?
>>
> 
> Not sure what indicates it is? The property is under remoteproc child
> device that is SOC level property. Remote core is on same SOC wher linux
> core is running.

So it is implied by SoC compatible? Please provide some arguments why it
cannot be implied by the SoC compatible. I gave you one way out, but if
you disagree then no problem.

> 
>>> +
>>> +      firmware-name:
>>> +        maxItems: 1
>>> +        description: default firmware to load
>>
>> Can you load non-default firmware later? IOW, why adding description
>> here, what is special?
>>
> 
> The rootfs contains other firmware demos, and it is possible to stop the
> default firmware, load other fw elf and re-run the remote core.
> I don't have strong preference on the description part, I will remove it
> if redundant.

No, it's fine, I wanted to be sure that such use case makes sense.

Best regards,
Krzysztof

