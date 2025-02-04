Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4udFGcQN12xvwMgelX48lh5gueDWmdXACwQIw7egmAg=; b=PT3Jw82J532QvQrhuGk9h+GyCl
	VWjGLBzMo8tXEERNH4PEu9GLeicOPd2fIreS+WkKrUPHJWy0SO5iT1Aj2883WxNvG+ltZMBFkNXh3
	c+Y3Nji2Mwd9oQag006y4nszvRslc5M4QVuTmT/fyPxReamDINmTV2J38vEPFFp5Bt2uLkl3Y3Wmj
	mB30WRZKcNM5NOxZ7ez6sqoQntJHFGCF8l5KgWQ1f0k833vk2TdX00Kh0iDxtPks9iLQV85Ko6vKb
	MuSBfWmzga4kebhdP91n/dp8/hQfh1EXP0lohVIAL7ZWJsulYysieFfMkPtlu5t/i9LNBG2k/RTIg
	uBnk7ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVh-00000001bQt-0npG;
	Tue, 04 Feb 2025 21:31:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPFY-00000001UrP-2RmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 20:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 295135C686E;
	Tue,  4 Feb 2025 20:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C5FC4CEDF;
	Tue,  4 Feb 2025 20:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738699823;
	bh=m8yVLYpKn3d5vWbvaWL2AJhRlp1fP7HatFby4Wvgjoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+GTNM8xDK6epsYVMUWqa7knu6hqrOfsFV2GPRbeXMQSUL6Vkzu6SC/Syb7PjulZg
	 YR9dvASFFJcxHVisAhg177l8yWYG+gUtviHNRVQhVSrK3qxh8ZaBdv6Oa45iFawJOP
	 J+MQOcFGK8bgQK4Zjgek+6c7r9bhO/2iU/GBCHd9II+qETt7sDSyCQOmuGHpTisScu
	 AIn65Ws4IsLy072ogIjUZm1UfnFDiTyWjOmAA4WjtRmHavYtSVKjosCcmtDJZXcQfd
	 LsSpQJGJy8/0oSXOoMyj0nPao8837lZzI51/+IchSQ57TJazhaeqkWxUsXZzZYebTY
	 4NzHOZbi8WhTA==
Date: Tue, 4 Feb 2025 13:10:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Will Deacon <will@kernel.org>, cki-project@redhat.com,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, masahiroy@kernel.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.14.0-rc1, upstream-arm-next, 2014c95a)
Message-ID: <20250204201019.GA3095838@ax162>
References: <35056.125020404510900229@us-mta-503.us.mimecast.lan>
 <20250204111552.GA893@willie-the-truck>
 <202502040638.5EF4863D8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502040638.5EF4863D8@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_121024_668847_05EEA1EE 
X-CRM114-Status: GOOD (  16.74  )
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

On Tue, Feb 04, 2025 at 06:40:25AM -0800, Kees Cook wrote:
> On Tue, Feb 04, 2025 at 11:15:53AM +0000, Will Deacon wrote:
> > [+Kees]
> > 
> > On Tue, Feb 04, 2025 at 09:51:05AM -0000, cki-project@redhat.com wrote:
> > > Hi, we tested your kernel and here are the results:
> > > 
> > >     Overall result: FAILED
> > >              Merge: OK
> > >            Compile: FAILED
> > > 
> > > 
> > > Kernel information:
> > >     Commit message: Linux 6.14-rc1
> > > 
> > > You can find all the details about the test run at
> > >     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1654629441
> > 
> > It looks like the build fails thanks to a rust panic:
> > 
> > 00:00:10   EXPORTS rust/exports_helpers_generated.h
> > 00:00:11 panicked at main.rs:52:36:
> > 00:00:11 Unable to generate bindings: ClangDiagnostic("error: unknown argument: '-fzero-init-padding-bits=all'\n")
> > 00:00:11 make[4]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 101
> > 
> > Presumably introduced by dce4aab8441d ("kbuild: Use
> > -fzero-init-padding-bits=all"). I'm guessing that option isn't supposed
> > to propagate to .rs sources?
> 
> How is that getting passed to Clang? That's a GCC-only option, with
> "cc-option":
> 
> +KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
> 
> I will take a look...

It seems like the error comes from bindgen. Does this patch help?

https://lore.kernel.org/all/20250129215003.1736127-1-jforbes@fedoraproject.org/

Cheers,
Nathan

