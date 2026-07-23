Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A2AC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkMW3gOeguIjQ0Mg8RSAnOS0Vj8MfegL+l44BmbKsDw=; b=BJLGzoyZS6Sg37FBW2HCqZ6yrp
	Fy5Ilc+7XmjPDP6dXpDP/4WdaBSXJPQtx9D/KnGqoEjfjPiunZxwqyNmD45UKoyDKp2NCS90tEqka
	iNmAMcOQVpH/BqgDrb6M4841M6c6ZO44FP1uD/oNdYUf7WN2giRaklOxa7Q0kQ4zftp2eFaLuqMgO
	DgOL7Vi3cexIarWwdQgGPiQ6Cs75UkFldNoew9tpFPxlvVeFnZoTG/aZSOgxWMzLKpxhSakxvNtlq
	15INpHyb7WxZDclxelFqO2xkziA2jW2NRjwFWs2dAruFHWNUOkBaTUlEtYAZio4A2L1cp8oEmwXx1
	Pc+Wh95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvDA-0000000Eabe-2FR9;
	Thu, 23 Jul 2026 15:19:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvD9-0000000EabT-1nIQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:19:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C78B660A82;
	Thu, 23 Jul 2026 15:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAAC1F00A3A;
	Thu, 23 Jul 2026 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784819986;
	bh=HkMW3gOeguIjQ0Mg8RSAnOS0Vj8MfegL+l44BmbKsDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mP0UTrQjww0Y7GkqMUFN2duxyoop8uI2z+FFWH9FPFDNF+BEsFk5YYCj5AzShnx6j
	 MMqiGjTBmGLXjigYWAmv0aorGDGw6ZK/+v5dtUbHgTExfI1vQ/x9dRdEETIzws0+Ap
	 6QUge50z2aE6K/SCcL90RdL5y27ZwTTPPnj7MtXhE/kuOYjGQ2Ains1Xz1yHnQ4Ikf
	 S+4gGuaJGmLgpJBMP8An8Go8asULYiSs7RC4GYyWj5o/6RVquGUOuER2sXTEneUzGZ
	 qFUk8yoWHMnsZW9lRdX9bPvR8yzNCvkh8PLSa/T7JtP7+WTlIefX1njgDXTN9A/nPb
	 8T31Ai3Y6NZ9w==
Date: Thu, 23 Jul 2026 16:19:41 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <willdeacon@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: cpucaps: Remove stale comment about keeping
 capabilities sorted
Message-ID: <amIxDV2tbDlc1bgg@willie-the-truck>
References: <20260723130233.3123-1-will@kernel.org>
 <amITcJVfOT1k68VV@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amITcJVfOT1k68VV@J2N7QTR9R3.cambridge.arm.com>
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

On Thu, Jul 23, 2026 at 02:13:20PM +0100, Mark Rutland wrote:
> On Thu, Jul 23, 2026 at 02:02:32PM +0100, Will Deacon wrote:
> > From: Will Deacon <willdeacon@google.com>
> > 
> > There is no functional requirement to keep the entries in arm64's
> > tools/cpucaps file sorted alphabetically and, in fact, they have fallen
> > out of order over time. Given that only the arm64 tree touches this file,
> > just remove the stale comment and accept that we're collectively not
> > very good at the alphabet.
> 
> It might be worth mentioning:
> 
> (1) The intent of sorting was to make it easier to avoid and/or resolve
>     merge conflicts, which hasn't been a big problem in practice.

I was trying to get at that when I mentioned that "only the arm64 tree
touches this file", but I'll add some extra wording.

> 
> (2) In the few cases where we do depend on the order of specific
>    cpucaps, we've added build-time asserts, e.g. in
>    can_use_gic_priorities(), which has:
> 
>      /*   
>       * ARM64_HAS_GICV3_CPUIF has a lower index, and is a boot CPU
>       * feature, so will be detected earlier.
>       */
>      BUILD_BUG_ON(ARM64_HAS_GIC_PRIO_MASKING <= ARM64_HAS_GICV3_CPUIF);
> 
>    ... and we can still do that.

I'll mention this too.

> 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Reported-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Will Deacon <will@kernel.org>
> 
> Regardless of whether you add the above to the commit message:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks. I'll post a v2 with the author fixed up as well... either my
hard drive or my TPM died this week, so it's been great fun setting up
a new machine whilst in the middle of merging stuff.

Will

