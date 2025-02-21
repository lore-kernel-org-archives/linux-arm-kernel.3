Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A06C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj8AVBt4Pvo2QXironaiASh1WrytVOJvAPqhzaCq9PQ=; b=SyP0eY30vgmOqXWn3KwiCXdEPp
	tUxozC4yctmH1cyTkKYiiOwB29N4OcpESHZOgEwReGh441x43OwuvM0KdB9xt6te6nrPksy6Tk3qj
	R76rS5KgzWJgDKecQeJvia5EhPNSuKZ8Q40iBxwpPMJV25rVV5yvw7wJ05keQy8nVrGcQ0LMhU5G3
	lP590EHQ3FEMrHDXPmrw94Ci3ZcGr9XpmnOEevDODKRwY1SemSjNlYpnMXzOZW7OkgBbw9eS+7564
	LHYfgPucpJde/7a6RxeENtpo3zLddtd7o2eqBSBdihDE8kFk7ctCTmBIDepsH60YmY/NgBuIDmxFs
	+8fBTRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUSP-00000005tjX-1TkF;
	Fri, 21 Feb 2025 14:56:49 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUQx-00000005tcS-2cgY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:55:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A4166123F;
	Fri, 21 Feb 2025 14:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB61C4CEE9;
	Fri, 21 Feb 2025 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740149718;
	bh=XtWO7IZGeVOG4s5bQUKGzp4rBpQT5RouY9R7IjvPx7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSXM//NDZfJsNGrDESXfeNq+/JoaOflIxwktoYQmxXLKdrU237JO1FFf0fvlTs2Uz
	 +oeA191d+g/Su30U1v4fJJnXcibs60lsJxljM1lH6gUBv1DSJ6XNCYQKoF/ohk9qLs
	 aK4h3p04skCBS3SbiN6xVj0dw670YudCy9+To9TickEtaYgMCPTBGT45aaJRNg2/Yu
	 IzStYvD4nVmSFfREH+9R/MByuztTrvOUSXCysqdFQ2AP5xXktJ7W0+4To5le34lsJ2
	 MQfafd8kNcnOB55/C+uc0Yo5t6fDiD0qWjHDXolWUu9o80Ndkak5i4g8VCcqzuMDq2
	 DCbAkG8fm7jfQ==
Date: Fri, 21 Feb 2025 14:55:14 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Don't use %pK through printk
Message-ID: <20250221145513.GA20567@willie-the-truck>
References: <20250217-restricted-pointers-arm64-v1-1-14bb1f516b01@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-restricted-pointers-arm64-v1-1-14bb1f516b01@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Feb 17, 2025 at 08:39:06AM +0100, Thomas Weiﬂschuh wrote:
> Restricted pointers ("%pK") are not meant to be used through printk().
> It can unintentionally expose security sensitive, raw pointer values.
> 
> Use regular pointer formatting instead.
> 
> Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/mm/physaddr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
> index cde44c13dda1bc0924d2d50369ad87f544a0a802..7d94e09b01b35094e883875a46b979666549095c 100644
> --- a/arch/arm64/mm/physaddr.c
> +++ b/arch/arm64/mm/physaddr.c
> @@ -10,7 +10,7 @@
>  phys_addr_t __virt_to_phys(unsigned long x)
>  {
>  	WARN(!__is_lm_address(__tag_reset(x)),
> -	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
> +	     "virt_to_phys used for non-linear address: %p (%pS)\n",
>  	      (void *)x,
>  	      (void *)x);

This is part of a WARN() and knowing the actual address may well be
useful in debugging. I suspect it also ends up being dumped as part of
the register dump _anyway_.

Will

