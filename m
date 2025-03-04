Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C20C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Zg1+yy7jMqKnmLLH02oHvA4wEz2Xw0HKFrMo4jjTs=; b=SdhmGQFuNZp65Do1EsppiSdU7x
	wGAkrKQ/JJD+LLG7GlFwzPZLyB7IYZZUgGZWAN+1h1QwLq028+oMOe1hhcW+80Jsf+Y/NBProS1dI
	accoSE1mea5BcTfRgd3QxyMrb0YcJtNyH7h5XCZ20pOFLF1NO4MLqdesSKz0NmxoOXS1FU7QzGkFj
	FYCrWWGtBETM0iW7LeDavI6dki4SZ65q6b8FNxMKlLeQd/aW8BQq3YeZ9yhb7JfEJvpEzlfeOVZgq
	6XfM9J9l472VTofQSmASAO7UDNVvlNuLk4+mduAWJgicKckWmRuSGrii6AbEoHgqQa+N2B+/t+WuN
	Poh8ZQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcj-00000004BAa-3m2C;
	Tue, 04 Mar 2025 10:35:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPQ5-0000000479d-3p5M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:22:39 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z6WrP6rxjz6M4cP;
	Tue,  4 Mar 2025 18:19:33 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6878D1402C7;
	Tue,  4 Mar 2025 18:22:29 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Mar
 2025 11:22:26 +0100
Date: Tue, 4 Mar 2025 18:22:22 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 8/9] drivers/perf: hisi: Add support for HiSilicon NoC
 PMU
Message-ID: <20250304182222.00006e5a@huawei.com>
In-Reply-To: <20250218092000.41641-9-yangyicong@huawei.com>
References: <20250218092000.41641-1-yangyicong@huawei.com>
	<20250218092000.41641-9-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_022238_238941_5C95DBA1 
X-CRM114-Status: GOOD (  23.25  )
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

On Tue, 18 Feb 2025 17:19:59 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Adds the support for HiSilicon NoC (Network on Chip) PMU which
> will be used to monitor the events on the system bus. The PMU
> device will be named after the SCL ID (either Super CPU cluster
> or Super IO cluster) and the index ID, just similar to other
> HiSilicon Uncore PMUs. Below PMU formats are provided besides
> the event:
> 
> - ch: the transaction channel (data, request, response, etc) which
>   can be used to filter the counting.
> - tt_en: tracetag filtering enable. Just as other HiSilicon Uncore
>   PMUs the NoC PMU supports only counting the transactions with
>   tracetag.
> 
> The NoC PMU doesn't have an interrupt to indicate the overflow.
> However we have a 64 bit counter which is large enough and it's
> nearly impossible to overflow.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
A few minor comments inline.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst  |  11 +
>  drivers/perf/hisilicon/Makefile              |   3 +-
>  drivers/perf/hisilicon/hisi_uncore_noc_pmu.c | 391 +++++++++++++++++++
>  3 files changed, 404 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> 
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> index 48992a0b8e94..d858bd3a8802 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -112,6 +112,17 @@ uring channel. It is 2 bits. Some important codes are as follows:
>  - 2'b00: default value, count the events which sent to the both uring and
>    uring_ext channel;
>  
> +6. ch: NoC PMU supports to filter the event counts of certain transaction
supports filtering the event counts...
> +channel with this option. The current supported channels are as follows:
> +
> +- 3'b010: Request channel
> +- 3'b100: Snoop channel
> +- 3'b110: Response channel
> +- 3'b111: Data channel
> +
> +7. tt_en: NoC PMU supports to only count the transactions with tracetag by

supports counting only transactions that have tracetag set if this option is
set.

> +this option. See the 2nd list for more information about tracetag.
> +


> +static int hisi_noc_pmu_probe(struct platform_device *pdev)
> +{
> +	struct hisi_pmu *noc_pmu;
> +	char *name;
> +	int ret;
> +
> +	noc_pmu = devm_kzalloc(&pdev->dev, sizeof(*noc_pmu), GFP_KERNEL);
Quite a bit of use of &pdev->dev, maybe worth
struct device *dev = &pdev->dev; to shorten all these lines.

> +	if (!noc_pmu)
> +		return -ENOMEM;
> +
> +	/*
> +	 * HiSilicon Uncore PMU framework needs to get common hisi_pmu device
> +	 * by device's drvdata.

from device's drvdata


