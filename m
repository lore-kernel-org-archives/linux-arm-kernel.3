Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44242CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDtp7+4u+gREjQ8ljzVH11TFzpUZV8VMW0swpF2la3Q=; b=xWgm60N/SArwRLtno0NpJisFoJ
	onyivVGBT4AD8kcpXiUPU1rUk/k2La57eSIbDcobwzsjIF7lZMqaSPMTj0JBI3eDKUsNYqW12D/kA
	GYE/4gggXar8qLHPQM3eChncUxp0o1SpkHYcDQmfs9vb53+Kd2vmA/a1vNyTyXg6tDvWi8W4k76RQ
	6/xHxF3iR3Kl419SfdzyBjVZ0c0gWIpTaw7P1lCDMOivBle2efsS12RCggMz3envb2eAej6fOsefU
	GB7WxxGOP3U6ZaS/gLUOotUrASi5IxZtgrtLy3IBbvSIUs0aelA2UriE0lNGdHUcjONlnKgbiKMr+
	N6gpmFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPE-0000000910Z-0lDR;
	Fri, 10 Oct 2025 16:55:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPD-000000090zp-07YF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WDtp7+4u+gREjQ8ljzVH11TFzpUZV8VMW0swpF2la3Q=; b=O5yyX5Sjsfx2llO/sovHZqO5cq
	j4ttPnhokTXEIcvukXQrOQ45alxaYVjGx3ky35PK4JG3GgNfVnApm9rDg3K/Oe0w+hrfFCTPwcqkE
	9F6QnruZoFE6VRs+TVHCj43eRTnAuPsEg2RRwmqfRWjV9lrMCi0Gzmlwj3FtgrL841CH8+i2fu5HI
	4/L9hfEdPjaVbTeh5MZ34Tm0ssvyZuSs7tyQupqjlufOruEErONqr9fHVSSjoWJOte7zTgdZGXQbb
	ZKAbLT/c6MLQjfIRiKnK+0idWDiTs3DwqHvZ0I6nSY3WyHIgG3JVLrOfSFQ7mlhwsxbL27+Tv/8qL
	7Pa6NstQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GP9-00000002JKm-07KV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:55:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A61153B;
	Fri, 10 Oct 2025 09:55:34 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04CF53F66E;
	Fri, 10 Oct 2025 09:55:36 -0700 (PDT)
Message-ID: <9ad2f065-cd13-4b9f-8b56-baa1794f0410@arm.com>
Date: Fri, 10 Oct 2025 17:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/29] ACPI / PPTT: Find cache level by cache-id
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-4-james.morse@arm.com>
 <5607ff12-1445-433a-b9f7-fffe20076be3@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <5607ff12-1445-433a-b9f7-fffe20076be3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175543_518335_0249F3BC 
X-CRM114-Status: GOOD (  17.51  )
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

Hi Fenghua,

On 02/10/2025 05:30, Fenghua Yu wrote:
> On 9/10/25 13:42, James Morse wrote:
>> The MPAM table identifies caches by id. The MPAM driver also wants to know
>> the cache level to determine if the platform is of the shape that can be
>> managed via resctrl. Cacheinfo has this information, but only for CPUs that
>> are online.
>>
>> Waiting for all CPUs to come online is a problem for platforms where
>> CPUs are brought online late by user-space.
>>
>> Add a helper that walks every possible cache, until it finds the one
>> identified by cache-id, then return the level.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
> 
> Other than minor comment issues as follows,
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks,


>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 7af7d62597df..c5f2a51d280b 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -904,3 +904,65 @@ void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t
>> *cpus)
>>                        entry->length);
>>       }
>>   }
>> +
>> +/*
>> + * find_acpi_cache_level_from_id() - Get the level of the specified cache
>> + * @cache_id: The id field of the unified cache
>> + *
>> + * Determine the level relative to any CPU for the unified cache identified by
>> + * cache_id. This allows the property to be found even if the CPUs are offline.
>> + *
>> + * The returned level can be used to group unified caches that are peers.
>> + *
>> + * The PPTT table must be rev 3 or later,

> s/,/./

Yup, already fixed. (I need to clean my glasses more often!)


>> + *
>> + * If one CPUs L2 is shared with another as L3, this function will return
> 
> This comment is not clear. Maybe it's better to say:
> 
> + * If one CPU's L2 is shared with another CPU as L3, this function will return

Sure,


>> + * an unpredictable value.
>> + *
>> + * Return: -ENOENT if the PPTT doesn't exist, the revision isn't supported or
>> + * the cache cannot be found.
>> + * Otherwise returns a value which represents the level of the specified cache.
>> + */


Thanks,

James

