Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0ACCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfSXR8cVtMDbFA1OoFTfYfL9yYo6wdjOPfF1Osx1+2I=; b=IAD4NaAuzRMaSh439u+15ejimV
	WVgnXT6tzeY6MpeRlAx/540xyNqlu/TFa0AkXdv05TETRkH/uIT+LkGK3226sMQh0OLkUD6j3ITWj
	sOvZlmrVsRtVh6/Muenik8QiGg6aFFrRpjPdqHFE3iTl7wQ1QyF5gm5RU924il3zIwNMoNqS9EGNn
	B7qAGyzAMC2cM6tugPD5UsUgNuu6mz2Pb5w7P03xBjOHJ3e2IZAajBFdbS4w358rweGHUcTlrAUJo
	MNbcFVZmAB7QXqnwO3ll3TCM5WJxqA2/F75bPTBR+B2l2RaTzY7KYSzSED30qKHlXhfguEpt2iLnm
	BmSnqeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nqF-00000005miO-1KOL;
	Thu, 09 Oct 2025 10:25:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nqB-00000005mh6-2r7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:25:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cj5bQ1ZCgz6FGkL;
	Thu,  9 Oct 2025 18:24:50 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 6FABA1400CA;
	Thu,  9 Oct 2025 18:25:32 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Oct
 2025 11:25:31 +0100
Date: Thu, 9 Oct 2025 11:25:29 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
CC: <linux-coco@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, "Gavin
 Shan" <gshan@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, "Jeremy
 Linton" <jeremy.linton@arm.com>, Sami Mujawar <sami.mujawar@arm.com>
Subject: Re: [PATCH] coco: guest: arm64: Update ARM CCA guest driver
Message-ID: <20251009112529.00001b41@huawei.com>
In-Reply-To: <20251008132758.784275-1-aneesh.kumar@kernel.org>
References: <20251008132758.784275-1-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_032544_048824_4FF4B737 
X-CRM114-Status: GOOD (  21.68  )
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

On Wed,  8 Oct 2025 18:57:58 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Make preparatory updates to the ARM CCA guest driver:
> 
>  - Switch from using a platform device to a faux device (based on
>    feedback in [1])
>  - Rename the device from `arm-cca-dev` to `arm-rsi-dev`, so that the
>    host driver can register an equivalent `arm-rmi-dev`
> 
> These changes are purely structural and introduce no new functionality.
> Subsequent patches will extend this driver to add guest device
> assignment support.
> 
> [1] https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh
> 

Slight preference for:
Link: https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh #1
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
> NOTE:
> This patch is sent early outside the patchseries to avoid userspace from
> depending on the presence of the newly introduced platform device.
> The platform device was added in v6.14-rc1. 
> 

A few trivial things inline. With those in mind.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
> index 69eeba08e98a..609462ea9438 100644
> --- a/drivers/virt/coco/arm-cca-guest/Makefile
> +++ b/drivers/virt/coco/arm-cca-guest/Makefile
> @@ -1,2 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +#

Unrelated change. I'd drop it.

>  obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
> +
> +arm-cca-guest-$(CONFIG_TSM) +=  arm-cca.o

extra space after = seems a bit odd.

> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> similarity index 85%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
> index 0c9ea24a200c..89d9e7f8eb5d 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2023 ARM Ltd.
> + * Copyright (C) 2025 ARM Ltd.

I'd expect a date range rather than updating copyright for whole file
like this. The untouched bit will still be 2023 era code.

>   */

> +static int cca_tsm_probe(struct faux_device *fdev)
>  {
>  	int ret;
>  
>  	if (!is_realm_world())
>  		return -ENODEV;
>  
> -	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
> -	if (ret < 0)
> +	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
> +	if (ret < 0) {
>  		pr_err("Error %d registering with TSM\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(&fdev->dev, unregister_cca_tsm_report, NULL);
> +	if (ret < 0) {
> +		pr_err("Error %d registering devm action\n", ret);

I believe (not checked today) that devm_add_action_or_reset() can only fail
with -ENOMEM due to an allocation failure and we generally don't print
extra error messages if that happens.
So I would drop this pr_err.

> +		unregister_cca_tsm_report(NULL);
> +		return ret;
> +	}
>  
>  	return ret;
>  }



