Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2E5C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCVelR+o83XaVGvz4DQ50PNmF82q//7lSnhfstgWi30=; b=hGXhD/PIu563F/CiZ24ZB3+fiA
	a2K4eY7D8zreDHp1Ax0gkLt77rO7lVQKHM11Ohq+QEtNTUq/QEu5Yr+EuU6aU0ozHXuu5H3XK5LCy
	/S8Y/6hkI9fL6zajGA14ux4cOtoBuj1S4Nnydlo8TnK6LhL36pb/1Izu6rCdKSw48qCJu7wOqUrJx
	g0M57N+AFNsKG7VnfwNfZSdmcoRI7BoWYqimh/JQNr47iPv7KGVgm/Dgj+F4CvZxP5I0xlvJAgGJx
	6O5m4o4wDA3Jh0Plb18zOxim38f+GBLIKiMN91ZMjhWFS3975ktnMx6URI3T74ql5zB2U1x5Hfu1f
	2LPR9cEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGl5-00000002Ai6-0xHW;
	Tue, 04 Aug 2026 15:08:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGl2-00000002Ah8-3K4k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:08:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 214891476;
	Tue,  4 Aug 2026 08:08:40 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 056C33F86F;
	Tue,  4 Aug 2026 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785856124; bh=T+gr0rNOzE9LGWc5d5uRT2kUhvR6p3PnmzPwKOsvu2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJU++mhuUwR6iMKXURfVTWxSD1Tc030OkGUuLekeRKLAsCu50j3c5/7jXy/ncb91h
	 tMQz7sCPe6TUtdIOUPj4M8JTmsQN8XGwSTQBYitQKe/nargeP9krOqMvUueRx7ts39
	 jDv/hZ3oJlT3R72HScRL35lJQBKuAsY9P5jPWrD0=
Date: Tue, 4 Aug 2026 16:08:40 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: arm64: Add Mark Rutland as an official
 Reviewer
Message-ID: <anIAeKI1MLp_rmNx@J2N7QTR9R3>
References: <20260803164230.25172-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803164230.25172-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_080844_870930_6A7C57E3 
X-CRM114-Status: GOOD (  17.23  )
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

On Mon, Aug 03, 2026 at 05:42:30PM +0100, Will Deacon wrote:
> Mark has been part of the arm64 furniture for as long as the code has
> existed in mainline and is consistently one of the most active and
> knowledgeable reviewers that we have.
> 
> Make it official.
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> Mark's actually OoO atm, but I spoke to him about this offline and he
> was keen to be listed. Honest!

I'm OoO for the next few weeks, but as I'm just finishing off list stuff
today:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks!
Mark.

> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 806bd2d80d15..08328eb1064d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3913,6 +3913,7 @@ F:	drivers/platform/arm64/
>  ARM64 PORT (AARCH64 ARCHITECTURE)
>  M:	Catalin Marinas <catalin.marinas@arm.com>
>  M:	Will Deacon <will@kernel.org>
> +R:	Mark Rutland <mark.rutland@arm.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> -- 
> 2.55.0.508.g3f0d502094-goog
> 

