Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76BAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TAFKlJ6U7QCklm7PSgnN2whltr6YSbd0ouHsKVqiJ0=; b=h+zRtKzUTc6K/aH7noh+qGzOW7
	C4BgXqFBx6oCG1oifnIeIyTIhsP3VGCBoDN37d97lKWIdK7oWQkC7o2MSc/cHGwgICjWRpQB5Ux1Q
	g+iw2ODZ10Hbxis6rvd1aoVRRpgqmBeBCc+Fzwm80Cnsw9YcGsTKVoRQdWx81uB62bgVcUd4Zo0LE
	gEK5syJ/RmgDKgxIQYZNrMTKC0f2f+raS9oxvIZtcB7TyTpdl9Yy199ep4dTAcer42cL8lMqR1eCc
	eN5o5S5SpOx8L67axMYjKhB8cJIRTWeMKQ7Iaq0bLc5NcDlXld9vOVEDAG3UeBjj42pXSRLVV6S4O
	uvRGDNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjlA-0000000DJck-18YJ;
	Fri, 03 Jan 2025 15:38:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjhv-0000000DIxz-489I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:35:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso46525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 07:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735918525; x=1736523325; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7TAFKlJ6U7QCklm7PSgnN2whltr6YSbd0ouHsKVqiJ0=;
        b=LSdWaaq37kz6vgXDi6SUoC/OJHxO8jOXbcm1+40D/9TzRnaJOrOroNwkWUx3fbU6u6
         xGnYMFwxNnJSVMwNOoIid4rsUJrXPTjVWiK4cQUqpUoQIqiOwHxHuZKVNmiViMrh+Is1
         GzKP8NHpeAx38/SImEKpTuIBDoZJ50pWTqMtlWmu9eWziStmKrY+mSefNR1FBd9hySFc
         fC2pK1MzmTtu/bsnhQIEMEo3QHJEzMJ0aOOIxIUoGkt0w1MNlvHLnJKRfXUjEr3EpHUa
         1W9OR8XKuqwmm5tVDp8oXNsYEWAeK2Rjjp3YWAZRuztBKmOzxI0i7jGb0LEXf7GxL6MT
         WpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735918525; x=1736523325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TAFKlJ6U7QCklm7PSgnN2whltr6YSbd0ouHsKVqiJ0=;
        b=Dn5qzpRUjouXHeqzpJhdFgn3pJIVrdqGTKlPaiZoIwq5XXc0yJXMQAGQGIg6PSAXEz
         HbyEUz4spZFUCWBT8o9KqiEuagO0WpHOId1wYkRLw+bpApL4scwn443fxtgVm+w1r7as
         CVtmv60TzByncbaMtPtTx2R93GYhh9wMmCuiIwqCaY0X7lFQy1hvB+PGdnCSJRnQ8N+5
         R2JoKnbvedm2gFX5R5Z3NLewt6UiYvDTHQOeXt/heGQjtUwr4KtCjzumxpsLQS57ApgK
         etxYie+6ILLzOUP1mrcpv4XKIa6bMBn3cnPwbZQTlfLdgX8qYF/zOGP/OyhEMeovO9cV
         iOUg==
X-Forwarded-Encrypted: i=1; AJvYcCVEQszc4edC6VFh5mVor9r1q1YHdI1j8OaAepp3UCReJ79do1Unt+VW1PSoqTOfdO51qoq0hLBhQGpF86OlxMV6@lists.infradead.org
X-Gm-Message-State: AOJu0YzSmHwH1UkoMyaJH9QIOMStvWfAUCrPOyVCbuB6P+3Rp+ouf9xy
	9BHOa+rrwcZ6VSZvvwnGlzlggZBaXOgWRo14gKF9pMrQs3beFKkDVcwbAYGlKg==
X-Gm-Gg: ASbGncvx3W+TnwEEx3nc5p85gxcPXP4ER6FnD5LzlRxvNfXEW+keTmdPGFBYEPCSzMs
	4BhzQz8Guz5seGr6rhLYslMakcCYmae0eDXACMya6FRYQROsnTlZP3/H+uxZrcq9Qvy0MhCb7FJ
	H2MbFk/SHhRyTCaU53sZaOwPQxXRwcHh0ehy57nuIXqw22RJFBGTFaUD9reeXScq1DAoWEfEiHx
	kZEZxm3XyK7XZMJkahH4Wq/Pb4rHJqvt/QxnmLvWLTtXHmDNky/wr2WXlDn19zAb2XZejS6Zeou
	c356Asf7zdQw99yNZVc=
X-Google-Smtp-Source: AGHT+IFYpv295mC4BjSl9FSXlia/fjrHlkEb0FIGQ5Me85JthE8z4rdE+//UhwlzrKWnZRqRsAmKQA==
X-Received: by 2002:a05:600c:5788:b0:434:9e1d:44ef with SMTP id 5b1f17b1804b1-436ccb413f2mr875415e9.7.1735918525147;
        Fri, 03 Jan 2025 07:35:25 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832b32sm40339218f8f.23.2025.01.03.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:35:24 -0800 (PST)
Date: Fri, 3 Jan 2025 15:35:20 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	robdclark@gmail.com, joro@8bytes.org, jean-philippe@linaro.org,
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com,
	tabba@google.com, danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 55/58] drivers/iommu: Add deferred map_sg
 operations
Message-ID: <Z3gDuPe5C1Uj7y4m@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-56-smostafa@google.com>
 <ce4c8db4-4895-426b-8d9d-97dc5d74fbc4@arm.com>
 <Z2Qshft8lQjI-x7c@google.com>
 <20250102201831.GB26854@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250102201831.GB26854@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073528_021964_6C990360 
X-CRM114-Status: GOOD (  20.84  )
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

On Thu, Jan 02, 2025 at 04:18:31PM -0400, Jason Gunthorpe wrote:
> On Thu, Dec 19, 2024 at 02:24:05PM +0000, Mostafa Saleh wrote:
> > I had a quick look now at s390, and it seems a bit different as they only
> > notify the hypervisor about the iova range being changed, and don’t need
> > to provide iova->paddr mapping which pKVM does.
> 
> Can you explain this statement some more. It seems strange to me, why
> would the pkvm side, which has it's own page table, need to be be told
> about the iova->paddr during range unmapping requests - and why would
> the host/guest side have to unnecessarily store this information?

No, it doesn’t need to be told about the paddr on unmapping.

The problem is as follows;
- With the current IOMMU API, an iommu_map_sg() function ends up looping on
  iommu_map() which is very slow as map is a hypercall and there is a lot of
  context switching.
- So, we add a map_sg hypercall, instead of consuming the kernel scatterlist
  which duplicates logic and can be complicated to do. A new iommu operation is
  added add_deferred_map_sg(), where at iommu_map_sg() instead of calling
  iommu_map() it calls add_deferred_map_sg() to add mapping, and 2 other new ops
  also added to create and consume a sg request which comes from a single iommu_map_sg().

The drawback of this approach is that it adds 3 new iommu_ops with a bit of niche
semantics, which for now only used by this driver.

An alternative approach as Robin suggested, is to treat all iommu_map as sg map,
and when the driver gets the iotlb_sync_map() call it can just issue the hypercall,
however this call only provides the IOVA range, which requires extra work or locking
as mentioned in the thread, and as Robin mentioned s390 doing something similar,
I was highlighting that in their driver, this call only notifies the hypervisor
about an IOVA and not an actual pv map as pKVM, so it much simpler in their case.

Thanks,
Mostafa
> 
> Jason

