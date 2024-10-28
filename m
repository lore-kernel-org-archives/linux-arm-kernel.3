Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB81D5B158
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFZKIzMwJccmjbRWz8hr4dF1BDbSPdCqeQ+MDKxNuD8=; b=v+F9Xu0X6SNU+kBd4khjadGcSX
	Pp4OAeRXTUy0zbaOQgkIQ8YoeIESoehBYW9LSNN+s+CJ1kuvFmW0EmTb8+Xwi1UDBOzZB9BwBnzpx
	cItND71W8qZEQFVeZMRc6lgwW0PPWR1SgWYvUvK0gMnuBtyy3w2Qzr4xwO3FTkpoTEzkdVGc7h2Dx
	I9EDJ08ERtEOZCXiDnOjy6LhBoN6m7Ynn6zs+7+KsfEAAw1ob9w5aoO6ZPmn+LfosaviSfVFHWgWj
	JoC0nQx5prxZ/l1UXgsSjCWQzctHrkzgg+Tos+sO+7D+RhiJusXlN5+hEpfxkMyNQV5g5ElgOpMjx
	Pu4s1K0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XgT-0000000CQ4C-3Kw2;
	Mon, 28 Oct 2024 21:53:57 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XMb-0000000CLZr-0x9v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:33:26 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-82cd93a6617so158220639f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730151203; x=1730756003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFZKIzMwJccmjbRWz8hr4dF1BDbSPdCqeQ+MDKxNuD8=;
        b=la23ev6OLjYNJ9OW7komuaYf71C+k4270kegYisa+G7AfMOrhcKCPKOpzSNfW/JYj/
         FdLRl6JoHvJW9hy/NOdrw7mpMoGFOqGrGEQFvkFXy0OmSNIGIqkdZUcW9rv8TMYLbhof
         F2X3/kLShha/5tSLGlXi95uU6JueO2H2qYDY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151203; x=1730756003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFZKIzMwJccmjbRWz8hr4dF1BDbSPdCqeQ+MDKxNuD8=;
        b=Ob+I3SpaqCRe/dJWq+txlMo9bUPr5BGrHTy3mFhVz6Vw2R2VYPUjBwO1XQwTw1JhbH
         2+mLa9pVZTmEW+ZldeY+mIRdmqbO6wDFmmAWjtvOXLZ7gxLZZo2nIQlIgjYeWX0IcYNt
         OCEx8Y3YtzIEf19p6ZE9P/UBrH2Ayr5QOdBLKhcl5OUEmOz2zqg2yj2+3OcRLWZj7Ci1
         +jFTKP79BQSMi9Auy3GMQNym9iagxtnCmQQ/J+Jzxbcqa7IQ+p8Tsx6KizgjQg17Fb1l
         BIhTyhA9gjBPZNzDUHOyjutSu4O554CZP/wTTFKvPb8lOxZgC24mXLD/4GVqScCD6lhW
         57QA==
X-Forwarded-Encrypted: i=1; AJvYcCXhgCngsDjhgDgtVNxqxi9RyYjMcQKWpbc09sg11t1H553EyZnnV3IXciQWBJGWwCBKmcFfA8fl12+N3wtElkjU@lists.infradead.org
X-Gm-Message-State: AOJu0YxMeitEGSDuv9ybHeyWF9uNBsiB6e+Rw/NHYq7Cxu3pocnDOaNI
	zg3wqPwk1NRYzoBYhacYpF8+DWtF7oJBbAEj3WI5Te3NgOJH4tj2VfJ/ODP+ii2obeXecAJChqh
	eFAKIqf/QC0tF26/GdSxTHLAxu5rkvzS7w+27
X-Google-Smtp-Source: AGHT+IFRf7Qdfzoq2U9A+NIDwOGbIKY7nZWXffb09QD8AJkz3xy2j34ROShaH6Jj6HGBK3DfHA78bcGG4mf4sL65r5o=
X-Received: by 2002:a05:6602:1686:b0:82a:2a67:9429 with SMTP id
 ca18e2360f4ac-83b1c3e7abemr939673139f.5.1730151203568; Mon, 28 Oct 2024
 14:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240827181717.187245-1-robdclark@gmail.com> <Zx97PU7cUEVCnpPl@google.com>
In-Reply-To: <Zx97PU7cUEVCnpPl@google.com>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 28 Oct 2024 14:33:12 -0700
Message-ID: <CAJs_Fx6EB=0GMqe4cZVdxptFSV3b63HHybfTOgiYVBudgAafsA@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
To: Mostafa Saleh <smostafa@google.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Joao Martins <joao.m.martins@oracle.com>, Kevin Tian <kevin.tian@intel.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_143325_317283_4897C4A8 
X-CRM114-Status: GOOD (  24.99  )
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

On Mon, Oct 28, 2024 at 4:53=E2=80=AFAM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> Hi Rob,
>
> On Tue, Aug 27, 2024 at 11:17:08AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This series extends io-pgtable-arm with a method to retrieve the page
> > table entries traversed in the process of address translation, and then
> > beefs up drm/msm gpu devcore dump to include this (and additional info)
> > in the devcore dump.
> >
> > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > (minus a patch that was already merged)
> >
> > v2: Fix an armv7/32b build error in the last patch
> > v3: Incorperate Will Deacon's suggestion to make the interface
> >     callback based.
> > v4: Actually wire up the callback
> > v5: Drop the callback approach
> > v6: Make walk-data struct pgtable specific and rename
> >     io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > v7: Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> > v8: Pass pte pointer to callback so it can modify the actual pte
> > v9: Fix selftests_running case
> >
> > Rob Clark (4):
> >   iommu/io-pgtable-arm: Make pgtable walker more generic
> >   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
> >   iommu/io-pgtable-arm: Add way to debug pgtable walk
> >   drm/msm: Extend gpu devcore dumps with pgtbl info
>
> Do you have plans to post another version of this series, as I am
> working on some patches, that would use some of the common page walk
> logic, so it would be more convenient to have them upstream.
> Otherwise, I can have your series as a dependency.

Sorry, this had dropped off my radar, I'll post an updated iteration
in a couple minutes.

BR,
-R

> Thanks,
> Mostafa
>
>
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
> >  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
> >  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
> >  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
> >  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
> >  drivers/iommu/io-pgtable-arm.c          | 149 +++++++++++++++---------
> >  include/linux/io-pgtable.h              |  15 +++
> >  7 files changed, 160 insertions(+), 56 deletions(-)
> >
> > --
> > 2.46.0
> >

