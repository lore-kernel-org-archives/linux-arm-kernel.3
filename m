Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B11D61020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPprun4aR90KqpUnWVsp2X14tMNGCdXErOUxb3GK7ZA=; b=SJAm+cO2+k72RrqJYCrLVMe4Dt
	gL1oLVhIus4XdDdrdnOaYSzdlHlKfrNb9EZffCwt0nRP8I2Hesk/rMlpHElWw0ywN+VpP+CpTj4jV
	YLAJy14idQb0/adXpPR/1AKWpJbF41DwLz5sr2yGJ6tzAUGSgP3lf+ZxsY2tCTiPvJ+9XGXM6/5tz
	ybe5KG0CbE+CSnWHS4mcQ7PVMklprmWggjNqoG9tz+/UT8ICAICySe8t5XdRrmGGgxPLrSfUb8tnW
	IpdcPEIIeU2I5a01MPQ5KiXaP4ahWSvyf61upNRgZOhwUgfmtaDmxfrdyV5DQvYfvYl+/dKB0YN8M
	SDtje/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlToY-00000000H6K-0Jyz;
	Thu, 29 Jan 2026 15:20:10 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlToV-00000000H5L-27Vr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:20:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yPprun4aR90KqpUnWVsp2X14tMNGCdXErOUxb3GK7ZA=;
	b=CRxPawUIXau+eXwS1lVvSmkkxONUydluDE8cAS9KTPp2fg/cfjXzXiVs1hrTPxohj63az0jc5
	w145pGxHti+NWh4ypxhZ1JeocsyAVVFXOXAdixMsCD0uBhvO5xv/QcrdFt8NCw6LrsYcYW43x1f
	BhlrQ+ZeAp7wn+2qcwvaejg=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f22mG0VMwzmV6b;
	Thu, 29 Jan 2026 23:16:30 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 714D74048B;
	Thu, 29 Jan 2026 23:19:59 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Jan 2026 23:19:59 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 29 Jan 2026 23:19:58 +0800
Message-ID: <e90f26f2-a966-46a1-a858-d1061a9e19c9@huawei.com>
Date: Thu, 29 Jan 2026 23:19:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 1/7] perf stat: Check color's length instead of the
 pointer
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <peterz@infradead.org>,
	<john.g.garry@oracle.com>, <shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
 <20260126123514.3238425-2-wangyushan12@huawei.com>
 <20260127155835.000011c9@huawei.com>
Content-Language: en-US
From: wangyushan <wangyushan12@huawei.com>
In-Reply-To: <20260127155835.000011c9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_072007_757689_FF6B8F86 
X-CRM114-Status: GOOD (  11.79  )
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



On 1/27/2026 11:58 PM, Jonathan Cameron wrote:
> On Mon, 26 Jan 2026 20:35:08 +0800
> Yushan Wang <wangyushan12@huawei.com> wrote:
>
>> Color string returned by metric_threshold_classify__color() is never
>> NULL, check the presence of *color will always return true.
>>
>> Fix this by change the checks against length of *color.
>>
>> Fixes: 37b77ae95416 ("perf stat: Change color to threshold in print_metric")
>>
> No blank line between tags.
>
> Fixes: 37b77ae95416 ("perf stat: Change color to threshold in print_metric")
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>
> Some of the scripting run against the kernel uses that lack of blank lines
> as a heuristic to identify what is a tag vs other similar looking text.

Thanks for reminding, will fix it in the next version.
> Thanks,
>
> Jonathan
>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>  tools/perf/builtin-script.c    | 2 +-
>>  tools/perf/util/stat-display.c | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
[...]

Thanks!
Yushan

