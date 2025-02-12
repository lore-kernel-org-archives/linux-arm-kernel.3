Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9211C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 04:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xISnSa8Eb7i1/ARLSwYrCQM29HuBqOwokOLf+OPQHaw=; b=piXqUTKSxWGnYg3f4w7Kp72II9
	WFUAg9yKf/locuTWJ5G0uRt9wLwMpsn7aRpYSyPx1m7zYxI6itSD3buKHVwaQrOI8+VERArHZLEUC
	AndrYaY8so+SS7+jbriQMr5QkD5luFVGytIjczeSP8Pml3GGTRZu3UFs9Fdl3K4W/ueP3SC80g06z
	qxZGP3sstsiiOhSA3VGkFQQ6sGUSxqKIAcbj4AQXvBvL85mHpjrFfcEJZHd5h1cHBv/Pv1JBbHaVq
	f0iMnVYtKS801EMNCjxK6moSj6TB0dw8Qfdunja+JvByJuG+DxKj7thOywCReHLytzzWliykZFFAo
	tXOtHtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti463-000000068c7-3kzk;
	Wed, 12 Feb 2025 04:11:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti43e-000000068DN-0ldq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 04:09:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Yt4X774BQzpTR1;
	Wed, 12 Feb 2025 12:07:19 +0800 (CST)
Received: from dggpemf100016.china.huawei.com (unknown [7.185.36.236])
	by mail.maildlp.com (Postfix) with ESMTPS id D693F14022E;
	Wed, 12 Feb 2025 12:08:54 +0800 (CST)
Received: from [10.67.120.139] (10.67.120.139) by
 dggpemf100016.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Feb 2025 12:08:54 +0800
Message-ID: <21a3726f-63d0-4c33-84a2-9e11b99f9e9c@huawei.com>
Date: Wed, 12 Feb 2025 12:08:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] soc cache: Add support for HiSilicon L3 cache
To: <xuwei5@hisilicon.com>, <yangyicong@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>, <wangjie125@huawei.com>,
	<wanghuiqiang@huawei.com>, <christophe.jaillet@wanadoo.fr>
CC: <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250122065803.3363926-1-wangyushan12@huawei.com>
Content-Language: en-US
From: wangyushan <wangyushan12@huawei.com>
In-Reply-To: <20250122065803.3363926-1-wangyushan12@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100016.china.huawei.com (7.185.36.236)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_200906_376902_88CA2F32 
X-CRM114-Status: GOOD (  12.52  )
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

Gentle ping on this patch.

On 2025/1/22 14:58, Yushan Wang wrote:
> This series adds support for HiSilicon SoC cache lockdown and cache
> maintenance operations.
>
> Cache lockdown feature prevents cache entries from being evicted from L3
> cache for better performance.  It can be enabled by calling mmap
> function to the file (`/dev/hisi_soc_cache_mgmt`).  This feature is
> implemented in the driver hisi_soc_l3c.
>
> L3 cache and L3 cache PMU share the same memory resource, which makes
> one fails to probe while another is on board.  Since both devices
> rely on distinct information exported by ACPI, their probing functions
> should be unrelated.  Workaround the resource conflict check by
> replacing devm_ioremap_resource() to devm_ioremap() instead.
>
> Changes in v2:
>    - Save unnecessary iterations when performing cache lock. (Christophe)
>    - Other minor style changes. (Christophe)
>    - Link to v1: https://lore.kernel.org/all/20250107132907.3521574-1-wangyushan12@huawei.com
>
> Jie Wang (1):
>    soc cache: Add framework driver for HiSilicon SoC cache
>
> Yushan Wang (1):
>    soc cache: L3 cache lockdown support for HiSilicon SoC
>
>   drivers/soc/hisilicon/Kconfig                 |  22 +
>   drivers/soc/hisilicon/Makefile                |   2 +
>   .../soc/hisilicon/hisi_soc_cache_framework.c  | 534 ++++++++++++++++++
>   .../soc/hisilicon/hisi_soc_cache_framework.h  |  77 +++
>   drivers/soc/hisilicon/hisi_soc_l3c.c          | 527 +++++++++++++++++
>   5 files changed, 1162 insertions(+)
>   create mode 100644 drivers/soc/hisilicon/hisi_soc_cache_framework.c
>   create mode 100644 drivers/soc/hisilicon/hisi_soc_cache_framework.h
>   create mode 100644 drivers/soc/hisilicon/hisi_soc_l3c.c
>


