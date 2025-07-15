Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2569C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsLMH+vYsGeXUr3yEqYzRwu74gJT5XhBJq3zmxjDhjg=; b=hwBq/THvAACcz1Iwn1w5GhQu6y
	1d1qBi4HYZ4QLutL9pImIjcoiKnd5zzy/FmtYa8vUH99/LwWPYN8NN9yboQk4N0KQsZ5g/+56Otxh
	2p3pOXdlRrTcYT2REqJZnVfJXmPf4LGr/NyPuqUBxPgw5kTeMYcd2Id/7jkAM9oLVnTFXJd94vtFW
	ByQrZ8VJrhfdmReMyIFCkcWSJ6510BiVAD/i27PKmvVyxBxtcPazYWmv/vFi6LJi+E55F1OzZkO7I
	aXMThNyofKf9WpvtpA8UlUb/1BX4Z/WNCOn4C+BwpqCNco4/VSF2YAs/lBlHATXoCGjHe/p4KAxLv
	ZtjIkABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubate-00000004Uzp-307q;
	Tue, 15 Jul 2025 08:20:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubajV-00000004SjJ-1ZeD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:09:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bhBbs1Cf1z13MqH;
	Tue, 15 Jul 2025 16:06:49 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id AE36D1401F4;
	Tue, 15 Jul 2025 16:09:35 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Jul 2025 16:09:35 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Jul 2025 16:09:34 +0800
CC: <yangyicong@hisilicon.com>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [RESEND PATCH v3 7/8] drivers/perf: hisi: Add support for
 HiSilicon NoC PMU
To: Will Deacon <will@kernel.org>
References: <20250619125557.57372-1-yangyicong@huawei.com>
 <20250619125557.57372-8-yangyicong@huawei.com>
 <aHUeJ1ovziG1rTyW@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <501e61fb-2dc5-c207-4bfd-1d3f23cd2c28@huawei.com>
Date: Tue, 15 Jul 2025 16:09:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aHUeJ1ovziG1rTyW@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_010949_739880_552F9D41 
X-CRM114-Status: GOOD (  23.29  )
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

On 2025/7/14 23:11, Will Deacon wrote:
> On Thu, Jun 19, 2025 at 08:55:56PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Adds the support for HiSilicon NoC (Network on Chip) PMU which
>> will be used to monitor the events on the system bus. The PMU
>> device will be named after the SCL ID (either Super CPU cluster
>> or Super IO cluster) and the index ID, just similar to other
>> HiSilicon Uncore PMUs. Below PMU formats are provided besides
>> the event:
>>
>> - ch: the transaction channel (data, request, response, etc) which
>>   can be used to filter the counting.
>> - tt_en: tracetag filtering enable. Just as other HiSilicon Uncore
>>   PMUs the NoC PMU supports only counting the transactions with
>>   tracetag.
>>
>> The NoC PMU doesn't have an interrupt to indicate the overflow.
>> However we have a 64 bit counter which is large enough and it's
>> nearly impossible to overflow.
>>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  Documentation/admin-guide/perf/hisi-pmu.rst  |  11 +
>>  drivers/perf/hisilicon/Makefile              |   3 +-
>>  drivers/perf/hisilicon/hisi_uncore_noc_pmu.c | 392 +++++++++++++++++++
>>  3 files changed, 405 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> 
> [...]
> 
>> +static int hisi_noc_pmu_dev_init(struct platform_device *pdev, struct hisi_pmu *noc_pmu)
>> +{
>> +	hisi_uncore_pmu_init_topology(noc_pmu, &pdev->dev);
>> +
>> +	if (noc_pmu->topo.scl_id < 0)
>> +		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get scl-id\n");
>> +
>> +	if (noc_pmu->topo.index_id < 0)
>> +		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get idx-id\n");
>> +
>> +	if (noc_pmu->topo.sub_id < 0)
>> +		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get sub-id\n");
>> +
>> +	noc_pmu->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(noc_pmu->base))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(noc_pmu->base),
>> +				     "fail to remap io memory\n");
>> +
>> +	noc_pmu->on_cpu = -1;
>> +	noc_pmu->dev = &pdev->dev;
>> +	noc_pmu->ops = &hisi_uncore_noc_ops;
>> +	noc_pmu->pmu_events.attr_groups = hisi_noc_pmu_attr_groups;
>> +	noc_pmu->num_counters = NOC_PMU_NR_COUNTERS;
>> +	noc_pmu->counter_bits = NOC_PMU_COUNTER_BITS;
>> +	noc_pmu->check_event = NOC_PMU_EVENT_CTRL_TYPE;
>> +	noc_pmu->identifier = readl(noc_pmu->base + NOC_PMU_VERSION);
> 
> Would it be worth going straight to an ACPI-based lookup for this lot?
> The earlier patches in the series rework the existing drivers to go in
> that direction as it's easier to extend, so it seems a little odd for
> new driver code to revert back to e.g. reeading the version number.
> 
> Same for the misc node driver in the next patch.
> 

ok. was planned to change to that when new version comes with new capabilities and
hardware interface, but it's easy to change to that. will update.

Thanks.

