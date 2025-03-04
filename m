Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9087C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Or6915/NnAJjQb/W0dagoIHAx1/PparfHkKA12320IU=; b=aq52ss3czGt/GaDAxXFrJ0+HKV
	h0XDzKitk1YLyq60PpZ2aa21ccWjcBDusqkXasLyawmuZ31bVBRsG6AgRPXfhPJZWxKMMDkV1TDs8
	bhbdw7bpz/2LwRrcp+JUSI7n27qdpwzRloR8axnCZvgEHsV9DfciMGjvh2XxcqSVih30p2xik0oiH
	Z9tWxjbiHUDLKlUJg49txFUcXeXeRrYNUyBhED/bJCsPwu4fPk3+0BJwpxriezRpMBVUqKBZGgdky
	zqyTgijStOJlHd3nntvPd3jpj7DTXD1EBflTmLBg4f6flKl9E3xebfMpKYD8UkdQYkJ9/GtASKQDf
	mrmwX75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcb-00000004Awy-3wdV;
	Tue, 04 Mar 2025 10:35:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPFv-000000044aq-16yT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:12:09 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z6Wd1111qz6D8xW;
	Tue,  4 Mar 2025 18:09:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A3AF140D1D;
	Tue,  4 Mar 2025 18:11:53 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Mar
 2025 11:11:50 +0100
Date: Tue, 4 Mar 2025 18:11:46 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 6/9] drivers/perf: hisi: Relax the event number check of
 v2 PMUs
Message-ID: <20250304181146.000042b3@huawei.com>
In-Reply-To: <20250218092000.41641-7-yangyicong@huawei.com>
References: <20250218092000.41641-1-yangyicong@huawei.com>
	<20250218092000.41641-7-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_021207_597849_BAF5C8EC 
X-CRM114-Status: GOOD (  21.83  )
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

On Tue, 18 Feb 2025 17:19:57 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Junhao He <hejunhao3@huawei.com>
> 
> The supported event number range of each Uncore PMUs is provided by
> each driver in hisi_pmu::check_event and out of range events
> will be rejected. A later version with expanded event number range
> needs to register the PMU with updated hisi_pmu::check_event
> even if it's the only update, which means the expanded events
> cannot be used unless the driver's updated. However the unsupported
> events won't be counted by the hardware so we can relax the event
> number check to allow the use the expanded events.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 2 +-
>  drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 7 +++----
>  drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 2 +-
>  drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 3 +--
>  4 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
> index 26eaa6d20c00..21c494881ca0 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
> @@ -53,7 +53,7 @@
>  #define DDRC_V1_PERF_CTRL_EN	0x2
>  #define DDRC_V2_PERF_CTRL_EN	0x1
>  #define DDRC_V1_NR_EVENTS	0x7
> -#define DDRC_V2_NR_EVENTS	0x90
> +#define DDRC_V2_NR_EVENTS	0xFF
>  
>  #define DDRC_EVENT_CNTn(base, n)	((base) + (n) * 8)
>  #define DDRC_EVENT_TYPEn(base, n)	((base) + (n) * 4)
> diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> index ca609db86046..78cd6d67f209 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> @@ -47,9 +47,8 @@
>  #define HHA_SRCID_CMD		GENMASK(16, 6)
>  #define HHA_SRCID_MSK		GENMASK(30, 20)
>  #define HHA_DATSRC_SKT_EN	BIT(23)
> -#define HHA_EVTYPE_NONE		0xff
> +#define HHA_EVTYPE_MASK		GENMASK(7, 0)
Using something called mask in places where we previously
had something called nr_events seems a little odd.

renaming EVTYPE_NONE to EVTYPE_MASK seems valid given the
useage but I'd have a different define for the number
of events and not make both changes in one patch.

>  #define HHA_V1_NR_EVENT		0x65
> -#define HHA_V2_NR_EVENT		0xCE
>  
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(srcid_cmd, config1, 10, 0);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(srcid_msk, config1, 21, 11);
> @@ -197,7 +196,7 @@ static void hisi_hha_pmu_write_evtype(struct hisi_pmu *hha_pmu, int idx,
>  
>  	/* Write event code to HHA_EVENT_TYPEx register */
>  	val = readl(hha_pmu->base + reg);
> -	val &= ~(HHA_EVTYPE_NONE << shift);
> +	val &= ~(HHA_EVTYPE_MASK << shift);
>  	val |= (type << shift);
>  	writel(val, hha_pmu->base + reg);
>  }
> @@ -453,7 +452,7 @@ static int hisi_hha_pmu_dev_probe(struct platform_device *pdev,
>  
>  	if (hha_pmu->identifier >= HISI_PMU_V2) {
>  		hha_pmu->counter_bits = 64;
> -		hha_pmu->check_event = HHA_V2_NR_EVENT;
> +		hha_pmu->check_event = HHA_EVTYPE_MASK;
To me this makes little sense.  Should be HHA_MAX_NR_EVENT
or something like that.

>  		hha_pmu->pmu_events.attr_groups = hisi_hha_pmu_v2_attr_groups;
>  		hha_pmu->num_counters = HHA_V2_NR_COUNTERS;
>  	} else {

Jonathan

