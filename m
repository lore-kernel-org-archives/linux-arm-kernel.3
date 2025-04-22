Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFD1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvcteZS3Nd9AGKY01zpet8qStvtwQts0Bk7Y9SgtC0I=; b=d+ds/KANXmtlBwQT5mtFH3U9xg
	s+pJmws3z/cmHLL4EBBPySnEv5b7vpP7/dKRInCKXX2NGSHx47+K94tbknPoeitMi4k299cUHV05d
	szXl+UyZ6FbjB5lNV62y/P0enJjmnIQGJnrPUVYb1rjdCT/p+JY2WvCE8dNCpEF5cRa0s7yuVdF3S
	dmF1dOwuGcOLCU6pI+oimOWQ8lZ+Uz6pPf0SDnURCnuvXdG4h8VaUWMayStkY4K6MAqCK51BEYbGk
	/9Z//2zSLHjdOTjHfRCLOCns8OgHE3wCavmHQGzQXjafqIDcQ4O8VWH1LiZOSeVtgPhjajVBhmTXK
	NKkdatvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78b3-00000006E0V-1UHS;
	Tue, 22 Apr 2025 08:03:13 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77qo-000000065TL-3d3B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:15:29 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZhYS50dy7z27hJM;
	Tue, 22 Apr 2025 15:16:05 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 171CB140257;
	Tue, 22 Apr 2025 15:15:22 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Apr 2025 15:15:21 +0800
CC: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] perf vendor events arm64: Drop hip08
 PublicDescription if same as BriefDescription
To: Junhao He <hejunhao3@huawei.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <acme@kernel.org>, <namhyung@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <james.clark@linaro.org>,
	<leo.yan@arm.com>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<mike.leach@linaro.org>, <yangyicong@hisilicon.com>,
	<jonathan.cameron@huawei.com>
References: <20250418070812.3771441-1-hejunhao3@huawei.com>
 <20250418070812.3771441-3-hejunhao3@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a40b18ef-2d86-f3b9-6143-8d74a63b4141@huawei.com>
Date: Tue, 22 Apr 2025 15:15:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250418070812.3771441-3-hejunhao3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001527_242539_8A6E67DD 
X-CRM114-Status: GOOD (  16.55  )
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

