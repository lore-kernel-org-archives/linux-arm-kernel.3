Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77F3606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cFcLl5Ei;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DL277mBx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2O75Mv2XtxZlV4hudBgTA9FuTJanexSJUKv97fAgems=; b=cFcLl5EimZTDHZwtGhwZdfBWpj
	RUu4YjyBhNsvWBkapbKRcf7+vmBo12yVje6F5iOLZo2BKGMc4CBBUtgE5ev8CQiRBM4kp9y/4g7mG
	qXqLGUnaaQmZ6qksaWJ0wSIaEnt5UArugPKhwqF4GDRKRvA7C/wk10KZMWQ0oRMYuFJqn8yuDeLm1
	Ia5mAnjoegk6BPtWuJfq+WzlTC8P9tJ0ry/niqQWCbEjivcPgk+uMMM9Q+FsH2h4+nqpWW9H7aQSq
	CzdqnsKRdfLKApAGe4yeL8w96QnPWElg/q0mR6197Mj7rsE1bvUa6nfW/HeaAQ9O0jdc6yLT51bFI
	JtiG/iOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeze-00000004OGB-3QeH;
	Tue, 27 Oct 2026 11:05:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLezb-00000004OFj-3yIm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:05:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c45111bebso1810680f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793099122; x=1793703922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2O75Mv2XtxZlV4hudBgTA9FuTJanexSJUKv97fAgems=;
        b=DL277mBxkco5egESWTgs/6LdoU5kftfK9cnpDwADhUtZdaG4nx19TRAFI/tuSXnm49
         WWJV27EF02uugw+rM+hT9RM/6x2kDO/thtXYE6tDg2amD49xG5I7ldKdxZ82TndKfEvS
         dHbGLnVK72QcjggN7/mgxeRJjyNHvLgOPq0/f0/wtkB72ku6A3q9b2EuA8rlsVl+dUIL
         f1m69mTd/0L3FkcLo+IUwnA1hbpVwU0iFqgP0+Yixa9j0FFbqDsc9eHz7ab/Di4XnYBA
         73N7Fj+MbYq6SHgRj/prMvDZnA1JMsKZKzulDLxscR/ji8je0LV/nWSDUR365wNqTkRo
         uRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099122; x=1793703922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O75Mv2XtxZlV4hudBgTA9FuTJanexSJUKv97fAgems=;
        b=2A1BL00Tg6eU9FNk4OjWmbiH9koyIGFutIQEB2gg7n4x742ysjTO1DxyCHhyf0XiyV
         nwsCVvm7214jfLxJGIsJOGN5+Oi0gpw0vh/E8359RJsQgMo1BPtAGzAyqY9VbI+Aucjv
         GJShfxkZ+mMuydth6favCDr7en0gMgTU6FXMYv8qaq9Yrww67zBe2m4DRmVt0s6sGjSg
         v5uB+PuY6ro1GD0lU0B8HRUrymxlXDWwNehr8k+gAot3wRCitZBO+pwMZOP9n5Nwn/J1
         fPDpT+qMpaOt9QqL87t4enjod94g1oNkqQ9115lEPV5MtkteFx/8n1QTzW4lvE1S+cqz
         hNyg==
X-Forwarded-Encrypted: i=1; AKwUvByrNQZdzjHVqSdFoAX2KNcOBmzAHj+SBUni7Ob8duAj80/XNPmnQd1L4cMkPlgRxd1GIM2hOxlCpleQPdqB16ni@lists.infradead.org
X-Gm-Message-State: AFq9FYKDVlR42phMhaS7/uizG7NIJKlMH/3X64dG8VXUU1sUmNJC3W2q
	HQsR/G3PrWzEAYyKXxWsioi11P/xJlbORtWhRhghC1fArTS3A7/O5DOS2O3A7sOPGQ==
