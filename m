Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE7C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 18:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYXcStxTya745/C3qWHhaMO1kEtnTappP3q6LyNH9C8=; b=EhRsbFsXzQK3MR3w3C/PbcYxoW
	ASqAv7GOccOad9wVWZVxBDmEKwuAQ9satBcUfPdzlCIsucD7ePlspol91CD9UFBrgvzb/elxg76dI
	J6FHx5GNFKx3K7Vs/j/2ZZGY9n03ScE9FfQ3XliQSPOmgrD6njI/ywvjQ6acxUiAZilUSTf6WDHk7
	GVq8t1WPmo9kGrcWu4IOHIGEEEXK8z1R+4J8DWQU9fEFXNovUVfLZA7MDfj9ShPwEESqhfTHj+7ay
	j93F9aCdwl3GAMaR3akqQxbnJkaAfXUZQxXk0TbwXo5fyvdiGqX/zzBgMajVufvSgJhF8ELF2suNb
	adXTjiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWvc-00000004e6p-1JU4;
	Fri, 23 May 2025 18:15:32 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWtW-00000004dsU-3MwQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 18:13:24 +0000
Date: Fri, 23 May 2025 11:12:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748024000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYXcStxTya745/C3qWHhaMO1kEtnTappP3q6LyNH9C8=;
	b=n6mn+5Hj8g4GnsWRsrOGTewo/+asWXjkTgk7kMaDSYdj/Jt6z9Nxv65iMfgt/a/ZlomGKv
	n9mlwVz3zX7i6CRFoL5aIsstJfd7TQucOLwmZ1N4m4seQPNM31cc/I/mvcGsmm4ip7ePPa
	hKnqc9Bhv0SAk3xvOwp1/NQYr0yEh0E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: sysreg: Drag linux/kconfig.h to work around vdso
 build issue
Message-ID: <aDC6l2MKYbncZKRt@linux.dev>
References: <20250523170208.530818-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523170208.530818-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_111323_054725_97819255 
X-CRM114-Status: GOOD (  11.25  )
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

On Fri, May 23, 2025 at 06:02:08PM +0100, Marc Zyngier wrote:
> Broonie reports that fed55f49fad18 ("arm64: errata: Work around
> AmpereOne's erratum AC04_CPU_23") breaks one of the vdso selftests
> (vdso_test_chacha) as it indirectly drags asm/sysreg.h.
> 
> It is rather unfortunate (and worrying) that userspace gets built
> with non-UAPI headers. In any case, paper over the issue by dragging
> linux/kconfig.h in asm/sysreg.h. It is the right thing to do, at
> least from the kernel perspective.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Fixes: fed55f49fad18 ("arm64: errata: Work around AmpereOne's erratum AC04_CPU_23")
> Link: https://lore.kernel.org/r/aDCDGZ-G-nCP3hJI@finisterre.sirena.org.uk
> Cc: D Scott Phillips <scott@os.amperecomputing.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

