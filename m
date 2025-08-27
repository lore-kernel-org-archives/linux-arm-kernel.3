Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6ECCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 02:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cooXmohHaKu6uaegrtlOTDLnsXY7LsvrY833HQ80t4=; b=VUaJAVrssGLYObOZ95Pc+wdJ/g
	VkwZdnYRRtXmmHAa35wVnrjAXUmNPiTe0cSUmr1mwKoyZBdld+R3AXka8dUeEwZc9dUF1G2Kisxm1
	6AjFeO61hhpPG31Rr/JHLYB2W9Eesc214935e5riAB30dJHUETcWD4Aq89Tv6x+bUC9kmZ0RsZmaz
	6/Mpa+hoYWoTms68Rek6uu9wcBKbMbyQpINmIt++sP+nSOFafG70W2lWbdJidPpwRCCOBbgekv+Nf
	FHgKf6cOv8p9tCVXA+davnyVghsAwB+1vkDmHkNqRhTYdmcBVaoF/78PNxguncPtwLn9G6D2gfucf
	9x/btSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5kK-0000000Deou-0A3X;
	Wed, 27 Aug 2025 02:18:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5h7-0000000DeHw-2z6j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 02:15:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cBSmB5GnYz14MLH;
	Wed, 27 Aug 2025 10:15:06 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 851AD1401E9;
	Wed, 27 Aug 2025 10:15:13 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 10:15:13 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 10:15:12 +0800
CC: <yangyicong@hisilicon.com>, <robin.murphy@arm.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v2 8/9] Documentation: hisi-pmu: Fix of minor format error
To: Yushan Wang <wangyushan12@huawei.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
 <20250821135049.2010220-9-wangyushan12@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3e19cbc9-7a23-dcde-af94-9afee42f044b@huawei.com>
Date: Wed, 27 Aug 2025 10:15:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250821135049.2010220-9-wangyushan12@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_191525_912848_7A6B3CD2 
X-CRM114-Status: GOOD (  13.93  )
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

On 2025/8/21 21:50, Yushan Wang wrote:
> The inline path of sysfs should be placed in literal blocks to make
> documentation look better.
> 
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Acked-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> index 48992a0b8e94..a307bce2f5c5 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -18,9 +18,10 @@ HiSilicon SoC uncore PMU driver
>  Each device PMU has separate registers for event counting, control and
>  interrupt, and the PMU driver shall register perf PMU drivers like L3C,
>  HHA and DDRC etc. The available events and configuration options shall
> -be described in the sysfs, see:
> +be described in the sysfs, see::
> +
> +/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>
>  
> -/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>.
>  The "perf list" command shall list the available events from sysfs.
>  
>  Each L3C, HHA and DDRC is registered as a separate PMU with perf. The PMU
> 

