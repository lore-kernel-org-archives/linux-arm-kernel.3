Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TKZFSylF;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bSYo+2tE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVNQzZPkVhaJesZfY8LQ/WfX4unos7POmP6IgKPN9ZE=; b=TKZFSylFvYFGxc8s1md9kbSZEr
	cZR8b2HCxdij1CDJtitf8R/yXZkcn6ww2Wba96H1vstQam3C8BuEJN8Md5yu6BWns44s4WhUcRZsr
	8cKfSweNiaNI28MjiID7CcDOAcs0rRVZ8vtvmnofXuqOdMxph23ol8bURorNQhz1h04u5+nQ8rMLi
	WnxYtRvT1X5V5k/CQiQFif1IFcDeRC1MNMTO8aaAZC723yoCOtKESFv/dE3LrVlZtbNjvvLVCyEz8
	72LBPlgrCNYqwwt/UzvRkyI9sDHQenchMTRrEV08CmdKL4rGDnU/Ym6BtVvKK8dcBPYLqrrRHftUS
	iHfulJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7q4-00000009WWF-2oQU;
	Tue, 20 Oct 2026 11:17:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7q1-00000009WVb-3AVw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:17:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1de789b63so47685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792495020; x=1793099820; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVNQzZPkVhaJesZfY8LQ/WfX4unos7POmP6IgKPN9ZE=;
        b=bSYo+2tEnYzkZvKW3Wr9wrOuiMP6YwVid7z2mdlJXoy99DFAdcJYDkz3IrOHXdAact
         DygWiiWXjBp044DzJ+in/NHNK6ctZ2Q7Pe289F6CRgvffNZKDMcCFWdSRtC5PuEehjGg
         ytBRWylWtPf5jxjBpgn/smyByy7aBSKC0gUHM6acZ+D2qn7gSPbXJbMm+Fku2+RW7H3j
         b/EeaDRc8E5A+xEOk1KenFW1NOCABVaF4re6Xl87+7CqkAhu1Brd2WZLIlG6lO1lsYjV
         OLP/iJjxGON+qcrOmnLtWKrY6wnpvsxRCfYhhyN4+THzTXgBlq37AAziaTJ4oFpE8b0a
         J2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495020; x=1793099820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bVNQzZPkVhaJesZfY8LQ/WfX4unos7POmP6IgKPN9ZE=;
        b=n/1kH+GQjgThdSkrahkKXW8kNsBT/D/zSFT5Azb4vqnHsztwSlSMFTT8FMLPXUjWdg
         jykRdPs9xlyT4CZaqPtBoUYVvNNdpOtKIvyx3B5Phrgj9ZLwPF2muO9beFKoRXXwT6RE
         LdifvcJtTAgCf+TovDECuD+i54n4dzVK8s4srUmbDM1KReRzGGVlnyx5eVMeJkrxLk47
         I9p3/zKbAi/1r0HjyiQzcDvr865f0nQ/urO2r0x9ZxsShYSpUjk7QBb+1I6ReCPYpzu/
         ys1PqjMxhcKc/FINRhdAoOgoKWuty+K4fjK6izGWW/tCDqUN7l3gbuDBKTW3fBJnRXqE
         PYLQ==
X-Forwarded-Encrypted: i=1; AKwUvByYcgKvLssC999kGY70SISLxLIKrX2PV8h5EMn2C36qobVk53uHdtFGhfiyDQHDnlI/sN/HY9YKTOV72SkprbSt@lists.infradead.org
X-Gm-Message-State: AFq9FYI8Dx9xjTINmj2s8eMx/MHQ6toCaTDz+z87XpKMb8Swi8GGZZaj
	R68wh+79fCA9RwkxuoiWr4yWR62XFfji6PJOK/ZvC1Z3JRlgD9FyZqj7F4mTjs4odQ==
