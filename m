Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E811CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE1ciaa8dDg/GL7EzAxWIBG0zeW13qYUOeBUcq1061w=; b=gznTFhcyAWuy4fyAETxShGL+1m
	y854Da85CE6ipPf8LXWUFPspphfaxmEreD+/01/99g6RtY5S46qqeTEvn4QdAAOVU2yZb/viL+abU
	X88KokKipDB2Si7+EHvm1dM/UCto+Xsoua3+V8r5uwIweoZEUWx8ABDLG6YeU0ihN7PgbyPlxDy9I
	s6QL632AHzeEOK/uaPNaGEXHkibdM85WDLcSWd6lkARNP1CqmN2WrwkXZHEavjE23+V1WEh0/wILO
	FGRt0jbEB5JMeHfNYK8jiRwK50gFDWKqcRB044e5CfvrWSgS6kt+ATFQWK4p+jBZCRKbh5E4dgHos
	nqW3Qeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyIr-0000000Ag7J-0C8q;
	Fri, 12 Jun 2026 09:35:53 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyIo-0000000Ag6q-1l7l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:35:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dE1ciaa8dDg/GL7EzAxWIBG0zeW13qYUOeBUcq1061w=;
	b=P5IU2YFfPLxj8W8ZYOGFS+X6NroylvFlTXHpztRKftHAI27BFK2t7xZlm2O9EvqrSZP9UqG6Q
	w9MN5uUsQxb3ZI66YzV8coq1JmapXt90Ek5AfiSDWNgkpGSMCEbLsUP6988m2izTFE4LCJQlyBc
	KSg4GL6NcoExsAls9fCueGo=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gcDh13RfJz1K96Z;
	Fri, 12 Jun 2026 17:27:45 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 993C340563;
	Fri, 12 Jun 2026 17:35:39 +0800 (CST)
Received: from [10.67.120.139] (10.67.120.139) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Jun 2026 17:35:38 +0800
Message-ID: <afe6b37a-becd-4431-bbc9-339d283275c0@huawei.com>
Date: Fri, 12 Jun 2026 17:35:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drivers/perf: hisi: Updates for HiSilicon uncore
 PMUs
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>
References: <20260612093207.1242000-1-wangyushan12@huawei.com>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <20260612093207.1242000-1-wangyushan12@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_023550_624510_1208BB72 
X-CRM114-Status: GOOD (  11.60  )
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

There are some issues with patch 1, please ignore this, sorry.

On 6/12/2026 5:32 PM, Yushan Wang wrote:
> This patchset added support of ITS PMU, and new version of MN PMU.
>
> ITS PMU supports counting number and latency of interrupts by
> catagory, and statistics of micro-ops of ITS.
>
> The new version of MN PMU added cycles event, to be used for MN
> metric computing.
>
> Changes:
> v2:
> - Added int_en filter to tell if int_id is used, enabling filtering
>   interrupt with 0 int_id per Sashiko.
> - Changed event format width to align with register width per Sashiko.
> Link to v1: https://lore.kernel.org/all/20260423152959.1458563-1-wangyushan12@huawei.com/
> Link to Sashiko review report: https://sashiko.dev/#/patchset/20260423152959.1458563-1-wangyushan12%40huawei.com
>
> Yifan Wu (1):
>   drivers/perf: hisi: Add new function for HiSilicon MN PMU driver
>
> Yushan Wang (2):
>   drivers/perf: hisi: Replace counter number with defined macro
>   drivers/perf: hisi: Support uncore ITS PMU
>
>  Documentation/admin-guide/perf/hisi-pmu.rst  |  12 +
>  drivers/perf/hisilicon/Makefile              |   2 +-
>  drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 375 +++++++++++++++++++
>  drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c |   2 +-
>  drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  |  61 ++-
>  5 files changed, 444 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>


