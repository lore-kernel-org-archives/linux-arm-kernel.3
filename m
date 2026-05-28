Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A5DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meonzuuyclWLVGJV9U6aQdhritntP0vgCuzICbgArsQ=; b=ByitD0mbwKGS5fhVtzctyzBsfE
	65KxbdOLKhEajPGSyeb6cCKrSedjqK5LWb+htberx560NMwekhIMJnYonTb3cou/MWZm0Gg1Nhm7a
	qtIRN2LKaEUJpiLqIwdl9xkBlK2399yFAJwPyvQcOYzY+rGInKYARpDyXDTqdpC8hx2EiKidHb6x2
	IcMjfrSWilt0M4VdaSV6de5ggwnGZRUcd/HTCV7ppIXpKpOz5Py3BS016/BZU5j7CJLtW/QnrnGse
	LGPTEi9tkH1IfbKrDB3WBM9RUg5opBm4nrciVZ+aJJRE2ch9i1s2C/dcgNwBlMUFGAEM42j1gavDn
	BUsbmaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShVj-00000006MrQ-2I7z;
	Thu, 28 May 2026 20:39:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShVg-00000006Mr5-1X4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:39:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so1115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780000759; x=1780605559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=meonzuuyclWLVGJV9U6aQdhritntP0vgCuzICbgArsQ=;
        b=bTS5ULRl97QNk6iu9ZNjQG//AlQoza1VgWriaspjgxzr5DxG6pT+/cbEwytJxWoS/x
         Ef48/1E8w3yoOphQgfXgoIITSzXlfG7nFKel6NUKECyYSY/OQb5MKBKAESC2NkKIbjf6
         eZinxun8P4Kuifw5KXeEjYUnOTW3oIowAIl7jnxagi7unixTQp+T6jPnJqHITQWyl4l4
         JycKcKmto1kiXSWCNHCtL93lmYkvL8LJpYH168tqrsjsSfgPRagVZyvETvr15QiTQEnD
         XAqCDMpiJOr4yktFke0sHWokNJpVUbyVwZ90V45SSq1bNOIfEEXKiq+Zj70p31ndvfYX
         n0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000759; x=1780605559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meonzuuyclWLVGJV9U6aQdhritntP0vgCuzICbgArsQ=;
        b=k6sKCPks/xvGnAW1HJ0K/qvxey2K5FJnscZr3FeKdIJbjfdjcft2oCPuFJByBLYk8M
         ysoqBOQIi+vAr0OwSPJUreqL+MojCUhir8yBZglM6y+MXaEy7zUqC3j9pzusx7P/JWQ5
         K0Y//WZG+J3qdJxIZ0hin3hpqOQBZ7PBDpFw/3j1Xo1ONw63LOW0iMIyaCPL2dYcXss/
         hrSqch02Iy2JjXiXYWT2ryp4kudW7PEJVKmPMNNH2FJRLKjLABiYwaIkkhb4EyXfyopV
         9l9HRw4F6PvS1gpy2UqCEhdmafor8q/jRD5BDieS0ggDTbtKvLthlwVcokuweZ7c+h2N
         nsWg==
X-Forwarded-Encrypted: i=1; AFNElJ+W8UVjjBuBT+Ycqu5Xn6EubW+Q0NRn9OoFUYWAM+54zz4EZPKeE3KlRiq//SH2q7eWD+9m+UoT8l3MuJEGnG2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5/2PZBtWGyvNvYyeOjkxCGHYXEpYBpGCIvPpPdYT7PnpRJ2HE
	Ey2oDYZgsGuHp2EXYHcjWqOwGERuJfUkvWu4ZYlj4Nc3kvr2FzlY5dCb6tD71vjBmw==
