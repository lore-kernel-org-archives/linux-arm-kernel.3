Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80924C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwnA2oNKgnZXUtMiDazVBO1hROK96MeArFT9225UuGA=; b=POqkf+UgG1KF0vaE7hYrAduq/W
	90H6p6v3n23nI3ME4maWoMnIs+5wiBgnpF8dcTOvYH7UOr9fHQh0oNA4g6X/qinA7exVVR3+dp4nT
	0PyMXUzHs34omKa+RTTv3L/UTX864z0+8mcaChXZoNCCLICg1sa/YS5dachIQ0xDbotlJI2oUUTpa
	ISoMTNJbjWsTrZK21EDa6dw/B5PlkJdnQd7ezPWnFZiQYqLwuWpmQkLgr1I9ldMMaiCsmACCvhiyv
	0NuFq24Qv/1VkoidnE3lP3+tjeZgy13g+OcdPk/Z57IHp36ySahzP2L6lTEk0RR9n3fWfeI/N6nkj
	+7s3qgpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8RG-00000001of1-3KV5;
	Wed, 30 Jul 2025 15:09:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8Om-00000001oOc-3fiW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 15:07:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-455b63bfa52so51375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753888038; x=1754492838; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwnA2oNKgnZXUtMiDazVBO1hROK96MeArFT9225UuGA=;
        b=X4VnvmNEDV/8rULt0vjF9tuqfGXSq0pym9K2mcPDsVBRswYTIYslKuyjCaQLNMgtTO
         PpaS92wEyJFfEO/g5i37Ed8sHRYC49VkU8a0oG+svrzVZW9oCzSRzeNaHbOvgn11HWq6
         djjcX4HduZDUjXYaPdnwras1aDL3Uou3H/sJAenBy7oOp2r+wV7dRH/HI/YOBtwqx2E1
         rz7yxknxoCNWazuioFJYCPpj7meV4IfO16J5JDA1ZuRc+hHjZo6Eb5HzJrc1afSCquVh
         dhbCwuQyfW0cJCWPq6UNFOqLIusfil166nC55G5rf3f2Tgkc894rnuz+UuBc0yI8ipO3
         zM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888038; x=1754492838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwnA2oNKgnZXUtMiDazVBO1hROK96MeArFT9225UuGA=;
        b=KTadMmKU93aSlh1f9SfduzNm6Ff7vR+BOsaBBByIsoFIC89m4yUkOFy7arbIIusbOO
         uEM8ciCsxLj3G8W0MNEeW4zg92p6I1Uv5i9jUrf8T57HNdSisT+3Z8yjNOCoznv+KEcA
         CNP3qm3J7RC2COtvqy8FRztJeT1xeiBHK41XXRvgeIkahsOnH5jhpZHw6XxfxDeeUJn8
         Wc9+lDbv8PL6U1xPhzXcz62XkBMMFCvCouAHTPznhY0D5+zoax/+EP6v035qb4NJfYZI
         huFFx6OcAv+HEk7xTFej4sKExclvqwidG5HOK2DInhuSdD25Gu3gRiyncxARXa02AhW7
         gH1g==
X-Forwarded-Encrypted: i=1; AJvYcCWAWuRiCBDvCCRRblFayyPbGJjaBPO+YMFBJzJE0/c56QxQPsAyo37yeTTfKOxtBa66f/R2sG6kpOzFy+vCAwBJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBbx2roqjO99FhfNZtLTV7CsYf/Np8yDlQJ55pAs7UU5fKtEio
	HSpBViBprD0gr1gLRs3QH9ej8sm4y6MCaD5RFvCdCWVjzu4S11rMmkosDnnr9YTw9Q==
