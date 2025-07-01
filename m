Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B9CC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=; b=snt8FC8Sl8C+dLX/s+puguPn16
	YRmIOKW+FEw/7k2l7el6MvSuy7jQP/JU4p1ojU7Z/hieEw0lR7Cq2eiCGy8ihbIjxPO7yFYzfJaSI
	sGCpLSLPSuOw0w7eSIAP2bjbj0HAXV8OxjqfVrBKdJ5Rl94T1an4YHLobjLpdA066ErG2i1UB3klw
	7u4d0WDY71KMsg9eFeNe+rZ4wYlhOiarAI5m7Ecd05Klrw8w6uTq7bArnnaOb7nkvmuLUcwItFkBV
	kzp2wmSiQVyqHmXvwnzdTQZ/qWcSVR1qjFC5h5ADoUmZTUk3q50xLvoZz0Q7gQ6AGvJC3BdgCTCCw
	BOaIxprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWboB-00000005fed-0vHx;
	Tue, 01 Jul 2025 14:18:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaSC-00000005Ns0-2Ffw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:51:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235e389599fso210215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751374276; x=1751979076; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=f8cu7Bx6QkuBFLbWWAeDUeH4ROPPcBillAurbRxBQZ27+Kken0ia+8nW3buAigqAhf
         vWwUHP0hpwL2c0P3M+tMEkyV5wi74NhJS3gYrXbmEghIXnTxX4c2USWAjhweporLKm9l
         X3djgRKQne8TO+0jO5jyZMHWswlCE892NTGthBIUv66Vhnh+BLvFK3UyDfFvyvVC2v1O
         rhjjjxDKa4IJ9MVnE75QpksWmlUbdHOQiBqZNG6pounPF8ZX444cWMgvJxvVHYYV4DEe
         pSB2x2ftbT4dLGUBwERsGhT1glNJ7wc8FiyZQTv93cqHk8HDrAePKO9p6EunUouDWaIq
         qPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374276; x=1751979076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=QwyfgLIFOYSW3MbGOYJg/XdsbYWdOdcB8LUQwFsUM1t6sXx85xD0Dd9yRXd0Gyq1f7
         sjq088lac8Y51VKJd9g4RKW2y2+temYrE8gILq5/TUK2JefHh2/EWjmUtv/D13yHoSsK
         NOOY/y1VsknSnaY5WXYKAvpFfUd0IC1wYudoodq5lbEo5rdfACfS0G6r2StmUIHR6qFO
         7dDKKSDEvpDz1tyLz5Neyb7NPikEg+yAihtHERMdXd5z7yBnf6FAryNwzatpFLoiUgD0
         Mz3KODsRbzHqr5NXFIg6en8wxGJFjUi+EPEyCxGG3zRsnAZaKQl7Hp49GvBdu8N//NFi
         9XBg==
X-Forwarded-Encrypted: i=1; AJvYcCXH7+j3fly4PF8+GU3VaxLDxYYMB6rMSK4L0aQQEgu2us+gzCf1iQ1aQP/8wDTkei8HDF++MyLkwLBA8NdugYqD@lists.infradead.org
X-Gm-Message-State: AOJu0YyWuCCbYcZopgBasT62cgdxb0c4ut/VyEfJk2BYxpGmlxoo+Go1
	YiFtyaWgCIB/po83TXRaAeSKeiIFWcJBlPG9/eFyVRFOmyIo2ZIK33GCxMaoZi6RsQ==
X-Gm-Gg: ASbGnctOptyzdV+kbIutyhG5fmvEZuafT3L17SBsKCdJIipQNWEbg0BBiivdJhAxLn5
	AMmW3xrFY++IuGhA95it6Mp1LIZP9oTQU/fHxzb69Jo6vjyP0Q0GNri9QcmY3NDpVPAY8Gf/6BW
	GP38biaVNkeMJUSUmdy4+ULDXTac8ciqBxOTZZ2OC3iiwInMApg2qbvB12XeupS9nrJxaxp+KPE
	GE3Jn/2m67ZE/4/ZzCLBN6ojieRS0ZaEbLqnzqhCIfGsKqI/1w6WcVNjQJ4OIQHsiLSkQjpluBE
	+1asKlgBYHCzfE95YkvyFbUc/VaMvm9WfX4aKw6nAG7nD3yo3tRkYQSFGukN6kCSmeckD4s+57e
	3q8Zj6jAIwlq4nacQmslg
