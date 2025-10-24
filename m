Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4E2CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GZu3eLr1OtM6C/pkNZiZaMnyFHP0NoxmXOoyhc9mKQ=; b=qzhq58B49uECOuxKuXGvXP+gKV
	PMSTesoX+pIXmkJScvs+n017eYYzM3VwuW5hqK2QkxJAW04m+YbJnefrxINzdH/NmnR3p/WZq/zM2
	PMXuzyWURujNTfQI57jZ+eWReTwpvxE1Ba8Vml6tgb1gUs92EOpOOXs/IJ53Org0mSgZ5j5X9t4ql
	IRxNHL8pSQVwWG6ETvUr8EnjpSNRUQmsuPmxXuC8TkpBtsIYsVo2hTV7l68jzhg7qCoCrQ5cdduev
	jMRIKtskuJII3Te+9zEP39pJ1JxFFMdTmXmG0jSPtzYyiHVLSBl/OUThpUgonDq2qUprRKZbr2ojW
	iu8eEDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLea-0000000A7kz-1d59;
	Fri, 24 Oct 2025 17:32:40 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLeX-0000000A7jz-00Sw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:32:39 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctVJ84zcpz6GDFt;
	Sat, 25 Oct 2025 01:29:12 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 855BD1400CB;
	Sat, 25 Oct 2025 01:32:31 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 18:32:30 +0100
Date: Fri, 24 Oct 2025 18:32:28 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v3 09/29] arm_mpam: Add MPAM MSC register layout
 definitions
Message-ID: <20251024183228.00005a64@huawei.com>
In-Reply-To: <20251017185645.26604-10-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
	<20251017185645.26604-10-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_103237_328990_CF56AB48 
X-CRM114-Status: GOOD (  20.51  )
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

On Fri, 17 Oct 2025 18:56:25 +0000
James Morse <james.morse@arm.com> wrote:

> Memory Partitioning and Monitoring (MPAM) has memory mapped devices
> (MSCs) with an identity/configuration page.
> 
> Add the definitions for these registers as offset within the page(s).
> 
> Link: https://developer.arm.com/documentation/ihi0099/latest/

I can't figure out how to get a stable link when there is only
one version.  If possible would be good to use one.

I guess it probably doesn't matter unless someone renames things as
you only have as subset of the fields currently there for some registers.

> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
A few tiny things inline.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> ---
>  drivers/resctrl/mpam_internal.h | 268 ++++++++++++++++++++++++++++++++
>  1 file changed, 268 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1a5d96660382..1ef3e8e1d056 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -142,4 +142,272 @@ extern struct list_head mpam_classes;
>  int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>  				   cpumask_t *affinity);
>  
> +/*
> + * MPAM MSCs have the following register layout. See:
> + * Arm Memory System Resource Partitioning and Monitoring (MPAM) System
> + * Component Specification.
> + * https://developer.arm.com/documentation/ihi0099/latest/
> + */
> +#define MPAM_ARCHITECTURE_V1    0x10

> +#define MSMON_MBWU_L		0x0880  /* current long mem-bw usage value */
> +#define MSMON_MBWU_CAPTURE_L	0x0890  /* last long mem-bw value captured */
Spec name I'm seeing is
MSMON_MBWU_L_CAPTURE.  Maybe a good idea to match?

> + */
> +#define MSMON_CFG_x_CTL_TYPE			GENMASK(7, 0)
> +#define MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L	BIT(15)
> +#define MSMON_CFG_x_CTL_MATCH_PARTID		BIT(16)
> +#define MSMON_CFG_x_CTL_MATCH_PMG		BIT(17)
> +#define MSMON_CFG_x_CTL_SUBTYPE			GENMASK(22, 20)
> +#define MSMON_CFG_x_CTL_OFLOW_FRZ		BIT(24)
> +#define MSMON_CFG_x_CTL_OFLOW_INTR		BIT(25)
> +#define MSMON_CFG_x_CTL_OFLOW_STATUS		BIT(26)
> +#define MSMON_CFG_x_CTL_CAPT_RESET		BIT(27)
> +#define MSMON_CFG_x_CTL_CAPT_EVNT		GENMASK(30, 28)
> +#define MSMON_CFG_x_CTL_EN			BIT(31)
> +
> +#define MSMON_CFG_MBWU_CTL_TYPE_MBWU		0x42
> +#define MSMON_CFG_CSU_CTL_TYPE_CSU		0x43
> +
> +#define MSMON_CFG_MBWU_CTL_SCLEN		BIT(19)

Why is this one down here, but OFLOW_STATUS_L is in middle of the shared
block of definitions? I don't mind which approach you use, but not a mix.

> +
> +/*
> + * MSMON_CSU - Memory system performance monitor cache storage usage monitor
> + *            register
> + * MSMON_CSU_CAPTURE -  Memory system performance monitor cache storage usage
> + *                     capture register
> + * MSMON_MBWU  - Memory system performance monitor memory bandwidth usage
> + *               monitor register
> + * MSMON_MBWU_CAPTURE - Memory system performance monitor memory bandwidth usage
> + *                     capture register
> + */
> +#define MSMON___VALUE		GENMASK(30, 0)
> +#define MSMON___NRDY		BIT(31)
> +#define MSMON___NRDY_L		BIT(63)
> +#define MSMON___L_VALUE		GENMASK(43, 0)
Positioning of L in these seems a little inconsistent?

> +#define MSMON___LWD_VALUE	GENMASK(62, 0)

>  #endif /* MPAM_INTERNAL_H */