X-Gm-Gg: ASbGncvlocuIMcIFfzNt53x5NfuBRNCiHaVHTJeoDNdpvYZVBJiGrQnLe7fBHBkhnpe
	kLzABLE8Wj9tTnoedFfu/mWQ78E+lLaw1NbjwLscnTmFkpJKM/zz87BnY3qVl8KI2+UcYYljRhd
	z+DzGf2OeGZHb+kxJ+8AwQzIx9spZjGZhVUS2V5jVsc9AZ6BELC8LzqDGz7uYdzP5n1ZOTPIQM3
	6h+rAnJ5zP+XM5rBZ6LFlfjr+m1GDKSdui1I1xIKasnqYaHC5giqf+OM+OeeTs3ZJ3EpZ+yeU2X
	40glliBcOIIeOBd2czwZwTccx6iaVRwN3wxNoUQCPkl6MF9d8gzRJHl4Gufn+q1YVLAvSx/d5Yh
	hWh/7gflLheqDQ3EuQNeD7gm6yWkZZYIpzxvH/IKlrEUFaVnz4PSQb+OyCFInAUANviTe
X-Google-Smtp-Source: AGHT+IFXd4tj1Gi+aSqsAPlyaWZo7LbAx7OS/cZ5blys8+9sDywLpzMvfiK5whFAaT6QiTiBqgdEJA==
X-Received: by 2002:a05:600c:8b66:b0:455:fd3e:4e12 with SMTP id 5b1f17b1804b1-45893a978a1mr1755975e9.4.1753888038295;
        Wed, 30 Jul 2025 08:07:18 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4588ee11c91sm35868305e9.4.2025.07.30.08.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 08:07:17 -0700 (PDT)
Date: Wed, 30 Jul 2025 15:07:14 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <aIo1ImP7R7VhRpVE@google.com>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730144253.GM26511@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_080720_930949_0FF83F94 
X-CRM114-Status: GOOD (  28.21  )
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

On Wed, Jul 30, 2025 at 11:42:53AM -0300, Jason Gunthorpe wrote:
> On Mon, Jul 28, 2025 at 05:53:16PM +0000, Mostafa Saleh wrote:
> > Register the SMMUv3 through IOMMU ops, that only support identity
> > domains. This allows the driver to know which device are currently used
> > to properly enable/disable then.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 92 ++++++++++++++++++-
> >  1 file changed, 91 insertions(+), 1 deletion(-)
> 
> Can you split the new iommu subysstem driver out please? I think I
> asked this before.

Sorry, maybe I misunderstood, do you mean split this patch into multiple
patches or split all KVM SMMUv3 driver out of this series?

> 
> This series is big, reviewing a new iommu driver should be done separately.
> 
> Please review all the comments for the verisilicon driver, I think
> many of the remarks apply here too:

Thanks, I will go through them.

> 
>  - Domain attachment looks questionable. Please do not have
>    attach/detach language at all in the hypervisor facing API.

I am not sure I understand this one, the hypervisor API has no
attach/detach APIs?
We only notify the hypervisor via “enable/disable” hypercalls when
devices are attached or released (as only IDENTITY DOMAIN is supported)
so it can enable or disable translation.

>  - Get the ordering and APIs right so replace works. You need this to support RMRs

I see, we can’t support bypass for security reasons, but we can enable
the identity map for such devices.

>  - Use a blocking domain not some unclear detatch idea

There is not a single detach in this driver, we only support attach and release
operation, which just goes to the hypervisor as enable/disable identity.

>  - Use a blocking domain for release

I see, I can add “blocked_domain” similar to “arm_smmu_blocked_domain”
which just disables the device translation, I will look into, I am just
concerned it's more code as this driver only supports a single domain
type.

>  - Use the smmu-v3 approach for the fwspec, don't store things in the drvdata.

This is using “dev_iommu_fwspec_get” similar to the SMMUv3 driver,
am I missing something?

The driver only save the "struct arm_smmu_device" in drvdata, which is
exactly what the other driver does (which allows us to re-use a lot of
the code)

Thanks,
Mostafa


> 
> Jason

