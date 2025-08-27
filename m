Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002F4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFdecGOoprJEKp2QUr1gruBJuQxDrlU/6WB8f6iL16U=; b=hhECdotsR5xZb7MfDHlsg84h/v
	xeEisYmCE++w6WG2mahC8Omo9rLGxqXCXpOnwVCd2I0/rPoXPhjNi41QhNcoUWkTwCOrmNVWzNDHP
	eslGHafG4hlKTdIkHJ9W38er6pNbM5YFmgSPBrHiOCU6eIEhloue+ckRggR23rJEq1hAAjHSHL3nZ
	z6oIlwSR8YmK7bmTid3ClPhhNyePmVuueDtqNsTMu8Hhqx/1BxR0Txo6nJlDwaiPKU+hdsZ/x6zLS
	NB7cMje5RXyWjOaw2AX6LJOz8EeFeqPwZrOoJVlwjHqJQSo3t+3DyKRMgLO6vZPW2FEuaoPrBvihj
	iCfQHxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5w2-0000000Dgir-2tq7;
	Wed, 27 Aug 2025 02:30:50 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5tJ-0000000DgIV-0qGi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 02:28:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cBSzH3tMBz1R8vx;
	Wed, 27 Aug 2025 10:24:43 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 9FF221A0188;
	Wed, 27 Aug 2025 10:27:39 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 10:27:39 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 10:27:38 +0800
CC: <yangyicong@hisilicon.com>, <robin.murphy@arm.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v2 9/9] Documentation: hisi-pmu: Add introduction to
 HiSilicon
To: Yushan Wang <wangyushan12@huawei.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
 <20250821135049.2010220-10-wangyushan12@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <d757a29e-6e13-d528-651b-beff8c2b2c21@huawei.com>
Date: Wed, 27 Aug 2025 10:27:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250821135049.2010220-10-wangyushan12@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_192801_612608_368B709B 
X-CRM114-Status: GOOD (  22.89  )
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

Hi Yushan,

the subject seems to be truncated? should it be like below?

Documentation: hisi-pmu: Add introduction to HiSilicon v3 PMU

other comments inline. sorry for the late reply..

On 2025/8/21 21:50, Yushan Wang wrote:
> Some of HiSilicon V3 PMU hardware is divided into parts to fulfill the
> job of monitoring specific parts of a device.  Add description on that
> as well as the newly added ext operand for L3C PMU.
> 
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst | 38 +++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> index a307bce2f5c5..4c7584fe3c1a 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -12,8 +12,8 @@ The HiSilicon SoC encapsulates multiple CPU and IO dies. Each CPU cluster
>  called Super CPU cluster (SCCL) and is made up of 6 CCLs. Each SCCL has
>  two HHAs (0 - 1) and four DDRCs (0 - 3), respectively.
>  
> -HiSilicon SoC uncore PMU driver
> --------------------------------
> +HiSilicon SoC uncore PMU v1

these (and below) new sections will break the ordered list of the options. this should not be
necessary to mention the version, just add the newly added options in the current way and
mention the introduced version should be enough.

> +---------------------------
>  
>  Each device PMU has separate registers for event counting, control and
>  interrupt, and the PMU driver shall register perf PMU drivers like L3C,
> @@ -56,6 +56,9 @@ Example usage of perf::
>    $# perf stat -a -e hisi_sccl3_l3c0/rd_hit_cpipe/ sleep 5
>    $# perf stat -a -e hisi_sccl3_l3c0/config=0x02/ sleep 5
>  
> +HiSilicon SoC uncore PMU v2
> +----------------------------------
> +
>  For HiSilicon uncore PMU v2 whose identifier is 0x30, the topology is the same
>  as PMU v1, but some new functions are added to the hardware.
>  
> @@ -113,6 +116,37 @@ uring channel. It is 2 bits. Some important codes are as follows:
>  - 2'b00: default value, count the events which sent to the both uring and
>    uring_ext channel;
>  
> +HiSilicon SoC uncore PMU v3
> +----------------------------------
> +
> +For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
> +further divided into parts for finer granularity of tracing, each part has its
> +own dedicated PMU, and all such PMUs together cover the monitoring job of events
> +on particular uncore device. Such PMUs are described in sysfs with name format
> +slightly changed::
> +
> +/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}_{Z}/ddrc{Y}_{Z}/noc{Y}_{Z}>
> +
> +Z is the sub-id, indicating different PMUs for part of hardware device.
> +
> +Usage of most PMUs with different sub-ids are identical. Specially, L3C PMU
> +provides ``ext`` operand to allow exploration of even finer granual statistics
> +of L3C PMU, L3C PMU driver use that as hint of termination when delivering perf
> +command to hardware:
> +
> +- ext=0: Default, could be used with event names.
> +- ext=1 and ext=2: Must be used with event codes, event names are not supported.
> +
> +An example of perf command could be::
> +
> +  $# perf stat -a -e hisi_sccl0_l3c1_0/event=0x1,ext=1/ sleep 5
> +
> +or::
> +
> +  $# perf stat -a -e hisi_sccl0_l3c1_0/rd_spipe/ sleep 5
> +
> +As above, ``hisi_sccl0_l3c1_0`` locates PMU on CPU cluster 0, L3 cache 1 pipe0.

this isn't correct. sccl0 indicates the Super CPU CLuster 0 which is already
described in the document.

thanks.


