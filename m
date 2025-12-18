Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89114D6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V16wrQoy/SPknd18yKhva6XGrcKslPDmZcjw2iC4VIc=; b=Bg3hoIF39g+yO79yI+ruKyi0Eo
	8vxHEWq6VRLdVIHPEJe/VuQ7sf7EgbuxiFn2iCBMVJQOXJlXPafI7RDMsd39Otez+F/zJVoyNNZdg
	E2Bw4vCFemgR3TCr4gtd+eK0dEJhrWgkvgHPZDCGBzmwwI8t9uLSpUPx44bey/lcOINvF4A/yVCWD
	4vTHgUCYP+khawiG4SyBR1cAf6Mf1xzH+fx1jOtM2WL72vztPXSyBiN8v0E4z9Q9Qkc0+eFaLZtfN
	pHfEc9dfas/C0qsPTutxtibfi6aHoIW3CcYjDHb5F7DPe9hHjh/8np+czXz32VfNw2YUM+Oc1ld1H
	+JF8wXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFmo-00000008g5K-0UPu;
	Thu, 18 Dec 2025 15:19:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFmm-00000008g4w-3hu9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B2F96012A;
	Thu, 18 Dec 2025 15:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7037CC4CEFB;
	Thu, 18 Dec 2025 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766071163;
	bh=lNs6h/Tn6npet126alMraOzQWAdHEXctBs9xqAtaI9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mh9vl8cO8g3zNkwI0qQEywi4S51l7RjjDFD+/NdoNaLkGqyRx/m6rMMWhNUAe/f7p
	 ayNsqjF0dga4H1hM0eBbT33xWsC3nBBDkCMb7NkPrqoSg4v74duc9/Q2XD17wHljdm
	 yojfvvwp03tfkXiwRvLb2udPhmZpeXD5MFNHzWHzDxSj0GvUIms23wcwgZC2ISjAcM
	 k1paKBb6BaFYcG4p5jQMYoICzy5HtZwhZLJ07d6szQNEo9aHjh1dO3uVvrc+DZy+9Z
	 SPQMmbht7uYv8YsFigMu2U/9a4X5PAY02AWgZ98AhbxtK9EMCcOShNkr0uzeJPImFd
	 MlBo/i78fGf2Q==
Date: Thu, 18 Dec 2025 15:19:17 +0000
From: Will Deacon <will@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	tony.luck@intel.com, bp@alien8.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com
Subject: Re: [PATCH 11/12] ras: add DeviceTree estatus provider driver
Message-ID: <aUQbdZHkzumTnwVP@willie-the-truck>
References: <aUPv5UfBByVoLbRV@willie-the-truck>
 <20251218134311.2309421-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218134311.2309421-1-ahmed.tiba@arm.com>
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

On Thu, Dec 18, 2025 at 01:42:47PM +0000, Ahmed Tiba wrote:
> On Thu, 18 Dec 2025 12:13:25PM +0000, Will Deacon wrote:
> >> Introduce a platform driver that maps the CPER status block described
> >> in DeviceTree, feeds it into the estatus core and handles either IRQ- or
> >> poll-driven notifications. Arm64 gains a FIX_ESTATUS_IRQ slot so the
> >> driver can safely map the shared buffer while copying records.
> >>
> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> >> ---
> >>  MAINTAINERS                     |   1 +
> >>  arch/arm64/include/asm/fixmap.h |   5 +
> >>  drivers/ras/Kconfig             |  14 ++
> >>  drivers/ras/Makefile            |   1 +
> >>  drivers/ras/estatus-dt.c        | 318 ++++++++++++++++++++++++++++++++
> >>  include/linux/estatus.h         |   3 +-
> >>  6 files changed, 341 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/ras/estatus-dt.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 6b2ef2ddc0c7..5567d5e82053 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -21761,6 +21761,7 @@ RAS ERROR STATUS
> >>  M:   Ahmed Tiba <ahmed.tiba@arm.com>
> >>  S:   Maintained
> >>  F:   Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
> >> +F:   drivers/ras/estatus-dt.c
> >>  F:   drivers/firmware/efi/estatus.c
> >>  F:   include/linux/estatus.h
> >> 
> >> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> >> index 65555284446e..85ffba87bab9 100644
> >> --- a/arch/arm64/include/asm/fixmap.h
> >> +++ b/arch/arm64/include/asm/fixmap.h
> >> @@ -64,6 +64,11 @@ enum fixed_addresses {
> >>  #endif
> >>  #endif /* CONFIG_ACPI_APEI_GHES */
> >> 
> >> +#ifdef CONFIG_RAS_ESTATUS_DT
> >> +     /* Used for ESTATUS mapping from assorted contexts */
> >> +     FIX_ESTATUS_IRQ,
> >> +#endif /* CONFIG_RAS_ESTATUS_DT */
> >
> > Why do we need this in addition to the four existing GHES slots? The DT
> > code doesn't use it and I was assuming that the ACPI code would continue
> > to use the existing irq; is that not the case?
> 
> 
> We still need a dedicated slot when only the DT provider is built.
> All four GHES slots are defined as part of the ACPI implementation,
> so they are not present in a DT-only configuration.
> 
> The estatus core always requests a fixmap index from each provider
> before copying a CPER record. As a result, the DT driver must supply
> its own slot to return a valid enum value to satisfy the common code.

Sorry, but I still don't follow this. The DT code doesn't use the fixmap,
does it? It looks like it maps the buffer ahead of time using
devm_ioremap_resource() and then the accessors don't use the fixmap
index at all, hence the horrible '(void)fixmap_idx;' cast which presumably
stops the compiler from complaining about an unused variable.

Will

