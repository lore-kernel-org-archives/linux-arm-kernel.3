Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D07D2FEE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 20:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ9Ft2CaIACN+o82o2+7Ae0BQcTFJZbQnncad82auSU=; b=Aq76Nn3lUxhvlkqFq+YFfC3m55
	oO9ad4qMAseg6bN2VfuKvMRgSbaLpx8H/ezcqYTlYcmGtdp4pOiY+PssYTjBlR4SgexShOlwBEUox
	GwPVT4oZQg650PulHZzaiaZJ4DZuGtC8Gox7UdtoPiAPvBKRHlRKR6RMl3U2UgOVp9SOeaDezr9Lo
	623+QOiGdvJy5Mi/y19eEYVZuTozWv2R93JIJfExNjxRs5C0JolU57svwo0REPQ2RM8J/Di9ZqxdG
	10Lk3dpMXO11BXqynpoxjguE9NvpEU6+BAxMJs6/7V9mjckeNeqkxapSST84pNSGfMCyWod6mavEN
	OfTaOCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpyP-0000000F1mN-2mIS;
	Tue, 27 Jan 2026 20:47:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpyN-0000000F1mG-47eZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 20:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YQ9Ft2CaIACN+o82o2+7Ae0BQcTFJZbQnncad82auSU=; b=DlndefuewtRJOYsgUO3pVvYShA
	03WOUkzeJrDtBPvlhe1lSUY6fHf/7HwsyQEItLDwDG1FwBxKnZuKankWIXocPqIbbl0YcOK7KQRLm
	mWJLgqE3jCja4ZASw+QKZPonskYBtjcaS22mQYrgmQuzxnezjZVQZkeHr7gLyuhsB99q2ZvWHjYNt
	zzalN8WTmTCPb73jhkW+r1eIy8KkhRDtOdNCm1fHx4huSUxwdi3f2RFN2AYXyClJkXEyUvo6vOFd2
	v8Ei0ktwMJ8NS37fxjtMau71YzyZnFjtOpZtD+MeiK2EgAwFIkSx6gLYMkVpsoQ1X6t+E4hCyr9Ie
	zliUn3Qg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpyK-00000007bGQ-2RGp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 20:47:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C4351515;
	Tue, 27 Jan 2026 12:47:28 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B9943F5CA;
	Tue, 27 Jan 2026 12:47:33 -0800 (PST)
Message-ID: <5aea412c-9c7f-4692-af3e-79937956ef8c@arm.com>
Date: Tue, 27 Jan 2026 20:47:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] kselftests/resctrl: Add support for CAT test on
 ARM
To: Shaopeng Tan <tan.shaopeng@fujitsu.com>, fenghuay@nvidia.com,
 reinette.chatre@intel.com, james.morse@arm.com, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <20260123044034.141247-6-tan.shaopeng@fujitsu.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260123044034.141247-6-tan.shaopeng@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_204736_913855_BDA6009B 
X-CRM114-Status: GOOD (  15.02  )
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

Hi Shaopeng,

On 1/23/26 04:40, Shaopeng Tan wrote:
> Currently, CAT test is limited to Intel architectures.
> Add cache cleaning and enable result checking for Arm architectures.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c | 2 +-
>  tools/testing/selftests/resctrl/fill_buf.c | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index e1b30ab4cef5..58b1590695d1 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -113,7 +113,7 @@ static int check_results(struct resctrl_val_param *param, const char *cache_type
>  		ret = show_results_info(sum_llc_perf_miss, bits,
>  					alloc_size / 64,
>  					MIN_DIFF_PERCENT_PER_BIT * (bits - 1),
> -					runs, get_vendor() == ARCH_INTEL,
> +					runs, (get_vendor() == ARCH_INTEL || get_vendor() == ARCH_ARM),
>  					&prev_avg_llc_val);
>  		if (ret)
>  			fail = 1;
> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> index 19a01a52dc1a..dbbf80d22f42 100644
> --- a/tools/testing/selftests/resctrl/fill_buf.c
> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> @@ -35,6 +35,10 @@ static void cl_flush(void *p)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("clflush (%0)\n\t"
>  		     : : "r"(p) : "memory");
> +#elif defined(__aarch64__)
> +	__asm__ __volatile__("dc civac, %0\n\t"
> +		     : : "r" (p) : "memory");
> +

This is only guaranteed to clean and invalidate to the point of
coherence, PoC. On Grace I expect this is L3/slc and so the cache line
there in L3/slc is likely not invalidated or pushed to DRAM.

The dsb() for synchronization is missing for aarch64 in sb().

>  #endif
>  }
>  

Thanks,

Ben


