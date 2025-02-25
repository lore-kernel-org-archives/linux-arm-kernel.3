Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C980CC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zet+c1c4ONj7xvmenDNyn9l5ztIYraYudvekwtRFR4g=; b=IfwlG9vE8lL7kek5MYXREVU4on
	IQsh9UebuW+F5YC+TpFequzsYOtqi3S1VYJiOeFUFus4IcPcGq+BXp5Pyu0pmcvqlPxvB6XITVVGr
	TGZX6aX1JdHYvnTafHtt8ugiElcKpsoRArkW6vzkIEd9XsohFsjrYdLah2l34wHTqKDWfAm6Dfuz2
	MzfPgx8ViX/khnGPRI6QQx1gmOAZqEpoUZLmmS9Yn88oZrcUwQBwCv0aFQskOEkorZHGsQlqPyXmp
	WlkaJIlo6pp2cMf/edGyJcDV3b9r+dcZ9oBmVhdq/bhtjDpfv+NyTgk8ILeHzBaGzyHt+gNiwz+tN
	ekA01KUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eV-0000000199V-28jf;
	Tue, 25 Feb 2025 19:31:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzDl-00000000nSl-15w8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:59:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220e0575f5bso5885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740506392; x=1741111192; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zet+c1c4ONj7xvmenDNyn9l5ztIYraYudvekwtRFR4g=;
        b=ELC9YKjvj0jptgDRBhLDOcBtemDggfAvcYHYawz6ge3iZRkZUoC1xcLkZcHEcgOCcT
         j7mHVx1EjnSc+vGrpT1aQCRxIsAWrqt8HZ8HsPENvzCxy1yDb8dtXrlzFmi1RRsFMDzK
         UWtr9DZSYq6YJ+TNehrqIOtEsILYIa3jGXearDyx52UXo1/uxqrz3ldZ0TwuxmJvU6bt
         FHse0srQnC8M9IV0e/pK92c9lgj9sX6p+91HJwECwsRhlZwKhnPWdFpg5anwfx1m/ZLo
         Fq/ALHbBnY5iv1VVS2XfYDnW82zjhdbi3P0d37ILxILR13zaQGAoTv4QakKCK1Yo7Jzd
         VDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506392; x=1741111192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zet+c1c4ONj7xvmenDNyn9l5ztIYraYudvekwtRFR4g=;
        b=VykVwR4z8DQPFboVP96jdS0aeVZe6uq7hVvZLOTTJsxKuOXnh6eNpnRcS+sEEbX4G0
         6JnHk+MiKrbVUZV+aD74Sm1+sqSdWlgAzYK4NekaDjTpCjoFng2xsvFSjxdRkvLbYGHV
         5TiRYXFDb4xVg6xDp5PhtCVDlpJ0ISt6s4oUFP8c8VSY3SWB6RareoTN8OR6WJFx45bw
         9XXTGRJIPOR/hL7jnTCxywc1Be7710NOcORL2pdSP0T1zNH7BHolyv7n4KRj7t9saP/z
         PFxfkr8YewPa9mFQcOC3hP3MDPo8iNrsQ80xESIaXj42fk97ShTZT0Z8mhRFeA757noK
         wJaA==
X-Forwarded-Encrypted: i=1; AJvYcCUOSMD+F2PqHl8+9eesE0cNBkBbMyxLicHXz0noV1WXbDLHilGe8fOJ5miXab2rjfpYVBzTLAeACiWVFzDD32BK@lists.infradead.org
X-Gm-Message-State: AOJu0YyFTSgMsVncqzbs8+OtZD1JC2VWL1jxAXvkN8aATVlYLD99HDCX
	7BzSQqu2Erd3BdezhbUhKQtiUBe2saMpBaWHntS+WJAcxdNEFZI1TL0SdRESGQ==
X-Gm-Gg: ASbGncuTA9a5qWKMFjjesjW67PJRSR9VU3mL1uplE58BIYgRIUvJaMcwsDMHV/0oAkZ
	teRyvHdV0CEGQpGrhmiGehh1havYpP8ZLq2FaAS8uz3KEvTa6s+6g0qvkCsvX9Dan7vao2TPtIB
	1DJ7q7oSbVsDXZn6qpGav2P+iW4GU5dCVM6EaxGYszS6SP1f3zi6a/pFhoi1pNIsmJ4lrMZQP38
	tXTiDF6TFSC5Kr6r2Weoz06jOY2QHXSqY8rDlKY+VLY2dlpeO0yddNTwj/u6DDy4lt4kTJ8RXFq
	iz3iwBZLgzFY+AV7+hVU9TyY2Lrl+r/9N7CXXziptmquAdPov/s0ioawNjn+Swk=
X-Google-Smtp-Source: AGHT+IHt1jR5XD9845sVRfVXJk9oOqx4VZihn8kcHDN1a+U5MuzF3NMe86gHqr8wYv7wnn00ZADsGQ==
X-Received: by 2002:a17:902:ec85:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-2230798c8c9mr3956505ad.0.1740506392319;
        Tue, 25 Feb 2025 09:59:52 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6f8ec9sm1867028b3a.53.2025.02.25.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:59:51 -0800 (PST)
Date: Tue, 25 Feb 2025 17:59:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v8 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z74FDTtZkjwrjv29@google.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <f465dd9defdc0fc748c2fa2cfc829e37778a4ced.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f465dd9defdc0fc748c2fa2cfc829e37778a4ced.1740504232.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_095953_301919_ED6A1A01 
X-CRM114-Status: GOOD (  17.08  )
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

On Tue, Feb 25, 2025 at 09:25:42AM -0800, Nicolin Chen wrote:
> There is a DoS concern on the shared hardware event queue among devices
> passed through to VMs, that too many translation failures that belong to
> VMs could overflow the shared hardware event queue if those VMs or their
> VMMs don't handle/recover the devices properly.
> 
> The MEV bit in the STE allows to configure the SMMU HW to merge similar
> event records, though there is no guarantee. Set it in a nested STE for
> DoS mitigations.
> 
> In the future, we might want to enable the MEV for non-nested cases too
> such as domain->type == IOMMU_DOMAIN_UNMANAGED or even IOMMU_DOMAIN_DMA.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 4 ++--
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
Apologies for my spelling error in [1]. It's supposed to be:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Correct spelling in [2].

Thanks,
Praan

[1] https://lore.kernel.org/all/Z73zvIbsXzJMCaNt@google.com/
[2] https://lore.kernel.org/all/Z730M3XptvDRObBp@google.com/ 


