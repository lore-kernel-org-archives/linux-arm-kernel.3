Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51ABC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4ULV7qWu2t/eINan4V/fEzrDSDZKWdgkqhswJbUeP4=; b=2iElmGGdsiT8bQYSLYV/3onX9U
	VrIX4zoTThimxhFWUbzbQlHYRZpifL6B/x+dqdMasLoTk7V+wnUOVfPrc0HqK9ljCABfoXFIQmYJK
	WRwBvdlxN1cYRIIvlobWm3yZRuMS6HVdIasSGpzWJckEVE7jMHMcnrCF6ldZpSWxRLFPraTJGIFZu
	ntBTx1/nwk439JO/MuZgGK7W4wCA5NbqT6rpxkZ8dgofGCZZGct3OWmRFfocf4pGaWQeqwL0YaYVs
	rUC6lNyVc9fkS/XeYHz/jQh8X1rd7zjFoUYxHPZxOgpSG02XwU7dGm6lZbrtWjK1s2rqbi2PAtW2K
	gVAuUwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn94S-0000000FYPO-2iL8;
	Fri, 24 Jul 2026 06:07:44 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn94Q-0000000FYOQ-0fSc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873259; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=+4ULV7qWu2t/eINan4V/fEzrDSDZKWdgkqhswJbUeP4=;
	b=IHOvA6lpY90Ka2b6jSkU1yVsPkHtx480NCaaKS/BRBQlivO3KfBDIQRi1Xyp4yKJPTHun6+oUHQmfDYoeBa5hpqMCu4lJH2GTJ5IW5FnnrMr0wj0ci4BZgp+AuiGIqtIxufllxk2jWPHZL0vQKKL0v24C2uQdP2JEs2If7JbraY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7i9Jog_1784873257;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7i9Jog_1784873257 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:07:37 +0800
Date: Fri, 24 Jul 2026 14:07:37 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 11/28] KVM: arm64: Expose FEAT_NV2p1 to NV guests
Message-ID: <2eghvvqryy347mukqfcr736tthcwiws2cfo3wxfiq66oyxln2z@c6bpes4rako7>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-12-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-12-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_230742_841204_DA6B25B0 
X-CRM114-Status: GOOD (  14.51  )
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

On Wed, Jul 22, 2026 at 08:42:17AM +0800, Marc Zyngier wrote:
> Since NV2p1 is reducing the number of traps, it is valuable to expose
> it to NV guests. Do so.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index dfb96edbdc43c..35a1c42ad3f84 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1728,7 +1728,7 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  		 * You get EITHER
>  		 *
>  		 * - FEAT_VHE without FEAT_E2H0
> -		 * - FEAT_NV limited to FEAT_NV2
> +		 * - FEAT_NV limited to FEAT_NV2(p1)
>  		 * - HCR_EL2.NV1 being RES0
>  		 *
>  		 * OR
> @@ -1740,7 +1740,11 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  		if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features)) {
>  			val = 0;
>  		} else {
> -			val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
> +			val &= ID_AA64MMFR4_EL1_NV_frac;
> +			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
> +			else
> +				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
>  			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, E2H0, NI_NV1);
>  		}
>  		break;
> --
> 2.47.3

