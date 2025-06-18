Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178AAC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAOqSpqCOL5vjgDSfWa7ZrwFL1vtEzIytDfSsqz8LEg=; b=fDbbEDJ6rJUZ+I9qIbP4uJROhX
	Hy0kYhWO5cDyeqRc1NWf/AUa3MDsuriu09b+vFmIWjPRxYW2ga7zE+obf61HW80YhYs7C49T2mgrx
	kjPUUVNtRN81orNh5yZu4Kp9i+/n1E6Oyt8jAR9M92PZ/7654NwsDuAu6T+PTx5q0cwxNgRa/GkFK
	RmLOnWyC68tF8Tdir+J5I6Q0CoqX+lDIxj82qwa5CikgN44MB4S6hh1dS5G7GC1EBSWYBSBdEit+0
	D+XUuTM1sVGHv0SH2z0pFBjkx2Y7TAVE8bosjCv+ZHMw+Wrj3dvjb+plL87ocCK7RSJ0ekCyVN0iw
	75yXP7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuYB-0000000AZUD-1mg1;
	Wed, 18 Jun 2025 15:18:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRspj-0000000AIO9-41G5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 13:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dAOqSpqCOL5vjgDSfWa7ZrwFL1vtEzIytDfSsqz8LEg=; b=QnsjPcDUpZ+OSX9rQh+yX77wVN
	FQRcHkGMHEbh1+cS1tSSBtJQLGUMsNGXMUyLbnhghfYZduoh2jUq66HCEfaG+zGYCs1rqvqvpzwSZ
	ZiYipSfaPlg38uy4/U+acITnCy2mnU0xGvUxDgO5vfFbSyaE+CvhZ/atmkK1KFBPzg1RKDGat1ceO
	PV88gDD62MfzMzxnRgf5CvCxNW5hq2314s7XOCL78KlGPGWfcTR5zrSdWfRutjyZS097HRcw9cf2/
	mjJONfxqI7Y3BNcLnrjupGf4bXDFzOB+RkjYVNPzc+N4MW12Dn9MzKhU6yc6uwPJn2RhtmAbijLOd
	2e0Os8Cw==;
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRspg-000000043Lm-14Jy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:28:07 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4a44b0ed780so99120331cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 06:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750253280; x=1750858080; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dAOqSpqCOL5vjgDSfWa7ZrwFL1vtEzIytDfSsqz8LEg=;
        b=h0sChdWAoU8nNoY4zuuJ3wpOU5IjTRt5P6a7bcUOSZUiPVsHLobfszIZFzkNUC+1nZ
         FimEzw5517kCMu9Ugyprln4qesNPm1qmP/SVNcQZOJ+A0H1pFes8lpZdSaa1fzWuerRk
         ZiJ3jF2gcaNX+GjhODI5K6dzidPtgdtqDDAzDurgXiVG0B6ZNIXodg+Hx6y/gTB8nK8N
         /jPURdEyEzN+27uP7qhl1oUcZo+n3onzQkvfTb7hkawyd3xSu5P6zdFaJNCPYgiLHqS0
         Cpx3evtygLr73lfFJGcmT53sovCHZ+Ub7ZGkOMj+grdaUch8bzrMAqvaNjPt+6O/vkhw
         7NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253280; x=1750858080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAOqSpqCOL5vjgDSfWa7ZrwFL1vtEzIytDfSsqz8LEg=;
        b=cOw7OepKKru/JZjHQP2UjQ82iZH2qu+ZCNCmzmIRcVkg4bVZvhVYvwJlQe//sPP9AO
         AiqSz7VPOtQYhpkyMmbMmvSYk2AMnr0TW3SbNI+kTU7LJUC6daVJfwRBJyYz6n8nWhIq
         JEr14H0uUewECnAnwZNa0btbOl3bRa4bNAWJ2ohij7mqrO4FgfMIoOUACoqXfKo6ND/D
         yhl6hyPSyxuZdhFCo5p5xg2cbXA1fGPOG/exuIibY+BkebH3uH5Y2bpA97m1UQOZoaCz
         X+GPvG4wSknPgurGlT76nSxiSMC/7XGqjTDsr+htTEIsvtvmS2D7HsF1K5AtH5nntGaT
         XAwA==
