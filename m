Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A25C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKoljqZU8Nwxrz36bE/WLCNEgSRa/n5CLFAsiZ8BcVQ=; b=EW9S9Xo2qLBI5h7XLCYVEkLrYz
	x00zH8f3omd4RxKfzcPUCtMmFudk4OYrvHOqhxNn/QepyhdW1b4kvNJweZq4gQa26lFaZasWOhXfV
	vC4NomqqJ3lEFygR2MU7hI9RWl70+OiLjgEJU6zUhBplqvR49rVqjkzDwYJsPt1l+K3pZbQtDzlYj
	w2RTy1UMetM0pAWyiwEBpqRXYQ8p8P9YD+SZIlz8NXLPqtLyyd/GDk5ZLt35+DwTw546I0GMkLgAV
	OFQsD1Kz1bCl/jW/yqYmLxoU8QYWI6pFBHYMNlliiqYRtIPaa/3sbdPtJG6nVzAPOUhEewZnDUPlU
	MvU1G8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LwE-00000008E6t-3VZq;
	Wed, 23 Sep 2026 12:19:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lw1-00000008E2D-2iRl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 12:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yKoljqZU8Nwxrz36bE/WLCNEgSRa/n5CLFAsiZ8BcVQ=; b=YITd0Tp7g2Ga1t/qse5zE4d1JF
	ykTpek7GcmxhlIXSkYZxdZXgEmG2ST40louRT9Mzf++RTTPWpxNL49Vg0l8EzHxhjgADon8/5wO31
	N5yYpGEm3DhI1oqlOdYRBgzeLwl7/iVoTCHiXy2jftohcQukGxlssL7OQLjAobH+Tr4oMxhsdxc5X
	e/YH0i2U+1hA65C9GhcBAuH88pHK+xqvlLiFtw9jliLTQnjAsMcr+PNZbmIe4gG9qL4VurJzI5mTZ
	sRuUhFviNoFFpyUrIYIwOs9hX3gU8YofYzAmvjBgZ/iiYR5dhW1WCs5/6Bi3YlrVHscicdK5nPJ/v
	s4nRXw8Q==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Lvy-0000000EkLe-18uZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:18:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-498012a61f6so33965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790165924; x=1790770724; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yKoljqZU8Nwxrz36bE/WLCNEgSRa/n5CLFAsiZ8BcVQ=;
        b=PgWxNoTDtPnnglNIvhl6lrhSyB5AMCOlY19mgPG53p+Pcz4RF1cZh01c3T/bMojX7e
         /0GA3sF7E1BdK/lZWS5ZCg7Zzp+v4qR6wxZ2GC6aCvNfIltL57h47+6JdtoFOB8cdNvR
         Qppv+zTOeMof/D/KCpvZL1XhfUOCWe6W/+k/7Lfow6voMNrdlq5FIURPYDyf41y8KTlY
         b3md6JldU1FE3FyOWkB3VKgCN2YcuV1T6lb29nEeTqaZnIoRh4cbOC3VJj0SesvRvsv2
         NQwlRFVQ4q2K05hcj6uD0zfup/O1rdps23sInTGaiK3NIDiGjnEHTgI1I3PAIasGz1hU
         7ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165924; x=1790770724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKoljqZU8Nwxrz36bE/WLCNEgSRa/n5CLFAsiZ8BcVQ=;
        b=VQc57plqpffXQCAXS9OnZrcg+eWV/+azNzDZJe5GOYvOkgjph9wEWY6860+wGtegjV
         d2f8bK2WsmyBiUN88QWAXCdHOSw4JXgrpzeyHNgbAs0CAlE5iRoxIZWzMOku8FXKW3TF
         a5tOtXASZEf4paydEomNpsR5LsVeJm7eCYBAbkinmkP8ZZ4LyUq4Xez5EjPlGGeS5osM
         MBRo2TRJebYANhN787dobmDAtaazy9ooviO2Vb/yTqELlpxDe7rOYOj81eBbfKrdppmI
         wEN0gPkKApkPGb+9jnBdDGvuebxo2TDi3VdNP0/al8yF27si4iT2goYSbxlYF6+zvg3j
         tknQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxzsnJk+v/F7zuaA3Bbs8fCaVDI5bywY+wJhSM64Orx3LDXOLm2tPvWbMYovNhDUrWPAne+ug+PO2v7K5YXVaF@lists.infradead.org
X-Gm-Message-State: AFuF++kh1Sc2PH3jJTL954hUTqwyIzjGW8pAHeY4sseD4PWHteyepfBM
	SNlbp1QTmHQp3wnsesKDCC1JHzqBPpdSV45en7XoG4/DQ2yYte/CeuBkW4XJjxsi6Q==
