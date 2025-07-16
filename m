Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E67EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buQFmx185hYrdSjw4kKRkulrU8E5QAT8AA25x1tX/ZM=; b=ikFvb0qQwvmFf9UV705Gx84qm+
	M/4pEMka0Tla2DiNSs8kOCI+uXwavlth/nCtMhNcWP3Q/j9uGXuZrM3E7fPJRC6MVatwb6pa82DoK
	7p+2+p+xYjxw5OXgbsCa+cqnhGRzu+oxt/TghHBG9KTQTPM/bpohFanCg7i0KB5AZAAZFO+b1Ro93
	TI9FO/boLdYFEdWgdim25zM07A7nobljYhP3BFEqh4i175wPLfx3hSI/EWd4NV+mwZoJwwvJhS1JJ
	U2AeLbYh4MR3Re+ObMyvOg0GUIaTuypOPR7TCzgfI5CXqBAnPlSa10AstAMRFR3c/vCwyasTeoiGu
	kJDLSR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc510-00000008BqJ-0YGy;
	Wed, 16 Jul 2025 16:29:54 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4yG-00000008BWu-3Jje
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 16:27:06 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bj1d30ZsCz6L5BC;
	Thu, 17 Jul 2025 00:25:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6ED361402F4;
	Thu, 17 Jul 2025 00:26:54 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 16 Jul
 2025 18:26:53 +0200
Date: Wed, 16 Jul 2025 17:26:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, Rohit
 Mathew <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	"Zeng Heng" <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
	"Carl Worth" <carl@os.amperecomputing.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>
Subject: Re: [RFC PATCH 09/36] arm64: kconfig: Add Kconfig entry for MPAM
Message-ID: <20250716172652.00005a76@huawei.com>
In-Reply-To: <20250711183648.30766-10-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-10-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_092705_118373_30726561 
X-CRM114-Status: GOOD (  23.21  )
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

On Fri, 11 Jul 2025 18:36:21 +0000
James Morse <james.morse@arm.com> wrote:

> The bulk of the MPAM driver lives outside the arch code because it
> largely manages MMIO devices that generate interrupts. The driver
> needs a Kconfig symbol to enable it, as MPAM is only found on arm64
> platforms, that is where the Kconfig option makes the most sense.
> 
> This Kconfig option will later be used by the arch code to enable
> or disable the MPAM context-switch code, and registering the CPUs
> properties with the MPAM driver.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Seems like a reasonable help test so FWIW

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/Kconfig | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 55fc331af337..5f08214537d0 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2058,6 +2058,23 @@ config ARM64_TLB_RANGE
>  	  ARMv8.4-TLBI provides TLBI invalidation instruction that apply to a
>  	  range of input addresses.
>  
> +config ARM64_MPAM
> +	bool "Enable support for MPAM"
> +	help
> +	  Memory Partitioning and Monitoring is an optional extension
> +	  that allows the CPUs to mark load and store transactions with
> +	  labels for partition-id and performance-monitoring-group.
> +	  System components, such as the caches, can use the partition-id
> +	  to apply a performance policy. MPAM monitors can use the
> +	  partition-id and performance-monitoring-group to measure the
> +	  cache occupancy or data throughput.
> +
> +	  Use of this extension requires CPU support, support in the
> +	  memory system components (MSC), and a description from firmware
> +	  of where the MSC are in the address space.
> +
> +	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
> +
>  endmenu # "ARMv8.4 architectural features"
>  
>  menu "ARMv8.5 architectural features"


