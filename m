Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E585C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CxWBQDeU5xVUZ5kekhvvHmx15qwBTQL8qybV6/TlUs=; b=n0ol3tQ3ZLgMVIu/8Ir+zEpxwD
	DSZMtMGhtTJbj1sP7vkLmjiBpVqJmuoAdN2aT/mdF4bDZ6kLnnvQ69khMYvzYsEToz7ggPHBssPE3
	shdXqVWzDTgUEBYSAuP2YCQf5iqbifFyZ2PYzCJ1LqCWnc7Hmp5F4pwQQosu1wYlDDKjsuse9wLu1
	WGY3Kb7Odx+GCKo3RuyFl/KcyLzLD32maFET1fYhRbnhHKJPmm2lkn1xUoLw2xVNsswJlq7ARR7wj
	hEq7VDVV5KAGY0WoTFXK2ZLQHdvMtwcpY6nxp/Jp4zRfvN+hfTSTtqL+M6cfahqDYpFFNDvWkSU+O
	dqVt5kvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woH2V-00000002Gdh-3a8G;
	Mon, 27 Jul 2026 08:50:23 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woH2S-00000002Gd7-2qBq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:50:21 +0000
Message-ID: <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785142201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CxWBQDeU5xVUZ5kekhvvHmx15qwBTQL8qybV6/TlUs=;
	b=BE0AFRENAJ2UYvSuzj+AWbyilZ8oTXTQO56nKU42/MZmWf3/sO3HFk5Ofhvo4zmModtyau
	PLc2q+wTzDZVSoQAUkeVeFxhxnBuQRt+I5pd4LdnkY8mamlhpMddp0SRQaBrlhbV20ORIi
	ri2oeU8LRkBS+hWg2hIxpG/wiWBZIPw=
Date: Mon, 27 Jul 2026 10:49:57 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
To: Will Deacon <will@kernel.org>, Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <amE5bX0jey6WS0U1@willie-the-truck>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <amE5bX0jey6WS0U1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_015020_917548_7B942DBA 
X-CRM114-Status: GOOD (  15.50  )
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

On 7/22/26 23:43, Will Deacon wrote:
> On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
>> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
>> index e278e060e78a..2452990ed37a 100644
>> --- a/arch/arm64/lib/delay.c
>> +++ b/arch/arm64/lib/delay.c
>> @@ -15,6 +15,8 @@
>>   
>>   #include <clocksource/arm_arch_timer.h>
>>   
>> +#include "../kernel/idle.h"
>> +
>>   #define USECS_TO_CYCLES(time_usecs)			\
>>   	xloops_to_cycles((time_usecs) * 0x10C7UL)
>>   
>> @@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
>>   		 * Start with WFIT. If an interrupt makes us resume
>>   		 * early, use a WFET loop to complete the delay.
>>   		 */
>> -		wfit(end);
>> +		if (likely(idle == ARM64_IDLE_WFI))
>> +			wfit(end);
> Rather than scatter the idle implementation check across all users of
> WFI*, why not move this into the macro itself? That way, the callers can
> all stay like they are but the macro behaves as specified.
>
> Will

In practise, I could only find the following uses of WFI / WFIT / wfi() 
/ wfit() in arm64 code: 1) the default idle loop and delay() function; 
arguably the only "real" users 2) parking cores after different kinds of 
unexpected situations / crashes.

Just to confirm, you are suggesting to add the conditionals to 
arch/arm64/include/asm/barrier.h, and have wfi() and wfit() macros not 
actually do WFI / WFIT depending on the value of the idle param?

I'm torn about this: We should maybe first discuss what effect idle= 
should have: Should it prevent WFI running anywhere in the kernel when 
idle=nop, OR is its intended use case to change the default arm64 
implementations for idle and delay, while still allowing other parts of 
the kernel to use WFI (for example, for custom cpuidle implementation)? 
I think the existing nohlt parameter, which disables all idle states, is 
more fitting for the first goal, even though it currently does not 
prevent the wfit in the delay function.

For preventing WFI anywhere, I think alternatives patching based on the 
earlyparam would be the most reliable way to achieve that, and second 
most reliable way is putting the conditional in the wfi() / wfit() macros.

But my assumption is that what we want to achieve is actually closer to 
changing only the default idle implementation, while allowing an idle 
state registered at later point to still do its thing (including using 
WFI for this purpose). And for this (and to be more flexible with other 
idle modes e.g. yield), what I proposed in this patch makes more sense, 
and I'm relatively confident it will fulfill the Apple Silicon use case 
without adding many more scattered checks other than these two.
Does this make sense?


Thanks!

— Yureka



