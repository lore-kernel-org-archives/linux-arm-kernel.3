Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDD8CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFRmJMq03VS3SgNxxQwHz5y0HJTqeQOU3DUVE68uXK8=; b=2I5XNnNDFEYjD59sVl05CPvTPG
	WRCgmWbV1ceZm05BUmGHQWOEL0NiqM3Xk3co6tkW5hZMgydldPUUHjC5qU6gyk1m/wnSqX9TgjuxD
	vcWO4H3F/wAmWqhqcIDKjzIdORJD8AU5lbw5XT/0YnNcoI5br9wXem2fl7TKCjPxTwJdMB15ydlPq
	cO4paSbjJPyRXCmyT8kCovP2e4zvosdXVsKcTKOJTgIg2v+J8CLFXipwUHxi5y+5HnORV/eNxPt09
	yYWHmeGPNoV5qt9NJ5XOL0QezjE7FoQNf7fijwsg4XmG/N1O0Cjt01b62866PnS3Y6mMDqx4JAkVa
	QcCjjpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIZB-00000006FJx-1dh4;
	Fri, 08 May 2026 10:36:21 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIZ8-00000006FIi-1jfd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 10:36:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JFRmJMq03VS3SgNxxQwHz5y0HJTqeQOU3DUVE68uXK8=;
	b=4eIXFaO2etyh2TEThCnYd0jP/eQK0tGc2YxMIy54WJMty5J7Fde7RpQR9L/VjMvbGQEIyWVFb
	ieStq3os3ZmeSlINoX20fMelCAnz+DZyP/9kq31ZdLB5lyJYrxXhjtYXFrPOQ1XlavcOp3FkMyB
	K1ese5PrpOfT/Noog0s6zzA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gBlhp4bYKzcb3j;
	Fri,  8 May 2026 18:28:58 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id DBEF640561;
	Fri,  8 May 2026 18:36:10 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 May 2026 18:36:10 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 8 May 2026 18:36:09 +0800
Message-ID: <55be95ff-2aaf-4223-8d6f-20426ef3525e@huawei.com>
Date: Fri, 8 May 2026 18:36:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yushan Wang <wangyushan12@huawei.com>
Subject: Re: [RFT PATCH v2 5/7] perf-iostat: Extend iostat interface to
 support different iostat PMUs
To: Ian Rogers <irogers@google.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<adrian.hunter@intel.com>, <james.clark@arm.com>, <john.g.garry@oracle.com>,
	<will@kernel.org>, <mike.leach@arm.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jic23@kernel.org>, <leo.yan@linux.dev>, <robin.murphy@arm.com>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
References: <20260507063737.3542950-1-wangyushan12@huawei.com>
 <20260507063737.3542950-6-wangyushan12@huawei.com>
 <CAP-5=fW592tmsKW8WqMPodWzq2JKO5G4nHDy7LKo8PCD2RMZ1Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAP-5=fW592tmsKW8WqMPodWzq2JKO5G4nHDy7LKo8PCD2RMZ1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_033618_753137_CE038F02 
X-CRM114-Status: GOOD (  26.23  )
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

On 5/7/2026 11:47 PM, Ian Rogers wrote:
> On Wed, May 6, 2026 at 11:37 PM Yushan Wang <wangyushan12@huawei.com> wrote:
>>
>> From: Shiju Jose <shiju.jose@huawei.com>
>>
>> Currently, platform-specific iostat code for PMUs is implemented as a
>> common iostat callback interface and linked during build. This approach
>> limits support for iostat across different implementations of PMU of the
>> same architecture.
>>
>> To address this, extend common iostat interface to provide support for
>> different PMUs by allowing each PMU to register itself and receive
>> callbacks to its PMU-specific functions through the unified iostat
>> framework.
>>
>> Signed-off-by: Shiju Jose  <shiju.jose@huawei.com>
>> Co-developed-by: Yushan Wang <wangyushan12@huawei.com>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>  tools/perf/util/iostat.c | 88 ++++++++++++++++++++++++++++++----------
>>  tools/perf/util/iostat.h | 38 ++++++++++++++++-
>>  2 files changed, 102 insertions(+), 24 deletions(-)
>>
>> diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
>> index a68ab100780d..90607d1cf3fa 100644
>> --- a/tools/perf/util/iostat.c
>> +++ b/tools/perf/util/iostat.c
>> @@ -1,47 +1,91 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #include "util/iostat.h"
>> -#include "util/debug.h"
>> +
>> +/*
>> + * Below iostat_* function calls are scattered through out perf stat process,
>> + * allowing multiple iostat PMUs and iterated them in following functions may
>> + * violate calling conventions or cause incorrect display.
>> + *
>> + * Default to register the first PMU device that matches any of the specified
>> + * iostat pmu name wildcards.
>> + */
>> +static struct iostat_pmu *iostat_pmu;
>
> Could there be more than set of printing functions?

