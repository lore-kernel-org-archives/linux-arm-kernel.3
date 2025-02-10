Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5F3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twuopEHjY+l/yM+eHpsnx9D+l0sU+uPOGYaQvqwJ34Y=; b=F+A1kbsPUWtxChj7QN4jkmMajM
	1J1Z0xfN0ci7sAdP02DsGD/ZyJaXKPFPks+ycRpckqszHbp818xEx/df6JY9JAlCQuL/vowUIl+ec
	bPQrlNc0jUqNXiOz4KtoymS8XfXP366+7zUfgcSoNZzfQlZ203ShZBBxwE1V23vadfwHgPsnpoD7K
	50eTD2WyCBZAXTFs4YUfg8F2wDlo1H8X3SxqR2+nrd81Es6bx3152DYyqa897xa/3tGMO9BnDt8FZ
	oBdnIrM7WGyI2ZXy9cq9WWeGanQCrGir99CWDil86e8VRpwehJRvEGaFbIYoXDiq0z23PWvCXl9RD
	7G4C0TvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWrw-00000000YoR-0CI2;
	Mon, 10 Feb 2025 16:42:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWoW-00000000YAS-1pcx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DC21A41AB1;
	Mon, 10 Feb 2025 16:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7612C4CED1;
	Mon, 10 Feb 2025 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205555;
	bh=zBjbBU1Nue8L7MN3bQCSRhEpfSUoOdHKNZD8vOvv7L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLQLTDiTeiHzk/qyhW9ivMiUSlqCTySZkOICCKSaWhRhk/kmmGWXg8JFTEs7d4Aju
	 WS7M3zfk5YmMIOPWa7jCMKa4K44ebuPyoxbcK70ZkEiOvfLilhcBXHX1WKqREYtjRw
	 G0OqQFOR+ouCc1jNrTczi5saa1gCw8NQXbHUsx6B6HBJbCDLBAjXxSizcn4zS8UZ/J
	 tyxI0/JGpmWnqB32MCnZMVKARC8YbTYrZcW7DwLXN+xMgz1ctehtFnm1weEytQXx9X
	 zGH8ucM9JCon5V8l/1ShaXqychsPmyJGFeWA5G/6Y118mZztlaof3XZQAKFiD7e5GS
	 oqVStBWrvK0CA==
Date: Mon, 10 Feb 2025 16:39:09 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 7/8] KVM: arm64: Mark some header functions as inline
Message-ID: <20250210163909.GH7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-8-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-8-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_083916_614219_790DBF85 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, Feb 06, 2025 at 02:11:01PM +0000, Mark Rutland wrote:
> The shared hyp switch header has a number of static functions which
> might not be used by all files that include the header, and when unused
> they will provoke compiler warnings, e.g.
> 
> | In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
> | ./arch/arm64/kvm/hyp/include/hyp/switch.h:703:13: warning: 'kvm_hyp_handle_dabt_low' defined but not used [-Wunused-function]
> |   703 | static bool kvm_hyp_handle_dabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
> |       |             ^~~~~~~~~~~~~~~~~~~~~~~
> | ./arch/arm64/kvm/hyp/include/hyp/switch.h:682:13: warning: 'kvm_hyp_handle_cp15_32' defined but not used [-Wunused-function]
> |   682 | static bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
> |       |             ^~~~~~~~~~~~~~~~~~~~~~
> | ./arch/arm64/kvm/hyp/include/hyp/switch.h:662:13: warning: 'kvm_hyp_handle_sysreg' defined but not used [-Wunused-function]
> |   662 | static bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
> |       |             ^~~~~~~~~~~~~~~~~~~~~
> | ./arch/arm64/kvm/hyp/include/hyp/switch.h:458:13: warning: 'kvm_hyp_handle_fpsimd' defined but not used [-Wunused-function]
> |   458 | static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
> |       |             ^~~~~~~~~~~~~~~~~~~~~
> | ./arch/arm64/kvm/hyp/include/hyp/switch.h:329:13: warning: 'kvm_hyp_handle_mops' defined but not used [-Wunused-function]
> |   329 | static bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
> |       |             ^~~~~~~~~~~~~~~~~~~
> 
> Mark these functions as 'inline' to suppress this warning. This
> shouldn't result in any functional change.
> 
> At the same time, avoid the use of __alias() in the header and alias
> kvm_hyp_handle_iabt_low() and kvm_hyp_handle_watchpt_low() to
> kvm_hyp_handle_memory_fault() using CPP, matching the style in the rest
> of the kernel. For consistency, kvm_hyp_handle_memory_fault() is also
> marked as 'inline'.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

