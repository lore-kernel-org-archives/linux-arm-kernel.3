Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354FACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISHrh37ZNX1+9L9LNPxqVYIIFEZ+t1IARFN8cjaMQmM=; b=45HSzzE45fWslfCohBhWV+ypdJ
	IPm6mNm0Xlu9mRfFce+aZnlbcroh+0aFtfOgNlCO4y56712NnIQbf4THO89zkrWgpjUVMHqWyAH+9
	ih0ZF37j7XCtdE1dzetDGN8Y0MZjOvtsXk1BUMsFDPtKivA76wuKiC2D7+cTUd5J4mWqVGSv4aGB3
	MZLHCq/sC4cr+R9yOsTOrr5hH0mn2ndfKiQpIdfzro2ow8Woa2E2HDXYW8KFDG/8+4ZhIHKmcXh1C
	gDe0IrMDuc3vK30mRIEUSLXU6yBlk6vD/lGP72EgcQ0vwA+VrBMKKUWj40C4U0Os3Z6NsWC01pdsS
	Q7ArMg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIYa-00000006FBH-0k9g;
	Fri, 08 May 2026 10:35:44 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIYY-00000006FAC-0WYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 10:35:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ISHrh37ZNX1+9L9LNPxqVYIIFEZ+t1IARFN8cjaMQmM=;
	b=mOxln/Cmact+jhCpY+ikLo1lMYkDrsvQuKbvLsmiJPMRsBYutC7/ot9bqZkF2NQxYzmOUuAsA
	pNMCkNu6kpC+2V0KsTbpzdLEl908mMIGuAwmW+O3NouIQPPanIRwXkRkaoRe8UlzIlOY5BiajjV
	yZgUIpNYxmmqdz2jPX3t+/Y=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gBlgp5WsvzLlSC;
	Fri,  8 May 2026 18:28:06 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5FD934055B;
	Fri,  8 May 2026 18:35:40 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 May 2026 18:35:40 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 8 May 2026 18:35:38 +0800
Message-ID: <51c6ea87-7812-4be2-ae1d-0fca29973623@huawei.com>
Date: Fri, 8 May 2026 18:35:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yushan Wang <wangyushan12@huawei.com>
Subject: Re: [RFT PATCH v2 4/7] perf-x86: iostat: Change iostat_prefix() to
 static
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
 <20260507063737.3542950-5-wangyushan12@huawei.com>
 <CAP-5=fUVf-6Xcd+xQBm9FbwbWsUff0PYuH54mrBkLeVyU2cj8Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAP-5=fUVf-6Xcd+xQBm9FbwbWsUff0PYuH54mrBkLeVyU2cj8Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_033542_481884_45D39095 
X-CRM114-Status: GOOD (  10.93  )
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

On 5/7/2026 11:39 PM, Ian Rogers wrote:
> On Wed, May 6, 2026 at 11:37 PM Yushan Wang <wangyushan12@huawei.com> wrote:
>>
>> Change iostat_prefix() to static function, since it is not used outside.
>>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>
> Reviewed-by: Ian Rogers <irogers@google.com>
>
>> ---
>>  tools/perf/util/iostat.c     |  7 ------
>>  tools/perf/util/iostat.h     |  2 --
>>  tools/perf/util/x86-iostat.c | 44 ++++++++++++++++++------------------
>>  3 files changed, 22 insertions(+), 31 deletions(-)
>>
>> diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
>> index b770bd473af7..a68ab100780d 100644
>> --- a/tools/perf/util/iostat.c
>> +++ b/tools/perf/util/iostat.c
>> @@ -37,13 +37,6 @@ __weak void iostat_print_metric(struct perf_stat_config *config __maybe_unused,
>>  {
>>  }
>>
>> -__weak void iostat_prefix(struct evlist *evlist __maybe_unused,
>> -                         struct perf_stat_config *config __maybe_unused,
>> -                         char *prefix __maybe_unused,
>> -                         struct timespec *ts __maybe_unused)
>> -{
>> -}
>> -
>>  __weak void iostat_print_counters(struct evlist *evlist __maybe_unused,
>>                                   struct perf_stat_config *config __maybe_unused,
>>                                   struct timespec *ts __maybe_unused,
>
> This change doesn't remove the weak symbols, but they should go. We
> should use the ELF machine to determine which architecture version to
> use.

The weak symbols are removed in patch 6. Reserving them here keeps this patch
from failing perf build :)

Thanks,
Yushan

>
> Thanks,
> Ian
>

[...]


