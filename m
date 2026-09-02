Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC17C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsUggKmep337k/nWMUInlaOzHuc790L78TJyJtJD4Js=; b=iEygOhG7afusQvcEAbLxnQ8/84
	7oLs7ChvS823dVkjkSBIaTOP9gbkJFZF9udPetiD3F/1pBNtHdPa78lKoPFotVn65adA3hNli5o9p
	VBj8fFRwf7BpSzHrt2+jGbMYCCzdd5k20zESHqrjngvP8rcOqYOqon3r/AaRfmfw4fVfTxDjFQ1EV
	e9H3NBOJoTUMSZ3Cm7QCk2DbZomXbUH+ANWBwzlCvdm5rACgFgBYzncje8XRmUcWRoENbWJuUou+F
	6bACGmJUJEYBIGFuGPUAYq72LRP6vAl5/Ahrkiqh8nLy48TXzvzkhARcn8rIYA5DHnvb3Zq7npKBv
	VjpU/vNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lIZ-0000000EqRo-37q2;
	Wed, 02 Sep 2026 13:46:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lIX-0000000EqRN-3TYl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:46:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7644165C;
	Wed,  2 Sep 2026 06:46:35 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64D7D3F673;
	Wed,  2 Sep 2026 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788356799; bh=luQwKBwF/mx0OlYkAeYieEObOYYQKo9O4fAy3WqvBNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4X1qn8ooarx22djTGEjA46dyi3s+VVIuxF9lKFH7PaIZzctpsytRMziSLhofuO1C
	 Q+jJWov3t9/fMk0QHe5OzoxYNj6YJPx++RsSVg7r7FzPZss0QTBx49aQ2HzPvlGi9J
	 E8w7FxpQ9uuTizsOiKuuwqHDPwYrGmL72ENxU6es=
Date: Wed, 2 Sep 2026 14:46:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: head: correct comment for init_kernel_el()
Message-ID: <apgovCGT-D7OWbSE@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org>
 <20260825205839.14571-3-brads@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825205839.14571-3-brads@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_064641_910196_1EA11052 
X-CRM114-Status: GOOD (  24.30  )
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

On Tue, Aug 25, 2026 at 08:58:34PM +0000, Bradley Morgan wrote:
> The comment above init_kernel_el() still says the function configures
> the CPU to execute at the highest reachable EL, but that stopped being
> true a while back. Ever since commit ae4b7e38e9a94798 ("arm64: Allow
> sticky E2H when entering EL1"), init_kernel_el() always drops to EL1,
> and it is finalise_el2() that brings us back up to EL2 when we want it.
> 
> Update the comment to match what the code actually does.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/head.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This looks to be my patch [1], but with a (partially) rewritten commit
message, and my S-o-B dropped.

There was admittedly one typo in that commit message that needed to be
fixed, but I don't think the rest of the changes were necessary, and I
don't think it's approriate to drop my S-o-B.

I think similar is true for the rest of the series. The patch fixing the
_cpu_resume() only seems to have a paraphrased commit message.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ee4323ff6a2ba4c3989b38f13b2c1a516d6c27e4

Mark.

> 
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 87a822e5c4ca..c6301557eee1 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -254,9 +254,9 @@ SYM_FUNC_END(__primary_switched)
>  	.section ".idmap.text","a"
>  
>  /*
> - * Starting from EL2 or EL1, configure the CPU to execute at the highest
> - * reachable EL supported by the kernel in a chosen default state. If dropping
> - * from EL2 to EL1, configure EL2 before configuring EL1.
> + * Starting from EL2 or EL1, configure the CPU to execute at EL1.
> + * If dropping from EL2 to EL1, configure EL2 before configuring EL1.
> + * To use VHE we'll upgrade back to EL2 later in finalise_el2().
>   *
>   * Since we cannot always rely on ERET synchronizing writes to sysregs (e.g. if
>   * SCTLR_ELx.EOS is clear), we place an ISB prior to ERET.
> -- 
> 2.47.3

