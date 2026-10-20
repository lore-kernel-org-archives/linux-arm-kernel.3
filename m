Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E086606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oZC+Ysci;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GhTLzmuC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhRLvzJzPI5U781F/KKbvaLNO/DRwhdbN5Luxo3sgyY=; b=oZC+Ysci7J/Rn6lVqj9uCkTuUt
	7ITryQhHcv6XrlKQoP2YyraRk7L7fPCYJ1Ylwb3ClJ4RL+QMh6hY205CEAAaIk/nbgAHE1utmvLG3
	f/doP23wvOt5JPTeWdC7amzZM1mU0pHPumwKLsKEC5Dulgn3ErF4A9PbnT3jRehWvU5zpvFK27BKL
	U0nRdJdXV1RGEQUuNwlB6J7xpYmewFjAI4JDQ4DiXWSHnehy3kvDf52LAdilBDgS/4sLO6jno41Vg
	oBuwifXUxJOq3nCCMCEFsuQnZfZnCAkinxmeiLitecQSGW64nj0QTFoWqpRK32CMSjDmDti94/SF8
	1lqm64OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7vl-00000009X1y-2Qs1;
	Tue, 20 Oct 2026 11:22:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7vi-00000009X1c-43s8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:22:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a1d2ec9aadso41455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792495373; x=1793100173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZhRLvzJzPI5U781F/KKbvaLNO/DRwhdbN5Luxo3sgyY=;
        b=GhTLzmuCp+ZvWSvKvp9JIUfqNxAZbbUXJE2GCEAdp/IaDud3WryMMKYAqt6u5yRElO
         h7HuAVRWVRBtxnU1yzXSocYsf/TQsZQZ19hyoEHHUkiOGnYxNASNd1F5KqJZ72Jm3lV7
         EAWcpIH5V8dcDqMCWFWbJppLCNsihrHqG1EfhCmXyjzASK7J0oaNWc79pRAp6TRPsG5u
         Nd7/K2JUDANSNv1ExYjzUbhSmoy2l0q0dWovRXrVrfler5UML6l22inawEHHqm1NUKtf
         kbGrVlaNEyZtW8nruZVnCbcMhmztO9br9ANjGOzp791T73jYY+v03hHEnf4Rh3xawlYc
         FI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495373; x=1793100173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRLvzJzPI5U781F/KKbvaLNO/DRwhdbN5Luxo3sgyY=;
        b=b92rMEP30D8jx5JWxxP1olD1EvTOMsrbVwNt4KHOOypIHwXoQpLREZxj7w+ZDMdtuu
         ynHI4V/bWIc417mKsYrBIkQUURc4Xo99fDYQR70djCUhMnik//NTGov98QvQ25M118x1
         +h8P72zOQk1G/j5k7olHk/s1XLkh9LSyeoj+D7ktQUJWSc+IOSBeeSe4y9xRJ3Ne0u6u
         nBkpyxjQJ9jnhFhgU2OpIqmdIvj3PRqRsoW2ecIP8tcNsgE8JvsFWySAf9/1+y+mHP2M
         woaIjGiZybsQLHVYEoX9BaJYwQ5udSeUET0OX2iACCeFfBv4fpbVi4Mb+/Fq08zrBvvN
         pf+g==
X-Forwarded-Encrypted: i=1; AKwUvBx4OXywkVyxyMZdYArkoY4aeWqmTeyA1EOag/z3RRASmRt/JgUHwJvtqH/z8kP1Ai9YuaOcR+hzNGqNCSL9zjUA@lists.infradead.org
X-Gm-Message-State: AFq9FYLYD7urlCHdBHiuL0scO49qoVhKR/Kt74cbUGwKUu9SyMYdREm1
	N+AUCqdWSzDe0ctOyhvk+pMF3sVlVuHcJeLAPUty+RyTof/ypeKfSaLxdjHMMk3p+w==
