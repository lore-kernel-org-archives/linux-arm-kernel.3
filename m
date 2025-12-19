Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1567D78763
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7m52Cenbhvt0wbf3Ebn025ff2BkDrc83DlhsO1V+10=; b=vbPcWbLphdYFVb8YJEyHD4EfVT
	gllyhcb6QivK6Boxa7O6d/wvrSd+uMF/3srpN9JEiNUyvLh/u6ZgCPT6HseTPbC33334UfDXDC0Om
	jbM48Ty2ZYhZeoqfRRovy8Vj8PTSjlWH9HuQe7sVxRav2Agg72b34PF/ekZ9lWYXZTsLHry0P5xKf
	aE7DELaL1t/kVXR+DPd7eZ9lfvAiyUkZP0bP5cVbMI1JdBhBS0gCNIpVREvFiPSfAOE/qIKmTdCMN
	fXk6Zmb5SQdL78CIFctaRUAM9CYunBLYDCo6w2e2MLrWfD8gmRZ2CksAdVwzXZtxU+WViX3Gqb2OX
	IUcQPbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa5i-0000000AK1e-0756;
	Fri, 19 Dec 2025 13:00:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa5f-0000000AK0q-1i8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DEFD405CE;
	Fri, 19 Dec 2025 13:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3BDC4CEF1;
	Fri, 19 Dec 2025 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149214;
	bh=E1H9BqH+g14za3jaZiHkm73npLmISjQWVm0QNQCmXXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qdDR0Iz28N5oUNg9bIT7XwJBY2IGAwSnpuHZ260vwBHj0jXvZwGQDC6H7g3scs+Y8
	 Rw0OXzA/9ATIlHvHYioB0rP4eyrjmpzcoQeArJ0GnWZqqKhfuHCec6ceKKfH1Yoogv
	 RwQMDXfLGMn3FMeryeJYuUKfEZuBSS5WcBK1HssLYjxSincWZ2wUfC9MuQ/lG1QYNO
	 nLnCxOgSaRy52WiOHuQAcIuTjCALk2IfFEFpHD/kHkBM0lgvyxeG8+IPLioaS0U+EI
	 BrU1f0D/Gs2K+kdDOfblvsg1G0f/AS56BKLvkxkPbL7P+XO/XBwK2PpjLx7prmWxue
	 DbPh/7K3NNbZA==
Date: Fri, 19 Dec 2025 13:00:08 +0000
From: Will Deacon <will@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	tony.luck@intel.com, bp@alien8.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com
Subject: Re: [PATCH 11/12] ras: add DeviceTree estatus provider driver
Message-ID: <aUVMWMMmiG8_I2I2@willie-the-truck>
References: <aUQbdZHkzumTnwVP@willie-the-truck>
 <20251219090239.2692458-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219090239.2692458-1-ahmed.tiba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_050015_488786_0F6A5913 
X-CRM114-Status: GOOD (  33.95  )
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

On Fri, Dec 19, 2025 at 09:02:35AM +0000, Ahmed Tiba wrote:
> On Thu, 18 Dec 2025 03:19:17PM +0000, Will Deacon wrote:
> > On Thu, Dec 18, 2025 at 01:42:47PM +0000, Ahmed Tiba wrote:
> >> On Thu, 18 Dec 2025 12:13:25PM +0000, Will Deacon wrote:
> >> >> Introduce a platform driver that maps the CPER status block described
> >> >> in DeviceTree, feeds it into the estatus core and handles either IRQ- or
> >> >> poll-driven notifications. Arm64 gains a FIX_ESTATUS_IRQ slot so the
> >> >> driver can safely map the shared buffer while copying records.
> >> >>
> >> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> >> >> ---
> >> >>  MAINTAINERS                     |   1 +
> >> >>  arch/arm64/include/asm/fixmap.h |   5 +
> >> >>  drivers/ras/Kconfig             |  14 ++
> >> >>  drivers/ras/Makefile            |   1 +
> >> >>  drivers/ras/estatus-dt.c        | 318 ++++++++++++++++++++++++++++++++
> >> >>  include/linux/estatus.h         |   3 +-
> >> >>  6 files changed, 341 insertions(+), 1 deletion(-)
> >> >>  create mode 100644 drivers/ras/estatus-dt.c
> >> >>
> >> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> >> index 6b2ef2ddc0c7..5567d5e82053 100644
> >> >> --- a/MAINTAINERS
> >> >> +++ b/MAINTAINERS
> >> >> @@ -21761,6 +21761,7 @@ RAS ERROR STATUS
> >> >>  M:   Ahmed Tiba <ahmed.tiba@arm.com>
> >> >>  S:   Maintained
> >> >>  F:   Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
> >> >> +F:   drivers/ras/estatus-dt.c
> >> >>  F:   drivers/firmware/efi/estatus.c
> >> >>  F:   include/linux/estatus.h
> >> >>
> >> >> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> >> >> index 65555284446e..85ffba87bab9 100644
> >> >> --- a/arch/arm64/include/asm/fixmap.h
> >> >> +++ b/arch/arm64/include/asm/fixmap.h
> >> >> @@ -64,6 +64,11 @@ enum fixed_addresses {
> >> >>  #endif
> >> >>  #endif /* CONFIG_ACPI_APEI_GHES */
> >> >>
> >> >> +#ifdef CONFIG_RAS_ESTATUS_DT
> >> >> +     /* Used for ESTATUS mapping from assorted contexts */
> >> >> +     FIX_ESTATUS_IRQ,
> >> >> +#endif /* CONFIG_RAS_ESTATUS_DT */
> >> >
> >> > Why do we need this in addition to the four existing GHES slots? The DT
> >> > code doesn't use it and I was assuming that the ACPI code would continue
> >> > to use the existing irq; is that not the case?
> >>
> >>
> >> We still need a dedicated slot when only the DT provider is built.
> >> All four GHES slots are defined as part of the ACPI implementation,
> >> so they are not present in a DT-only configuration.
> >>
> >> The estatus core always requests a fixmap index from each provider
> >> before copying a CPER record. As a result, the DT driver must supply
> >> its own slot to return a valid enum value to satisfy the common code.
> >
> > Sorry, but I still don't follow this. The DT code doesn't use the fixmap,
> > does it? It looks like it maps the buffer ahead of time using
> > devm_ioremap_resource() and then the accessors don't use the fixmap
> > index at all, hence the horrible '(void)fixmap_idx;' cast which presumably
> > stops the compiler from complaining about an unused variable.
> 
> Correct. The current DT driver keeps the CPER buffer permanently mapped with
> devm_ioremap_resource() and that (void)fixmap_idx; line is just silencing
> the warning. I’ll fix that by dropping the permanent mapping and copying the
> status block via the fixmap entry, so the DT implementation mirrors GHES. That
> gets rid of the cast and makes FIX_ESTATUS_IRQ do real work.

Why can't you just drop FIX_ESTATUS_IRQ entirely? Your original
justification was:

> We still need a dedicated slot when only the DT provider is built.

but as above, the DT driver doesn't actually need it.

Will

