Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AF4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2yAkmYQB4G91GHgBGmGQXAjN+eKltXauKbY/zcUPEg=; b=Camt7SNClCgmQcj/sZpT4uJYxE
	xHQ3v+Oy+y1uzaqZ/ztIyjdo3g079mDtwfw7Q8w+Jt2Z8/YvGYMYDfP7+37ob8HC7fz+jUkO2W3N6
	WWVm66nKmRkELeRt2vs5/26I4KeuPAsxWy0M9ptFxfkhHpj5RDcgrxOYdwx1T+jvcL4YRKvVoP/pt
	AInntJduQ69Y6n6XMwtj37xGowcHnWArG27Q4aOTJhnP0HiBdq+Y4Y6B6BpikCBmkEtPyCk7Kpiq/
	hwUHciRNu/Rvd17+gzWShLhmQniiHGv8i4XIOzpOeh+wSSnDHP/6fWDSANJlpHHoDsA1sAeKpN9F1
	RyeOfvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJClM-000000093ss-1IWt;
	Wed, 12 Nov 2025 15:28:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJClJ-000000093sO-3hDv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:27:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4744B1515;
	Wed, 12 Nov 2025 07:27:47 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5D5E3F66E;
	Wed, 12 Nov 2025 07:27:53 -0800 (PST)
Date: Wed, 12 Nov 2025 15:27:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: mrigendrachaubey <mrigendra.chaubey@gmail.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH v2] arm64: Fix typos and spelling errors in comments
Message-ID: <aRSnd6cyAdeBtEF4@arm.com>
References: <aQoF3pu8CjO3tAl6@willie-the-truck>
 <20251106135655.8441-1-mrigendra.chaubey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106135655.8441-1-mrigendra.chaubey@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072757_961859_E60DDB99 
X-CRM114-Status: GOOD (  13.87  )
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

On Thu, Nov 06, 2025 at 07:26:55PM +0530, mrigendrachaubey wrote:
> This patch corrects several minor typographical and spelling errors
> in comments across multiple arm64 source files.
> 
> No functional changes.
> 
> Signed-off-by: mrigendrachaubey <mrigendra.chaubey@gmail.com>
> ---
>  arch/arm64/include/asm/assembler.h  | 4 ++--
>  arch/arm64/include/asm/cpufeature.h | 4 ++--
>  arch/arm64/include/asm/el2_setup.h  | 2 +-
>  arch/arm64/include/asm/pgtable.h    | 4 ++--
>  arch/arm64/include/asm/suspend.h    | 2 +-
>  arch/arm64/kernel/acpi.c            | 2 +-
>  arch/arm64/kernel/cpufeature.c      | 2 +-
>  arch/arm64/kernel/ftrace.c          | 2 +-
>  arch/arm64/kernel/machine_kexec.c   | 2 +-
>  arch/arm64/kernel/probes/uprobes.c  | 2 +-
>  arch/arm64/kernel/sdei.c            | 2 +-
>  arch/arm64/kernel/smp.c             | 4 ++--
>  arch/arm64/kernel/traps.c           | 2 +-
>  arch/arm64/kvm/arch_timer.c         | 2 +-
>  arch/arm64/kvm/hyp/nvhe/ffa.c       | 2 +-
>  arch/arm64/kvm/mmu.c                | 2 +-
>  arch/arm64/kvm/nested.c             | 2 +-

Marc, Oliver, do you care about these kvm typos and are you happy for
them to go in via the arm64 tree?

> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 5ed401ff79e3..5c673778e28f 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1002,7 +1002,7 @@ static void __init sort_ftr_regs(void)
>  
>  /*
>   * Initialise the CPU feature register from Boot CPU values.
> - * Also initiliases the strict_mask for the register.
> + * Also initialises, the strict_mask for the register.

This comma is wrong (I can drop it when applying).

-- 
Catalin

