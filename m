Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98069C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DRboL7iXAangnAe10zAw/fnPXaxzgNmenGuCjK+wlo=; b=J2twda94h05UTcQQYAyIXRWmd7
	W3lZtlHB6ZUwL/+7NY/FYbo0gS2FOor/Z0uZWUJ20HVbgKb1Y1GntULdKlmqm75XzX1jy7tTXbBp9
	Ntj1sW6AJR7QFnjfK14XfgK03xFnfPV0UgwXfbTftSvD/n/mlVSHyykDAbBOCFT/eRr4bzuxiG0/y
	uphSsPYrNNX9cUSotmpeyh4FuSoG6E0j4Qhxx36AMMS5oy1KFbnlB7F+QmreXQotbUoO2h4sXCDip
	CoVDJaYizpTc3TghkSu2ujb8C+LRXhfsyxI2Lw9m5joV2wPDV9JTYtqf+bJHXi+Lm7wBgemu60q07
	7+BMCaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLSP-00000008RYv-08Wi;
	Wed, 12 Mar 2025 12:45:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKUY-00000008Ijf-2UMC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 11:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/DRboL7iXAangnAe10zAw/fnPXaxzgNmenGuCjK+wlo=; b=oGhoweT0F60ChhiXzCE2sHn237
	ISmbDJLimVlBjbU0bMitIIlteEA4YBR3nwsok5ENAY00zuKB3mH5SmWSC2s3d8n+QWSljONXu7cOm
	wakBxInxQuactUvAv8p8i60w1/mtejS+MtmtSL9oBJ9k/KuOfWb+DzJGG65JHvHY8ACBY7BRVJU6Z
	RSqgQd5fs8NXglLL4eWwKRVYH2ggOqLWRGfqItCbath+y9vzWCo76RIzs7wwJF6sRAtlhiSYstSxO
	lJL7LSZjmH6PB+kANWMA3TZDB79Dly/rXJpNaeAQEojUx0m80ebblzZW1+Su8jfrCN+kY3l+xBD10
	henJz9wA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKUV-00000002Max-1aOj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:43:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso39075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741779792; x=1742384592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DRboL7iXAangnAe10zAw/fnPXaxzgNmenGuCjK+wlo=;
        b=PgBZ5seaugSIcUEK1q/Ie4Fx5PDrP9IW/4dzxSnOTcs6nmlvXaXVPG605DjeXW2Sff
         8+LlMwj2DU2+oYdlFltwy3mAmRtw1x05belBl6RRahVB6jSCzgNwdHI9WBIEEEZD0LAz
         GrHEeoExMuT6hu8wpeOMb7D2+/kukGqATtWsFWTWYRgonMtIDBYBbGoSJo8x45Fy/pd6
         W7ZTKGYRy2hltkhiYeTNs1IGOvNPz3dEEGcVUdAdAGHSr3KkKGX6ScADWXv8aY8uO2e3
         jFNgszgLnz2OYEetmS9uWZl7Kw5FXV5YevQdQEH5E4bSHvTKvWTTjCDD0bDlmrKhiZKR
         B59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779792; x=1742384592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DRboL7iXAangnAe10zAw/fnPXaxzgNmenGuCjK+wlo=;
        b=VJxek0czDObOUoAPpsNZlfZJjm2C1hsAZAMFQos//DgcPaoJWq4hvuzWwo4k4NQCqQ
         J7vPyhyawxxbcw1VB9Fyh7jFhRWfK9+fHDp4M04D7lz0F+6dqV625ruwpyPjl1K04bkT
         EoDbcPNA5Sm5YV1c8gudkTWaqkkZTS2v6VgffszQf4ieWmJStsLssF+4pIGXcVeD6Jl2
         ItknT4SvBJ1cWjDeAbBiwHJ80qaAm5HHeFw9sCYI0qBBMqWI1Qmp8GpzfqYFIVBD8uaX
         CX+wbsc2JI8RmLPrZZOYoJS161y8QK4kPqtrm3pCyGWTjZe5mNq4JK0D8+hRmJBaCHd4
         vTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4yqdIidaqk6qS3k63fvwzK6WCUFZaz5dleUWIJbga7DW4qeiJnSO6uUxe2LjDXe1qMcJEIS7tVr8linEULXDn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs+paWsGF4AKsyKPUt9MW4RkNu89qAwtNRqlRMjflIamB7kLwv
	Tdphv8qwsOvakBO+grIpRQAwu57r9d03EZtfTHWHVCqygsjWGA4mf8MVala76w==