X-Gm-Gg: AYBFou0Lqsg6kt4amBO282Z99MjeeGAO6OsGO4nBcOeCv9bL4l1dLahWn1ieGifUguv
	8rLAMSDkSszR7IXDTdeRdrCSsD04JiOCleudPn7nwJgUTjfwqGCirHE9FnLdcw1jnqwyvGCCaSm
	BMb8A+QASXpZQwlkKB9qni6jXsyI4sFTYD3jjW+J5tvajtj0Ie/y3Z4aRRTxCf5kwwGPQeGUS4G
	GnfhUdfpIFdmFVwFp9/QZ318kRahhrtfYKNANCqkNAUtYbjdwpVtxZksCjGi7pX3BMV3PDQBNtt
	KUmA8Bo8kf+1XgoR0cV2RKEoDFM3ZuOX8+ezx/kUhg0/wdncV/DA27CMTpxo141o4EVKGmsBoqt
	Aty6Im2x+/fmfcZf6ksLPRJwolGVkm+3vs2ST36Uh6CqVIkVJwaLdda4dd68yK9W0eaonh+iYCr
	/DdRj+p6fXKDZdIdYg6HvDmzHaa9VHnFnieAtOKmMhctYly3JRgGVq4FcaCYYPwabDcry5+FWFQ
	ShwgDDLWPs8uS1JHoBAdwfVVo0Ew2OIhjk4fw6xUadRgoLxs8JvGweAUNBzhLa0OyRgSvuZ+fSG
	zE6XXPL3BzUAtNO/a4AIzwMSmdsY/b0jAI5wTg==
X-Received: by 2002:a05:600c:4f0f:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a35ac803e2mr215293275e9.10.1793099121225;
        Tue, 27 Oct 2026 04:05:21 -0700 (PDT)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm174413535e9.0.2026.10.27.04.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:05:20 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:05:15 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Pass the PMU events to the hyp vCPU of
 non-protected guests
Message-ID: <auCFa2VPEmxx2ZcC@google.com>
References: <20261027081147.498183-1-fuad.tabba@linux.dev>
 <20261027081147.498183-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027081147.498183-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_040524_011287_015332C2 
X-CRM114-Status: GOOD (  22.30  )
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

On Tue, Oct 27, 2026 at 08:11:46AM +0000, Fuad Tabba wrote:
> From: Oliver Upton <oliver.upton@linux.dev>
> 
> Before every run, the host records in vcpu->arch.pmu.events which perf
> counters to disable and enable around guest entry, and
> __pmu_switch_to_guest() applies them at EL2. Since commit be66e67f1750
> ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()"),
> protected mode runs the hyp vCPU instead, and flush_hyp_vcpu() never
> copies the events into it. So the counters backing a non-protected
> guest's PMU are never enabled, and every counter the guest reads stays
> at 0, the cycle counter included. The host's counters that exclude
> guests keep counting the guest as well.
> 
> Copy the events into the hyp vCPU of a non-protected guest on every run.
> The events only exist with CONFIG_HW_PERF_EVENTS, so the copy is built
> under it. Like mdcr_el2, they're host-controlled and never reach a
> protected guest.
> 
> Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
> Link: https://lore.kernel.org/all/20240305184840.636212-2-oliver.upton@linux.dev/
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> [Fuad: non-protected copy only, tested on the hyp vCPU, under
>  CONFIG_HW_PERF_EVENTS, new message]
> Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d715aa942577e..28a292deecb64 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -690,6 +690,16 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
>  		host_vcpu->arch.external_debug_state = hyp_vcpu->vcpu.arch.external_debug_state;
>  }
>  
> +#ifdef CONFIG_HW_PERF_EVENTS
> +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +		hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
> +}
> +#else
> +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu) {}
> +#endif

nit: Could save a couple of lines by just doing?

#ifdef CONFIG_HW_PERF_EVENTS
   if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
        hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
#endif

> +
>  static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  {
>  	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> @@ -698,6 +708,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  
>  	fpsimd_sve_flush();
>  	flush_debug_state(hyp_vcpu);
> +	flush_pmu_state(hyp_vcpu);
>  
>  	/*
>  	 * If we deal with a non-protected guest and the state is potentially
> -- 
> 2.47.3
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

