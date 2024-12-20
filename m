Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A53AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/eSIZxsQMcENJr/D+vZaiIGDQsWh+vH0nKnhYuKDXw=; b=hKR/ArtPgKhIfaajOUflOiO4N5
	AZwXnDkIHrEknmtUrpYU0hagFtjpqmqFtdM0vQZK3Sl+Xc2bpuoWTC6cpZcB503+WNWsmIJ8QMi9V
	30IqUingjCs0RUCABE9GDVbS2HLJ0QZbh1tyy9fVrafX7MRI7XYm8hi3LiXwhedbpmtjSYKxrk5jE
	sQ0XnfhVPkhW6x3iehsrSmvpEAJuozP7sTz29e4OecbfrKZyOcFx7T76t5Bl2FHQtG14aMOzN2max
	Snb23MlaPH0EmtVUOHy17ueLWRRcf2Jsp3KwPpm0r3tUXJRJ/k5oeX1qv7UPHpqp93ylt7aiQEqFG
	6ySwM8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdJ4-000000052Vs-1HeI;
	Fri, 20 Dec 2024 13:44:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdHu-000000052MN-0TKE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8C165C5FC8;
	Fri, 20 Dec 2024 13:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75569C4CED3;
	Fri, 20 Dec 2024 13:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734702209;
	bh=lV6r+LNOfCx85KGIBSkBaigxztrKSsTLXQrG5Dvnx98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEvTdwIlc5cQko8VVMQqLXbuNU17fqwKVBSOQcNrvSFO9THKPC2vj45EtvdPRd6vF
	 PMify3yW9UxzzF0e6g5lTxMHk3EWTObubQWQRnUTSJbn2sJOVcmfdepoooqmaw9Hjq
	 USdW1laSulZsDFTVja6Pmg3xt6M1bgzugYPebsa6cvnBvGbRMPXPvhOjAJKkrAi3rO
	 uaS9p2Ga61GSB6en5ap/b+Ni4oU3km00fIr5re85gblQnb1XJFHRv70Y+EivRkrrCS
	 rFXy6dyH1BsUTGHHUlPA/QkJ54vuNACn1lSvqCAHhpJ8IK4/+TxbfvuREmY+7cHor5
	 QH+Xm8Pqy8uCw==
Date: Fri, 20 Dec 2024 13:43:24 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: cki-project@redhat.com, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.13.0-rc3, upstream-arm-next, 06a57361)
Message-ID: <20241220134324.GB26731@willie-the-truck>
References: <64955.124121918121002524@us-mta-554.us.mimecast.lan>
 <20241220123526.GA26697@willie-the-truck>
 <CAMj1kXENrzsF6JzvbGSwiJT5nupfJbij86zp0k2+YbqUCqvqNA@mail.gmail.com>
 <CAMj1kXGx+Li4qwh_05Uf-aTtEOLSThv8o3JjKgWrPp9t8rqQyg@mail.gmail.com>
 <20241220132549.GA26731@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220132549.GA26731@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_054330_237912_3EB60B68 
X-CRM114-Status: GOOD (  24.75  )
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

On Fri, Dec 20, 2024 at 01:25:50PM +0000, Will Deacon wrote:
> On Fri, Dec 20, 2024 at 02:06:21PM +0100, Ard Biesheuvel wrote:
> > On Fri, 20 Dec 2024 at 13:49, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Fri, 20 Dec 2024 at 13:35, Will Deacon <will@kernel.org> wrote:
> > > >
> > > > On Thu, Dec 19, 2024 at 11:12:08PM -0000, cki-project@redhat.com wrote:
> > > > > Hi, we tested your kernel and here are the results:
> > > > >
> > > > >     Overall result: FAILED
> > > > >              Merge: OK
> > > > >            Compile: OK
> > > > >               Test: FAILED (Did not boot)
> > > > >
> > > > >
> > > > > Kernel information:
> > > > >     Commit message: Merge branch 'for-next/core' into for-kernelci
> > > > >
> > > > > You can find all the details about the test run at
> > > > >     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1596629923
> > > > >
> > > > > One or more kernel builds failed:
> > > > >     Builds that are failing to boot:
> > > > >          aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redhat:1596629923-aarch64-kernel
> > > >
> > > > Hmm, I can't find any console logs here. Did the machines really fail that
> > > > early?
> > > >
> > >
> > > This appears to be my fault: commit 32d053d6f5e92efd
> > >
> > >   arm64/mm: Drop configurable 48-bit physical address space limit
> > >
> > > inadvertently sets CONFIG_ARM64_LPA2 for all VA space sizes. The
> > > following hunk needs to be applied to address this
> > >
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -1418,7 +1418,7 @@ config ARM64_VA_BITS
> > >
> > >  config ARM64_LPA2
> > >         def_bool y
> > > -       depends on !ARM64_64K_PAGES
> > > +       depends on ARM64_VA_BITS_52 && !ARM64_64K_PAGES
> > >
> > >  choice
> > >         prompt "Endianness"
> > 
> > On second thought, let's just omit commit 32d053d6f5e92efd  for now -
> > it's at the tip of the for-next/mm branch so it can just be dropped.
> > 
> > I'll revisit this later - I have to double check that non-LPA2 configs
> > (such as the one this report is about) work correctly on LPA2 capable
> > hardware, and don't deviate from LPA2 configs booting with arm64.nolva
> 
> Sure thing, I'll drop it for now. I've managed to repro the failure
> under qemu using the CKI .config, so I'll check that things are happy
> again before I pushed the updated branch.

Ok, now pushed!

Will

