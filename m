Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03832FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psW2zn2RKA7mDVnr8upNFQH0mArJi5iuTG1xm14kmUs=; b=hcb/nz3li7jHtAZs8ozLmGjqo8
	1qWr4ucrPMXmv8lEWwEYb70LaLPHHoZedIibSEyim32iffn5ZlhmdGedoQv4eH+OIkK+Sn4NtpPbk
	Xw6jAf31KhhIxeC8Bau1SePgK0S7vR9nHCQflqmFrFJJ665NmRQQ5vi+tQFTdwydGUqtAwEgSm7FG
	9P481E6EfHIGuQg7e5GzwCePCbINyUn8bbEJj9Fl+feg+XMD0JMMdUqpYHrVhuhjfgeejU0400ZKm
	yfTtwgeHn1w9FnPG223jjx+WD0XOEM4bfY4HQNXWMP5iTzfBxM2rzIUUgFm8aG9Nan6BLsBxIfpe/
	NAhHtKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIch-0000000Gsw9-01um;
	Tue, 05 May 2026 16:27:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIce-0000000Gsuv-18WB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:27:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891b0786beso36886245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777998466; x=1778603266; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psW2zn2RKA7mDVnr8upNFQH0mArJi5iuTG1xm14kmUs=;
        b=lWA/aF4AnZRMVegibBk/o94MP1wKxSNGS+SdWtbS7PXaOVRIMsa9ciMW3R2z8Iixaa
         wDJjDs1D5gwbs168WKh0ghE/H1abypkU0XDdKG2V+KFPz3pw88MNHnlYonP49ya9hgdS
         YyA4O+LDo4qvRIN/yiK251Yi6nD/hnQ7PZG7vs0X67tN7R778Fb02t53noP8qbLvyA/R
         g6dTsF42OKwJ4DZZJB4NEKwiXTXCGfEEOcAQcvRxWJhq4SnHrzk8LCT+U8s6hMykrWLd
         DVA83qcC9nynvmoPHdCyiNuuo6vDP7UH/ef6XJrnttTKrLyETOHwbD2T7CUv80b3ZJYe
         zYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998466; x=1778603266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psW2zn2RKA7mDVnr8upNFQH0mArJi5iuTG1xm14kmUs=;
        b=c8tXIZzQ3TOPyNmL4ACuYyxLqulslVfKqtP3FPAOL6p6Tq43NfcDUjBfZwhXIuBDfJ
         CTny5RjjPYKT9HVsrQFt60/n8bGYTHWNSl47yW9dK9DoFXb3Gra6dbEmq4p2SZYLuqyT
         9mt3xdJZ/bKcjdYk+nApZ7cotRB2sRqe6eEus355yKZb9BJYBw1X2I4NS0nVpffmNpVy
         37XI7F6EuWRObReuP36MWEnkWdRU6fAml8f1VSJcbQfFy5ivl2/AJi7sXqpoCZnm5IRc
         z/mFDE5K2gXBA3zRqpevDIB8hu19yJddGAwAcUEPx21HOXJB/uVhZp6nlhSwDUIJ0Mbf
         P2eA==
X-Gm-Message-State: AOJu0YwLdmWafoHY7j6N4K5tFXmm3oVeMRbFrF+zapjETe+cs2wg7f6s
	xL2DZAEuIjy9GfAYvI5FiXQ3gwFrQJOIdzJ8giJTydGaa85sQG5HHA0ICGzvY46l+TI=
X-Gm-Gg: AeBDiesXWmFuhUiULl55wAiFRMmNvG6g2dp4+IoQwRhjkAHIlPEVI/MZ9EMSHOdjqWw
	jZnXusZVZB7GkKKrB2JBPFHk6YGwuDS0H/NsHzngsq/OQvMwd9C1VP/EIHpIO7Ojw/VnLAT0Ai6
	4vb5T7tjXZN8g/pFwKGOFGzI/at4CPqT92DG5SwSuxOSF3U/qa5QyaKsP98FZtCLl6cmp8Sushi
	gQg1DqhaeQ9Ah2GAWhREdMYjBSwJhjZ5lt4HsX53X5Z02hO/U+ouP2o1vLxC4OEdXhwJzLGfPtz
	M0CR2dtoKkqE021ej9ACzVOFBjmULMu90AasFg92QWJ5rxVRROVpw2L9hbC/p7tZPZXtJHyo6ep
	tFBaE//gzqHfQXTEb1kZrZ4foxTO/RO/HIzG5aPcOxC4f6wksTjoUsnX6OUSjg/4yw1glYN1HF3
	vnxQcDoTw=
X-Received: by 2002:a05:600c:3544:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48e51a6229fmr2708455e9.5.1777998466365;
        Tue, 05 May 2026 09:27:46 -0700 (PDT)
Received: from ziepe.ca ([213.147.98.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ebb3dc1sm381506775e9.14.2026.05.05.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:27:45 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wKIcb-000AO7-2w;
	Tue, 05 May 2026 13:27:45 -0300
Date: Tue, 5 May 2026 13:27:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <afoagb/wVBJD1IX+@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca>
 <afiODW2sVMeOj3Ag@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afiODW2sVMeOj3Ag@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092748_322147_3341F226 
X-CRM114-Status: GOOD (  22.84  )
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

On Mon, May 04, 2026 at 12:16:13PM +0000, Mostafa Saleh wrote:
> On Fri, May 01, 2026 at 09:47:16AM -0300, Jason Gunthorpe wrote:
> > On Fri, May 01, 2026 at 11:19:07AM +0000, Mostafa Saleh wrote:
> > > Move parsing of IDRs to functions so that it can be re-used
> > > +unsigned long smmu_idr5_to_pgsize(u32 reg)
> > > +{
> > > +	unsigned long pgsize_bitmap = 0;
> > > +
> > > +	if (reg & IDR5_GRAN64K)
> > > +		pgsize_bitmap |= SZ_64K | SZ_512M;
> > > +	if (reg & IDR5_GRAN16K)
> > > +		pgsize_bitmap |= SZ_16K | SZ_32M;
> > > +	if (reg & IDR5_GRAN4K)
> > > +		pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> > > +	return pgsize_bitmap;
> > > +}
> > 
> > I think this should include:
> > 
> > > +	smmu->oas = smmu_idr5_to_oas(reg);
> > > +	if (smmu->oas == 52)
> > >  		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
> > > -		break;
> > 
> > ie it should return the supported page sizes by inspecting all the
> > idrs and don't leave this tricky bit to be open coded..
> 
> This way was easier as each function only returns one thing, otherwise
> we have to pass stuff by address as we can’t pass the smmu struct as it
> is not shared between the drivers.
> But no strong opinion, I can change that.

Could you share the struct? With multi-compilation you do get two
structs with the same name and different layout, it is OK?

That would give a cleaner setup too because you can just shove all
this into a function and have it setup the same struct which is more a
copy and paste than break up into little functions?

Jason