X-Gm-Gg: AYBFou1sVhJu4k1yvcjA/6uyqRra4EJld1ESc32l6Dlgi45IBGD6jfH6H5bT+PoBqEd
	Spfb4iN5TnoinmBdMrhVyHylLip2p1X3Dr681kJudJAqXmFWNV0NJ0l+duIFGD0ywXZ3Fy9f02O
	LFkB6qx1xN8VwVZGcqbZRbAKAAn/y7Nv0ysKPi4sZYAwKNH4kw+bNUmM4Lm4AmRGA8cC/oxF3+L
	8hEwNzFIJcHpHPGlP8VXaVB/5HyGvumCOHZkve7C+RBGRhAYMQsFqsZpVtAIpuhxvxg08/M+GGV
	rWefkmnTvb26IXhUhoWj4VWAtr8v5G9bQRo3QDTv+aQ313UyohmvDbEBUxU7HY9FydJQAXzEeTl
	LjcJ5nOsjlGoO2+s/NFagtzlULwsEBOt1jwUgQyXAtrSUCqJcp9Tb1LnUdCg5c8dKsSQ5tA+DPY
	IlXQJU02Vt6sWF1KYL4QjqvXF8WJN4BdROWau3eK2P8qZfIXRnxBYTfekMGnFGDdaJYqkXRE+nX
	hfrqdMYoUcH9kGzsLK2lW4tqA==
X-Received: by 2002:a05:600c:a3a5:b0:4a1:a48c:17eb with SMTP id 5b1f17b1804b1-4a1f59a5836mr572995e9.11.1792495019224;
        Tue, 20 Oct 2026 04:16:59 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82fe82sm5139903f8f.51.2026.10.20.04.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:16:58 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:16:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 04/11] iommu/arm-smmu-v3: Add ARM_SMMU_FEAT_EVTQ for
 the event queue
Message-ID: <atdNpl732M7D4dXz@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <250a57bbdd232bbb1e3511b7768a1c9ae3d204e6.1791226953.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <250a57bbdd232bbb1e3511b7768a1c9ae3d204e6.1791226953.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_041701_948505_4AD324F7 
X-CRM114-Status: GOOD (  31.47  )
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

On Mon, Oct 05, 2026 at 12:30:47PM -0700, Nicolin Chen wrote:
> The driver programs and enables the event queue unconditionally, while the
> PRI queue has an ARM_SMMU_FEAT_PRI gating each of its touch points. Yet a
> kdump kernel wants to leave both of the queues alone, which would take an
> is_kdump_kernel() test at every one of those places.
> 
> Add an ARM_SMMU_FEAT_EVTQ that the probe always sets, as the event queue is
> architecturally mandatory, and gate the queue's allocation, its interrupt,
> its MSI vector, and its CR0 and IRQ_CTRL enables on it. A subsequent change
> will turn the queue off in a single place.
> 
> No functional change intended.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

