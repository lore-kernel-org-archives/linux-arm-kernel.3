Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A46C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnn6zn+vbwMdJcdlyBW4k06r7mJ5WHfKBmVX1PCngjU=; b=MzZWtXHtKsYSLbKy4XO/Sf+Pmu
	cH0fLLd/Ufsg53uqWvTZhxGfkdshcE0Ib4VNniQCTOVhUuA1S5RETniHIL0XiJQjFXTyZR0xRA12/
	EnBTWuMH/cfY2qm7n0aloxHxSXwUEpbhKEgcplKJ89fmxxXQan/svNn2FodNZMn2WE3m176xROx2B
	W5dHzFGyxNCETEUO4fVzbGKvcp8W15F4r+bOz1QQgxpioiP8Mic4Im/UgrHo/V6LZciPuAaE5tmDe
	kp4JMRIYJb7mbTpZzRO2SgwGcScREYkFxyWyaX2+NXKw6FJ1rFviz52pHx7u1bpGWUbAI0/vhHj1p
	EQnesqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cYl-00000001yJf-2Fhj;
	Mon, 21 Sep 2026 11:51:47 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cYj-00000001yIo-03PR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:51:46 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939109fafd6so245000885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789991503; x=1790596303; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnn6zn+vbwMdJcdlyBW4k06r7mJ5WHfKBmVX1PCngjU=;
        b=hRNdOo2X0+j2876ySDyXNVyPhsXK+IOrBfN1dH9yifTL+cwYhvTkRQ8+ByuWkCxWxt
         D5IjSgucuNHjDPK5AOD+6W2aPfQ94d3afV2eiZrbCS3ay2fzNPzCzDXgSFPk0pc6QrCQ
         1W26llohpDBYpQoly8cMu/hdLv/yavrO3QzRMcxHBJcvqZKK9Hbp1jGvGsCCpZ3Y6sX1
         +FDVSnjQfZ7BRsOc8kyeWNhoxbZbaXkSll2DErrkbMG/KWtrQi24HU/vJC5FyO7HwYtv
         59KsmnJLht4Pl1fTUQq/QNyizGLq+7o1muKefR1hC7fJ2M71THLfWaXLUcmusGwltss3
         xC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991503; x=1790596303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bnn6zn+vbwMdJcdlyBW4k06r7mJ5WHfKBmVX1PCngjU=;
        b=vXa8/faLWtd23/+HWC66fQf1BD26Zify3wq+UZfPi+kOIcLL0WcfxnA6TJxLHVVay5
         lrLOvTxQ+MWjyEavGtHV+MEpRrg50GU5i8rNEBIWRjUhUI3SWAHvsN1B6IN4IejvCakb
         Z8nHzMqdwTWgibJWvmXk8OIWf0Y6eyjLjXuLAwtfA02L+JljgjkG45Otv6NdL5qj1MGB
         nn85g9CqehBGQSLPxWJO9tZ9OB3kLUAQgi+DFTEUAfQmADupn1lhkgOnaEapAx1JiT3b
         W9xHKsYQ1VLbMFA5WwTgy7l8Wq8POOS4HFfRzGhOzehq+D8xuUQ2uZto5E42ule16HG+
         MC9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYJuX77Vrc0Tq2wOcpLAXLVqX6rePf5/a++Uq6gUaqzGKA+okrdEf9M0+U0ZXU9EmziQiXTg7LKFoXrxayhse1@lists.infradead.org
X-Gm-Message-State: AFuF++nJd2hAiIeIoazDSHrwSvUhFjtBTogGDB0nGDf6dusIZh0eI3EM
	GrU7TM9/Mj1nvL+zvQInVSac1/4GX+nLl8xIOls/3WA5UGiZcGVzPirCp5+MmdBUYwZUFQ79itX
	6Fubz
X-Gm-Gg: AYBFou1Ya3OfPjvspj6+EYDGZP/qL7ajzpiE11RcIHbjoVnDHQLsbIzdrrCKdmZ/enI
	TIxMsh1TCMFSyRSszBIQp625qrM7+KHRvOiOCZWgMKitU8v66ISzUBrgKMNZy6PEILIn/5ug9V+
	w19zOu8zaUzUkiXEifxmjd5MVQ0/lT71pgbpyTJ6rGCWAAPFwYsIyacSqUxVKkW9HldPHaCI9Bc
	zxd/Cn94imyVxFhj4XX6jZIVdCrHYIAZzOyIfOd4zTjM8p8o5qZ93/9Sf3AAmotgzqyZQ9+phS4
	KaoiuwWEnfaR8tJKW/dH1zQryXCp3t39WySFaGIb+TylLh3mYxTFUfhR0Acs9bzZFTONFQm7nNk
	MYbLtzZ4TiRx+pWKtmcVb9xRvZ3mkdpRohXjtQvzwEtRuy3Wf5aQ9NxO1JOtOJplEngHDeauasK
	NKS/EpsvOdLdn+NRPYaZ2+7g3OcDZm9T4HYwpm5//pJDy27jM/Utk1Y5t5/E9pTMBxzWTFXnD1B
	xfNuBhPMvceuLxYTI4PfuZx4fP9D5ZG1GB2Hp8Am4Mu11LZB6N+J/GvjQDfQi1Pu4I=
X-Received: by 2002:a05:620a:2556:b0:93b:d79e:18f7 with SMTP id af79cd13be357-93c15e7ffcfmr18078085a.58.1789991502666;
        Mon, 21 Sep 2026 04:51:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa0f99sm65421876d6.38.2026.09.21.04.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:51:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8cYf-00000006E0j-0Dl6;
	Mon, 21 Sep 2026 08:51:41 -0300
Date: Mon, 21 Sep 2026 08:51:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260921115141.GJ11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_045145_117275_5BF982A7 
X-CRM114-Status: GOOD (  21.13  )
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

On Mon, Sep 21, 2026 at 11:07:17AM +0200, Christian König wrote:
> On 9/18/26 18:53, Jason Gunthorpe wrote:
> > On Fri, Sep 18, 2026 at 05:39:55PM +0200, Christian König wrote:
> > 
> >>> Arch code can figure out how to do it. If some ARM configs only give
> >>> order 4 folios or whatever then dmabuf heap doesn't care.
> >>
> >> The fundamental problem is that DMA allocations are highly
> >> architecture and device specific while Linux memory allocation APIs
> >> are generic.
> > 
> > This isn't a dma allocation, this is a memory allocation.
> 
> No, I mean this is a DMA-buf heaps allocation. It is a DMA
> allocation, we just don't know for which device.

So? How is it any different from the existing alloc pages?
 
> So ideally we should use resources which work for most devices in
> the system.

Which this does.

> If a device has special allocation requirements (CMA,
> restricted addressing etc...) we need a specialized DMA-buf heaps
> for it.

Those things don't really intersect with CC, but if they did their are
already heap names to request those, someone can add some shared
restricted CMA option if they need someday ?

> That userspace provides this cc_shared flag is a NO-GO to begin
> with.

What do you mean? We discussed this with the heap maintainers and we
all agreed this was a kind of heap just like any of the other kinds of
heaps that userspace can request.

It is *exactly* the "special allocation requirements" you are talking
about above.

Jason

