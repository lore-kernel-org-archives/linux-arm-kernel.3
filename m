Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15FAC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzAx7zrshxa9otOXRhlSkfMjSVGU/IxrZ5CXiIP9CSA=; b=Dud+HrmdSsLv5vnKO8s+GtRFCo
	dmmZ/gXlszWlaUok9iwah4FPJGruzSOLiUOJ+HUX7rq0ZmP7PHfR/YlyCJ/lpvAakDaKeT/dqSzSn
	nGTb4QivFExLfXi3xRGevrf9NqXQb2d5Ibjje0T3EhBUxBHP8+52I6uynHUIQEObcRiSnO/BokCqT
	WAUZtTDsPN8/HCavceMNuohEB+8uo3LJPUQ1f7+V4Kiklrj0hiNDCE9co+kU9SEw0xV1PB4h9WSK1
	hgsSbcwnw50Sop+KgeDD8eQbbDSHBZJjGqHQiP0o7MXtrvOZSXlE0jkig8o1ZLvX3zSYQE+kXmYO7
	vMLZiKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv32V-0000000AVmZ-0UoP;
	Wed, 19 Mar 2025 23:41:35 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv30m-0000000AVOQ-3b9Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:39:49 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-476a1acf61eso2148221cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 16:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742427587; x=1743032387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzAx7zrshxa9otOXRhlSkfMjSVGU/IxrZ5CXiIP9CSA=;
        b=atafuyg733M0RMjKXeDmVOM8uTuKGYjRpAPUtmScHc2/jj29hNH55MKN9RmpbJUXX6
         PVBbHMoASMcQ2C86Mc7XBgpYXG4E5B4vSfgPONCg4t9uYM32uFesycL83vEqHepkAg4L
         kzmJemOmNzRRD6aQK1kLg2yxm9MB9SEZwvwZLd5/8hQFqTTT6Kin8lmcrSj0Gq7tP4u9
         eV/0mQITSQ7awoUff6U4qTgFeTiyURccKf4n5ScmrPTi4A0AjgpE7Y8GIFwX0Y78Cg7B
         Jg8cyp56MJtzi/KHlbFIVAJz2LqwD7ydK6IrjsFHZ90KlFNovz+Qw5vfQKt5fIg5pwNQ
         JKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742427587; x=1743032387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzAx7zrshxa9otOXRhlSkfMjSVGU/IxrZ5CXiIP9CSA=;
        b=a47fGKdW37VIVf3F6CMSK+9YF8irkyPkvS0Vja1GH4bkpY1ohJlXoN4CwRJohGY0PQ
         RtyH0Mrh2Ya4Zu02RYOvUrVfoNnt0etfI+5ZYyD0eLKauJ8Ci7vLoiQL0Kph3Rik6MX9
         nUHBb31I71J3B5y5IhogCC34OuY0REKfJSADEBuBwrnMeoIgNXMDbGPnpRUFAgoPbabQ
         hExoPYtTo9DrHQw3KTn7di/yakg/uPE2CLrXLvfQyNnWTNRPlr9BN6carVv0cB43owBC
         UcxLiSxInvs6KATZ5SwqkdIViVT7Be1gGEHblN8UwWafEOmmAREshylL+jlfpo3QB6nI
         +KkA==
X-Forwarded-Encrypted: i=1; AJvYcCVdzVoCStwmSsYhHp3qNIbh+HcQ3T4X/USy8O3QsaW3Vnfy+48nrrRGYAxRths1F0wQTlUme7sfEpZhcFoRqzoT@lists.infradead.org
X-Gm-Message-State: AOJu0YzmOao4Qc9g7ll0ZkkNFhAdUqkkijH2sAjyarvDDMKdtvxSKOY5
	1n50mW7FH+ZUNKfTTFKQrByVMaPD6wnq9Ij0Uj8ecz6WMWZFSHZJpWipqN+XuCs=
