Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D1ACA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2k/PNfgFvi8nksxIh6BQ1Ns4K8AbQibQ2TViek2F2Y=; b=mRNawllM1XHrWAMcZwF7wFEsDS
	AWYNWEQFP2J5eCM/YQUlKuwkk26nOqYWW/9ReoNhWZ0UnQ8TQ/6lFBS1tGCu2G0yRWBVC6+XC7v+o
	ik11MEDPl+sQY6OET1BkIuCnI1LpNM/qsWp0yETzD1sw/VtSVxeAiGQf+dRH3kdAuL5HE7hNxf/M7
	xzrjPC1VosJIOC8JDfezLpq1iacHmgBKWf8MQDmtoj0jgFqfqEZO+WVQOkwYJi1DQtIGoehPFsinW
	Khgv2SeEAJuoLwaLa0bwBXqdBQXniHJY1IoP3vr8ryj9a482ohXCgM5UBSKE+wW/4aSZYnvs5bIlk
	03aOXq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oG-00000007CAi-3bds;
	Sat, 30 Aug 2025 00:51:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5rs-00000006r0G-06Ie
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 20:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k2k/PNfgFvi8nksxIh6BQ1Ns4K8AbQibQ2TViek2F2Y=; b=mbNHWSHqfMVftCQjEh936xVETk
	+ONcELZ0i6967HgWiA3UpnRDC1NIl5eOYlIKPHczdRAcUF0BGhzSDDVoO3/D3C1Q/hFD0PM591ZW8
	w3aiG0SXNbXyw24ASqnaJrOLjGUSAyKY2tuChGG2KsYK2qJ21ZE5ndEMKRUI4A0ue96FWL7kZoCzB
	HdT5CTTDUZH6bz3MneinplcsGft80QmkEqqCAznbSxnhseLgrEYsoKSL17wN+nDrQJF2vHKeX6z1T
	dnzzZrf3I4M8h2egyrDheqSvPkgyzIkMjnBkeAKJng7wty2hhbe+h/VgnoHhe5+D3sSCUdBOsuAN6
	KeKwCYCA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5rR-00000003JCt-2T3n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 20:38:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EF7B1BA8;
	Fri, 29 Aug 2025 13:37:52 -0700 (PDT)
Received: from [10.57.3.75] (unknown [10.57.3.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 373033F63F;
	Fri, 29 Aug 2025 13:37:59 -0700 (PDT)
Message-ID: <12082d54-6014-4a63-8c51-8353f9dd6613@arm.com>
Date: Fri, 29 Aug 2025 21:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] dmaengine: dma350: Register the DMA controller to
 DT DMA helpers
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-6-jszhang@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250823154009.25992-6-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_213821_110734_5C597BDD 
X-CRM114-Status: GOOD (  18.41  )
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

On 2025-08-23 4:40 pm, Jisheng Zhang wrote:
> Register the DMA controller to DT DMA helpers so that we convert a DT
> phandle to a dma_chan structure.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/dma/arm-dma350.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 17af9bb2a18f..6a9f81f941b0 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -7,6 +7,7 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> +#include <linux/of_dma.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   
> @@ -635,7 +636,7 @@ static int d350_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
>   
> -	return 0;
> +	return of_dma_controller_register(dev->of_node, of_dma_xlate_by_chan_id, &dmac->dma);

This only works for channels with HAS_TRIGSEL=0 (where I guess HAS_TRIG 
can be assumed from DT describing one) - with selectable triggers the 
trigger number (which the dma-cell specifier actually is) doesn't bear 
any relation to the channel number, so channel selection is both simpler 
and more complicated at the same time, since we could pick any free 
channel with HAS_TRIGSEL, but that's not necessarily just *any* free 
channel...

Given that at this point the driver only considers nominal trigger 
capability for channels with HAS_TRIGSEL=1, this patch seems effectively 
broken.

Thanks,
Robin.

>   }
>   
>   static void d350_remove(struct platform_device *pdev)
> @@ -643,6 +644,7 @@ static void d350_remove(struct platform_device *pdev)
>   	struct d350 *dmac = platform_get_drvdata(pdev);
>   
>   	dma_async_device_unregister(&dmac->dma);
> +	of_dma_controller_free(pdev->dev.of_node);
>   }
>   
>   static const struct of_device_id d350_of_match[] __maybe_unused = {

