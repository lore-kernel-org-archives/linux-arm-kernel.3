Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30C6C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bn78rIl0UMN/Etf6kRxoCTI1Ti4PPNnvK//KgYHJgyU=; b=uvC/oDLYpemOutVhfq+nV1TR8r
	k+mRta1fMCVNN1Xv1knryRQYRHLg1J4XJ3njpWMuvlJhv432h2gwS732ixyzvc/RgiKbhBWFFy1gt
	0q1ZCY+1d0lR4ghnWiY69TN6BLp2x84dIsjWJAxTgqI7GJkkLdzJn9aoBZQXM5Q1HombQR5QGgd5Q
	S4gaOUQRQvJjJ1rXeo8DshduUOYc6WNMg8GiNdTxJ4ErCXntEdrjaTnK6UuAtsNfCJa4p7W3lGx25
	BVGajiH/K9cfF88VF59X32SthFna/LuIEil1DOHVPwHUYygY87gw6glcqgtLp3lYzCIe8e5pycLKH
	aRGYm3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Ff-00000005oRD-29bc;
	Tue, 22 Sep 2026 15:17:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Fd-00000005oQq-2Toc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:17:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7771576;
	Tue, 22 Sep 2026 08:17:39 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0863FA32;
	Tue, 22 Sep 2026 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790090262; bh=qcQAZi3C9KEKVCBrKlQm5wPF/QzOabtzbyH89pFNqKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7KOIxYw+wpS/RrOBtHZPEoa57VsVibuLFGNxbuxwd5gOZ0PyKUaEoISzKjUkGm+O
	 cRnFupxuwJe0JyM2CbdZiq/dPP8ao0o7SFv2+hYk1oun7k8V+WaxzzZjfFLG9EUXEY
	 OuYRrdnKbDr0QYRRHufbQIooq5EOPRgeXMonIamE=
Date: Tue, 22 Sep 2026 16:17:35 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 12/13] arm64: Kbuild: Remove vestigial big-endian
 support
Message-ID: <arKcDyE6pkBI9YVt@arm.com>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
 <arEF5IOJSlQyYwX5@arm.com>
 <arKaWVwH5RXKpDTf@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKaWVwH5RXKpDTf@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_081745_671030_148F7A03 
X-CRM114-Status: GOOD (  20.29  )
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

On Tue, Sep 22, 2026 at 04:10:17PM +0100, Will Deacon wrote:
> On Mon, Sep 21, 2026 at 11:24:36AM +0100, Catalin Marinas wrote:
> > On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> > > -choice
> > > -	prompt "Endianness"
> > > -	default CPU_LITTLE_ENDIAN
> > > -	help
> > > -	  Select the endianness of data accesses performed by the CPU. Userspace
> > > -	  applications will need to be compiled and linked for the endianness
> > > -	  that is selected here.
> > > -
> > > -config CPU_BIG_ENDIAN
> > > -	bool "Build big-endian kernel"
> > > -	depends on BROKEN
> > > -	help
> > > -	  Say Y if you plan on running a kernel with a big-endian userspace.
> > > -
> > > -config CPU_LITTLE_ENDIAN
> > > -	bool "Build little-endian kernel"
> > > -	help
> > > -	  Say Y if you plan on running a kernel with a little-endian userspace.
> > > -	  This is usually the case for distributions targeting arm64.
> > 
> > Running the checks through an LLM found that CONFIG_GVE depends on
> > X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.
> > 
> > I think that's the only positive test of CPU_LITTLE_ENDIAN.
> 
> Would you like me to add a '|| arm64' in there? I was a bit wary of doing
> so, given that I don't have a way to test it. Removing CPU_LITTLE_ENDIAN
> forces the issue, somewhat.

Or turn the dependency into X86 || !CPU_BIG_ENDIAN.

Was arm64 the only one to define CPU_LITTLE_ENDIAN before?

-- 
Catalin

