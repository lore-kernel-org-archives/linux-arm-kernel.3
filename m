Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3777C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9rTdAG5UF7Ih/OQeEoy2G22JIJbqdv9IlO1Ri/2ivQ=; b=VPi2OcSw/dClx5d2bcpGOrosEt
	OOajKoq5nHYXs3N7XC3oqHmbOzvGAnryoADTNprCtG/djXB7ksYcEpT0WuyCrfcfGtDWRYpNV0ElW
	F9Hfj6KmdeLKJSAqCGJjsTrr6Fwnwo5XBNUexCT4DuWqrlgKGBJLbQhsOsrx4IxkxoomUkTNT87IS
	vBqFd6WMCjPiHBXZnwWOFHVBOy1vLyVtPVeky5s+Iimp52DKHLXphAelR9t0pcO+l2CeZ7B2r0+tT
	N8U1xood5z79GocEcqQQEJBPP7C6V3l1tvWbEQCQ36O4X20MAokiyrLFsCCXGMoQ/GFkXkJT6h57H
	UlxL0wmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfK7d-00000000gus-2Tmv;
	Tue, 04 Feb 2025 14:41:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfK6I-00000000gl9-46cy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 320FE5C68DC;
	Tue,  4 Feb 2025 14:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC59EC4CEDF;
	Tue,  4 Feb 2025 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738680029;
	bh=K3K81ZUsdcvBt8FPkEamsjtLAANfVjhwUkp09Y4A9wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmodcQAhZpkm1PXkfhZSEqlLlzST8emQr+GSqv5gy2/EQr4voknFicdsQjhBEkwaH
	 ooDniH/G1DOI9dKkcx++9OiRHYAPO33eFjtXQVGX5ZkOLTBIkQXf2CCbW6foTaXqcI
	 cBalQFSoTBkvUn/rk5u4FrnqgGpycCuSw4gKVA8IFrP72+1QtDPLfD/wIv6Qs8/3Ko
	 CZv7pQ1Jc/s2lKAa6XDdSQlyPtlKhyAJuJdqJp6tca5HDWxOQeianmBFsatd7LGMWU
	 4SsHdQFGfD5YI3tbygVV1WoHnn+1h22mFrUhV4jrvr2prIvpj355p1HTBWSpQoLO4N
	 Keh8CNRbKdhhA==
Date: Tue, 4 Feb 2025 06:40:25 -0800
From: Kees Cook <kees@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: cki-project@redhat.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	masahiroy@kernel.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.14.0-rc1, upstream-arm-next, 2014c95a)
Message-ID: <202502040638.5EF4863D8@keescook>
References: <35056.125020404510900229@us-mta-503.us.mimecast.lan>
 <20250204111552.GA893@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204111552.GA893@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_064031_059360_E989A65F 
X-CRM114-Status: GOOD (  13.67  )
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

On Tue, Feb 04, 2025 at 11:15:53AM +0000, Will Deacon wrote:
> [+Kees]
> 
> On Tue, Feb 04, 2025 at 09:51:05AM -0000, cki-project@redhat.com wrote:
> > Hi, we tested your kernel and here are the results:
> > 
> >     Overall result: FAILED
> >              Merge: OK
> >            Compile: FAILED
> > 
> > 
> > Kernel information:
> >     Commit message: Linux 6.14-rc1
> > 
> > You can find all the details about the test run at
> >     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1654629441
> 
> It looks like the build fails thanks to a rust panic:
> 
> 00:00:10   EXPORTS rust/exports_helpers_generated.h
> 00:00:11 panicked at main.rs:52:36:
> 00:00:11 Unable to generate bindings: ClangDiagnostic("error: unknown argument: '-fzero-init-padding-bits=all'\n")
> 00:00:11 make[4]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 101
> 
> Presumably introduced by dce4aab8441d ("kbuild: Use
> -fzero-init-padding-bits=all"). I'm guessing that option isn't supposed
> to propagate to .rs sources?

How is that getting passed to Clang? That's a GCC-only option, with
"cc-option":

+KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)

I will take a look...

-Kees

-- 
Kees Cook

