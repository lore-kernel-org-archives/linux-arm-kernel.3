Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F9C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBWlpV8kTmfjUp/cxbE2jcSPrbfeSERAXUEbv1hgRHQ=; b=vkWMexzvTcCsy1JzYbtT8sc5UB
	lTR5QNsZk1/KxqvGfTSwUnh23sdlLSiRCp8l2az8OLzsnSN23SLMUKv4RboIIrc21I70p+1Xsujh8
	4aLJ5LIy5FW+cMRhjfTOVKZNvEYMi1KRypWI8MMBcCyDpFqNuGOMA0EerKZILLdrVMCQQml/zMnmj
	rEFXwcBYwHdZY6BCufMQzvR5J3Ht8rZfsGYtAQyc3sbssJ9qFB6a2RQ3ovPJEIl7MydeMz5hMkSdM
	fTdIRvSGx7G8Dg/xG/YvYbjbeHjDo0B641DC94x2Cd1knuskchVf/QaTNWecKLdmZi4p4D+WAr7vI
	iFaAnUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cnp-0000000Azhl-2ekJ;
	Wed, 09 Sep 2026 07:33:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cno-0000000AzhS-3HuK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:33:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E61440252;
	Wed,  9 Sep 2026 07:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB31F00A3A;
	Wed,  9 Sep 2026 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939184;
	bh=sBWlpV8kTmfjUp/cxbE2jcSPrbfeSERAXUEbv1hgRHQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=KFy44dzfvwwgIv8doM5H3ys0Vi4Sl2PVI1tanddz/nCudVW+TT8zWcAbS0+b9vnWc
	 UyMiSVSqcxxVLOMUCUsQRKaTCv9Ikkn8AJ8px1T3gzDCGfco56YwSNro5ue/rWTdJV
	 kfxEn1c5mbyoHd8OISl5f5KQMyWJOiW2sig1bIjoQ5aRS6ed0sKdP8nAvA0jCauMbS
	 RzEfFrtfHz8wkQcI1mI1t/djukTiZ6UG5LOVGJ9qJfkqNWxNAdm6AtzhkWcEuWoOql
	 VyzS4Wj2HvU1HPz3uVthksl8p4UOJ44hle0E4qLJG6szIr7luFbAFEBIVssCpze81U
	 QVeDeG4wJ+yyQ==
Message-ID: <76ad4ffe-82b8-42ec-abbe-a8c35ed8705f@kernel.org>
Date: Wed, 9 Sep 2026 09:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8140 compatible
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
 <4e65ef39-cf1b-49d4-a899-da36acb442c2@gmail.com>
 <20260909-advanced-marble-lorikeet-eebeef@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260909-advanced-marble-lorikeet-eebeef@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 09/09/2026 09:31, Krzysztof Kozlowski wrote:
> On Sat, Sep 05, 2026 at 04:25:36PM +0800, Nick Chan wrote:
>>
>> Yureka Lilian 於 2026/9/5 凌晨3:49 寫道:
>>> The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
>>> the M1-M4 SoCs.
>>>
>>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>>> ---
>>>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>> index 1cb886785173..e3cadc5ad39d 100644
>>> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>> @@ -46,6 +46,7 @@ properties:
>>>                - apple,t6030-aic3
>>>                - apple,t6031-aic3
>>>                - apple,t8132-aic3
>>> +              - apple,t8140-aic3
>>
>> the title should be "... Add t8140 compatible" describing the hardware corresponding
>> to the added compatible since the compatible being added is not "apple,t8140".
> 
> Commit msg is correct, it does exactly what you wrote, no?
> 
>>
>> (Alternatively, if you mention the compatible in title, say "...Add apple,t8140-aic3" as
>> "compatible" is already implied)
> 
> That would be repeating diff, so not really helpful.


Ah, you meant the subject of the patch...


Best regards,
Krzysztof