On 2025/4/18 15:08, Junhao He wrote:
> If BriefDescription and PublicDescription are the same, only
> BriefDescription is needed. It will be used for both long and
> short format outputs.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  .../arch/arm64/hisilicon/hip08/uncore-ddrc.json     |  8 --------
>  .../arch/arm64/hisilicon/hip08/uncore-hha.json      | 10 ----------
>  .../arch/arm64/hisilicon/hip08/uncore-l3c.json      | 13 -------------
>  3 files changed, 31 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-ddrc.json b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-ddrc.json
> index 2b3cb55df288..014454d78293 100644
> --- a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-ddrc.json
> +++ b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-ddrc.json
> @@ -3,56 +3,48 @@
>  	    "ConfigCode": "0x00",
>  	    "EventName": "flux_wr",
>  	    "BriefDescription": "DDRC total write operations",
> -	    "PublicDescription": "DDRC total write operations",
>  	    "Unit": "hisi_sccl,ddrc"
>     },
>     {
>  	    "ConfigCode": "0x01",
>  	    "EventName": "flux_rd",
>  	    "BriefDescription": "DDRC total read operations",
> -	    "PublicDescription": "DDRC total read operations",
>  	    "Unit": "hisi_sccl,ddrc"
>     },
>     {
>  	    "ConfigCode": "0x02",
>  	    "EventName": "flux_wcmd",
>  	    "BriefDescription": "DDRC write commands",
> -	    "PublicDescription": "DDRC write commands",
>  	    "Unit": "hisi_sccl,ddrc"
>     },
>     {
>  	    "ConfigCode": "0x03",
>  	    "EventName": "flux_rcmd",
>  	    "BriefDescription": "DDRC read commands",
> -	    "PublicDescription": "DDRC read commands",
>  	    "Unit": "hisi_sccl,ddrc"
>     },
>     {
>  	    "ConfigCode": "0x04",
>  	    "EventName": "pre_cmd",
>  	    "BriefDescription": "DDRC precharge commands",
> -	    "PublicDescription": "DDRC precharge commands",
>  	    "Unit": "hisi_sccl,ddrc"
>     },
>     {
>  	    "ConfigCode": "0x05",
>  	    "EventName": "act_cmd",
>  	    "BriefDescription": "DDRC active commands",
> -	    "PublicDescription": "DDRC active commands",
>  	    "Unit": "hisi_sccl,ddrc"
>     },
>     {
>  	    "ConfigCode": "0x06",
>  	    "EventName": "rnk_chg",
>  	    "BriefDescription": "DDRC rank commands",
> -	    "PublicDescription": "DDRC rank commands",
>  	    "Unit": "hisi_sccl,ddrc"
>     },
>     {
>  	    "ConfigCode": "0x07",
>  	    "EventName": "rw_chg",
>  	    "BriefDescription": "DDRC read and write changes",
> -	    "PublicDescription": "DDRC read and write changes",
>  	    "Unit": "hisi_sccl,ddrc"
>     }
>  ]
> diff --git a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> index b52f056d0255..b2b895fa670e 100644
> --- a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> +++ b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> @@ -3,28 +3,24 @@
>  	    "ConfigCode": "0x00",
>  	    "EventName": "rx_ops_num",
>  	    "BriefDescription": "The number of all operations received by the HHA",
> -	    "PublicDescription": "The number of all operations received by the HHA",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x01",
>  	    "EventName": "rx_outer",
>  	    "BriefDescription": "The number of all operations received by the HHA from another socket",
> -	    "PublicDescription": "The number of all operations received by the HHA from another socket",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x02",
>  	    "EventName": "rx_sccl",
>  	    "BriefDescription": "The number of all operations received by the HHA from another SCCL in this socket",
> -	    "PublicDescription": "The number of all operations received by the HHA from another SCCL in this socket",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x03",
>  	    "EventName": "rx_ccix",
>  	    "BriefDescription": "Count of the number of operations that HHA has received from CCIX",
> -	    "PublicDescription": "Count of the number of operations that HHA has received from CCIX",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
> @@ -49,42 +45,36 @@
>  	    "ConfigCode": "0x1c",
>  	    "EventName": "rd_ddr_64b",
>  	    "BriefDescription": "The number of read operations sent by HHA to DDRC which size is 64 bytes",
> -	    "PublicDescription": "The number of read operations sent by HHA to DDRC which size is 64bytes",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x1d",
>  	    "EventName": "wr_ddr_64b",
>  	    "BriefDescription": "The number of write operations sent by HHA to DDRC which size is 64 bytes",
> -	    "PublicDescription": "The number of write operations sent by HHA to DDRC which size is 64 bytes",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x1e",
>  	    "EventName": "rd_ddr_128b",
>  	    "BriefDescription": "The number of read operations sent by HHA to DDRC which size is 128 bytes",
> -	    "PublicDescription": "The number of read operations sent by HHA to DDRC which size is 128 bytes",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x1f",
>  	    "EventName": "wr_ddr_128b",
>  	    "BriefDescription": "The number of write operations sent by HHA to DDRC which size is 128 bytes",
> -	    "PublicDescription": "The number of write operations sent by HHA to DDRC which size is 128 bytes",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x20",
>  	    "EventName": "spill_num",
>  	    "BriefDescription": "Count of the number of spill operations that the HHA has sent",
> -	    "PublicDescription": "Count of the number of spill operations that the HHA has sent",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x21",
>  	    "EventName": "spill_success",
>  	    "BriefDescription": "Count of the number of successful spill operations that the HHA has sent",
> -	    "PublicDescription": "Count of the number of successful spill operations that the HHA has sent",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
> diff --git a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-l3c.json b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-l3c.json
> index e3479b65be9a..d83c22eb1d15 100644
> --- a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-l3c.json
> +++ b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-l3c.json
> @@ -3,91 +3,78 @@
>  	    "ConfigCode": "0x00",
>  	    "EventName": "rd_cpipe",
>  	    "BriefDescription": "Total read accesses",
> -	    "PublicDescription": "Total read accesses",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x01",
>  	    "EventName": "wr_cpipe",
>  	    "BriefDescription": "Total write accesses",
> -	    "PublicDescription": "Total write accesses",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x02",
>  	    "EventName": "rd_hit_cpipe",
>  	    "BriefDescription": "Total read hits",
> -	    "PublicDescription": "Total read hits",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x03",
>  	    "EventName": "wr_hit_cpipe",
>  	    "BriefDescription": "Total write hits",
> -	    "PublicDescription": "Total write hits",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x04",
>  	    "EventName": "victim_num",
>  	    "BriefDescription": "l3c precharge commands",
> -	    "PublicDescription": "l3c precharge commands",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x20",
>  	    "EventName": "rd_spipe",
>  	    "BriefDescription": "Count of the number of read lines that come from this cluster of CPU core in spipe",
> -	    "PublicDescription": "Count of the number of read lines that come from this cluster of CPU core in spipe",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x21",
>  	    "EventName": "wr_spipe",
>  	    "BriefDescription": "Count of the number of write lines that come from this cluster of CPU core in spipe",
> -	    "PublicDescription": "Count of the number of write lines that come from this cluster of CPU core in spipe",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x22",
>  	    "EventName": "rd_hit_spipe",
>  	    "BriefDescription": "Count of the number of read lines that hits in spipe of this L3C",
> -	    "PublicDescription": "Count of the number of read lines that hits in spipe of this L3C",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x23",
>  	    "EventName": "wr_hit_spipe",
>  	    "BriefDescription": "Count of the number of write lines that hits in spipe of this L3C",
> -	    "PublicDescription": "Count of the number of write lines that hits in spipe of this L3C",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x29",
>  	    "EventName": "back_invalid",
>  	    "BriefDescription": "Count of the number of L3C back invalid operations",
> -	    "PublicDescription": "Count of the number of L3C back invalid operations",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x40",
>  	    "EventName": "retry_cpu",
>  	    "BriefDescription": "Count of the number of retry that L3C suppresses the CPU operations",
> -	    "PublicDescription": "Count of the number of retry that L3C suppresses the CPU operations",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x41",
>  	    "EventName": "retry_ring",
>  	    "BriefDescription": "Count of the number of retry that L3C suppresses the ring operations",
> -	    "PublicDescription": "Count of the number of retry that L3C suppresses the ring operations",
>  	    "Unit": "hisi_sccl,l3c"
>     },
>     {
>  	    "ConfigCode": "0x42",
>  	    "EventName": "prefetch_drop",
>  	    "BriefDescription": "Count of the number of prefetch drops from this L3C",
> -	    "PublicDescription": "Count of the number of prefetch drops from this L3C",
>  	    "Unit": "hisi_sccl,l3c"
>     }
>  ]
> 