X-Forwarded-Encrypted: i=1; AJvYcCVvAcbXiZYONm7IL1Ifh6cIT6d9q/MhLh6r+WNFececMLVDjeJ+lZcbszX9yM8MvI6U9S80u0FQ26obXwZ0PLvY@lists.infradead.org
X-Gm-Message-State: AOJu0YzoZ4X9dCWYgSHBFBcZPqGooysOYZm2REDqwjupH9BTKkrkq+7t
	6gKuhQYY1YSeG1ZZl56E6GE0eBMy3UZg3EFFACR4PxQpK2waBcST0150OXFyW7acXwc=
X-Gm-Gg: ASbGncusQW58ElMghu12JV1C4Mx5tZ9AoD+7fRx9yRYEBncn+He8bJXGrnmnWBIyRLm
	I69gn5W1BRkU3RvZjRxzY/e6Ewly5P5qHxgt7ty5pRzVdCw/DmAyGqG4+dqUg/Q75nxH/asJMsO
	Ys02UNool02urCntSiokfR8/QlsOQxNnq1+ygg7ucTV+HxPdnaRV0soaBHNv83nC+J9XRw5wIPl
	wbdprsALX8pCHqLk1jvmknmVpcXzpN4SPAMDKi+mDrynDzRNOgoykVgKVb1V18WyehXI2Fluznv
	O54Q0n2y0gZuFIxkZFhHgJva6JU4ttJYsn3HucSg85UAtlD4mwMTWJdCmQjRIel+3Dh4zeRZuEl
	/u6b5o1nQiaHBjwUyeKS0oCWiqAhAP7ENn82Mvw==
X-Google-Smtp-Source: AGHT+IG2fHMkumSLh5a7kRlQvfCzWqyNaNQCt2F7JGbyl37Cd1Kzlhrtl/JlBPjRFd8BrqzAM7ABWw==
X-Received: by 2002:a05:622a:1886:b0:4a7:2328:27dc with SMTP id d75a77b69052e-4a73c4fd24emr201270391cf.9.1750253280248;
        Wed, 18 Jun 2025 06:28:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a50f29dsm71636961cf.75.2025.06.18.06.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:27:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRspb-00000006mz5-0lhB;
	Wed, 18 Jun 2025 10:27:59 -0300
Date: Wed, 18 Jun 2025 10:27:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250618132759.GO1376515@ziepe.ca>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-4-benjamin.gaignard@collabora.com>
 <20250617163219.GF1376515@ziepe.ca>
 <ff32d7c1-d811-46b8-8d3d-458dfebd14f8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff32d7c1-d811-46b8-8d3d-458dfebd14f8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_142804_399950_E523BDEB 
X-CRM114-Status: GOOD (  22.63  )
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