There is a nit below though.

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 89 ++++++++++++++-------
>  2 files changed, 61 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 8f2c0b1cc4a8d..559bfa8cbc5e0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -972,6 +972,7 @@ struct arm_smmu_device {
>  #define ARM_SMMU_FEAT_BBML2		(1 << 24)
>  #define ARM_SMMU_FEAT_HAFT		(1 << 25)
>  #define ARM_SMMU_FEAT_DS		(1 << 26)
> +#define ARM_SMMU_FEAT_EVTQ		(1 << 27)
>  	u32				features;
>  
>  #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6ff61565f7583..756825e004774 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2381,7 +2381,8 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
>  
> -	arm_smmu_evtq_thread(irq, dev);
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
> +		arm_smmu_evtq_thread(irq, dev);
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		arm_smmu_priq_thread(irq, dev);
>  
> @@ -2390,7 +2391,12 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  
>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> -	arm_smmu_gerror_handler(irq, dev);
> +	struct arm_smmu_device *smmu = dev;
> +	irqreturn_t ret = arm_smmu_gerror_handler(irq, dev);
> +
> +	/* Without either queue, the thread would have nothing to drain */
> +	if (!(smmu->features & (ARM_SMMU_FEAT_EVTQ | ARM_SMMU_FEAT_PRI)))
> +		return ret;
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -4763,11 +4769,14 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
>  		return ret;
>  
>  	/* evtq */
> -	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->page1,
> -				      ARM_SMMU_EVTQ_PROD, ARM_SMMU_EVTQ_CONS,
> -				      EVTQ_ENT_DWORDS, "evtq");
> -	if (ret)
> -		return ret;
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
> +		ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->page1,
> +					      ARM_SMMU_EVTQ_PROD,
> +					      ARM_SMMU_EVTQ_CONS,
> +					      EVTQ_ENT_DWORDS, "evtq");
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if ((smmu->features & ARM_SMMU_FEAT_SVA) &&
>  	    (smmu->features & ARM_SMMU_FEAT_STALLS)) {
> @@ -4950,7 +4959,15 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>  
>  	/* Clear the MSI address regs */
>  	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> -	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +
> +	/* PRIQ's vector needs EVTQ's to be kept */
> +	WARN_ON_ONCE(!(smmu->features & ARM_SMMU_FEAT_EVTQ) &&
> +		     (smmu->features & ARM_SMMU_FEAT_PRI));
> +

I can't see how we can end up in this case, I’d suggest dropping it
if I am not missing something.


> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
> +		writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +	else
> +		nvec--;
>  
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> @@ -4987,16 +5004,20 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  	arm_smmu_setup_msis(smmu);
>  
>  	/* Request interrupt lines */
> -	irq = smmu->evtq.q.irq;
> -	if (irq) {
> -		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						arm_smmu_evtq_thread,
> -						IRQF_ONESHOT,
> -						"arm-smmu-v3-evtq", smmu);
> -		if (ret < 0)
> -			dev_warn(smmu->dev, "failed to enable evtq irq\n");
> -	} else {
> -		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
> +		irq = smmu->evtq.q.irq;
> +		if (irq) {
> +			ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> +							arm_smmu_evtq_thread,
> +							IRQF_ONESHOT,
> +							"arm-smmu-v3-evtq", smmu);
> +			if (ret < 0)
> +				dev_warn(smmu->dev,
> +					 "failed to enable evtq irq\n");
> +		} else {
> +			dev_warn(smmu->dev,
> +				 "no evtq irq - events will not be reported!\n");
> +		}
>  	}
>  
>  	irq = smmu->gerr_irq;
> @@ -5029,7 +5050,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  {
>  	int ret, irq;
> -	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> +	u32 irqen_flags = IRQ_CTRL_GERROR_IRQEN;
>  
>  	/* Disable IRQs first */
>  	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> @@ -5055,6 +5076,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  	} else
>  		arm_smmu_setup_unique_irqs(smmu);
>  
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
> +		irqen_flags |= IRQ_CTRL_EVTQ_IRQEN;
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
>  
> @@ -5173,16 +5196,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  		smmu, arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NSNH_ALL));
>  
>  	/* Event queue */
> -	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
> -	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
> -	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
> -
> -	enables |= CR0_EVTQEN;
> -	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> -				      ARM_SMMU_CR0ACK);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to enable event queue\n");
> -		return ret;
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
> +		writeq_relaxed(smmu->evtq.q.q_base,
> +			       smmu->base + ARM_SMMU_EVTQ_BASE);
> +		writel_relaxed(smmu->evtq.q.llq.prod,
> +			       smmu->page1 + ARM_SMMU_EVTQ_PROD);
> +		writel_relaxed(smmu->evtq.q.llq.cons,
> +			       smmu->page1 + ARM_SMMU_EVTQ_CONS);
> +
> +		enables |= CR0_EVTQEN;
> +		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> +					      ARM_SMMU_CR0ACK);
> +		if (ret) {
> +			dev_err(smmu->dev, "failed to enable event queue\n");
> +			return ret;
> +		}
>  	}
>  
>  	/* PRI queue */
> @@ -5330,6 +5358,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	u32 reg;
>  	bool coherent = smmu->features & ARM_SMMU_FEAT_COHERENCY;
>  
> +	/* The event queue is architecturally mandatory, unlike the PRI queue */
> +	smmu->features |= ARM_SMMU_FEAT_EVTQ;
> +
>  	/* IDR0 */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
>  
> -- 
> 2.43.0
> 