X-Gm-Gg: ASbGnctwEpd5L6zN4Deb04VINCUSpe4WiNAXgYUwQK/ahXDDijQVmMy/uca5lfyVQV/
	Bp7IvofAojeenEKX8gcLOFBjrgasLoL/pe+qzaXna7Jbo92V7D6LlZN8vNgH3fBn/V0Io6nozro
	W15N1Mx2Hss1sj5PTdo84At35U32LH3Yg9BYfxDzHgMqFM7Vf0ZSWIX4Nn/7H7VKIcVk1Bbq8th
	7IZ2GG4zlD0kvASBiLdI0jEJcS0BP4ZiKxJ+kZVc/N/m7bmv5v1/71KrHeIYipc6pI5NIEje/35
	vqH7BXEuSVQE6J0XOPlpODZLd5QYLp8liK5HH+vYdTbaF5XYlE4CMCHBZQT9gE5ekd10HuUTtiG
	3VRd0
X-Google-Smtp-Source: AGHT+IGAlRZ9FGEpVbzn9/E/l/2Ksb4Pgfv6rI6D7I3wU6Ogl1uoOZwLKHkEYMZpOjmtLPXmOnf3OA==
X-Received: by 2002:a7b:c8d1:0:b0:439:8d84:32ff with SMTP id 5b1f17b1804b1-43d0a5e40ccmr994365e9.3.1741779792013;
        Wed, 12 Mar 2025 04:43:12 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a72ea88sm18970735e9.7.2025.03.12.04.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:43:11 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:43:07 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 03/23] iommu/pages: Remove
 __iommu_alloc_pages()/__iommu_free_pages()
Message-ID: <Z9FzS-AzZNzYhrou@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <3-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_114315_544762_639794D6 
X-CRM114-Status: GOOD (  23.96  )
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

On Tue, Feb 25, 2025 at 03:39:20PM -0400, Jason Gunthorpe wrote:
> These were only used by tegra-smmu and leaked the struct page out of the
> API. Delete them since tega-smmu has been converted to the other APIs.
> 
> In the process flatten the call tree so we have fewer one line functions
> calling other one line functions.. iommu_alloc_pages_node() is the real
> allocator and everything else can just call it directly.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/iommu-pages.h | 49 ++++++-------------------------------
>  1 file changed, 7 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> index 82ebf00330811c..0ca2437989a0e1 100644
> --- a/drivers/iommu/iommu-pages.h
> +++ b/drivers/iommu/iommu-pages.h
> @@ -46,40 +46,6 @@ static inline void __iommu_free_account(struct page *page, int order)
>  	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
>  }
>  
> -/**
> - * __iommu_alloc_pages - allocate a zeroed page of a given order.
> - * @gfp: buddy allocator flags
> - * @order: page order
> - *
> - * returns the head struct page of the allocated page.
> - */
> -static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
> -{
> -	struct page *page;
> -
> -	page = alloc_pages(gfp | __GFP_ZERO, order);
> -	if (unlikely(!page))
> -		return NULL;
> -
> -	__iommu_alloc_account(page, order);
> -
> -	return page;
> -}
> -
> -/**
> - * __iommu_free_pages - free page of a given order
> - * @page: head struct page of the page
> - * @order: page order
> - */
> -static inline void __iommu_free_pages(struct page *page, int order)
> -{
> -	if (!page)
> -		return;
> -
> -	__iommu_free_account(page, order);
> -	__free_pages(page, order);
> -}
> -
>  /**
>   * iommu_alloc_pages_node - allocate a zeroed page of a given order from
>   * specific NUMA node.
> @@ -110,12 +76,7 @@ static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
>   */
>  static inline void *iommu_alloc_pages(gfp_t gfp, int order)
>  {
> -	struct page *page = __iommu_alloc_pages(gfp, order);
> -
> -	if (unlikely(!page))
> -		return NULL;
> -
> -	return page_address(page);
> +	return iommu_alloc_pages_node(numa_node_id(), gfp, order);
>  }
>  
>  /**
> @@ -138,7 +99,7 @@ static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
>   */
>  static inline void *iommu_alloc_page(gfp_t gfp)
>  {
> -	return iommu_alloc_pages(gfp, 0);
> +	return iommu_alloc_pages_node(numa_node_id(), gfp, 0);
>  }
>  
>  /**
> @@ -148,10 +109,14 @@ static inline void *iommu_alloc_page(gfp_t gfp)
>   */
>  static inline void iommu_free_pages(void *virt, int order)
>  {
> +	struct page *page;
> +
>  	if (!virt)
>  		return;
>  
> -	__iommu_free_pages(virt_to_page(virt), order);
> +	page = virt_to_page(virt);
> +	__iommu_free_account(page, order);
> +	__free_pages(page, order);
>  }
>  
>  /**
> -- 
> 2.43.0
> 

