Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05311090246
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2JP03vn5HtKdzVfWm+gOvyQw90nJHysAm3XWbSTXBw=; b=uRax1VUmJzFavORVF7NyGlMomf
	1OIwiqZhnHhZZ8AgnUR61J7Eu0aEID7vLsvT3BNjs5gM5sEy/CfbLeDXdkt+uqODuR3Eqz1n6C585
	74LBw9raNjFk2zh2vZRjsvXSHG4WSWMPLi0E5HWXCrrj8QGqudZ/Aa0D+rvTElhZUEfN0PL+FTD55
	p+pr1XreATEZ6FEyO2axfRFjZZ72dWEkqFNBUC6rcj54FSDm7EtOeSabUKp+oklWL/Fp7SOFxv24T
	te64kObJBx2HvFrJLeafgXqRug5KXxmRpPppQxTCGfzPyN7Mqe1Vdpx/doWLWBmmFA7ibV6p0fffj
	YPw2EiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fdo-0000000Awkw-2bnc;
	Thu, 19 Mar 2026 15:50:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fdm-0000000AwkP-1qAn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A83E43870;
	Thu, 19 Mar 2026 15:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A911C19424;
	Thu, 19 Mar 2026 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773935430;
	bh=OOiabRzfIU2rkzstMHupJQAL4bYIGNlCquN6bH2HLmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vy2p5TPfckFpW/r8pn1mfBzmjmPLf3nSoaQvLsdcIPNZYEqNBsyrMpTuxMv/Of0f0
	 ir9sIQW8LHJeUBtTiOSifjezt2M+2bdF3no3Rq2XnsHEvh6AtjkrdY3eVx2uILAlld
	 WyE82C14fWCVpXtgHWuuLBKCditeGTQYJ/Ql8VmRd+bwLLGle2lBvplPYEOo7+9BZ/
	 lLUyCeDpw0XtWAR7zYI+rP+Q5g/NKxJTYJAGCYCanxmZ5LR7JPnfmNyvlgxovQvEnN
	 AYp3RWnFny4eAU4V0d23x9Id4Qq3f3UxS/AHEZAt29z7YUWoahLO2zX5A1yCfjnsgV
	 OUC++t35vDKog==
Date: Thu, 19 Mar 2026 15:50:25 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, daizhiyuan@phytium.com.cn
Subject: Re: [PATCH 1/3] arm64: errata: Reformat table for IDs
Message-ID: <abwbQWfV-yRZzkJC@willie-the-truck>
References: <cover.1772125743.git.robin.murphy@arm.com>
 <3adc16d4d035cf76803e706e325822b99c13e977.1772125743.git.robin.murphy@arm.com>
 <abwNg5LY9Ll235vS@willie-the-truck>
 <7fe97d37-b6e4-4fe7-a871-b4d67763079a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fe97d37-b6e4-4fe7-a871-b4d67763079a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_085030_498244_E5DEE6F5 
X-CRM114-Status: GOOD (  21.07  )
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

On Thu, Mar 19, 2026 at 03:32:22PM +0000, Robin Murphy wrote:
> On 2026-03-19 2:51 pm, Will Deacon wrote:
> > On Thu, Feb 26, 2026 at 06:10:20PM +0000, Robin Murphy wrote:
> > > We have some inconsistency where multiple errata for the same component
> > > share the same Kconfig workaround; some are one ID per line, some are
> > > smooshed together, and some are entirely separate entries. Standardise
> > > on the single entry, one ID per line format so that things render nice
> > > and consistently in the HTML docs, and it's simple and clear to add new
> > > IDs to existing workarounds without churning the table too much.
> > > 
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >   Documentation/arch/arm64/silicon-errata.rst | 44 ++++++++++++---------
> > >   1 file changed, 25 insertions(+), 19 deletions(-)
> > 
> > I think we're better off doing this at -rc1 in the Arm tree, so we avoid
> > unnecessary cross-tree conflicts for something that doesn't really matter
> > that much in the grand scheme of things.
> > 
> > For now, please can you send the SMMU patch on its own so that I can
> > pick it up?
> 
> Yeah, that's fair enough, it's not like it's a real dependency that would
> justify taking the SMMU patch through arm64 either. v2 sent, and if I
> haven't forgotten all about this by -rc1, I'll rebase and re-send this one
> then.

Thank you!

Will

