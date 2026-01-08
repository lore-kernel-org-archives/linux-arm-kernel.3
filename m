Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C4D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDc8gEQlRtn05+eqiKSTYH2m2YeP09EAkl/QBkK95Qs=; b=uZFsRh5bbzuLt2rgyTa+8o31Tb
	HJsz3ggPdqFoTiQ4n6AHEpXh5q1aL0fHcFYXyTy/PEF9KPK0Fs3klJvPa8uCjGU8tds8XyVVr1zz1
	V67er0OfNzQHkAqAS+A5NdH8STgy7shQMrBktWhvFcUL/egsz3F1i8DF+DlNc5huoVduTTaYEjMyA
	9bsWS00d80/2EmUbiowMukRKhNbtJGxOcE8JmgpKQxh3btRlEE1D/NUaQvzMfjQFp2QVTB+gLLH84
	iPyzdwBmU2uz3Pm0LoUjo+rRRnkQiz2GSgad71U8gOI/6/Nbrcd22GAf3DvX1YPFCl89IDMjPp/dB
	K6k09PMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsn2-0000000070W-3hN3;
	Thu, 08 Jan 2026 16:23:12 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsmy-000000006xq-3rq1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:23:11 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dn9DZ3Qp4zJ467w;
	Fri,  9 Jan 2026 00:22:54 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C84240086;
	Fri,  9 Jan 2026 00:22:59 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 8 Jan
 2026 16:22:58 +0000
Date: Thu, 8 Jan 2026 16:22:57 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>, <conor@kernel.org>
CC: <arnd@arndb.de>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of hisi_soc_hha
Message-ID: <20260108162257.00000a2b@huawei.com>
In-Reply-To: <20260108133128.777813-1-wangyushan12@huawei.com>
References: <20260108133128.777813-1-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_082309_103541_C3B9D0C0 
X-CRM114-Status: GOOD (  11.36  )
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

On Thu, 8 Jan 2026 21:31:28 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> Add myself as maintainer of HiSilicon SoC HHA driver as I will be
> responsible for this driver.
> 
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks for stepping up!

Jonathan
> 
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0dd762f5648..b8427c072c9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11366,6 +11366,11 @@ F:	Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
>  F:	drivers/soc/hisilicon/kunpeng_hccs.c
>  F:	drivers/soc/hisilicon/kunpeng_hccs.h
>  
> +HISILICON SOC HHA DRIVER
> +M:	Yushan Wang <wangyushan12@huawei.com>
> +S:	Maintained
> +F:	drivers/cache/hisi_soc_hha.c
> +
>  HISILICON LPC BUS DRIVER
>  M:	Jay Fang <f.fangjian@huawei.com>
>  S:	Maintained


