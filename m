Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE870606C918
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lqvt1KUZ;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NrHKc0nK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=; b=lqvt1KUZ40S55nHn4m3W4g3KsR
	cv9gbTd+e7RHWbeBqi6184ho2x0lKNe1HD2rn9/R4jik6RipCKFLjvywbsDVyvb8WB2O8pmH5JiZD
	mvWB4xTmrVQX5WBn3nuatA7Fzr6NlhXHOf0u+Er4CsER9W01CVEnWdx7gpw9auILHo4QWepIv9Nfa
	XVC1hEOT9R3EbHIQHytvwtBwX3UFjvM1OJwYDdPh0L4haUWQP25KXAvjrvs4ozbvXrcJuy6UYXwqf
	+hKwfHztoEwPtDK1R2OiQYqf4fFLqiNqr5VrNRWlg3kkOgitUYtKwTRcHXPAqfdtYJuRTpcn5C+Dv
	CrZ7q43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgi1-00000006eLi-14cm;
	Wed, 04 Nov 2026 19:31:45 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOghx-00000006eGC-3jiH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:31:43 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93e515769d3so105058585a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793820700; x=1794425500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=NrHKc0nKYZ1dDse5SeQGAapdJQOfxW3ZPMfdFIaAsAn1XQV+Mlm3PR7XY+yQX+8QRO
         YO667/awiRIzGVniIUmDautaIVcgAvHI+4kq1oXliAguSKFjpvcfsUPjxA3hOmJqWuWX
         /valZ4uc7zQ0NKGHfQ26LFrf0847G+vtdjRMeWej+rd2A5idKaMvkxwBzngAytrzvZke
         p/1rza7x+j+EuHBylklRrSOYOTr/wAAtMno/dqXAH9WqkT3MDa+AK7EJvt/px3koWJPS
         YyOK/rCmILh4DNTNj03ZNV5WlQ2cbpo+fqseIq4Vjl4m4VmvWadjI1x/eWMTivv7UBZE
         3abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820700; x=1794425500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=viR8c5boLGkkufs0qHld5G2+ZQ1sZhsap5lJKXQLECf96cIlf1A5ms8CV2CssSqIyC
         tffB0X9PgyCLnNNuhhSngNnW250uzDEtTg8ytTx7oruD37DhHW4qM7RCSX6rM05O6Bg3
         27M16dsxrUbUcpvk41KawjVpDT5y0BVK4qXGy8gjV4x1M0QCNkCyk3Kt2HVSiyVKTzK0
         7KBnMV17lDa1hSAccC5z6Nl46AAe295hzcWmNaplwqi8o4b1EM0KvEj0w6WrlOM72n0T
         lX6N2dMCmlPSYbkVGBIPvJgbfIo4qzFDcgGUdcgZWKbMHlcIEN07NRm6VlVsSvj9KscS
         xUiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6PqCc1L36RTxCGgYFjfnsYkgRYb0iq3BLD4KLU4lszv6ZkKfUwvZoLxu6VdzQkd/qBduOqISHu4r00Iqv2L6U@lists.infradead.org
X-Gm-Message-State: APuU4Z/fwZd7TfCMI893VV6WE+iGWbVbVZphgI+Vgodt5uWDFDS+7FaO
	lFQzq4yZ7/S3lcipBT5F4K4+zOHzXAr2zwQHjlB9gymN+YqkgNANxO6nJrmhRB7ixXc=
X-Gm-Gg: AYBFou2u9lG8rIGMv67iyHl1bNraTyngMbr9rwG5SwHTj/YV6KOjG5kEs60Lo9VNa4E
	bX59lWsg5JwQxcIMymStfFYDdVg4j7/tddyn21g+EO54r+EwWR0SPjvQeTT6qUaKQqAXqgQhZZL
	RV70Hmcuvj2K4e3Zy3CeFiTnA52QVc+5pdubKExmarHcBC6HSsYDfXZ+SkCAxiAuy5Av5IBZqmS
	Tuag9oQO9Oe4PYIeChOxYIAp91Bpmvde5gq0mSueBBdYM/woN1bEiwhoa6l6HxBl4vKwVSTGQnD
	W3cF3/k0EVu8YSWX2Ar/+Z/UXYWiYRTX4shuVZS6IQBQARSLiLH4g8ZoDLIJuRHJiM3LKoJfxrr
	47p/8w4uiYh5QXN8WNrLvqM+lbQ+Xea8/z7p4a5SARDXxLoGVLT3YVG3LqmGC1M99KwNjYdU5Ex
	cI61nCt3J/JQ30VGg6P+NR5+7IPEjYnHP7gmMLO20UCMSe1Dysknfst+QTKz9NdVD1hI+YpI6Qf
	6m9l+FyYHfzkMRCanuJbzE1D9m08wJIwN30ZhoETzba9t9b5ksz+Wuj/RPh85WNq9zHW8B+g78p
	P2Qa50stRlKlteKI+znWWHiiwSZ+AaMURYkekQkjHNvgYZPRGJsFiDffDPpS7pFlT0dMlvTQVq8
	a5tiYOx81Iw==
X-Received: by 2002:a05:620a:1a24:b0:93c:6534:d04d with SMTP id af79cd13be357-9442167725emr2767779185a.35.1793820700269;
        Wed, 04 Nov 2026 11:31:40 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4844991sm278199585a.28.2026.11.04.11.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:31:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOghv-0000000HG9b-0zIw;
	Wed, 04 Nov 2026 15:31:39 -0400
Date: Wed, 4 Nov 2026 15:31:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261104193139.GB3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuBjRjQwXl7UvvO@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_113141_947635_C16ED4D0 
X-CRM114-Status: GOOD (  15.01  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> On Wed, Nov 04, 2026 at 09:46:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
> > the selected vIOMMU implementation has no use for one. This would force
> > implementations such as the following Arm Realm vIOMMU to create an
> > unused parent.
> 
> IIRC, MSI on ARM still goes through the NS pathway. So, it wouldn't
> be "unused" if the device attaches to it (or its nested hwpts)?

It is unused by the RMM VIOMMU. I think that is what is Aneesh is
explaining.

> By dropping the nesting parent from VIOMMU, it just simplifies the
> attachment to an S1 paging hwpt, right?

Yes.

The VMM must always maintain a S1 paging attachment that is the
identity map of the VM on all devices, same action as when there is no
viommu.

Jason

