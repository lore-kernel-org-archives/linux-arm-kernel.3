Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC32C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 01:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r+5WkyUwaatx2CtpLzuZtA6tB6jLB9WVQM6cMSk/Qs=; b=cuyvhSEg2jRyjUKOfOSMFC7IG3
	u2nJvUTq9vDyH43HZ9fKRIoW2krduYhM/eGyQ6Y4hdundRPKTC6M/OkXaHk4KLeIdYc+FNM/MLbVj
	KNkn2nBUAkX3uQ09SEbAYyFkbXUo6GZM8tm/zfYo/l/ZnDXrUiH9Zv/ETTzNiBG6CV1qpkHhibbRE
	9x/YmS+Qw8L5+jsjkbmsDsywDYR0pbeVR60r2DgJAorvaWD8D7N+uLjGT2aVFJY2wu4f/6a0PNeBc
	RggoallslvQ1F5YCw9tVeRlyplbdKozp6bHsQDO6IHJzz571esSFSLz+xLH2NsLypEHVgJqwl5wIn
	dOlz/D7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpUY-00000009QJd-1iks;
	Fri, 28 Feb 2025 01:48:42 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpSx-00000009Q9Z-1X51
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 01:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740707207; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	bh=5r+5WkyUwaatx2CtpLzuZtA6tB6jLB9WVQM6cMSk/Qs=;
	b=fnhiRIOB5XSm7gk7rr+pVLGCzBje657X8XQTBGra49k/mpzlI7a/xPVzSrxwSuJi2u9DCcDHsJz7nGMm1fkhJ8TFKb9BOKQ5EEaHKZNs2mZgPnNEcpIM/Q5BJks9iB85sJoTfX/NBxMmVRlZE14x/vuQqYuZP04H3WdibLVcm44=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQNqCdH_1740707191 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Feb 2025 09:46:33 +0800
Message-ID: <0c93542f-4521-41bc-a030-5b2d8621aa6a@linux.alibaba.com>
Date: Fri, 28 Feb 2025 09:46:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v18 2/3] mm: memory-failure: move return value
 documentation to function declaration
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: yazen.ghannam@amd.com, mark.rutland@arm.com, mingo@redhat.com,
 robin.murphy@arm.com, Jonathan.Cameron@huawei.com, bp@alien8.de,
 rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com,
 tony.luck@intel.com, linmiaohe@huawei.com, naoya.horiguchi@nec.com,
 james.morse@arm.com, tongtiangen@huawei.com, gregkh@linuxfoundation.org,
 will@kernel.org, jarkko@kernel.org, linux-acpi@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
 ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com,
 baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com
References: <20250107081735.16159-1-xueshuai@linux.alibaba.com>
 <20250107081735.16159-3-xueshuai@linux.alibaba.com>
 <Z8BbFRupgknBTvH8@arm.com>
In-Reply-To: <Z8BbFRupgknBTvH8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_174705_559471_94043A9D 
X-CRM114-Status: GOOD (  15.82  )
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



在 2025/2/27 20:31, Catalin Marinas 写道:
> (going through patches in my inbox)
> 
> On Tue, Jan 07, 2025 at 04:17:34PM +0800, Shuai Xue wrote:
>> Part of return value comments for memory_failure() were originally
>> documented at the call site. Move those comments to the function
>> declaration to improve code readability and to provide developers with
> 
> s/declaration/definition/

Thanks, will fix.

> 
>> immediate access to function usage and return information.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
>> Reviewed-by: Jane Chu <jane.chu@oracle.com>
>> ---
>>   arch/x86/kernel/cpu/mce/core.c |  7 -------
>>   mm/memory-failure.c            | 10 +++++++---
>>   2 files changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
>> index 7fb5556a0b53..d1dd7f892514 100644
>> --- a/arch/x86/kernel/cpu/mce/core.c
>> +++ b/arch/x86/kernel/cpu/mce/core.c
>> @@ -1398,13 +1398,6 @@ static void kill_me_maybe(struct callback_head *cb)
>>   		return;
>>   	}
>>   
>> -	/*
>> -	 * -EHWPOISON from memory_failure() means that it already sent SIGBUS
>> -	 * to the current process with the proper error info,
>> -	 * -EOPNOTSUPP means hwpoison_filter() filtered the error event,
>> -	 *
>> -	 * In both cases, no further processing is required.
>> -	 */
>>   	if (ret == -EHWPOISON || ret == -EOPNOTSUPP)
>>   		return;
>>   
>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>> index a7b8ccd29b6f..14c316d7d38d 100644
>> --- a/mm/memory-failure.c
>> +++ b/mm/memory-failure.c
>> @@ -2211,9 +2211,13 @@ static void kill_procs_now(struct page *p, unsigned long pfn, int flags,
>>    * Must run in process context (e.g. a work queue) with interrupts
>>    * enabled and no spinlocks held.
>>    *
>> - * Return: 0 for successfully handled the memory error,
>> - *         -EOPNOTSUPP for hwpoison_filter() filtered the error event,
>> - *         < 0(except -EOPNOTSUPP) on failure.
>> + * Return:
>> + *   0             - success,
>> + *   -ENXIO        - memory not managed by the kernel
>> + *   -EOPNOTSUPP   - hwpoison_filter() filtered the error event,
>> + *   -EHWPOISON    - the page was already poisoned, potentially
>> + *                   kill process,
>> + *   other negative values - failure.
>>    */
>>   int memory_failure(unsigned long pfn, int flags)
>>   {
> 
> Why not keep the comment in both places? One is about the x86 decisions,
> the other is about what memory_failure() can return.
> 

Ok, will keep x86 path.

By the way, could arm maintainers help to ack patch 1 and 3 if there
is no objection?

Thanks.
Shuai


