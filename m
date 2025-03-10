Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFA7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Bo5Sb//e4/TpGlaD4cLHv5CTVxyF4CiZevTRPO3KJI=; b=1d/g45A1GsNfjxJ4pDxv9MQWoB
	0NS0omWSdDJRuWVn+Wt0+Ra9qI4xsD5NStNfq6SI315LyhFbUXeiHCBTzw8vJACDA4F+lE5HHaj1u
	xEGOlGEfAW4Ogw1zwQdEQj9zvojkH9NDJ45/mUF2G2whCr3xD4Y0bmDde7iO6ZOOQpSbISQ+LS7Zz
	XNc/eu/eaKFrUmmRp7q9k4GfXNv/z+rt2CoTpBnHJJIkKmLDj6FoMtapSsSEcRTQ1Ig+kRwdgtUrH
	HyEA1BIQSGMbTG9Y4qT9+y3UQrhU/Vc1Xq+fj4lzp9gd/uToY5bMp7+C2BhpVpER+6O4yrFA3vzvc
	uvL45yVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triRS-00000003hL7-27YO;
	Mon, 10 Mar 2025 19:05:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfvt-00000003LVC-1055
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:24:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA7F31692;
	Mon, 10 Mar 2025 09:24:59 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 798013F5A1;
	Mon, 10 Mar 2025 09:24:47 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:24:41 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] arm64/fpsimd: Remove unused declaration
 fpsimd_kvm_prepare()
Message-ID: <Z88SSYFJo9R_YgO3@J2N7QTR9R3.cambridge.arm.com>
References: <20250309070723.1390958-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309070723.1390958-1-yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_092449_317468_257F348A 
X-CRM114-Status: GOOD (  13.95  )
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

On Sun, Mar 09, 2025 at 03:07:23PM +0800, Yue Haibing wrote:
> Commit fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host
> FPSIMD/SVE/SME state") removed the implementation but leave declaration.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

My bad. Looks like a sensible cleanup.

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/fpsimd.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index f2a84efc3618..564bc09b3e06 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -80,7 +80,6 @@ extern void fpsimd_signal_preserve_current_state(void);
>  extern void fpsimd_preserve_current_state(void);
>  extern void fpsimd_restore_current_state(void);
>  extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
> -extern void fpsimd_kvm_prepare(void);
>  
>  struct cpu_fp_state {
>  	struct user_fpsimd_state *st;
> -- 
> 2.34.1
> 
> 