X-Google-Smtp-Source: AGHT+IGScnewrdwJXz5o2+pGS36a0Kxzmd5AqmLzt37Kv43BKh9NBBAVMo2i4U9SfF+orF6VioLZJQ==
X-Received: by 2002:a17:903:b07:b0:234:bfa1:da3e with SMTP id d9443c01a7336-23c5ff04d7cmr1891395ad.5.1751374275468;
        Tue, 01 Jul 2025 05:51:15 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ee760sm11194996b3a.155.2025.07.01.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:51:14 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:51:05 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 03/28] iommu: Use enum iommu_hw_info_type for type in
 hw_info op
Message-ID: <aGPZuSKBSADLbwas@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <f588bf6a47cbaf350a03e5a1680074b852fb5502.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f588bf6a47cbaf350a03e5a1680074b852fb5502.1750966133.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_055116_586041_2D133A48 
X-CRM114-Status: GOOD (  22.77  )
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

On Thu, Jun 26, 2025 at 12:34:34PM -0700, Nicolin Chen wrote:
> Replace u32 to make it clear. No functional changes.
> 
> Also simplify the kdoc since the type itself is clear enough.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h                               | 6 +++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 3 ++-
>  drivers/iommu/intel/iommu.c                         | 3 ++-
>  drivers/iommu/iommufd/selftest.c                    | 3 ++-
>  4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 04548b18df28..b87c2841e6bc 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -563,8 +563,7 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>   * @capable: check capability
>   * @hw_info: report iommu hardware information. The data buffer returned by this
>   *           op is allocated in the iommu driver and freed by the caller after
> - *           use. The information type is one of enum iommu_hw_info_type defined
> - *           in include/uapi/linux/iommufd.h.
> + *           use.
>   * @domain_alloc: Do not use in new drivers
>   * @domain_alloc_identity: allocate an IDENTITY domain. Drivers should prefer to
>   *                         use identity_domain instead. This should only be used
> @@ -623,7 +622,8 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>   */
>  struct iommu_ops {
>  	bool (*capable)(struct device *dev, enum iommu_cap);
> -	void *(*hw_info)(struct device *dev, u32 *length, u32 *type);
> +	void *(*hw_info)(struct device *dev, u32 *length,
> +			 enum iommu_hw_info_type *type);
>  
>  	/* Domain allocation and freeing by the iommu driver */
>  #if IS_ENABLED(CONFIG_FSL_PAMU)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 9f59c95a254c..69bbe39e28de 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -7,7 +7,8 @@
>  
>  #include "arm-smmu-v3.h"
>  
> -void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
> +void *arm_smmu_hw_info(struct device *dev, u32 *length,
> +		       enum iommu_hw_info_type *type)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	struct iommu_hw_info_arm_smmuv3 *info;
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 7aa3932251b2..850f1a6f548c 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4091,7 +4091,8 @@ static int intel_iommu_set_dev_pasid(struct iommu_domain *domain,
>  	return ret;
>  }
>  
> -static void *intel_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
> +static void *intel_iommu_hw_info(struct device *dev, u32 *length,
> +				 enum iommu_hw_info_type *type)
>  {
>  	struct device_domain_info *info = dev_iommu_priv_get(dev);
>  	struct intel_iommu *iommu = info->iommu;
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 74ca955a766e..7a9abe3f47d5 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -287,7 +287,8 @@ static struct iommu_domain mock_blocking_domain = {
>  	.ops = &mock_blocking_ops,
>  };
>  
> -static void *mock_domain_hw_info(struct device *dev, u32 *length, u32 *type)
> +static void *mock_domain_hw_info(struct device *dev, u32 *length,
> +				 enum iommu_hw_info_type *type)
>  {
>  	struct iommu_test_hw_info *info;
>  

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

