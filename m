Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF40CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq2Ji8iIUW6ky9NAEq0n4swfYb9E9uMD6+G4QTqL/lI=; b=svtchNeCuh3pn0bnPxd6BsnZqQ
	MMo7Ags4MLAW+jj+dL//cV9PtQ9sIfZ9Cp4+LpqCPk+YEQ2lxP/ROrd5BfcERebb2k07AY2rvUCVx
	6oX2saXary0vuwcHTZt/JSUFpDd7Qy5J74MFp6EwW0B8nMWKYTPSkEIZNVsZCtAj1omp4NuAHD0lj
	YsOVaLCHS+6UKIZrIMsNwphMNOGm4Gh3u0F+P5KusFn6HA54M0yfdm7Gk09WtKy5KXkS4Si0L2Z3s
	FMKk2y4+bdJc+UP+QYKiPilKA+zYPQB2266WMOnbSwfaDGoCXkYgveoSJq4hjT8RumI8FZ/h5oVIT
	3U9n+H3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7Rh-00000003uzr-37EW;
	Mon, 15 Sep 2025 11:32:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7Rg-00000003uzQ-3MAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B741601A3;
	Mon, 15 Sep 2025 11:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C361C4CEF1;
	Mon, 15 Sep 2025 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757935951;
	bh=igQdQMm1aWVPuBBl6+Gz268oZtM9MYyah2qiIamBr0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2WRhNj+XGcJXy3udeuk2ypyEbEhGFwhh29xiQ84MKu1fhbKbEoaIr6iT+VyqqQeH
	 sOyCmO97muj9BhqBmdPLfAcdpjbfrW0MYycIpjrIoIaD22UFtO/jWqgbMlGo+z41Zf
	 SYwovXTGoUyGfHNxg9FYSV8R9NA0OOZSbBnGvnZoBY3oCldnr7mXn1QGc17b24QJB4
	 jBAgFPogtpmshCXRc2hK0I8OvRQQw5WdHcjC5NOo6rM9cQuXHIxpYYXcoEAyoO8g6e
	 kiZTkNeBLKgEDEroleiQvj1EoRlrZ1Q+AsB0JjJgkYJq48L6q4bsNaCAI/nklGukAP
	 dJccvMFtX34tg==
Date: Mon, 15 Sep 2025 12:32:26 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, broonie@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 3/6] arm64: Kconfig: add LSUI Kconfig
Message-ID: <aMf5SlYGhOFLSU1N@willie-the-truck>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-4-yeoreum.yun@arm.com>
 <aMRJK3x-K0HktAPA@arm.com>
 <aMfthATCr5VZcVAH@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMfthATCr5VZcVAH@e129823.arm.com>
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

On Mon, Sep 15, 2025 at 11:42:12AM +0100, Yeoreum Yun wrote:
> > On Sat, Aug 16, 2025 at 04:19:26PM +0100, Yeoreum Yun wrote:
> > > Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> > > previleged level to access to access user memory without clearing
> > > PSTATE.PAN bit.
> > > It's enough to add CONFIG_AS_HAS_LSUI only because the code for LSUI uses
> > > individual `.arch_extension` entries.
> >
> > The subject could be improved slightly: Detect toolchain support for
> > LSUI.
> >
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > ---
> > >  arch/arm64/Kconfig | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index e9bbfacc35a6..c474de3dce02 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -2239,6 +2239,11 @@ config ARM64_GCS
> > >
> > >  endmenu # "v9.4 architectural features"
> > >
> > > +config AS_HAS_LSUI
> > > +	def_bool $(as-instr,.arch_extension lsui)
> > > +	help
> > > +	 Supported by LLVM 20 and later, not yet supported by GNU AS.
> >
> > binutils 2.45 added support for LSUI.
> >
> > Nitpick: we tend to add a two-space indentation from "help".
> >
> > Otherwise it looks fine:
> >
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Thanks! I'll change the Nitpick and send again.

Please don't resend until we've concluded on the CAS discussion.

Will

