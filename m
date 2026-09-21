Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F02C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h60FEv/IeqHFNTk805m5EhGk1NC7fkBYTFD/7UZcnhA=; b=sbzBrxrZk83KGfL1CELwwGSj1C
	djLV5IAitXwCWKVxsq2HxuRvuVwcuq9IGWY6H1DoyMLC/RYEp8b77YVYi4yv2QQkN94MyqTXB+cvP
	G4Rdh4eYyWVtmvcfQ+L1ZFYlPOXKFQMrSOdp+Y5bBaC9wQSkN7HyflvqVXad2ev5d+Bq3OclvnLst
	5lAe7ZOzmYxS9DtsFhfNoDbWxH6wP0h5Ur663zeYX9ppPq+74mberWaGx46CJJkxk5Do5BGFOzDtu
	c/WUhvv6dacJR8JhNqcs47dNoeAJ2y8uSq5ExFRRRWvqTZvv4bK4uL8uuFz0ne2IOq0mgcKjuHZbf
	Oz61E1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a1m-00000001Skn-3Cvr;
	Mon, 21 Sep 2026 09:09:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a1i-00000001SjM-1gOT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:09:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A1CD1D13;
	Mon, 21 Sep 2026 02:09:20 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825863F86F;
	Mon, 21 Sep 2026 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981763; bh=NzXT89fT91jRss88v9wu5H7tWKGtVCzsHuCRkJMBwFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIlF4TH5rCEyZsursZk865vh+sMS4tSuhkm6t2NtH4/1PDNneEHciBiaLXqvLwMyH
	 iHDXuOlz64TJYimgzK1yZnb0ziw4VpAI/oT0uaQ9G34qvyt+WcIJp6Tr0kY0LLCK+J
	 24+7i4E5aN2uOmGV2euDIHnC1OZFX5GkhHsNyIQU=
Date: Mon, 21 Sep 2026 10:09:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: errata: document Cortex-A9 r4 as affected by
 erratum 754322
Message-ID: <arD0O8BgRmhnbvSx@J2N7QTR9R3>
References: <20260920032926.452884-1-qingfang.deng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920032926.452884-1-qingfang.deng@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_020931_562646_24C7BC5D 
X-CRM114-Status: GOOD (  26.37  )
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

On Sun, Sep 20, 2026 at 11:29:23AM +0800, Qingfang Deng wrote:
> The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D),
> section 2.3.3, lists erratum 754322 as affecting all r2, r3 and r4
> revisions. The Kconfig help text currently mentions only r2 and r3.
> 
> Add r4p* to the affected revisions so that users configuring Cortex-A9
> r4 systems know that the workaround also applies to them.
> 
> Link: https://documentation-service.arm.com/static/608118675e70d934bc69f143

The document you link to says:

	Fault Status: Present in: All r2, r3 and r4 revisions. Open

The "Open" part means this isn't fixed, and so we have no idea whether
this could afect a hypothetical r5, etc. Listing all the affected
versions is a bad idea as it wil just lead to needless churn...

> Fixes: fcbdc5fe6ebe ("ARM: 6772/1: errata: possible fault MMU translations following an ASID switch")

I don't beleive a fixes tag is necessary. The code works regardless of
what the documentation says.

> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  arch/arm/Kconfig | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 0cc289a7184a..c7d631d5242b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -708,11 +708,12 @@ config ARM_ERRATA_754322
>  	depends on CPU_V7
>  	help
>  	  This option enables the workaround for the 754322 Cortex-A9 (r2p*,
> -	  r3p*) erratum. A speculative memory access may cause a page table walk
> -	  which starts prior to an ASID switch but completes afterwards. This
> -	  can populate the micro-TLB with a stale entry which may be hit with
> -	  the new ASID. This workaround places two dsb instructions in the mm
> -	  switching code so that no page table walks can cross the ASID switch.
> +	  r3p*,r4p*) erratum. A speculative memory access may cause a page table
> +	  walk which starts prior to an ASID switch but completes afterwards.
> +	  This can populate the micro-TLB with a stale entry which may be hit
> +	  with the new ASID. This workaround places two dsb instructions in the
> +	  mm switching code so that no page table walks can cross the ASID
> +	  switch.

If you want to change this, you could say "r2p* and later", but TBH I
think we can just leave this as-is.

Mark.

>  
>  config ARM_ERRATA_754327
>  	bool "ARM errata: no automatic Store Buffer drain"
> -- 
> 2.43.0
> 
> 

