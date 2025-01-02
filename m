Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CCEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNygnQNen7VJALsC07zvRWslbWg8Y7umKhpxIibCRyM=; b=oi7aGYzKYcFs7GO2vz3AgmeIIF
	DvzxXq7rODmQwck8xxV9CmrW0viNtfZiBbjYg5hm7rrk4VMlTJKim70Dc9/Vi1heLlqPgseiNbFTo
	r+H1omGPNGse7Og1BJ3INe0QCdZpk7Ad01kIbMke24aE0mB94d/XWicTEEE0v00YLX6MrpqW4/Csl
	18SGGlioizCcKL8nJ6rKfhgy5Y2vO9jByw4o7BwG8erADegKgS8QC9+mWL3vzLrZGAVub9vXx0Eq1
	5D0LiJDp81xwxWHZX7CMRO9CdF6vK4twTV9+PVpAqc3EgyKIXueZho37ocsdxR2guVEC5Ih2DkuvQ
	/x2fu6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSPu-0000000BT0e-2prT;
	Thu, 02 Jan 2025 21:07:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSHu-0000000BRvl-3pRg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9B5FA4056D;
	Thu,  2 Jan 2025 20:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8833C4CED0;
	Thu,  2 Jan 2025 20:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735851565;
	bh=x1wt2ruZc6TJ0Hf0LZHvtfDHq3OOUXDBkPjsYcgAWUE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N3Y1FERPQtdFML7aRTmEnEOe9D5SvWbWyZ0BXr8xiiEpuCRlCnh7etYVo4I7MO6oD
	 XVAmNJBcUidF1JmiastIUs7/RC9FHD1HC9FIGWsum4Mg8ZKq3PznQWnIdHz0XKl8XG
	 AMMbeFvWqAPrj3K2Fm30zwptmXT+C1SAwsG1tAW3IUmeW/r3fpJfhpI50l4beWB3/r
	 i0FzKQWJM0ZUZrH3N3vDEyTDvlpHcJ7Jgf4+fQYcVE6xfNOPoFRD801z5G8kaeDZoU
	 KhYH8k9vgoYjHmKiPlFiZs0m4C8b7/6Inb3aPX+BMo3bI4zDDlYTX13+FrPo3a297k
	 voLrlWXbDYTtA==
Message-ID: <459cfaff-4f3b-46ac-9b4e-b794cb3968d4@kernel.org>
Date: Thu, 2 Jan 2025 21:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
 <20250102175006.3675-1-lukas.schmid@netcube.li>
 <20250102175006.3675-2-lukas.schmid@netcube.li>
 <478a6364-0537-453a-881f-c460de2f67a8@kernel.org>
 <c025818214942560a291f8c53108503a@netcube.li>
 <7bcb73f5-26ae-4bdd-9bb4-afc1c5b9fc0d@kernel.org>
 <26cbf302f615bec3ed6496f04425edc7@netcube.li>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <26cbf302f615bec3ed6496f04425edc7@netcube.li>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_125927_087074_68D696E1 
X-CRM114-Status: GOOD (  13.76  )
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

On 02/01/2025 19:48, Lukas Schmid wrote:
> Am 2025-01-02 19:31, schrieb Krzysztof Kozlowski:
>> On 02/01/2025 19:24, Lukas Schmid wrote:
>>> Am 2025-01-02 18:57, schrieb Krzysztof Kozlowski:
>>>> On 02/01/2025 18:49, Lukas Schmid wrote:
>>>>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>>
>>>> You did not read really the messages we gave you...
>>>>
>>>> 1. Read what I wrote in my first reply for v1. I gave detailed
>>>> instruction to avoid the exact mistake you now did.
>>>>
>>>> 2. Read again Andre's reply.
>>>>
>>>> 3. Do not attach (thread) your patchsets to some other threads
>>>> (unrelated or older versions). This buries them deep in the mailbox 
>>>> and
>>>> might interfere with applying entire sets.
>>>>
>>>> 4. Next version, with proper cover letter, is after 24h, so you have
>>>> some time to digest the feedback.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Hi,
>>>
>>> Thank you for your feedback, and I sincerely apologize for the 
>>> mistakes
>>> in my submission process.
>>>
>>> I did read Andre's reply and your feedback on v1, but unfortunately, I
>>> had already sent the v2 series as a reply before fully understanding 
>>> all
>>> the recommendations. I realize now that this was a misstep and caused
>>> confusion.
>>>
>>> I will wait until tomorrow, around 20:00, to send the v3 series. I 
>>> will
>>> make sure to include a proper cover letter and ensure that all the
>>> feedback from v1 and v2 is addressed.
>>>
>>> Regarding the v1 feedback, I thought I had incorporated all your
>>> suggestions. However, after rereading it, I seem to have missed
>>> something critical. Could you please point out what I might have
>>> overlooked? I want to make sure I fully understand and correct it in 
>>> the
>>> next iteration.
>>>
>> Please read my full reply for v1 of this patch. How did you implement
>> that feedback - long instruction?
>>
>> Best regards,
>> Krzysztof
> 
> I assume by 'long instruction' you mean checking the devicetree using
> 'make dtbs_check W=1'.

There was nothing like that. Again, we talk about this patch, not other.
You refer now to other patch.

Best regards,
Krzysztof