On Wed, Jun 18, 2025 at 02:04:19PM +0200, Benjamin Gaignard wrote:
> 
> Le 17/06/2025 à 18:32, Jason Gunthorpe a écrit :
> > > +	vsi_domain->dt_dma = dma_map_single(dma_dev, vsi_domain->dt,
> > > +					    SPAGE_SIZE, DMA_TO_DEVICE);
> > > +	if (dma_mapping_error(dma_dev, vsi_domain->dt_dma)) {
> > > +		dev_err(dma_dev, "DMA map error for DT\n");
> > > +		goto err_free_dt;
> > > +	}
> > > +
> > > +	vsi_domain->pta = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> > > +					       SPAGE_SIZE);
> > > +	if (!vsi_domain->pta)
> > > +		goto err_unmap_dt;
> > > +
> > > +	vsi_domain->pta_dma = dma_map_single(dma_dev, vsi_domain->pta,
> > > +					     SPAGE_SIZE, DMA_TO_DEVICE);
> > > +	if (dma_mapping_error(dma_dev, vsi_domain->pta_dma)) {
> > > +		dev_err(dma_dev, "DMA map error for PTA\n");
> > > +		goto err_free_pta;
> > > +	}
> > > +	vsi_domain->pta[0] = vsi_mk_pta(vsi_domain->dt_dma);
> > > +
> > > +	vsi_table_flush(vsi_domain, vsi_domain->pta_dma, 1024);
> > > +	vsi_table_flush(vsi_domain, vsi_domain->dt_dma, NUM_DT_ENTRIES);
> > dma_map_single already flushes, put things in the write order and no
> > need to double flush.
> 
> I don't get your point here, for me it flush two different pieces of memory.

dma_map_single() already flushes the cache, you don't need to do it
again.

Do your memory writes then call dma_map_signle().

> > > +	dte_index = vsi_iova_dte_index(iova);
> > > +	dte_addr = &vsi_domain->dt[dte_index];
> > > +	dte = *dte_addr;
> > > +	if (vsi_dte_is_pt_valid(dte))
> > > +		goto done;
> > > +
> > > +	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
> > > +	if (!page_table)
> > > +		return ERR_PTR(-ENOMEM);
> > Don't use get_zeroed_page for page table memory.
> 
> I will use kmem_cache in v2

I mean you are supposed to iommu-pages.h for page table memory.

> > > +	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
> > > +	if (dma_mapping_error(dma_dev, pt_dma)) {
> > > +		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
> > > +		free_page((unsigned long)page_table);
> > > +		return ERR_PTR(-ENOMEM);
> > > +	}
> > > +
> > > +	dte = vsi_mk_dte(pt_dma);
> > > +	*dte_addr = dte;
> > > +
> > > +	vsi_table_flush(vsi_domain, pt_dma, NUM_PT_ENTRIES);
> > > +	vsi_table_flush(vsi_domain,
> > > +			vsi_domain->dt_dma + dte_index * sizeof(u32), 1);
> > Double flushing again.
>
> Same here, for me I flushing two different memory area.

write to the page-table, then call dma_map_single(), don't flush it again.

> > > +static int vsi_iommu_map_iova(struct vsi_iommu_domain *vsi_domain, u32 *pte_addr,
> > > +			      dma_addr_t pte_dma, dma_addr_t iova,
> > > +			      phys_addr_t paddr, size_t size, int prot)
> > > +{
> > > +	unsigned int pte_count;
> > > +	unsigned int pte_total = size / SPAGE_SIZE;
> > > +	phys_addr_t page_phys;
> > > +
> > > +	assert_spin_locked(&vsi_domain->dt_lock);
> > > +
> > > +	for (pte_count = 0; pte_count < pte_total; pte_count++) {
> > > +		u32 pte = pte_addr[pte_count];
> > > +
> > > +		if (vsi_pte_is_page_valid(pte))
> > > +			goto unwind;
> > > +
> > > +		pte_addr[pte_count] = vsi_mk_pte(paddr, prot);
> > So why is this:
> > 
> > #define VSI_IOMMU_PGSIZE_BITMAP 0x007ff000
> > 
> > If the sizes don't become encoded in the PTE? The bits beyond 4k
> > should reflect actual ability to store those sizes in PTEs, eg using
> > contiguous bits or something.
> 
> The iommu use arrays to store up to 1024 4k pages indexes so the size
> isn't coded in the PTE bits but the numbers of used indexes for each arrays.

That isn't how it works, if the PTE bits don't code the size then you
don't set the VSI_IOMMU_PGSIZE_BITMAP. You just want SZ_4K for the way
this driver is written.

Jason

