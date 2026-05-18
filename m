Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yi0yqBmj4Fj5pS8XdrreLBwJA8eRheXQa5NGK+5zq7M=; b=GdxQxmKIWPppdNok0VsE4lmnNQ
	EdBmgsSCmH8sPOhtKI+QwJJgqOaXFd8VBqSKwnY+lfORlsN6ECNbqOs2nnUfJhdPimVorcLTzY081
	XIipQdSjoppBRWeuEjKBKz4bWK6ajS0oYkNOYiXCmLrnBB2YOriYI3KAbPigYHcumUTlsfmgip1+Y
	poISUr4DJ71j2dPwIGJJohUrb7x9s2GpZ2DIzjK6OZ99RRHHaZ2bsKMGy/5HsGnyGl36b197/GnlC
	Z7kdTnVMN42Vws90gpjQpMZzrcNgXZ7FdgRa2376fAjOjbigxGygARjxxmrvVcKYEeOOjOyXMDB16
	YxxcYAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqXR-0000000EJtY-20mP;
	Mon, 18 May 2026 05:29:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqXP-0000000EJtG-31OV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 05:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Yi0yqBmj4Fj5pS8XdrreLBwJA8eRheXQa5NGK+5zq7M=; b=HwsyZKNwiEd6J3GkAFycU+B3jn
	I+/xNmPbSn/pD67g8v4nIkE9tBjUu9zM+2fc63MaKp2fNZDiIv7iM2W/9JDXBcxkkq0CE6no3qEyi
	F8ePGtvaXD0E8iUXTYmnZdYYvZ6vuysss8V5fENQR1DT66cR1cvka1uWXwPSz8hxfpPUgDK4cz4q5
	CIm5NGzqyb5WXbhN4EolUt7shBEGbQcsYUW1itYb7oPkFVDlm6iBVtDpOipKuAxDHQXSj/Fqh24Uz
	FtE0iKIIiNVdoXk+pCwgbMP5cWfPfNxryKRhWZIkTW76neQg10KncyWiLOMuXJ2qh/TDEuIrCZNDX
	DxSAlhVg==;
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqXK-00000009us2-1FpB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 05:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779082133; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=Yi0yqBmj4Fj5pS8XdrreLBwJA8eRheXQa5NGK+5zq7M=;
	b=YULlcTT5/tLB9MbC6VmyumTkaCLKfHM6Er/s6uJWrVJMX07CcO78r3jnbioqyRRkfxwHE4FrWe2tcCsZQoSg60oO/58104wYPujy4CFUlj0SbC9SkSwzTd5fomTNRYTZY+h1jsnO3BrmCddqGEhVcqMdvYb4vWoI+EZmdIBE9B0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X33jdht_1779082129;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X33jdht_1779082129 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 18 May 2026 13:28:49 +0800
Date: Mon, 18 May 2026 13:28:48 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic: free private_irqs when init fails
 after allocation
Message-ID: <rkjsbismtxb6lijsju7o3udrltqfmydafybfvngodf3rsigg3f@hahisxrsjc4x>
References: <20260517181331.367676-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517181331.367676-1-michael.bommarito@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_062907_709439_5085D6F3 
X-CRM114-Status: GOOD (  25.33  )
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

On Sun, May 17, 2026 at 02:13:31PM +0800, Michael Bommarito wrote:
> Companion to commit 250f25367b58 ("KVM: arm64: Tear down vGIC on failed
> vCPU creation"), which added the missing kvm_vgic_vcpu_destroy() call
> to the kvm_share_hyp() failure path in kvm_arch_vcpu_create().  The
> kvm_vgic_vcpu_init() failure path immediately above it has the same
> shape and still needs the same cleanup.
>
> If kvm_vgic_vcpu_init() allocates per-vCPU private IRQs via
> vgic_allocate_private_irqs_locked() and then vgic_register_redist_iodev()
> fails (for example when kvm_io_bus_register_dev() runs out of MMIO-bus
> slots, or vgic_v3_check_base() rejects the configuration), the function
> returns the error without freeing the private-IRQ allocation.
>
> The caller kvm_arch_vcpu_create() returns this error directly, and
> kvm_vm_ioctl_create_vcpu() jumps to vcpu_free_run_page on
> kvm_arch_vcpu_create() failure, which does not invoke
> kvm_arch_vcpu_destroy().  The vCPU struct is then released via
> kmem_cache_free(kvm_vcpu_cache, ...), dropping the only reference to
> the leaked allocation.
>
> The comment block above __kvm_vgic_vcpu_destroy() explicitly anticipates
> this case ("vCPUs that failed creation are torn down outside of the
> kvm->arch.config_lock ... it is both safe and necessary to do so
> here"), but the caller never actually invokes the destroy primitive on
> the kvm_vgic_vcpu_init() error path.  Call it now, mirroring the shape
> of the kvm_share_hyp() cleanup added by 250f25367b58.
>
> Per-failure leak is VGIC_NR_PRIVATE_IRQS * sizeof(struct vgic_irq),
> roughly 3.8 KiB rounded up to 4 KiB by the kmalloc-cg-4k slab.  On
> systems whose /dev/kvm policy lets unprivileged users open the device
> this is reachable to any local user; reach is policy-dependent and
> varies by distro and packager.
>
> Confirmed with kmemleak on v7.1-rc1+: 50 failed KVM_CREATE_VCPU
> attempts (run with the per-VM MMIO bus pre-filled to NR_IOBUS_DEVS so
> vgic_register_redist_iodev() returns -ENOSPC) leave 49 unreferenced
> 4096-byte blocks whose allocation backtrace is
>
>   __kmalloc_noprof+0x390/0x4d0
>   vgic_allocate_private_irqs_locked+0x68/0x1c8
>   kvm_vgic_vcpu_init+0x78/0xd8
>
> With this patch applied to the same tree, kmemleak reports zero
> unreferenced objects under the identical workload.
>
> Cc: stable@vger.kernel.org
> Cc: Will Deacon <will@kernel.org>
> Assisted-by: Claude:claude-opus-4-7
>
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> ---
>  arch/arm64/kvm/arm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 176cbe8baad30..5d5e2f81b9c94 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -554,8 +554,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  	kvm_destroy_mpidr_data(vcpu->kvm);
>
>  	err = kvm_vgic_vcpu_init(vcpu);
Hi Michael,
> -	if (err)
> +	if (err) {
> +		kvm_vgic_vcpu_destroy(vcpu);

This LGTM.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  		return err;
> +	}
>
>  	err = kvm_share_hyp(vcpu, vcpu + 1);
>  	if (err)
> --
> 2.53.0
>

