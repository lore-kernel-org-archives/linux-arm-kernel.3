Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4FBC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcYeM8YddgGy0Co6PLjjbrNoOflTVmZ7V8icjLa1578=; b=4UlsF7w5dT5yvdMJ5DtYrEBSOQ
	Cz+Iaa8SI5jgoGaoAdh/1f5s3SVswXaS6yyB2XdkerY7dNuZzun2jAvkaNMolaI5Qc9ndQsNCcAYh
	yGSC6X7ypTpRoBD/jVTDHWkhHuhLohnHGJVREJnRO+cFehbAKTlBSOMEkEZOiKu3FpFdjt1bAQGfb
	A0mhQdHdWM2/WjfZLgkB922U5FxcT5MisAmSLxavcl7CYRERNIuF2oRQwIAU9L205D6UX8Gh8ygut
	S4vNfr8bc+gJUkz5KyFK2hPo3BUxEHaAfrJNfnnCgwWwthhQzA6UichmOjRSCWnaNknYQAQ98EwtC
	E/Jkpzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5StY-0000000DozI-1eL6;
	Thu, 17 Apr 2025 17:19:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Si6-0000000DmIW-39m5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:07:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zdkjl0nrbz6K9K2;
	Fri, 18 Apr 2025 01:03:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A57A3140145;
	Fri, 18 Apr 2025 01:07:24 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Apr
 2025 19:07:24 +0200
Date: Thu, 17 Apr 2025 18:07:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: <vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] dmaengine: Add Arm DMA-350 driver
Message-ID: <20250417180722.00002465@huawei.com>
In-Reply-To: <6d7d8efefa935d34977b59a74797ab377528db94.1741780808.git.robin.murphy@arm.com>
References: <cover.1741780808.git.robin.murphy@arm.com>
	<6d7d8efefa935d34977b59a74797ab377528db94.1741780808.git.robin.murphy@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_100734_935774_7C3D71A0 
X-CRM114-Status: GOOD (  13.40  )
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

On Wed, 12 Mar 2025 12:05:10 +0000
Robin Murphy <robin.murphy@arm.com> wrote:

> Add an initial driver for the Arm Corelink DMA-350 controller, to
> support basic mem-to-mem async_tx. The design here leaves room for more
> fun things like peripheral support and scatter-gather chaining to come
> in future.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> v2:
>  - Fix build warnings
>  - Limit retries for reading live residue
Drive by review as I was curious...

Few things inline but it's been too long since I last looked
at a DMA driver to give a detailed review.

Jonathan

> +
> +static int d350_probe(struct platform_device *pdev)
> +{



> +
> +	platform_set_drvdata(pdev, dmac);
If you used the managed form of register, I don't think you need this?
> +
> +	ret = dma_async_device_register(&dmac->dma);

This is pretty noisy on most non -ENOMEM errors anyway. Is it worth another
layer of error print?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
> +
> +	return 0;
> +}
> +
> +static void d350_remove(struct platform_device *pdev)
> +{
> +	struct d350 *dmac = platform_get_drvdata(pdev);
> +
> +	dma_async_device_unregister(&dmac->dma);

dmaenginem_async_device_register() and get rid of remove.

J



> +}