X-Gm-Gg: AYBFou0Xo4gnCpSncT6uxbb1XblqXvtADUjo2755C1LbhNQls5CNdsup/CEEqBTyaDO
	PsQji808znAdxoAqvs26WOvJtY4uyCSJXVVTORJsO2YrpkqvlbCzFBQJO/RsJUJuMJELF10shd4
	NdbgHJPEHjHLu7FqIKcwp/jh5l+LHtNZhxqWTdySEzOQxwgLuX8wcAE0LjZvfuyGvYGwWyOhfBi
	JJzdJJ4c1hw+e4dmIvUcdKaI99GE2b4IQKc0TY1FK85CSW7jYQ4cFvyEL9VeJdofKhjyGk9xH5v
	sE5UotkEB5RrK1BQ6BxkWR4sgFqhWs3cSouNpPSbb/2YFj6I/NxggxmhVeQe6bUh799GPTMe9Xu
	GylDLJTlRdx5L/KomFkvZvy2Kszemv7bRISOwuPVarvUlhfKWE8DDfRfXDmkl483Vm+FaL4tr+O
	Ir+fCYafLmFG05FGCHsKkpzSBVTMDIc010j8erJVUIUHd1ujKICIdD3PLswo0yyff6m0FE2WtI8
	hdwVaUBAJQkg40aKNZAXxuwK+UFujoxdUoAGexo
X-Received: by 2002:a05:600c:3b86:b0:49f:e1d3:fe03 with SMTP id 5b1f17b1804b1-49fe1d4031emr732825e9.3.1790165924117;
        Wed, 23 Sep 2026 05:18:44 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm90764065e9.3.2026.09.23.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:18:43 -0700 (PDT)
Date: Wed, 23 Sep 2026 12:18:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <arPDn5c815X72PSF@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
 <arLa0E3xq5dGuPpd@nvidia.com>
 <arOlQtPYzF5yT8fP@google.com>
 <20260923115257.GC2545495@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923115257.GC2545495@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131846_534904_8BEF5118 
X-CRM114-Status: GOOD (  29.73  )
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

On Wed, Sep 23, 2026 at 08:52:57AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:09:06AM +0000, Mostafa Saleh wrote:
> > > > +	if (coherent && !disable_msipolling &&
> > > > +	    smmu->features & ARM_SMMU_FEAT_MSI)
> > > > +		smmu->options |= ARM_SMMU_OPT_MSIPOLL;
> > > 
> > > Will pKVM ever use MSIPOLL?
> > 
> > No, this version does not support MSI and hides it.
> > And this check can not be moved because disable_msipolling is a
> > module_param.
> 
> Could you move the above if into the shared area and have the callers
> mask off options if they don't want it?

Sure, I can move it and pass disable_polling as an arg which the
hypervisor will set to true.

> 
> > > > +	if (smmu->features & ARM_SMMU_FEAT_HYP &&
> > > > +	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
> > > > +		smmu->features |= ARM_SMMU_FEAT_E2H;
> > > 
> > > Why is ARM64_HAS_VIRT_HOST_EXTN left behind?
> > > 
> > 
> > cpus_have_cap() can not be used in the hypervisor.
> > Also, ARM_SMMU_FEAT_E2H is not exactly FEAT_HYP. As it defines the
> > world the translation lives in based on the kernel EL.
> 
> But don't you need this FEAT to issue invalidations correctly?
> pkvm never issues a S1 invalidation?

No, STRW is enforced to zero (NS-EL1) with pKVM as the kernel must be
running in EL1.

pKVM will issue S1 CMDQ_OP_TLBI_NH_ALL to invalidate all of S1
after S2 changes and invalidations.

> 
> > With pKVM at EL2 ARM64_HAS_VIRT_HOST_EXTN is always true anyway.
> 
> > And the hypervisor never owns a page table itself, so it never
> > checks this feature.
> 
> ? I thought the whole point of this was for pkvm to own a S2?

By own I mean "it's own translation regime" as if the hypervisor wants
to do DMA itself (synonym to EL2-S1 translation) in that case the
hypervisor will have a different STRW and use the E2H stuff. But that
never happens, the hypervsior populates S2 to enforce isolation of the
host but it never uses it itself.

> 
> Maybe same as I suggested for MSIPOLL, set the FEAT and mask it later
> if it can't be used. If KVM implicitly knows it has
> ARM64_HAS_VIRT_HOST_EXTN then it should operate with ARM_SMMU_FEAT_E2H
> set.
> 

As I replied to Nicolin, the problem here is not the FEAT being used or
not, it is that cpus_have_cap() can not be used in the hypervisor.

I think this can be replaced with cpus_have_final_cap() which should be
the same and then move this code also.

> > Otherwise, I think we can move this check and use cpus_have_final_cap()
> > instead as it can be used in the hypervisor.
> 
> Or that, I don't know the difference

I will try that for the next version.

Thanks,
Mostafa

> 
> Jason

