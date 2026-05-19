Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC24BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eckcCpi0xrpFbE201pgVvuYoNal9URjmldCWt34Ap8=; b=0BgLtCo/1EkxWOIS1g1BJKhVqI
	YQp848FDs6izNBEAlCzvnZSCcNpwjPIYQIr/WFvwGBsK94R9pcr2OCB6dirg7wVwFGJU4KiOe/N93
	VVHT+kV0J9CQ7YiYDOFqT18lqiosf7f2ci0wZNqjdk2KRjsW3BKPU43ltxhJfx47Rf1veqquBti0f
	dMfruouaDwX02sl9Qmx4UdvGFxrmTIFxzdoSvUMrNTOGzmurZaiTKH8+C6LAq3DJCONFpKXo+/twE
	K9kEKjqIaEocHB2YvWWorYhJ7MI+q9lwmzA1LfdkC2m6LM/CzA+vsVi+2bcWk61ofht2qB5nHIDJH
	qXIXKSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL3p-00000001lKT-16up;
	Tue, 19 May 2026 14:04:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL3n-00000001lJz-3iNO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 14:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/eckcCpi0xrpFbE201pgVvuYoNal9URjmldCWt34Ap8=; b=NwvvwEDDcFs9Le7s9pjwEGLwY9
	k+6nCxKC8UQkUyC8cvf5WHVcxwfTDfsiQEN029BWooJrljj9p5jUWfSf6ORMWH82gH7ObcWzfdBH+
	iCMTUMPSo9VgM69NjbcYCaLRLYwdgmhQZKHsaiUhrvWl9DbYgkQXbJnK2j1BEzN3QSuykRT4XtfqH
	LPywsRlPQWMDGI1+Ldr/uxw5+mUzopasz+3PPlXWfys/PLrbxOmifHd2Fna8F8o3/5pAc4a7gGFXo
	sQ1mupqxIY0AoF0EVqzAPG7Wnd2RstPsZROIDPdscBPwx4pL45ITSpvxPb/GUaQr8ZYqwO9Q8UwVo
	/urcNORQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL3j-0000000ESFf-3yoX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:04:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so3065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779199474; x=1779804274; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/eckcCpi0xrpFbE201pgVvuYoNal9URjmldCWt34Ap8=;
        b=Q0yISPQgJcga+D9nhPm5/uGtg/T1rZjkshHGKF+J168qaDTImqSVyc2SWZV59My+fz
         uprTG9QRQ4GYju7Rggk8w3e1RWE3DzUNE9BQEMrmSyCgvmsS91PkNwXUzErW4uo3tBAy
         0PHodbORCT/pOJbL9iJvREQeqoReRhxvI8qqOa1FRxyTMEz2WtV3d0MH7C0hO5ZIyfb8
         9eYy12bguL3RDzhH2Yzi0bYbkEu5tKLtoU7+yT+OXJWi/Y5PG8vPqaWtPYtv4bWipbWn
         CrQjbVQv1ydn1C5TP16SOKu26fRkZ16/k4J/ZYop3rGYFg4TjFcFJ+ciDDmvv/NrZxMJ
         Fu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199474; x=1779804274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/eckcCpi0xrpFbE201pgVvuYoNal9URjmldCWt34Ap8=;
        b=s+BjMlc91nLOfJA20M4jLql+lMJ8bbc/LWWNpJQgGOrmxVuQJecIcGMseaX6jT9h4n
         PFL0x0iaYX9hdweh+fQ/Ygb9hFrVGdEtptmdH5q88Nin+p0tL+K7RmmvI9f2VLtTmosU
         LVLnns576R4TS/Tw7jXgrF5/x4K87BMc4xWrx0Trmd3BATFVYao8/Qo/tSQL5NFKgYBj
         YI/3HZVmU2aeMTkC/zVwKFXCcYZTzVAXQcQAIZHf5Hmbh+AwGPZFod51wYbsPAheVnb+
         dQZN2P7+y1nQUzQza3Rupu3PyI78aETonvUjuh1+dSHmb7c54NGbbS232FW1AwZRXcK7
         Xcdg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZPSY1U8uiZwmUHd0qoJCWoPKw+c95NRiX8Qan/t782j/Ob8kMcoprfdwPW+2xKUZzUY48TkLfpV55TNuPRYMV@lists.infradead.org
