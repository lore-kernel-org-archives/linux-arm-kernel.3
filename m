Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AAAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94nCs6ZmKrqisw5u9Gie9ERMvwRDFdSUvqy6jGZvHfA=; b=zi8Nob4waffnUPTkfWS22wl42J
	D4u8NTtZkgXhsIuoPvLBczZAKUYZhQ4nNa4TQp6m2EX+Y1EnNzaUISIukEKOaMzYjCsiZ9mDhGaa9
	n9IamKrwTjgemn/7DpERPV+pYgnUDUE9rnv5dQburhQke/US8zMJRsEmTvTqoRBWzLUHWJaZ1fHeQ
	lmTUwrzqD710g4mk+YvSv4XJ5JQ0oee9+FADBJ2cWaN2g2aAB6AG2x18bD5Mz00WtGpYIbXDsddWs
	WQskKmpvYGH+2e5fXvteqNU2+R2Y/BQYRMjiuzW8WhQ6qzmHAYSfsqguoPr8lyZypHFdVuJgl8M4D
	onL9lPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78ZD-00000006DZd-2eRG;
	Tue, 22 Apr 2025 08:01:19 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77q0-000000065Lk-3s6j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:14:39 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZhYPv6dG7z1j5xV;
	Tue, 22 Apr 2025 15:14:11 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 92074140278;
	Tue, 22 Apr 2025 15:14:26 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Apr 2025 15:14:25 +0800
CC: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] perf vendor events arm64: Fill up Desc field for
 Hisi hip08 hha pmu
To: Junhao He <hejunhao3@huawei.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <acme@kernel.org>, <namhyung@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <james.clark@linaro.org>,
	<leo.yan@arm.com>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<mike.leach@linaro.org>, <yangyicong@hisilicon.com>,
	<jonathan.cameron@huawei.com>
References: <20250418070812.3771441-1-hejunhao3@huawei.com>
 <20250418070812.3771441-2-hejunhao3@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <976fceb4-f0fd-eae4-066c-6b77e5adcea9@huawei.com>
Date: Tue, 22 Apr 2025 15:14:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250418070812.3771441-2-hejunhao3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001437_294176_E4EA873A 
X-CRM114-Status: GOOD (  16.39  )
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
> In the same PMU, when some JSON events have the "BriefDescription" field
> populated while others do not, the cmp_sevent() function will split these
> two types of events into separate groups. As a result, when using perf
> list to display events, the two types of events cannot be grouped together
> in the output.
> 
> before patch:
>  $ perf list pmu
>  ...
>  uncore hha:
>    hisi_sccl1_hha2/sdir-hit/
>    hisi_sccl1_hha2/sdir-lookup/
>  ...
>  uncore hha:
>    edir-hit
>       [Count of The number of HHA E-Dir hit operations. Unit: hisi_sccl1_hha2]
>  ...
> 
> after patch:
>  $ perf list pmu
>  ...
>  uncore hha:
>    edir-hit
>       [Count of The number of HHA E-Dir hit operations. Unit: hisi_sccl1_hha2]
>    sdir-hit
>       [Count of The number of HHA S-Dir hit operations. Unit: hisi_sccl1_hha2]
>    sdir-lookup
>       [Count of the number of HHA S-Dir lookup operations. Unit: hisi_sccl1_hha2]
>  ...
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Reviewed-by: James Clark <james.clark@linaro.org>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  .../arch/arm64/hisilicon/hip08/uncore-hha.json   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> index 9a7ec7af2060..b52f056d0255 100644
> --- a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> +++ b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> @@ -30,15 +30,18 @@
>     {
>  	    "ConfigCode": "0x4",
>  	    "EventName": "rx_wbi",
> +	    "BriefDescription": "Count of the number of WriteBackI operations that HHA has received",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x5",
>  	    "EventName": "rx_wbip",
> +	    "BriefDescription": "Count of the number of WriteBackIPtl operations that HHA has received",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x11",
> +	    "BriefDescription": "Count of the number of WriteThruIStash operations that HHA has received",
>  	    "EventName": "rx_wtistash",
>  	    "Unit": "hisi_sccl,hha"
>     },
> @@ -87,66 +90,79 @@
>     {
>  	    "ConfigCode": "0x23",
>  	    "EventName": "bi_num",
> +	    "BriefDescription": "Count of the number of HHA BackInvalid operations",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x32",
>  	    "EventName": "mediated_num",
> +	    "BriefDescription": "Count of the number of Mediated operations that the HHA has forwarded",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x33",
>  	    "EventName": "tx_snp_num",
> +	    "BriefDescription": "Count of the number of Snoop operations that the HHA has sent",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x34",
>  	    "EventName": "tx_snp_outer",
> +	    "BriefDescription": "Count of the number of Snoop operations that the HHA has sent to another socket",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x35",
>  	    "EventName": "tx_snp_ccix",
> +	    "BriefDescription": "Count of the number of Snoop operations that the HHA has sent to CCIX",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x38",
>  	    "EventName": "rx_snprspdata",
> +	    "BriefDescription": "Count of the number of SnprspData flit operations that HHA has received",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x3c",
>  	    "EventName": "rx_snprsp_outer",
> +	    "BriefDescription": "Count of the number of SnprspData operations that HHA has received from another socket",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x40",
>  	    "EventName": "sdir-lookup",
> +	    "BriefDescription": "Count of the number of HHA S-Dir lookup operations",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x41",
>  	    "EventName": "edir-lookup",
> +	    "BriefDescription": "Count of the number of HHA E-Dir lookup operations",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x42",
>  	    "EventName": "sdir-hit",
> +	    "BriefDescription": "Count of the number of HHA S-Dir hit operations",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x43",
>  	    "EventName": "edir-hit",
> +	    "BriefDescription": "Count of the number of HHA E-Dir hit operations",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x4c",
>  	    "EventName": "sdir-home-migrate",
> +	    "BriefDescription": "Count of the number of HHA S-Dir read home migrate operations",
>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x4d",
>  	    "EventName": "edir-home-migrate",
> +	    "BriefDescription": "Count of the number of HHA E-Dir read home migrate operations",
>  	    "Unit": "hisi_sccl,hha"
>     }
>  ]
> 

