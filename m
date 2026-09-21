Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580D9C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcL3GAkRKxieHVQbXg+KXKMiPhwn+/h/T17lmePKN9U=; b=3F/XASHBWmpsZ5XOc85W0Le3qc
	iR1VHs3EQNvuy9upfHa6tzHvW8KqA4n5htZOAc+wK2vbTDc8IlD62dRVjZ2uUnj7CFRd8SRMUfOdF
	es3vGrb/DORbE2MzhBIglDU8SVGWAzQFfkKQqVOVffPyrJ430jbgVW3jlXyE+QK+PlKhzezvjDMXd
	0g6zyhhfKQYWSxvted/0L11bfJGy2tIb2HlevjJedJcqv/Ca9q60X0sFOZIyOnDYi6qt4OHYVNyGZ
	5VBlKAWTN/a8efhLOh26T5MJ5jZLTsX1ULEwEq1yYXGGD3aL956wGdvUI8X0vJZHZXAUS9q5yBSKN
	B8n6xhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bCX-00000001gJ7-1NWN;
	Mon, 21 Sep 2026 10:24:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bCU-00000001gIh-47uQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:24:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C3219F0;
	Mon, 21 Sep 2026 03:24:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9DBA3F86C;
	Mon, 21 Sep 2026 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789986281; bh=FhXjGblU154b3/iGKZgOvko5HqBskKdnpkd2ss6SKBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PP+b/+BlFbviOChQuugyXCOT9qITsdQW628WzZJIkn8J7eQr7Z+d1r95L0xVfD1Bw
	 LcS4DgVewJ0NUeNGAUniVn8IKG3xT5vqPtwMy+NzOibblC1J6uR0epCNTp6uIzItWt
	 r7SQsbQCnIGDsMgAECycXtGKxHqhnlHZ7LsRHu2s=
Date: Mon, 21 Sep 2026 11:24:36 +0100
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
Message-ID: <arEF5IOJSlQyYwX5@arm.com>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918145217.1669-13-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032443_082830_5E4957DC 
X-CRM114-Status: GOOD (  13.41  )
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

On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> -choice
> -	prompt "Endianness"
> -	default CPU_LITTLE_ENDIAN
> -	help
> -	  Select the endianness of data accesses performed by the CPU. Userspace
> -	  applications will need to be compiled and linked for the endianness
> -	  that is selected here.
> -
> -config CPU_BIG_ENDIAN
> -	bool "Build big-endian kernel"
> -	depends on BROKEN
> -	help
> -	  Say Y if you plan on running a kernel with a big-endian userspace.
> -
> -config CPU_LITTLE_ENDIAN
> -	bool "Build little-endian kernel"
> -	help
> -	  Say Y if you plan on running a kernel with a little-endian userspace.
> -	  This is usually the case for distributions targeting arm64.

Running the checks through an LLM found that CONFIG_GVE depends on
X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.

I think that's the only positive test of CPU_LITTLE_ENDIAN.

-- 
Catalin

