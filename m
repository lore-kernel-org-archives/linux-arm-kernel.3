Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB82C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKP9m+BDIsOZfQbj9AWrQzrEcScLXA8SYtp1+eZNKJw=; b=UJ0Cun75zhh5eBNAp20iVfNUXQ
	h3KxVor6i5uYPm75Q5tGqI3x6EyadMM6qtl33vMW1bwz2VLYrYgq4P4E5nteiZBsS/Bbd/GeSUbjP
	heHXuVu8+Lt72YFwUCbneZugtXiD7kfOdzX9PrqFBfeE9dBGraxPgTYAp2mei5E5Hdu/mq69V6K9Y
	qj1hcpE1vCKFqHMd2nC0hpRqQ9Ab4y84HJY3t6uqkmhMUUcSpaCW6QBXVeuN3QJB2RcrwGfVIUXvp
	n7Mh2Opr/xpufLWIHIzCICRbZS9NU/KtHgDvqBGi1HEXOp16ZBFUVsY92gzh10Ncqm9HpaEn/UZCq
	B0gAv0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92UE-00000005qoX-0srR;
	Tue, 22 Sep 2026 15:32:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92UB-00000005qnT-1SKw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:32:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7F376024D;
	Tue, 22 Sep 2026 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5740C1F00893;
	Tue, 22 Sep 2026 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091166;
	bh=JKP9m+BDIsOZfQbj9AWrQzrEcScLXA8SYtp1+eZNKJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNO8FjwsfUZmD09rveJo7VFGZrFnxDeVkxjDJ4aQ5RI5h8oep9eltQpM6N4tOOSK5
	 JymgYe87F9POuzWRjo1XRI31Cv7Wvdp7KheANzBbOGsb/dmUYcE1hbx2wMUqp4lm2w
	 N7JW4MRmC5LaHxSATN6Vmkuss0twaSFvVHVrj7M9EjN74s+HTaNTxI7fHlxtiAHZQv
	 BZ2HTsuwHwXLruuXtLxCDuofurDnBtaFYtPHti6VbQgIp7kOtIxZGv1sinJ1N4M0W3
	 WIuIeKjWnJnlRpnvadegNMZV8COoCV7whAQNw55iqCRq0OkOjl40qaSnetLcCavh/i
	 KhesXx6I3zpcg==
Date: Tue, 22 Sep 2026 16:32:40 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
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
Message-ID: <arKfmFW5lLqipdQ5@willie-the-truck>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
 <arEF5IOJSlQyYwX5@arm.com>
 <arKaWVwH5RXKpDTf@willie-the-truck>
 <arKcDyE6pkBI9YVt@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKcDyE6pkBI9YVt@arm.com>
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

On Tue, Sep 22, 2026 at 04:17:35PM +0100, Catalin Marinas wrote:
> On Tue, Sep 22, 2026 at 04:10:17PM +0100, Will Deacon wrote:
> > On Mon, Sep 21, 2026 at 11:24:36AM +0100, Catalin Marinas wrote:
> > > On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> > > > -choice
> > > > -	prompt "Endianness"
> > > > -	default CPU_LITTLE_ENDIAN
> > > > -	help
> > > > -	  Select the endianness of data accesses performed by the CPU. Userspace
> > > > -	  applications will need to be compiled and linked for the endianness
> > > > -	  that is selected here.
> > > > -
> > > > -config CPU_BIG_ENDIAN
> > > > -	bool "Build big-endian kernel"
> > > > -	depends on BROKEN
> > > > -	help
> > > > -	  Say Y if you plan on running a kernel with a big-endian userspace.
> > > > -
> > > > -config CPU_LITTLE_ENDIAN
> > > > -	bool "Build little-endian kernel"
> > > > -	help
> > > > -	  Say Y if you plan on running a kernel with a little-endian userspace.
> > > > -	  This is usually the case for distributions targeting arm64.
> > > 
> > > Running the checks through an LLM found that CONFIG_GVE depends on
> > > X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.
> > > 
> > > I think that's the only positive test of CPU_LITTLE_ENDIAN.
> > 
> > Would you like me to add a '|| arm64' in there? I was a bit wary of doing
> > so, given that I don't have a way to test it. Removing CPU_LITTLE_ENDIAN
> > forces the issue, somewhat.
> 
> Or turn the dependency into X86 || !CPU_BIG_ENDIAN.

At which point it might as well just be !CPU_BIG_ENDIAN.

> Was arm64 the only one to define CPU_LITTLE_ENDIAN before?

Looks like there are a few:

$ find . -name 'Kconfig*' | xargs grep 'config\s\+CPU_LITTLE_ENDIAN'
./arch/sh/Kconfig.cpu:config CPU_LITTLE_ENDIAN
./arch/mips/Kconfig:config CPU_LITTLE_ENDIAN
./arch/arm64/Kconfig:config CPU_LITTLE_ENDIAN
./arch/xtensa/Kconfig:config CPU_LITTLE_ENDIAN
./arch/arm/mm/Kconfig:config CPU_LITTLE_ENDIAN
./arch/microblaze/Kconfig:config CPU_LITTLE_ENDIAN
./arch/powerpc/platforms/Kconfig.cputype:config CPU_LITTLE_ENDIAN

I'll play it safe and add the || ARM64 as I don't particularly want to
deal with the fallout of the driver getting additional exposure on
architectures (e.g. sparc) that don't define either of the symbols.

Will