X-Gm-Gg: AYBFou2fAgzMCozWqshW8y6/nmH1aswJqC+MEvcQvWdSRy/n/Q8+FUJH3Edl3sNWL35
	rSvo8d9JiE/bPan9mjp2GbDuaX6UI5BigHrU8bRmczfDiGnHYxvfMfBTK+EaftkmgbdPuI7swLh
	D/hVz9/EKAkj3VB3r5rn/Go7ewZ1KChKvPfKQzy35F0u1zY6TnscsdR9TrzvGAwF+sX8gOwcJDK
	9XOu80aP1nWTLxuelNhd8KU8u8UqzThVuD/QupKhRX82g+rztk5iiVPjnQZXTcD1EOweQxtFVG4
	6B0B4QptdBIRYO0GBomjlDGPmfaK5LtqC8EzXBqoHx7+9CtycSgYKIr+aRHWBHgQ2omP78Bv/im
	zGz5Yam9z+tyVeTQLFV5Iut06UxK7DquNlCTxmt8Ce/bfbNcaLwKVww8Zbf4aNhhEeS190j5V8K
	Jao6plRaQmWCJWbANEpD644NNvZM0Qwc0ZxU0xS9dl3opyc0Uy9MIZd+4Tw6EwTmo17gwDd77aw
	ajzLDe27lmEgyVFznioxWX/4PinNTMjI6ecgCkV
X-Received: by 2002:a05:600d:640e:10b0:4a1:98b1:1de9 with SMTP id 5b1f17b1804b1-4a1f59c151cmr652475e9.13.1792495372639;
        Tue, 20 Oct 2026 04:22:52 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm5787276f8f.33.2026.10.20.04.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:22:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:22:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 05/11] iommu/arm-smmu-v3: Disable the EVTQ and the
 PRIQ in a kdump kernel
Message-ID: <atdPBqd1-xLNZ1hs@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <fdebf9f372ebabd7a44581a2068d6fcbff058783.1791226953.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdebf9f372ebabd7a44581a2068d6fcbff058783.1791226953.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_042255_024323_B9BA0B02 
X-CRM114-Status: GOOD (  24.78  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 05, 2026 at 12:30:48PM -0700, Nicolin Chen wrote:
> A kdump kernel cannot use either queue. The crashed kernel's CDs and page
> tables might be corrupted, so events would spam the EVTQ, and there is no
> way to serve the page requests that would arrive at the PRIQ.
> 
> The reset routine still enables both of the queues and then masks the two
> enable bits back out, having already programmed the queue bases and taken
> the interrupts of both.
> 
> Clear ARM_SMMU_FEAT_EVTQ and ARM_SMMU_FEAT_PRI in the probe instead, so as
> to entirely skip the queue initialization and handling in a kdump kernel.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/all/amiBagGKn-Aym1DK@willie-the-truck/
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 756825e004774..42cd30c79211e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5247,9 +5247,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  		return ret;
>  	}
>  
> -	if (is_kdump_kernel())
> -		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> -
>  	/* Enable the SMMU interface */
>  	enables |= CR0_SMMUEN;
>  	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> @@ -5576,6 +5573,15 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	if (arm_smmu_sva_supported(smmu))
>  		smmu->features |= ARM_SMMU_FEAT_SVA;
>  
> +	/*
> +	 * A kdump kernel wants neither queue: the crashed kernel's CDs and page
> +	 * tables might be corrupted, spamming events, and page requests cannot
> +	 * be served. A disabled queue discards new records without raising any
> +	 * global error.
> +	 */

I find this a bit confusing. If the CD or page table of the crashed kernel are
corrupted how is it safe to adopt them later in this series?

Thanks,
Mostafa

> +	if (is_kdump_kernel())
> +		smmu->features &= ~(ARM_SMMU_FEAT_EVTQ | ARM_SMMU_FEAT_PRI);
> +
>  	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
>  		 smmu->oas, smmu->features);
>  	return 0;
> -- 
> 2.43.0
> 

