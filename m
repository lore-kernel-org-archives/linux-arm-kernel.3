Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36992C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKEqugZkGpaJgQ876U/uGlQebvOtKBITWLU3VSoe94k=; b=NrzeOIYcGA9Is+4QEvROIrWspX
	G6qaym3/CRgPtxiXxEgG58KRhYFzZHG76gBRjHJp8J/73hJXSzaUR9Q3M6UD9Q0G39VPnQqXtSQjM
	qRFQt2qjJmhJqMApTH5eI5oy2mLKPf5S1/rKYC387DikHC29m55iPk/aoR58HhfZmD+rySdw4cqaZ
	tZmffrgM1kraqiZV+0U7Bj4FLtXphQRaHqw+U3Z7U86f90FDufMATyVjjA990r/GMJTbCFwMO6rvv
	qJYvagmJ2m2O7CEG1yECoaoJ1wXM+PkJ3qs6jDR2dSGTZzFpN40X6fTijxVrTVY82Kg4dfZk0LxTO
	qP/uXfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nLQ-0000000ABrI-0UZU;
	Tue, 29 Apr 2025 15:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9myA-0000000A90x-2iau
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EKEqugZkGpaJgQ876U/uGlQebvOtKBITWLU3VSoe94k=; b=ZW/3/PKh08CP6CM6mmdfBMXHA7
	lblKoJ0S9Cbq/8Et16WSB65E/fNjF2HkLlUZGikZsbdzA35gHTMK95193dq3K64yr8bM8aQmih0X3
	XeKYmFcOJ/8gopEzlzYnVOiwCtSzKRec8YEynTeN0hsYmihLO9k9dT2zU0NZSAokpD1Mj32uYhW8g
	gqzwVUIZrzE+5epCxR8tVfUTojerGWWXkjusJ9DmgvsPUcPg0Ld9vlgdB9hsm4ydjN2K1MTv+dNNS
	CPrhdFkGm+gSCPmEmpvqvMewUorLDb7CtYxzVXqgMGZTSefDAg9CVuFkyYz+kGsgZnmrCWD16iak3
	e8ur2pRA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9my7-0000000DRkz-31Ro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADDA05C36C7;
	Tue, 29 Apr 2025 15:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C5FC4CEE3;
	Tue, 29 Apr 2025 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745940837;
	bh=O7nh+imMdrxSBWpVTmxuA+7ncoNVNhnrz8X/O8N4GLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ymz5Kh+HzS+bCSWxghsSxPSc0djdXglT63SepTdgjewDK2JG9SFM8CxZO13QRezbX
	 K8YrmGTc6WdMqRYx2hwDy/NcYzSzZEU21GPPcs2Hr14BdMFqwPBd9KypkVVyglElN0
	 H++vkRvXJkngF7oQchezY9qbO9F8vRpZoylWRKsprabU086fvnQ/KvEeV9PxS0V2Bl
	 5eVNnYnABnyo5Bemc7hypLJkteK2T52HdHBd6yMcjdkt2fKtYPZAe99VA2+iXcdVNy
	 u7o+lBFMXalAJBC1v7uQpwtN4g3qwZhUjsGa4RACXMl75EL9nEOVz1lM6YTMRc8UiZ
	 aDcIWhpXu7KoQ==
Date: Tue, 29 Apr 2025 16:33:53 +0100
From: Will Deacon <will@kernel.org>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64/traps: show fault address in exception trace
Message-ID: <20250429153352.GA26610@willie-the-truck>
References: <2a16075bce75fa68450edb16f5712e265d7cc45a.1745910924.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a16075bce75fa68450edb16f5712e265d7cc45a.1745910924.git.baruch@tkos.co.il>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_163359_964189_7174F533 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, Apr 29, 2025 at 10:15:24AM +0300, Baruch Siach wrote:
> The FAR (fault address) register provides useful information when
> debugging an unhandled exception.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  arch/arm64/kernel/traps.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 4e26bd356a48..14eb598e33a7 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -239,7 +239,7 @@ void die(const char *str, struct pt_regs *regs, long err)
>  		make_task_dead(SIGSEGV);
>  }
>  
> -static void arm64_show_signal(int signo, const char *str)
> +static void arm64_show_signal(int signo, const char *str, unsigned long far)
>  {
>  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>  				      DEFAULT_RATELIMIT_BURST);
> @@ -256,6 +256,7 @@ static void arm64_show_signal(int signo, const char *str)
>  	pr_info("%s[%d]: unhandled exception: ", tsk->comm, task_pid_nr(tsk));
>  	if (esr)
>  		pr_cont("%s, ESR 0x%016lx, ", esr_get_class_string(esr), esr);
> +	pr_cont("FAR 0x%016lx, ", far);

Are you sure the FAR is always valid here? For example, if we're delivering
a SIGILL due to an undefined instruction.

Also, once you have the PC and the registers (both of which we print),
it's not too hard to dig the instruction out of the binary and figure out
the faulting address that way.

Will

