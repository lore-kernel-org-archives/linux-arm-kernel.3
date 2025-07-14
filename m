Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CC5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtpQJmuGmlAozb8OB+D24kISWFad5B7gZEyt7muHjt8=; b=EACefk31K1BV0FRqNPxn2leVIC
	4F1rzbG/a+XgQiYhFLNvnvE1m0sygy6aoksT0MN95tmK76oph+dDuvsYlkZ5+lrmGJ6zitsuqRVxZ
	YnSneoh70uNGY8IIa0Xjxj/UMBNUXHI7pA9ihtR7zxcvfxFFNHqBf8dNtu26tFEq+2kUEyym3wbsG
	5yrrSCJfNixzfmmINYcsQj6PMB8VUVporQrehFZYu0ZZcLsmGRp54u7B1eBL5NRwfM6NnjK3uGf/i
	uu1B4ZH+DzedNOS/cCs/xh5tfS0Z9+7mocTNZnAwAtjQCnZVW5ZWFFQYlR1CxPiXPeStUwjuVN/43
	QbrocyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubM6Y-00000002qLM-1eiG;
	Mon, 14 Jul 2025 16:32:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKqE-00000002bax-2L0n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 052F561461;
	Mon, 14 Jul 2025 15:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC507C4CEF0;
	Mon, 14 Jul 2025 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752505901;
	bh=OoveOS18V+H9a1dqKkOQiPA6wT3JMHnInuThtr8wR30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvA8E5fdSyrwQ9Ro7U7nMpZ35yl8CGgsCk6EPpeiKzrgdxLB95qqb0K7KakbkcVGO
	 PNVqgAf6mxILpGxw558Gbc/9SAFw0KKIHAF0OFU9lb2HWwgyq2f3lkx3IoJuPGQ1CH
	 AAAQ4xeCQZWaYZl2mzWSEeOzD1mgU5oSHWiJBDynYirXCBYkxvzqslDuZKL6eNa+F8
	 S2M3IA/WtxSpaSc/qBSBiUYb57UDek3NrziiTzhd6KP27nl8BHPASwu58qOOLn6sir
	 9xsc1eQVdEuClBdcKuU92/cUdOHOmswwJrxV5bgGm/5teTawobMQQkXZYuJTz6mH1c
	 +fqxe1+zcCnaw==
Date: Mon, 14 Jul 2025 16:11:35 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hejunhao3@huawei.com,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, yangyicong@hisilicon.com,
	wangyushan12@huawei.com
Subject: Re: [RESEND PATCH v3 7/8] drivers/perf: hisi: Add support for
 HiSilicon NoC PMU
Message-ID: <aHUeJ1ovziG1rTyW@willie-the-truck>
References: <20250619125557.57372-1-yangyicong@huawei.com>
 <20250619125557.57372-8-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619125557.57372-8-yangyicong@huawei.com>
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

On Thu, Jun 19, 2025 at 08:55:56PM +0800, Yicong Yang wrote:
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
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst  |  11 +
>  drivers/perf/hisilicon/Makefile              |   3 +-
>  drivers/perf/hisilicon/hisi_uncore_noc_pmu.c | 392 +++++++++++++++++++
>  3 files changed, 405 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c

[...]

> +static int hisi_noc_pmu_dev_init(struct platform_device *pdev, struct hisi_pmu *noc_pmu)
> +{
> +	hisi_uncore_pmu_init_topology(noc_pmu, &pdev->dev);
> +
> +	if (noc_pmu->topo.scl_id < 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get scl-id\n");
> +
> +	if (noc_pmu->topo.index_id < 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get idx-id\n");
> +
> +	if (noc_pmu->topo.sub_id < 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get sub-id\n");
> +
> +	noc_pmu->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(noc_pmu->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(noc_pmu->base),
> +				     "fail to remap io memory\n");
> +
> +	noc_pmu->on_cpu = -1;
> +	noc_pmu->dev = &pdev->dev;
> +	noc_pmu->ops = &hisi_uncore_noc_ops;
> +	noc_pmu->pmu_events.attr_groups = hisi_noc_pmu_attr_groups;
> +	noc_pmu->num_counters = NOC_PMU_NR_COUNTERS;
> +	noc_pmu->counter_bits = NOC_PMU_COUNTER_BITS;
> +	noc_pmu->check_event = NOC_PMU_EVENT_CTRL_TYPE;
> +	noc_pmu->identifier = readl(noc_pmu->base + NOC_PMU_VERSION);

Would it be worth going straight to an ACPI-based lookup for this lot?
The earlier patches in the series rework the existing drivers to go in
that direction as it's easier to extend, so it seems a little odd for
new driver code to revert back to e.g. reeading the version number.

Same for the misc node driver in the next patch.

Will