At the second thought, to support cross-platform iostat, multiple printing
function should be supported, otherwise interpreting dumped perf.data from
another architecture may just not work.

This may require some more changes to the embedded iostat function calls, I can
try to add that support in the next version, thanks for pointing out!

>
>>  enum iostat_mode_t iostat_mode = IOSTAT_NONE;
>>
>> -__weak int iostat_prepare(struct evlist *evlist __maybe_unused,
>> -                         struct perf_stat_config *config __maybe_unused)
>> +__weak int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
>
> Eww.. weak.

These __weak symbols are added to avoid confliction with existing x86 iostat
implementations, and are removed in patch 6.

>

[...]

>>
>> -__weak void iostat_print_counters(struct evlist *evlist __maybe_unused,
>> -                                 struct perf_stat_config *config __maybe_unused,
>> -                                 struct timespec *ts __maybe_unused,
>> -                                 char *prefix __maybe_unused,
>> -                                 iostat_print_counter_t print_cnt_cb __maybe_unused,
>> -                                 void *arg __maybe_unused)
>> +__attribute__((destructor))
>
> I don't believe using this attribute is standard in either perf or the kernel.

Sorry, I will fix that with explict calls to constructors and destructors.

>
>> +static void iostat_exit(void)
>>  {
>> +       unregister_iostat_pmu();
>>  }
>> diff --git a/tools/perf/util/iostat.h b/tools/perf/util/iostat.h
>> index 820930a096d9..5cc8963c6122 100644
>> --- a/tools/perf/util/iostat.h
>> +++ b/tools/perf/util/iostat.h
>> @@ -10,6 +10,7 @@
>>  #ifndef _IOSTAT_H
>>  #define _IOSTAT_H
>>
>> +#include <stdbool.h>
>>  #include <subcmd/parse-options.h>
>>  #include "util/stat.h"
>>  #include "util/parse-events.h"
>> @@ -31,8 +32,7 @@ extern enum iostat_mode_t iostat_mode;
>>  typedef void (*iostat_print_counter_t)(struct perf_stat_config *, struct evsel *, void *);
>>
>>  int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config);
>> -int iostat_parse(const struct option *opt, const char *str,
>> -                int unset __maybe_unused);
>> +int iostat_parse(const struct option *opt, const char *str, int unset);
>>  void iostat_list(struct evlist *evlist, struct perf_stat_config *config);
>>  void iostat_release(struct evlist *evlist);
>>  void iostat_print_header_prefix(struct perf_stat_config *config);
>> @@ -42,4 +42,38 @@ void iostat_print_counters(struct evlist *evlist,
>>                            struct perf_stat_config *config, struct timespec *ts,
>>                            char *prefix, iostat_print_counter_t print_cnt_cb, void *arg);
>>
>> +/**
>> + * struct iostat_pmu - Callbacks for an iostat-capable PMU backend.
>> + * @pmu_name_wildcard: Glob pattern to identify the PMU (e.g. "uncore_iio*").
>> + * @match: Detect whether matching PMUs exist on this system.
>> + * @prepare: Set up events and config for iostat collection.
>> + * @parse: Parse the --iostat option argument.
>> + * @list: Display available iostat PMU instances.
>> + * @print_header_prefix: Print the column header prefix.
>> + * @print_metric: Format and print one metric value.
>> + * @print_counters:  Iterate over counters and print per-port results.
>> + * @release: Clean up PMU-specific resources.
>> + */
>> +struct iostat_pmu {
>
> I wonder if iostat_pmu is the best name here, perhaps
> iostat_callbacks? It would be nice not to overload the term PMU in the
> code with regular PMUs and the iostat PMUs.

Yes. iostat_backend or iostat_handlers may be more specific. I'll change that in
the next version

>
> Thanks,
> Ian

Thank you for review!
Yushan

>

[...]


