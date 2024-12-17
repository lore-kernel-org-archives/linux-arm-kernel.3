Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C1CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 03:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYaV8tUHY5DY/QNPB9vrWmARi1TH7zIIIk5o2rlYGdA=; b=OEuPfJy2GiyfHr6BZsjfHKoQFO
	aOb5I97J65PETWzaHAPwFsg7KyR2C7Gw/q/4AgsmSC/unaPUBY1B24qilAGXfC88Ma992hmEr7Cd9
	+3ji6Y0sZ/NfwKTBTXvB9xibfadKg9yWNlQYRLZSOLDE7j/z9kGi68qu4drOs/I8Ct5vLTjtLuWqB
	f6JOvI1dN/b6rdZMeL4qlt0lwQdppKTIDKmJgeOoRsB21tjr8dC0TyflUlcZc+trHka6uSemghVWx
	bOZfBGG5uTiFPpFNE8fbcYvBvcsVaxBB+SsASE4ZqWZdF0v5DJg2CxGtnQtb+uZFUJYBfJyoaQrbK
	U3HMYVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNul-0000000C1hn-1tUg;
	Tue, 17 Dec 2024 03:06:27 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNtf-0000000C1cD-0riA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 03:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1734404716; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JYaV8tUHY5DY/QNPB9vrWmARi1TH7zIIIk5o2rlYGdA=;
	b=MSUW7IPYxXTNw/klexzDs7KhW6mYbfKQE31FKkjTVdgCYh7J+BXlkhdQDjLoaUwanxU2rcMU6q1ph5oQn/2EXzfEcOP737mCbzasin3cMafYqXAbS1FMTrI8IBGIjBqrvdnW1jYhogQkLJ24ZeTbwJXTjAmaLJ/SwHNRcDQXFko=
Received: from 30.246.161.240(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WLh6bXS_1734404711 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 17 Dec 2024 11:05:13 +0800
Message-ID: <1e0a0f9b-7c58-4f70-b2d4-6b3c2c4143de@linux.alibaba.com>
Date: Tue, 17 Dec 2024 11:05:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/3] mm: memory-failure: move return value
 documentation to function declaration
To: jane.chu@oracle.com, yazen.ghannam@amd.com, mark.rutland@arm.com,
 catalin.marinas@arm.com, mingo@redhat.com, robin.murphy@arm.com,
 Jonathan.Cameron@Huawei.com, bp@alien8.de, rafael@kernel.org,
 linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 tanxiaofei@huawei.com, mawupeng1@huawei.com, tony.luck@intel.com,
 linmiaohe@huawei.com, naoya.horiguchi@nec.com, james.morse@arm.com,
 tongtiangen@huawei.com, gregkh@linuxfoundation.org, will@kernel.org,
 jarkko@kernel.org
Cc: linux-acpi@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
 ardb@kernel.org, ying.huang@intel.com, ashish.kalra@amd.com,
 baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com
References: <20241202030527.20586-1-xueshuai@linux.alibaba.com>
 <20241202030527.20586-3-xueshuai@linux.alibaba.com>
 <51d231c2-3659-461a-b6c3-d0e7f9fddfc1@oracle.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <51d231c2-3659-461a-b6c3-d0e7f9fddfc1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_190519_845122_2963D6B0 
X-CRM114-Status: GOOD (  12.90  )
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



在 2024/12/17 07:37, jane.chu@oracle.com 写道:
> 
> On 12/1/2024 7:05 PM, Shuai Xue wrote:
>> Part of return value comments for memory_failure() were originally
>> documented at the call site. Move those comments to the function
>> declaration to improve code readability and to provide developers with
>> immediate access to function usage and return information.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
>> ---
>>   arch/x86/kernel/cpu/mce/core.c |  7 -------
>>   mm/memory-failure.c            | 10 +++++++---
>>   2 files changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
>> index 7fb5556a0b53..d1dd7f892514 100644
>> --- a/arch/x86/kernel/cpu/mce/core.c
>> +++ b/arch/x86/kernel/cpu/mce/core.c
>> @@ -1398,13 +1398,6 @@ static void kill_me_maybe(struct callback_head *cb)
>>           return;
>>       }
>> -    /*
>> -     * -EHWPOISON from memory_failure() means that it already sent SIGBUS
>> -     * to the current process with the proper error info,
>> -     * -EOPNOTSUPP means hwpoison_filter() filtered the error event,
>> -     *
>> -     * In both cases, no further processing is required.
>> -     */
>>       if (ret == -EHWPOISON || ret == -EOPNOTSUPP)
>>           return;
>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>> index a7b8ccd29b6f..14c316d7d38d 100644
>> --- a/mm/memory-failure.c
>> +++ b/mm/memory-failure.c
>> @@ -2211,9 +2211,13 @@ static void kill_procs_now(struct page *p, unsigned long pfn, int flags,
>>    * Must run in process context (e.g. a work queue) with interrupts
>>    * enabled and no spinlocks held.
>>    *
>> - * Return: 0 for successfully handled the memory error,
>> - *         -EOPNOTSUPP for hwpoison_filter() filtered the error event,
>> - *         < 0(except -EOPNOTSUPP) on failure.
>> + * Return:
>> + *   0             - success,
>> + *   -ENXIO        - memory not managed by the kernel
>> + *   -EOPNOTSUPP   - hwpoison_filter() filtered the error event,
>> + *   -EHWPOISON    - the page was already poisoned, potentially
>> + *                   kill process,
>> + *   other negative values - failure.
>>    */
>>   int memory_failure(unsigned long pfn, int flags)
>>   {
> 
> Looks good.
> 
> Reviewed-by: Jane Chu <jane.chu@oracle.com>
> 
> -jane


Thanks.

Best Regards,
Shuai

