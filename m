Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E591CCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cdnAPJ/txGMdC+542Rqoyln86KAovKwsF9QsCq4AEY=; b=otALj4ye3jRRDSZhZNvgELntNM
	y10msRykMKlQ25ZTpnkS0OWJHJZ74keKdmqH1+SrL0ROzyTwUDa9HDFKKTCbwsQ4TUV1GiPnwIwFe
	EnX70Cio7YU+aICdOIdtu/rLw/TbfadKXSZHay+FEM1jrpVV1ZKgFMoDunabTQiGYqr86jzRrlzUP
	oyGwaBzcgZnImdHM2/6e3JkKheIGnxUhe+Sz3xVOAi+VlGModL86zztBEJeMtwm/uHDa+nH/2p1CS
	XJYeaO4kFPWyWGHkdp9PWGbHSvlEJqUAq+xRaaljl3FZV7jXydLRndsKXHOt05lFqEewiDu24DUN7
	aJYylfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaAp-0000000E1yK-1J2j;
	Wed, 03 Jun 2026 01:13:35 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaAn-0000000E1xy-1wIB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:13:34 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5177b1a7441so2658541cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780449212; x=1781054012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2cdnAPJ/txGMdC+542Rqoyln86KAovKwsF9QsCq4AEY=;
        b=Wel0kdWv8E9m5uZBNPiTM2IOckNo40lqf9U/e98/r5zOabwHLWpXoPf4eAHDjHoD6X
         NPXrIcP6Lt9pgofwjPoFYOgoflfgJffScqSaGxTs7zohPSazQd6vkT6xU+sMvc1vFU+8
         1VJnIORI1aP/KXonlxGoZ5Ft6gz97C0a1dHhCgjTeXLWX1n+b84kPy/I3XOhAdqS5b8c
         cQDwrBYxmAxaraN560r7EACUPXlPkezZ4qYT0BdY2jdExNIhdzJ/fM/nDDpbbADypKK1
         eoI/2J8EvCCYpBG5qO7fk1U7IH8/ujfWuJSKY32+bGpSV/1l1uikelZY4RV+MZ51Nr4D
         yiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449212; x=1781054012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cdnAPJ/txGMdC+542Rqoyln86KAovKwsF9QsCq4AEY=;
        b=PKsMNVFBlMXFzjZFVlzRjBM8QaT1RnocJhChiXWeLKhP55RRcSXcSHuJu8MyX1Clwc
         obtqUgka82nHCiup6QMksopWPoRQkrMS4RMafohv308H7y5QV+uBXscR2jmclZ64suYl
         vaq7U47jQvOfwYvhUsp56Dji8C/Eoh/Q9YfLVYGNeVglXJrz5tbehMJJqQuUhlNU6akc
         GP/5u7GRzneXMfShv+ni+N9tHbcP6fD6bUkWLzarnjhQjujrwJQxvYZcdU6H8Quw5+Wb
         ru+p8KSElcZnddsBdTAIu4dzB/O+cQZOe1Cs3d/Vd7yqkqHb+qdgIYJo10LYldCiarCI
         lufw==
X-Forwarded-Encrypted: i=1; AFNElJ+CNBmrRoqaS9VJ+oJCDDqIslTBvMvEWY9mutAUogxsCQHHkFZCLBY+XzNiC4pjXdKzVBo2fGa7xVwpsZ1SHFYO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq8ux7o/rXZNyXvylQXhsDkNf6Pn4+lXkLVjJV6MJKNXTVsT1v
	83Xc07LN+08E3nvAydij4D4KQ8XJyiumEVsWNwdj9AbBuqI1QNxA4P+3yfarhHUBRIs=
X-Gm-Gg: Acq92OFS6H2f06C6mH4LhdueulWbhiAx6o0qSBbMPNuMl2ybO2M3jmgGu/eEpndKu7c
	POIu20327bLB8ib3HYUKQkjpjI6sD5DXwA6j99kg4Y/aMr7AJxTxTZWYDOD5RgVtcFQxmT6mKWN
	oTuMX79cxConp9K/vw1wNhCmCpSXb0Lh819PiBPx1X7Dx3zPV45z6Mk6qk5awCe5Cj2g50Zs79Z
	iwRdROZYA9h9ciDIh0wNK9AZZqfCm0cB6Y0DZX5KVHqKHDtFU+MV2+fwfU9Onv9k1hcriWn/bmx
	BgLR/sjnZ5aRMTpN6M6WiueBd58DdROLPDrO2mIUFTXzy8cdjDxcOZu+0RgMMFhRI8AOjlKnfcS
	LO4rOsr47KrnMmVq6ivNgxZTjR/ZR+3tkYMpD+VHIz/Q7Kl1OqD/U2ZGtET5fUGW0kG8FxbRdIC
	n+YZrMh4EXD02AvPlDeRomAg0JZ1TrEFBNP8Czo854YiCBuvz9npgzkQa7J4wTKa/x/Ka1mHWqk
	WBIRvFfuXOrLGQI
X-Received: by 2002:a05:622a:5b90:b0:517:7590:228e with SMTP id d75a77b69052e-517784827b9mr21839501cf.0.1780449212162;
        Tue, 02 Jun 2026 18:13:32 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c54177sm13497781cf.12.2026.06.02.18.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:13:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUaAk-00000004yZP-2Ic0;
	Tue, 02 Jun 2026 22:13:30 -0300
Date: Tue, 2 Jun 2026 22:13:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
	baolu.lu@linux.intel.com, boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org, dwmw2@infradead.org,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	oliver.yang@linux.alibaba.com, robh@kernel.org,
	robin.murphy@arm.com, shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com, suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de, wei.guo.simon@linux.alibaba.com,
	will@kernel.org, xlpang@linux.alibaba.com,
	alikernel-developer@linux.alibaba.com
Subject: Re: [PATCH v2 10/30] iommu/ipmmu-vmsa: implement iova_to_phys_length
Message-ID: <20260603011330.GS2487554@ziepe.ca>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-11-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602104637.1219810-11-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_181333_508205_AD3095CA 
X-CRM114-Status: GOOD (  14.82  )
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

On Tue, Jun 02, 2026 at 06:46:17PM +0800, Guanghui Feng wrote:
> Migrate IPMMU-VMSA to implement iova_to_phys_length, passing through
> mapped_length from io-pgtable.
> 
> Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 9386b752dea2..a1b659ddbdb5 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -699,14 +699,18 @@ static void ipmmu_iotlb_sync(struct iommu_domain *io_domain,
>  	ipmmu_flush_iotlb_all(io_domain);
>  }
>  
> -static phys_addr_t ipmmu_iova_to_phys(struct iommu_domain *io_domain,
> -				      dma_addr_t iova)
> +static phys_addr_t ipmmu_iova_to_phys_length(struct iommu_domain *io_domain,
> +				      dma_addr_t iova, size_t *mapped_length)
>  {
>  	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
>  
> +	if (mapped_length)
> +		*mapped_length = 0;

Why?

Jason

