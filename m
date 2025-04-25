Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D97DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bALn/jKpYbd/0B3l2cqRKxcFc/vc3c6Lpg4H+z8VBE=; b=4n9S7CnZFmfJHnAK6172JKQH5p
	exwNUbydnN5OoNMs7D24rUG+KT7mbVps+UkaWjgBLvtNE5t+Iy6pRQWGF8rbPaOSGJ79tUuUEa8lD
	m1rsVQG0FReBBO2NSfSVA2mKFpZSeZbs14erv1dCZ8a+C0jMwikLLcS/GjNky9BqnKppAyiKtsIkL
	21Mpq7nKiyUWNKF6vla5zHgzN6rB5FoJfiLr/lQaL8+SWOnKPDH4ViOVsdWZ07dH5L91E931vu4fQ
	2WLIHSBVhMRCeD3VICLRLjji1HxBcqGTZMZTufO6zJMynEfoKVgIcsAJZvZ+kyGLhaAhEXXcPRpVS
	iI2s3Iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IUD-0000000HAWy-3Tj0;
	Fri, 25 Apr 2025 12:48:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Gtd-0000000GsIh-3CWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:07:07 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZkVKj39nWz6K9Hm;
	Fri, 25 Apr 2025 19:02:17 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 067ED1400D7;
	Fri, 25 Apr 2025 19:06:57 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 25 Apr
 2025 13:06:56 +0200
Date: Fri, 25 Apr 2025 12:06:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Junhao He <hejunhao3@huawei.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <james.clark@linaro.org>, <leo.yan@arm.com>,
	<john.g.garry@oracle.com>, <will@kernel.org>, <mike.leach@linaro.org>,
	<yangyicong@hisilicon.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] perf vendor events arm64: Fill up Desc field for
 Hisi hip08 hha pmu
Message-ID: <20250425120654.00007e4c@huawei.com>
In-Reply-To: <20250418070812.3771441-2-hejunhao3@huawei.com>
References: <20250418070812.3771441-1-hejunhao3@huawei.com>
	<20250418070812.3771441-2-hejunhao3@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040705_952240_CCC823B9 
X-CRM114-Status: GOOD (  11.04  )
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

On Fri, 18 Apr 2025 15:08:10 +0800
Junhao He <hejunhao3@huawei.com> wrote:

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
One trivial comment inline that might be good to tidy up.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>     {
>  	    "ConfigCode": "0x38",
>  	    "EventName": "rx_snprspdata",
> +	    "BriefDescription": "Count of the number of SnprspData flit operations that HHA has received",

Not SnpRspData?  For Snoop Response Data flit ?


>  	    "Unit": "hisi_sccl,hha"
>     },
>     {
>  	    "ConfigCode": "0x3c",
>  	    "EventName": "rx_snprsp_outer",
> +	    "BriefDescription": "Count of the number of SnprspData operations that HHA has received from another socket",

Similar on the capitalization.

>  	    "Unit": "hisi_sccl,hha"
>     },



