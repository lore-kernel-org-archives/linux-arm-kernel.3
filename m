Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D184ACA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu3CV7rAnax3xOdpVrI2BuRPRfuaZqv1S+8culmQGRs=; b=vqx4XgeT+IGnrUopQadW0x3MQz
	x5iwyCsyP3pryIuTdqq+kL4J5Tz1Kqca3GhpruxsR2stNksCqjuC0pPy1lif2id0tWl2vEnzovKv1
	fvNQ9aCmzTYnUtPMBExlhZWaP6ki2SgWkKeFbA3FeqwARJk3FqMvCbMHUNj8tIHp+Vt8RLjnZI0cS
	l73NsiEKKsfIwkSrVi0TQDk8D6l9uLey3mygvdkX2j9dhYQQ/grgzzKPWkClCfkjAtEXv+0h+tcvq
	xKUa6q9nLLCnk1xZDNWeoClSzxzBErbodk5SB/FKCl3LNA+wANwjUwBFSE4FPGdEPFFwdVBga6qIZ
	itqZuD6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyvy-0000000BQwG-1ViD;
	Mon, 01 Sep 2025 07:26:34 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyLo-0000000BMom-1DkP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:49:14 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cFfXb5p3rz1R97H;
	Mon,  1 Sep 2025 14:46:07 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 42879140109;
	Mon,  1 Sep 2025 14:49:06 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 14:49:06 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 14:49:05 +0800
CC: <yangyicong@hisilicon.com>, <robin.murphy@arm.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>, <linuxarm@huawei.com>, <fanghao11@huawei.com>
Subject: Re: [PATCH v3 9/9] Documentation: hisi-pmu: Add introduction to
 HiSilicon V3 PMU
To: Yushan Wang <wangyushan12@huawei.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250829101427.2557899-1-wangyushan12@huawei.com>
 <20250829101427.2557899-10-wangyushan12@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <ebf838bd-93ec-15ea-bc98-d3afc5629256@huawei.com>
Date: Mon, 1 Sep 2025 14:49:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250829101427.2557899-10-wangyushan12@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_234912_698072_682A2FB0 
X-CRM114-Status: GOOD (  18.59  )
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

On 2025/8/29 18:14, Yushan Wang wrote:
> Some of HiSilicon V3 PMU hardware is divided into parts to fulfill the
> job of monitoring specific parts of a device.  Add description on that
> as well as the newly added ext option for L3C PMU.
> 
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst | 33 +++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> index a307bce2f5c5..b78381a1e5e9 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -113,6 +113,39 @@ uring channel. It is 2 bits. Some important codes are as follows:
>  - 2'b00: default value, count the events which sent to the both uring and
>    uring_ext channel;
>  
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
> +provides ``ext`` option to allow exploration of even finer granual statistics
> +of L3C PMU.  L3C PMU driver uses that as hint of termination when delivering
> +perf command to hardware:
> +
> +- ext=0: Default, could be used with event names.
> +- ext=1 and ext=2: Must be used with event codes, event names are not supported.
> +
> +An example of perf command could be::
> +
> +  $# perf stat -a -e hisi_sccl0_l3c1_0/rd_spipe/ sleep 5
> +
> +or::
> +
> +  $# perf stat -a -e hisi_sccl0_l3c1_0/event=0x1,ext=1/ sleep 5
> +
> +As above, ``hisi_sccl0_l3c1_0`` locates PMU of Super CPU CLuster 0, L3 cache 1
> +pipe0.
> +
> +First command locates the first part of L3C since ``ext=0`` is implied by
> +default. Second command issues the counting on another part of L3C with the
> +event ``0x1``.
> +
>  Users could configure IDs to count data come from specific CCL/ICL, by setting
>  srcid_cmd & srcid_msk, and data desitined for specific CCL/ICL by setting
>  tgtid_cmd & tgtid_msk. A set bit in srcid_msk/tgtid_msk means the PMU will not
> 