X-Gm-Gg: ASbGncsbaVdHyNpyJyMo5IoGQrnnbqlZmvgtouTiJSXo8adNiYA6ZuvggCQDMT+sxZz
	idslKasGG2+Ey6LtOJgDnRXMJ+yk6RN6E+WnPqKkq7o5Fd9HGsRXIPs9XcKnd7dIzl+08QEQSCA
	nlzaJCoiADXjni0uju3lcAHVkSVka+5/wfYeT+Llf/gi1vVDLQyEskF7D4/n8q9wwBzmkNeK+7k
	HEfpO5AWpl4NjJ0c/HLjgoV2+hou2J9LC2DW5CMxru9qhAix4Zmukog5LeLnPduCM3HLqiJ4963
	hqt1UoSt2MM9kc1SwpMYqwUaTKxi7pQP1n/rXlA9Ew1hrRqrVruAQ+KdP7VoK/jSfXklTEnqMRz
	VB+Gbp7sll3QgL3Bzng==
X-Google-Smtp-Source: AGHT+IF9kl9P6XYnhoEMvEZ3lKapz4eUtSUPO4gWdTGr+ps6RPA96Wz7D0zijkf/bw2551v0mV3avg==
X-Received: by 2002:a05:622a:418f:b0:476:7b0b:3110 with SMTP id d75a77b69052e-4770831f8f5mr94450601cf.20.1742427587653;
        Wed, 19 Mar 2025 16:39:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb82bf6bsm85415621cf.78.2025.03.19.16.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 16:39:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tv30k-00000000clb-27LO;
	Wed, 19 Mar 2025 20:39:46 -0300
Date: Wed, 19 Mar 2025 20:39:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com,
	kevin.tian@intel.com, alex.williamson@redhat.com, maz@kernel.org,
	oliver.upton@linux.dev, will@kernel.org, robin.murphy@arm.com,
	nicolinc@nvidia.com, jean-philippe@linaro.org,
	jonathan.cameron@huawei.com
Subject: Re: [RFC PATCH v3 4/5] iommu/arm-smmu-v3-iommufd: Use KVM VMID for
 s2 stage
Message-ID: <20250319233946.GF126678@ziepe.ca>
References: <20250319173202.78988-1-shameerali.kolothum.thodi@huawei.com>
 <20250319173202.78988-5-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319173202.78988-5-shameerali.kolothum.thodi@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_163948_893828_7FFC8BCF 
X-CRM114-Status: GOOD (  19.72  )
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

On Wed, Mar 19, 2025 at 05:32:01PM +0000, Shameer Kolothum wrote:
> +static int arm_vsmmu_alloc_vmid(struct arm_smmu_device *smmu, struct kvm *kvm,
> +				bool *kvm_used)
> +{
> +#ifdef CONFIG_KVM
> +	/*
> +	 * There can only be one allocator for VMIDs active at once. If BTM is
> +	 * turned on then KVM's allocator always supplies the VMID, and the
> +	 * VMID is matched by CPU invalidation of the KVM S2. Right now there
> +	 * is no API to get an unused VMID from KVM so this also means BTM systems
> +	 * cannot support S2 without an associated KVM.
> +	 */
> +	if ((smmu->features & ARM_SMMU_FEAT_BTM)) {
> +		int vmid;
> +
> +		if (!kvm || !kvm_get_kvm_safe(kvm))
> +			return -EOPNOTSUPP;

Isn't kvm_get_kvm_safe() in modular KVM code most of the time? You can't
call it like this right?

Per my prior comments, I'm a little nervous to make drivers keep track
of this refcount instead of the core code but this does seem like it
could work..

I also think you should block using the S2 without a viommu & KVM in
BTM mode.. Maybe like this:

@@ -2938,8 +2938,16 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
                cdptr = arm_smmu_alloc_cd_ptr(master, IOMMU_NO_PASID);
                if (!cdptr)
                        return -ENOMEM;
-       } else if (arm_smmu_ssids_in_use(&master->cd_table))
-               return -EBUSY;
+       } else {
+               if (arm_smmu_ssids_in_use(&master->cd_table))
+                       return -EBUSY;
+               /*
+                * S2 cannot be used when BTM is turned on without a VIOMMU and
+                * VMID shared with KVM
+                */
+               if (smmu->features & ARM_SMMU_FEAT_BTM)
+                       return -EOPNOTSUPP;
+       }

That more closely matches how this will eventually work when the VMID
allocation is properly made to be local to the viommu.

Jason

