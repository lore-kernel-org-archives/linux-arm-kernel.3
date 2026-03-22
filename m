Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C90FC72AE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMLpKkhbJahfZAQ9E3JPvXDUjHThDrC8Y/biDjc3qW0=; b=s189kTdoVOw38vvJQ18cx/hj9U
	7kIkaqsMlzL4hmB/HsFH/3UkXZ8FcqdBnMedEVTCJW3gx0g4M6jtZiy31GV2aL0DUQqf7AqVdLy8D
	p/UnFEitWRVsm4wY9eQPKuDGNy9P7SeZpxp026vZi8JYnCXwKyv2C36x/cgNSwl4IaeSLc6neJo4M
	otWxVhxJecIkVX2/LYSlKJuBGneAUqg+aOjvSu1YetSw8TgPkBDj9yqXn/4OBGRDp2k8KmmIeMoTP
	tVMj2J/Eqx5Ki9mI3MBybO678tobvSK7KpVc0y+i8Oj2R+1lzXEzMqOnCsDG8smcb6GxepXJslfhR
	5Yd2Cv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4FWr-0000000FEGi-33d0;
	Sun, 22 Mar 2026 09:55:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4FWm-0000000FEGL-2Usw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 09:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E08674434A;
	Sun, 22 Mar 2026 09:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF91C19424;
	Sun, 22 Mar 2026 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774173323;
	bh=wds4pz1vo4hnU97Ycw1V36BOoaG56UpHueqjDmj507M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Glr449GFxMkqC3eb7DHpp2nEiEZn4tkpvQhrQkkZk34f2MhfFTdPAlV/3BHWC2Z5J
	 9dUvwUIHcPg053EXP5b5/Zcl7f5DeI6n1p7xvBhbr6VbqeW0n1rXi1f/AFgjj4QZ4J
	 LJRtz7J12UVbR8xQlEdtHYh7nH5ykBNtqczuN9svOO3ABY5ONMtC/WDXBJjIhlfxXe
	 YLK4L+/l4PGnYe61qmxaTtugHMbSctS7BV/Bk0Zcf7N9pXEZ5vOICsJTECSWXQCJk6
	 iSTPAl1U+ugBbLtOhNbs3Rs8Bn6HjBdZbd9egZovXr6WhNQT4QiBe/q14SKARvJEJR
	 PWUp+Gj/0/6qQ==
Message-ID: <2e43f7e5-09b8-4f95-815c-0954c579a623@kernel.org>
Date: Sun, 22 Mar 2026 10:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] dt-bindings: iio: adc: xilinx-xadc: convert to YAML
 format
To: David Lechner <dlechner@baylibre.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-6-sai.krishna.potthuri@amd.com>
 <20260221-dancing-papaya-wolverine-db8afd@quoll>
 <b89933a3-5f25-466c-a2f5-6e231aa12749@amd.com>
 <21d425bc-9406-401b-9817-7255ba3d31fc@baylibre.com>
 <e4c9729f-1785-4d10-a337-37b0d26fe30b@amd.com>
 <f1706ec0-3995-4fdf-a9fb-8e1e688438a7@baylibre.com>
 <05bcc5b7-b3e8-40fb-be70-413c74afcfb1@amd.com>
 <cf749e8c-f141-4367-81ad-827e02273ec5@baylibre.com>
 <6a4e3d95-875f-4c2b-8443-c2f2b19ff166@amd.com>
 <12a06779-cbbb-4dc2-b564-7b9cdff6796b@kernel.org>
 <faa4e46b-1cc6-4bab-b13e-c527a67ec4c4@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <faa4e46b-1cc6-4bab-b13e-c527a67ec4c4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_025526_294721_568B1670 
X-CRM114-Status: GOOD (  27.91  )
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

On 19/03/2026 20:07, David Lechner wrote:
> On 3/19/26 11:49 AM, Krzysztof Kozlowski wrote:
>> On 19/03/2026 16:49, Sai Krishna Potthuri wrote:
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +$defs:
>>>>>>>>>>
>>>>>>>>>> Why this is a def, not used directly? I see only one usage of this def.
>>>>>>>>>
>>>>>>>>> I am getting the below error if i define the patternProperties directly.
>>>>>>>>> Seems like complex vendor peroperties should be referenced via $ref.
>>>>>>>>> Please suggest if there is any better way to deal this.
>>>>>>>>
>>>>>>>> It is hard to say without seeing the new version of what you wrote.
>>>>>>>
>>>>>>> In v1 series, i created $def and referenced this in xlnx,channels to avoid the error that i mentioned.
>>>>>>
>>>>>> Is the code below the code that causes the error?
>>>>>
>>>>> No, the below code is not creating the error but Krzysztof asked the question on this code,
>>>>> "Why this is a def, not used directly? I see only one usage of this def."
>>>>>
>>>>> I am saying if i don't use the def and use it directly i am seeing the error that i mentioned. So, asking is there any better way to handle this case other than using def.
>>>>
>>>> If you could show us the actual code that is causing the error, then
>>>> we could perhaps spot a mistake or suggest an alternative.
>>
>> Thanks David, I am surprised how many emails we need to exchange just to
>> see the actual code.
>>
>>>
>>> Thanks. Here is the code that is causing the error
>>> ("properties:xlnx,channels:type: 'boolean' was expected").
>>>
>>> xlnx,channels:
>>
>> Device nodes do not have any prefixes. Just take a look at any DTS or
>> any binding.
>>
>> Probably that's the reason, because nothing in this code looks
>> particularly odd. Anyway, please do not come with odd syntax in the code
>> without any explanation, just to make it passing the tests, so for
>> example ignoring the checks we have.
>>
>>
>> Best regards,
>> Krzysztof
> 
> Since this is converting existing 12-years-old .txt bindings, I don't
> think we can "fix" the bindings by dropping the vendor prefix.

Indeed. It is being also in the driver. The prefix must stay and this
oddity must be explained in the commit msg.

Commit msg must explain all the non-obvious, unusual, unexpected odd
things the patch is doing.

> 
> I think in cases like this, Rob will usually fix the tooling to ignore
> this as a special case. (I had a similar case last year on a conversion
> I did.)
> 
> So I think the right thing to do is to not use $def and explain in the
> commit message why the error is expected (we can't change existing bindings
> even though they are "wrong" by current standards).
> 
> If this was a new binding, we should be using the common adc.yaml for IIO
> ADCs which already has patterProperties for channels and a bipolar flag.
> But we are stuck with this vendor-prefixed one here.
> 


Best regards,
Krzysztof

