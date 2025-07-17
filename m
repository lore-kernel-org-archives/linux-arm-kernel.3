Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04FDC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRM7ea8WF4O4QsZ/i20kItQnxWi8KnJBkgRIgCsm0IE=; b=BtDxzHdxl+5+Q59jWdLDS+QeeY
	IKTeBhvakr5exdidohBsmCiw64Vc2fq6wIv+4NtCPen1hHlgqyV6X41UUVx0TEcyWx3d7J65oxNfX
	Cqm3ktu9dzdcpJTKYnxyfS4bue66WIPcOypqVIEeamD1fxinarmDLsUusmvFA3phNcXJJDvQcO4HP
	lmY3agwtj0oVE85cOhYrxlmVQI7qwldB1DlF/2B3kgPxp8u8INkBgavX1b/CFIgjANNPawWjC1XPj
	i8e5rfbHaosOgrrS8pCgbd5dkIpswY4CTDHtcjdSedqhJ+ZEHBfoEYkZGlP3MWmccZ/3wb3dLbmbv
	05Sgpy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNO9-0000000A4LE-10UM;
	Thu, 17 Jul 2025 12:07:01 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLza-00000009rk6-3of1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:37:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bjTqL3vS6z6K5qc;
	Thu, 17 Jul 2025 18:36:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 560581402F7;
	Thu, 17 Jul 2025 18:37:28 +0800 (CST)
Received: from localhost (10.48.159.214) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Jul
 2025 12:37:27 +0200
Date: Thu, 17 Jul 2025 11:37:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH v4 1/2] drivers/perf: hisi: Add support for HiSilicon
 NoC PMU
Message-ID: <20250717113725.000075fb@huawei.com>
In-Reply-To: <20250717074138.39903-2-yangyicong@huawei.com>
References: <20250717074138.39903-1-yangyicong@huawei.com>
	<20250717074138.39903-2-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.159.214]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033735_155496_58BF3B9A 
X-CRM114-Status: GOOD (  15.38  )
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

On Thu, 17 Jul 2025 15:41:37 +0800
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

Hi.

Just one trivial thing that I missed in internal review yesterday.
Not worth a respin though!

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> new file mode 100644
> index 000000000000..2e3eb7881caa
> --- /dev/null
> +++ b/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c

> +
> +static struct hisi_noc_pmu_regs hisi_noc_v1_pmu_regs = {
> +	.version = NOC_PMU_VERSION,
> +	.pmu_ctrl = NOC_PMU_GLOBAL_CTRL,
> +	.event_ctrl0 = NOC_PMU_EVENT_CTRL0,
> +	.event_cntr0 = NOC_PMU_EVENT_COUNTER0,
> +	.ovflow_status = NOC_PMU_CNT_INFO,

Trivial but if you are spinning a v5 for some I'd just spell out
as .overflow_status.

I've never seen any consistency in abbreviations for overflow!

> +};
> +
> +static const struct hisi_pmu_dev_info hisi_noc_v1 = {
> +	.attr_groups = hisi_noc_pmu_attr_groups,
> +	.counter_bits = 64,
> +	.check_event = NOC_PMU_EVENT_CTRL_TYPE,
> +	.private = &hisi_noc_v1_pmu_regs,
> +};


