Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2898CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Drg44PID7vSo8k08KdqnAjGAkoAPIda9Boa1pGJLFck=; b=b6tmSch2/AW7DqhHZ/tqiJjrGP
	J9ShYJuSqk/Df1XQ3mk1gwkDWg2P9+3+bXXdLigQS6ubtsb/D2a4N9LPPg/KdCZ371Uau2wrFqAkj
	IBxULspG5dib9L05crwWBgSxep+hfHzXkUszQK7hdtc6iYTkg8bk9FSrzw9U201pepscnl68H6aWb
	icZw8Oizuwc8z1f7OK9Ju8sC61KnOA2ovrFbpM7D0i7/28aIlW5Ow8qdfwETZDCK02iSpKZ/z8/gR
	62aGc8KpMC2dcno7TI0fgpvLqvlNcZT6/FqocYFRVE5aS4BN3OKnu+pOvNq2Rs46AQ227heIacP84
	x+B+CbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuWW-0000000Da3s-16b5;
	Wed, 04 Dec 2024 18:54:56 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuUo-0000000DZhW-14wJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 18:53:11 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 3A22872C97F;
	Wed,  4 Dec 2024 21:53:09 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id 2915C36D0178;
	Wed,  4 Dec 2024 21:53:09 +0300 (MSK)
Date: Wed, 4 Dec 2024 21:53:09 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>,
	Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <20241204185309.v4yq6n7antt7m7jb@altlinux.org>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck>
 <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org>
 <86ser6t6fs.wl-maz@kernel.org>
 <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
 <20241203092721.j473dthkbq6wzez7@altlinux.org>
 <1847e34fa7724d28aeb22d93752f64f2@huawei.com>
 <20241203221453.mwh6sozyczi4ec2k@altlinux.org>
 <87jzcfsuep.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <87jzcfsuep.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_105310_622327_82CB1C33 
X-CRM114-Status: GOOD (  28.96  )
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

Marc,

On Wed, Dec 04, 2024 at 08:51:26AM +0000, Marc Zyngier wrote:
> On Tue, 03 Dec 2024 22:14:53 +0000,
> Vitaly Chikunov <vt@altlinux.org> wrote:
> > 
> > I tried to verify that MPAM is advertised with qemu+gdb method, as
> > suggested by Oliver, but ID_AA64PFR0_EL1 register is not there.
> > 
> >   (gdb) i r ID_AA64PFR0_EL1
> >   Invalid register `ID_AA64PFR0_EL1'
> 
> Then there is a bug in either QEMU or the GDB stubs. This register
> exists, or you wouldn't be here.
> 
> > 
> > Are there other suggestions?
> 
> Mark has described what the problem is likely to be. 6.6-stable needs
> to have 6685f5d572c22e10 backported, and it probably should have been
> Cc: to stable. Can you please apply the following patch to your *host*
> machine and retest?

Looks like I will be able to test this.

Thanks,

> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 370a1a7bd369..258a39bcd3c7 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1330,6 +1330,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
>  			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);
>  
>  		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
> +		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MPAM_frac);
>  		break;
>  	case SYS_ID_AA64ISAR1_EL1:
>  		if (!vcpu_has_ptrauth(vcpu))
> @@ -1472,6 +1473,13 @@ static u64 read_sanitised_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
>  
>  	val &= ~ID_AA64PFR0_EL1_AMU_MASK;
>  
> +	/*
> +	 * MPAM is disabled by default as KVM also needs a set of PARTID to
> +	 * program the MPAMVPMx_EL2 PARTID remapping registers with. But some
> +	 * older kernels let the guest see the ID bit.
> +	 */
> +	val &= ~ID_AA64PFR0_EL1_MPAM_MASK;
> +
>  	return val;
>  }
>  
> @@ -1560,6 +1568,29 @@ static int set_id_dfr0_el1(struct kvm_vcpu *vcpu,
>  	return set_id_reg(vcpu, rd, val);
>  }
>  
> +static int set_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
> +			       const struct sys_reg_desc *rd, u64 user_val)
> +{
> +	u64 hw_val = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
> +	u64 mpam_mask = ID_AA64PFR0_EL1_MPAM_MASK;
> +
> +	/*
> +	 * Commit 011e5f5bf529f ("arm64/cpufeature: Add remaining feature bits
> +	 * in ID_AA64PFR0 register") exposed the MPAM field of AA64PFR0_EL1 to
> +	 * guests, but didn't add trap handling. KVM doesn't support MPAM and
> +	 * always returns an UNDEF for these registers. The guest must see 0
> +	 * for this field.
> +	 *
> +	 * But KVM must also accept values from user-space that were provided
> +	 * by KVM. On CPUs that support MPAM, permit user-space to write
> +	 * the sanitizied value to ID_AA64PFR0_EL1.MPAM, but ignore this field.
> +	 */
> +	if ((hw_val & mpam_mask) == (user_val & mpam_mask))
> +		user_val &= ~ID_AA64PFR0_EL1_MPAM_MASK;
> +
> +	return set_id_reg(vcpu, rd, user_val);
> +}
> +
>  /*
>   * cpufeature ID register user accessors
>   *
> @@ -2018,7 +2049,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_ID_AA64PFR0_EL1),
>  	  .access = access_id_reg,
>  	  .get_user = get_id_reg,
> -	  .set_user = set_id_reg,
> +	  .set_user = set_id_aa64pfr0_el1,
>  	  .reset = read_sanitised_id_aa64pfr0_el1,
>  	  .val = ID_AA64PFR0_EL1_CSV2_MASK | ID_AA64PFR0_EL1_CSV3_MASK, },
>  	ID_SANITISED(ID_AA64PFR1_EL1),
> 

