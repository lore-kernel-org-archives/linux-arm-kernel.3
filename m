Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA20C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klYtEhovmTlwcYguIPBeU+Xf5MWQCBo4CKfTOLBIQKA=; b=29r1OVGL3w1WEbv17VosKRrUbS
	rpFS8kRdC2H3ZQCPDD+JwGgjZkpoxgA+ooa2OTbovveZJLv4pxR9lSG0ecnuIhtQSrzeM4XPJBFfV
	bVjdayIAVdzUi3wHklZqKP7KQ5P0ToXvOR+uNqxkcwuLHPOolSnxc8e/f2++f0hAar/ngFgthme+i
	aoCalI2wWdNabBI9sr2sXUBFq40UpEB7qgz5qRDmmhdQtjIoYDvLOmKvr4t5iySgX8ObBZoo2YDAZ
	8TW3R1ZZx7fj+XM1jUNpqXkzjVzG9vB4scy4yswe1oHYcoMpEqAcZFoHDcPjEC/KbIXGqtrfDMVMO
	S2r57f2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z31-0000000EZgB-11ff;
	Thu, 24 Apr 2025 16:03:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ulm-0000000DrLb-45DM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:29:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D84C11063;
	Thu, 24 Apr 2025 04:29:24 -0700 (PDT)
Received: from [10.163.49.106] (unknown [10.163.49.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9C223F59E;
	Thu, 24 Apr 2025 04:29:23 -0700 (PDT)
Message-ID: <b002574d-e993-4b06-87f7-54bd01dfa500@arm.com>
Date: Thu, 24 Apr 2025 16:59:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to
 cs_etm PMU
To: Yabin Cui <yabinc@google.com>, Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
References: <20250421215818.3800081-1-yabinc@google.com>
 <20250421215818.3800081-3-yabinc@google.com>
 <20250422142102.GI28953@e132581.arm.com>
 <CALJ9ZPNKZU7nVLyodN5i7GeRxWL6KzkXnqEJMv2sJkk2SwYi9Q@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CALJ9ZPNKZU7nVLyodN5i7GeRxWL6KzkXnqEJMv2sJkk2SwYi9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_042931_098227_FDBA7B4E 
X-CRM114-Status: GOOD (  18.74  )
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



On 4/24/25 01:31, Yabin Cui wrote:
> On Tue, Apr 22, 2025 at 7:21 AM Leo Yan <leo.yan@arm.com> wrote:
>>
>> On Mon, Apr 21, 2025 at 02:58:18PM -0700, Yabin Cui wrote:
>>> The cs_etm PMU, regardless of the underlying trace sink (ETF, ETR or
>>> TRBE), doesn't require contiguous pages for its AUX buffer.
>>
>> Though contiguous pages are not mandatory for TRBE, I would set the
>> PERF_PMU_CAP_AUX_NO_SG flag for it.  This can potentially benefit
>> performance.
> 
> As explained in the patch 1/2, my use case periodically collects ETM data
> from the field (using both TRBE and ETR), and needs to reduce memory
> fragmentation. If the performance impact is big, we can make it user
> configurable. Otherwise, shall we default it to non-contiguous pages?

But is not that already happening ? cs_etm does not set the PMU cap
PERF_PMU_CAP_AUX_NO_SG that means it can allocate non-contig memory
chunk. Where am I missing ?

> 
>>
>> For non per CPU sinks, it is fine to allocate non-contiguous pages.
>>
>> Thanks,
>> Leo
>>
>>> This patch adds the PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES capability
>>> to the cs_etm PMU. This allows the kernel to allocate non-contiguous
>>> pages for the AUX buffer, reducing memory fragmentation when using
>>> cs_etm.
>>>
>>> Signed-off-by: Yabin Cui <yabinc@google.com>
>>> ---
>>>  drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>> index f4cccd68e625..c98646eca7f8 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>> @@ -899,7 +899,8 @@ int __init etm_perf_init(void)
>>>       int ret;
>>>
>>>       etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
>>> -                                        PERF_PMU_CAP_ITRACE);
>>> +                                        PERF_PMU_CAP_ITRACE |
>>> +                                        PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES);
>>>
>>>       etm_pmu.attr_groups             = etm_pmu_attr_groups;
>>>       etm_pmu.task_ctx_nr             = perf_sw_context;
>>> --
>>> 2.49.0.805.g082f7c87e0-goog
>>>
>>>
> 