X-Gm-Gg: Acq92OHxCgay+8oL2bgBNTyhkzfn4+lQnaUHRKxt3WAqulPtTIz82Yu8jU5Mlo0pfZr
	/Z65wZydCIBEhJxfIWskD3VBnkBxZBK1ahhhbQaKMnGo+L9zZtSIpuSaagU0rP+HXcxMPMtOmf6
	n8vuoOWsgL+e2EZPdJZRxumD/DyFSGBQwJmc8HwyIcMP570lqWoi/FnkXGiqrMoUy/QoSESzN18
	LBMBbEpB1gsePG38NJ+V8mCVKR0p6iQUdE9u6VoJjI7r1sCAA265UuJyRp4mXvbqbksY8iMLKpE
	k3EuZB5y1LrMOkd/I7krw4qmc9FsSUvdi01aMSLNyZI3MIlEzSQWzhBLnZhznPaaGTKyOeSJs6X
	mcRkGcY8+UPyMEYQ7nRNwJTj10JoB7VBIT6uLlzsEfqkGxIvi/1YTUtLGDrXCq3Tp7/OVzELRNP
	/SNxF4OkA7rbVNOdhrKGivScJOpX1wCmpaHOXwOk/PP62AfL7sMBe2sJ6GmZ9nEcFIS9Z9
X-Received: by 2002:a17:903:1a67:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2bf2046519bmr79225ad.25.1780000759071;
        Thu, 28 May 2026 13:39:19 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf1e609a0asm1939385ad.26.2026.05.28.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:39:18 -0700 (PDT)
Date: Thu, 28 May 2026 20:39:11 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v6 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <ahin734hJ0CSSepe@google.com>
References: <cover.1779392420.git.nicolinc@nvidia.com>
 <18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com>
 <ahheOF8L0aGMttcI@google.com>
 <20260528152930.GA3195266@nvidia.com>
 <ahhuFw3ZJpy48xkH@google.com>
 <20260528180018.GB3195266@nvidia.com>
 <ahiGIUDG2uvA6usM@google.com>
 <ahiHc3y4wAxxtpLT@Asurada-Nvidia>
 <20260528200450.GC3195266@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528200450.GC3195266@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_133920_404793_75D9B3DB 
X-CRM114-Status: GOOD (  26.46  )
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

On Thu, May 28, 2026 at 05:04:50PM -0300, Jason Gunthorpe wrote:
> On Thu, May 28, 2026 at 11:20:35AM -0700, Nicolin Chen wrote:
> > On Thu, May 28, 2026 at 06:14:57PM +0000, Pranjal Shrivastava wrote:
> > > On Thu, May 28, 2026 at 03:00:18PM -0300, Jason Gunthorpe wrote:
> > > > On Thu, May 28, 2026 at 04:32:23PM +0000, Pranjal Shrivastava wrote:
> > > > > On Thu, May 28, 2026 at 12:29:30PM -0300, Jason Gunthorpe wrote:
> > > > > > On Thu, May 28, 2026 at 03:24:40PM +0000, Pranjal Shrivastava wrote:
> > > > > > 
> > > > > > > > +	master->ats_always_on = true;
> > > > > > > > +
> > > > > > > > +	return arm_smmu_alloc_cd_tables(master);
> > > > > > > 
> > > > > > > Nit: I'm not sure if I'm getting this right, are we saying we *need* to
> > > > > > > allocate CDs for CXL.cache cases in the probe itself because STE.EATS
> > > > > > > requires Config=Translate with S1DSS in bypass?
> > > > > > 
> > > > > > Yeah, basically.
> > > > > > 
> > > > > > Effectively the ARM rules for enabling ATS and Bypass together require
> > > > > > a valid CD table pointer.
> > > > > 
> > > > > Ack. But do we expect transactions before attach_dev? What'd happen if
> > > > > we don't allocate CDs here?
> > > > 
> > > > It can be done at any point before a non-abort STE is formed.
> > > > 
> > > > The core code pretty much does this immediately after probe so there
> > > > isn't much point in moving it later.
> > > > 
> > > 
> > > Right.. that's what I'm not understanding clearly, if the STE is Abort
> > > anyway during probe, why are we breaking the alloc-at-attach convention? 
> > > Usually, we allocate CD tables in the first attach_dev call. Why does
> > > that not work here?
> > 
> > It would work in attach_dev(). I just felt cleaner to have it in
> > probe(), paired with arm_smmu_free_cd_tables() in the release().
> 
> I thought it was like this because we don't have an alloc on attach
> flow for the identity domain, so add it there or add it here..

Right, doing it in attach would've been cleaner, but I don't mind the
existing way too (since it's merged anyway)

I went down this hole since the reason for the convention change wasn't
immediately clear.

Thanks for the clarification!
Praan

