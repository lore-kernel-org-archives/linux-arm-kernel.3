Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6738BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSTBStxhzyR+6+FFM24DzymWvE+CP0/qXEeLu3rO9mU=; b=ba6tMQ7qpGZVf/MQiZdA2iRRPo
	XDF2Lp/iCAlZz7yaDNbWtfht8AUJdds3u+G9iWi4n0+TUNJ6u3lFQ11Lx5aHfy5pLx8hQkXdgGE0m
	pwKKRoApc3dw5YNWi/KlupvIl4QcihfH8lJU3YZSsgmMh2aDgXvAbF3n71cSvCut1jHdcREYDL8Bp
	wcAqP/sCTLzNEBIixGpZJYoe2KlMYWros9s8V7cpVn3hwbxvvN3+08u+pti7PjbpdLN1g8XI43vCg
	oVsBqpoGqcQmNtrCLBsjD9VagCIWCB7e3QXiUHlU2v2lV5GAn5LAQmYmD8wccWxoNLaE3T5F7bbUl
	nS6mYpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTST9-0000000BTPL-3cly;
	Thu, 02 Jan 2025 21:11:03 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSRw-0000000BTEG-0tvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 21:09:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
	bh=RSTBStxhzyR+6+FFM24DzymWvE+CP0/qXEeLu3rO9mU=;
	b=Vn/xKSj+oPkTQxwKb6Pt6A3BgAuqF/RnqKnt+PN38Vkhbjiwp4bSc+uOInNz1E9aRmD4j9aU/N/AsaN/lpRUsi+mrCRhi2gPOW7sY+eleVPRkyKroVQMyNq7mQ7ldjM5ag3/bzwvb6RkhsYbvkVLZOfpj0x4PGxXHk/SgVXWEsc=
Received: from webmail.netcube.li (WIN-IJ7TS3MJ5LT [127.0.0.1])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 22:09:28 +0100
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 22:09:27 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
In-Reply-To: <459cfaff-4f3b-46ac-9b4e-b794cb3968d4@kernel.org>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
 <20250102175006.3675-1-lukas.schmid@netcube.li>
 <20250102175006.3675-2-lukas.schmid@netcube.li>
 <478a6364-0537-453a-881f-c460de2f67a8@kernel.org>
 <c025818214942560a291f8c53108503a@netcube.li>
 <7bcb73f5-26ae-4bdd-9bb4-afc1c5b9fc0d@kernel.org>
 <26cbf302f615bec3ed6496f04425edc7@netcube.li>
 <459cfaff-4f3b-46ac-9b4e-b794cb3968d4@kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <36651dffdddb8e1781ce929f14a11cc1@netcube.li>
X-Sender: lukas.schmid@netcube.li
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_130948_580769_07759DC6 
X-CRM114-Status: GOOD (  16.40  )
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

Am 2025-01-02 21:59, schrieb Krzysztof Kozlowski:
> On 02/01/2025 19:48, Lukas Schmid wrote:
>> Am 2025-01-02 19:31, schrieb Krzysztof Kozlowski:
>>> On 02/01/2025 19:24, Lukas Schmid wrote:
>>>> Am 2025-01-02 18:57, schrieb Krzysztof Kozlowski:
>>>>> On 02/01/2025 18:49, Lukas Schmid wrote:
>>>>>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>>> 
>>>>> You did not read really the messages we gave you...
>>>>> 
>>>>> 1. Read what I wrote in my first reply for v1. I gave detailed
>>>>> instruction to avoid the exact mistake you now did.
>>>>> 
>>>>> 2. Read again Andre's reply.
>>>>> 
>>>>> 3. Do not attach (thread) your patchsets to some other threads
>>>>> (unrelated or older versions). This buries them deep in the mailbox
>>>>> and
>>>>> might interfere with applying entire sets.
>>>>> 
>>>>> 4. Next version, with proper cover letter, is after 24h, so you 
>>>>> have
>>>>> some time to digest the feedback.
>>>>> 
>>>>> Best regards,
>>>>> Krzysztof
>>>> 
>>>> Hi,
>>>> 
>>>> Thank you for your feedback, and I sincerely apologize for the
>>>> mistakes
>>>> in my submission process.
>>>> 
>>>> I did read Andre's reply and your feedback on v1, but unfortunately, 
>>>> I
>>>> had already sent the v2 series as a reply before fully understanding
>>>> all
>>>> the recommendations. I realize now that this was a misstep and 
>>>> caused
>>>> confusion.
>>>> 
>>>> I will wait until tomorrow, around 20:00, to send the v3 series. I
>>>> will
>>>> make sure to include a proper cover letter and ensure that all the
>>>> feedback from v1 and v2 is addressed.
>>>> 
>>>> Regarding the v1 feedback, I thought I had incorporated all your
>>>> suggestions. However, after rereading it, I seem to have missed
>>>> something critical. Could you please point out what I might have
>>>> overlooked? I want to make sure I fully understand and correct it in
>>>> the
>>>> next iteration.
>>>> 
>>> Please read my full reply for v1 of this patch. How did you implement
>>> that feedback - long instruction?
>>> 
>>> Best regards,
>>> Krzysztof
>> 
>> I assume by 'long instruction' you mean checking the devicetree using
>> 'make dtbs_check W=1'.
> 
> There was nothing like that. Again, we talk about this patch, not 
> other.
> You refer now to other patch.
> 
> Best regards,
> Krzysztof

Oh I see now. It's about the Acked-by. I have already added it to the
commit-message of my clone. The V3 will have those two included. I have
read the message from Andre, but unfortunately had already sent the new
patches before I got the mail. I have already applied the tags.

Best regards,
Lukas