X-Gm-Message-State: AOJu0YwjwrBlJ9qXLra6QNfsQIb5J8R9EE+8bqyxwUsj0W2b2UTKrph8
	ydKeM4Gdq/SIadH2l61HMA/3wYGDzYRFe9hZYik4SqvtmfR1BjY+jh2ysGM40Opxz8Y8XTXVHFu
	rrFlmzXX7
X-Gm-Gg: Acq92OGNjWSTSMn4ng8NK0MGtb19j0+6eDZ6JtDVwdfpwVXnu18QVaTyDjrGllsqeRi
	rVXR+tbZtgC+9Q6kOfo73X18JjFBdHds58D2ED9i94VaLz6yNrrqQ6AwCLUC5bMGpDSmf0pDvtn
	VAAUHZhTTcA+7wiivsmNCq/yn3pYI4HkUbXXSz2/cFBdINDOiSqchZh/g/HZIz/2Gh/wItYSZF4
	MAoCgy6RYLZWWA0o116EhlnDP8qohrSxFfXkIog49VQ0eS4iQbj3312xIpLyXv81cwOKsYFAgwL
	J+bciQpfqEVljdrkTAEWjbh3Vw55k6w4KbZczLBwb/8LuOAaS95mlLBhlBCgro3BfQEYkLPxXE5
	JOYuSHYqMzF43Wiog3TnM1tMiAf7wn/wVhQSxm/AnKCaIKntCFS03FFNx7I1/YlRym9msJypuG4
	n/ZOBeZJbejO8nEq+zwytVK5NeTh33jY4Zf6opYnC5NftZPtgwZI8/8tzQgFWvkXdGWmGZgahIs
	vM=
X-Received: by 2002:a05:600c:621a:b0:489:1adc:f017 with SMTP id 5b1f17b1804b1-4901573b1a3mr2225915e9.5.1779199473882;
        Tue, 19 May 2026 07:04:33 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19b1dsm45189665f8f.17.2026.05.19.07.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:04:33 -0700 (PDT)
Date: Tue, 19 May 2026 14:04:29 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <agxt7SFGT7OLMIah@google.com>
References: <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
 <yq5ah5o3sdn3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5ah5o3sdn3.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_150436_376282_321BAD3C 
X-CRM114-Status: GOOD (  26.88  )
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

On Tue, May 19, 2026 at 07:30:16PM +0530, Aneesh Kumar K.V wrote:
> Mostafa Saleh <smostafa@google.com> writes:
> 
> >> > 
> >> > I am still running more tests, but looking more into it. Setting
> >> > force_dma_unencrypted() to true for pKVM guests is wrong, as the
> >> > guest shouldn’t try to decrypt arbitrary memory as it can include
> >> > sensitive information (for example in case of virtio sub-page
> >> > allocation) and should strictly rely on the restricted-dma-pool
> >> > for that.
> >> 
> >> ??
> >> 
> >> Where does force_dma_unencrypted() cause arbitary memory passed into
> >> the DMA API to be decrypted? That should never happen???
> >
> > Sorry, maybe arbitrary is not the right expression again :)
> > I mean that, with emulated devices that use the DMA-API under pKVM,
> > they will map memory coming from other layers (VFS, net) through
> > vitrio-block, virtio-net... These can be smaller than a page, and
> >
> 
> Don't we PAGE_ALIGN these requests?
> 
> dma_direct_alloc
> 	size = PAGE_ALIGN(size);
> 
> iommu_dma_alloc_pages
> 	size_t alloc_size = PAGE_ALIGN(size);
> 
> 

For allocation, yes, and that's fine because we bring memory from
the pool.
But not for mapping, as dma_direct_map_phys(), where the memory is
allocated from the driver or other parts in the kernel and the page
may be shared with other kernel components.

Thanks,
Mostafa

> 
> > using force_dma_unencrypted() will share the whole page.
> > And as discussed, that leaks sensitive information to the untrusted
> > host.
> > I am currently investigating passing iova/phys/size
> > to force_dma_unencrypted() and then we can share pages inplace only
> > if possible without leaking extra information.
> > I am trying to get some performance results first. But the tricky part
> > is to get the semantics right, I believe in that case those devices
> > shouldn’t use restricted-dma-pools as those should always force
> > bouncing. Instead bouncing happens through the default SWIOTLB pool,
> > if not possible to decrypt in place.
> >
> 
> -aneesh

