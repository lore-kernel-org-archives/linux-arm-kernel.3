Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50BECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VgMZuy/3MhIoKwziEmdaVYyml/kIWkNAEqXbv32/+E=; b=wk++i78r0+7Q00
	cTwTOlgObZuH6mf2FtC9SVvcLoevoRstMby8kPo/KbQUqQQ5lxfMH2WJudtyyQNW0WzORQXa1TwR5
	XMQ/cv+RgQQudRVVNjhaMqkTWLZMi0p3yZl6VZ1QMD4sbgfmLNOvEtsJFrYOd/je2mAoayg+KgSYb
	Ojii/RxewJjf/kDirQzcFgWPDxMFSEWtmlxh8PbAjdx7saFzOtmQE57RA8OJGGSC1jT4KeBYaSWnW
	dOsO11QE9cjZXdrME/UIPp+9unJ7ldQAy8axE2MVVkAj491hrnnYM+4n1qyHdBaWew2g6n4u/7J45
	xcxMxXv0zQGxcCp1frQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPmA-000000081qi-1h8U;
	Wed, 24 Jun 2026 15:44:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPm7-000000081qA-2a0w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:44:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B7E1691;
	Wed, 24 Jun 2026 08:44:21 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C8263F905;
	Wed, 24 Jun 2026 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782315866; bh=48PhkVFzO/1mTGp5JG1H71vPiIiN+lYego6qdEh2Mrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RgtTdy7dtyFO5BgS5hbYoiJTYUk359ukOSf7qeATy2vfJfBnpSwH9STf3DlzGeR4e
	 Wq8Gea+iHeRRY4Pv91OyCEG4Eb9MF95+n+iVk2A9UTxRqgI5T0pqSsLo/XzpMDkqEV
	 uUpOvp1mMYpQz0PW1YvBJHOlzu+BO9RWdWvECmj0=
Message-ID: <d2b27459-25e1-40cc-90fa-5f2c5f806b97@arm.com>
Date: Wed, 24 Jun 2026 16:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/11] arm64: entry: Convert to Generic Entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <ec181396-e398-4ce2-8cb8-10d7bdfeed61@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <ec181396-e398-4ce2-8cb8-10d7bdfeed61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_084427_738888_7048D0E8 
X-CRM114-Status: GOOD (  23.38  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jinjie,

On 17/06/2026 17:27, Ada Couprie Diaz wrote:
> Hi Jinjie,
>
> On 11/05/2026 10:20, Jinjie Ruan wrote:
>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>> maintainers' work easier and codes more elegant. arm64 has already
>> successfully switched to the Generic IRQ Entry in commit
>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>> time to completely convert arm64 to Generic Entry.
>>
>> [...]
> [...], when combining pseudo-NMIs with PREEMPT_RT under heavy pNMI load,
> I was able to trigger a new warning compared to upstream :
>
>     BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
>
> Specifically, this was when running `stress-ng --all 100 --class vm -t 
> 300` with
> `perf top -a -e 'cycles'` in another shell.
>
> This does not feel like a major issue : from my understanding it only 
> happens
> when running the full suite for some time and with many stressors (I 
> was not
> able to reproduce it by running individual tests), and flooding the 
> system with
> pseudo-NMIs.
>
> Given that this only happen with PREEMPT_RT, my guess is that it 
> interacts
> with generic entry in a way that can lead to more nesting than before,
> leading to an easier exhaustion of the limit on lockdep.
> As the system was still able to recover and did not lock up, I think 
> it can be OK
> as-is, or simply bumped a bit ? Happy for more opinions on that.
>
>
> Otherwise, this is
> Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>
> As this is an important change, any other testing, especially on real 
> workloads
> as well as on very large systems (which we haven't covered), would be 
> very welcome !
>
>
> I will take some time soon to review this latest version, now that I 
> am able to.

I went through the series and only had some minor nitpicks, and some small
worries about the intentionality of the behaviour changes in patch 7.
It also feels like the above bug is more of a stress limit being easier 
to reach
than a core issue with the series, but I'd be happy to get more thoughts 
on it.

This looks great, and I am looking forward to seeing it merged ! :)
Thanks again for carrying this change through.

Kind regards,
Ada


