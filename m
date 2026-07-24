Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC96EC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg/EcGAZSO+Qz1w6Fca62WR0QTsDRF+HEAtmCs/sfmg=; b=bABuoeDLr8Pz/ZJVzmE2RvZADD
	9b200KBxZP8usYjabaxFejfjMdhK43jnWmG7/rnziW+oY2Dyy+d8yP0w/r4HuId8lgd5d7BCuuyWR
	tHlJm993mEO+5Vgqf8LqszhsSQiWlFr9xeJQ64bbF3DHfP70EnR3PakhE/fNeSJtY9GIoBiUNAa99
	9F8dJz+f41P5SwNfPB0NqUrlYvnMsM2Ke5rPChpLUcnfm17/bCmNgSrPysybQd8dlNG540Zh0YUaX
	z/Tl2Z0m4PmGaQTlUm3HUYucs+cC5YQuhm/R/2+Mw/c4O+++a4KL86yLytHrtSrQTorpLRtsB/1Pw
	CygWIQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBUy-0000000FqIh-1wo7;
	Fri, 24 Jul 2026 08:43:16 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBUv-0000000FqI7-2IIJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784882591; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=lg/EcGAZSO+Qz1w6Fca62WR0QTsDRF+HEAtmCs/sfmg=;
	b=ZOU7NpM9q6eLzcX3mhbJpndZaa2QvjIaIarItdNcj/T/2LY/VUi2wzl7UBvuHeWCKV8RMPAKedXZWs8miHXq1CRz9hbSePDVJYBhpzbrVQXz0YS1/hzt5wJwRIsMUib8blEW2kQxsDU+fRIBknX0Q9pKF2V+XpI0GAYL2TPtat4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7icg7Y_1784882590;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7icg7Y_1784882590 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 16:43:10 +0800
Date: Fri, 24 Jul 2026 16:43:10 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 27/28] KVM: arm64: Expose FEAT_NV3 to guests
Message-ID: <kw7jdrvszacuvzvgdwqooxqgzgvf2wjhf6heddnuydjr6vthlz@qqt63cqorpiq>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-28-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-28-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014313_767316_61861EB9 
X-CRM114-Status: GOOD (  13.67  )
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

On Wed, Jul 22, 2026 at 08:42:33AM +0800, Marc Zyngier wrote:
> Further enable FEAT_NV3 by making it visible to NV guests.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index f646894fec9a9..70d605e60cfb3 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1728,7 +1728,7 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  		 * You get EITHER
>  		 *
>  		 * - FEAT_VHE without FEAT_E2H0
> -		 * - FEAT_NV limited to FEAT_NV2(p1)
> +		 * - FEAT_NV limited to FEAT_NV2(p1)/NV3
>  		 * - HCR_EL2.NV1 being RES0
>  		 *
>  		 * OR
> @@ -1741,7 +1741,9 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  			val = 0;
>  		} else {
>  			val &= ID_AA64MMFR4_EL1_NV_frac;
> -			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +			if (cpus_have_final_cap(ARM64_HAS_NV3))
> +				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV3);
> +			else if (cpus_have_final_cap(ARM64_HAS_NV2P1))

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
>  			else
>  				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
> --
> 2.47.3

