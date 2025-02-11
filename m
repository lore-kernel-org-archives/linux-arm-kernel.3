Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CC5C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfyIR9zJN7mo6nVeqM2VUMp7BoyxRshFZiXhQXmunYE=; b=UwzvDd4UbHrgGQuj4HU0wsY+HB
	cUnFe4jU1O9KXsXXgyylNmhfy59x56f0sFCpO2Y+Z6MM3LwS98d1xyjnw0WDurxUUgLP22/OXNgxV
	COdqtXYU/EN0XT2P1ju2yhOEIPK8o5Ak3H2vrAB4eXZogJvhYC8/ouG5xR6WYMRbPwZhAS/8RLw0K
	Df8USo1KxtV8KRU7NFtv6FQo/Nd85H1d7zqr09uWPwySy6sdz1uukSKkWF0PgzlH0ZqTvubg7HygY
	D0T0/XCEk2GlpZYyOm2+2A8xfHTDkvWATC+P/QpAM28jKEgjNZi1eQ0Ut++M2g3sWFtbTRqHbTu+2
	EsY+z45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvHF-00000004tla-22nj;
	Tue, 11 Feb 2025 18:46:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thv87-00000004rfL-1N72
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 18:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yfyIR9zJN7mo6nVeqM2VUMp7BoyxRshFZiXhQXmunYE=; b=IzUiCHT8aIZjyrfa8GIhJlLc1t
	OOXYFUIL1qw/S+3kLGTouWcxt71gf63bxzwPw1dEsvLjqS7an5OhUHogdDVDTP+R+xXlrVOg3DXOX
	pWGwdcBH7JqyLAI2AVd8kr87EY/XoYgKnF1aa4HPXnfPJu5i/ib52ENw6e23HzbRCEmwcurCd29zV
	vrPfB2UWnOHMHxFiRc0F8P8sxIypzm+/ovov/F/zu1Pp56pXwnD4Rjt+DGlem+NM9FBnKqAfyxuqz
	KHWXoIRCeeQxiwMQEhsvHeFtADJldruORLXaFWsi4Nd/aVFlLslupRvYAJEyrf5/9gXRVAOxPzFPz
	YAldHebQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thv84-00000000gNf-1Jbv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F9825C47A0;
	Tue, 11 Feb 2025 18:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3ADC4CEDD;
	Tue, 11 Feb 2025 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739299020;
	bh=ECyQVWW45GnMczkRjm/XlCIytIxAb9ehTHDo2xIVE4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2ecMHeREtQ/wkbTPoKsOeq+nqXp+73t/ZKlLsqrNK3xL22ErByyMZzi4hfK879GP
	 TbRUHh+Oir4XU+oHSo9fSOcLt3vdCbLOre1EHiZVLfGoSGDAhobtrMj6RvJKxg5lGz
	 iNPPqLFtGMhsLFl2lCIuer8ouq5WQex6JvZWVQ4N3zMpuMXSdjuyICZs665D8UCnLn
	 +PcN5Qc9NpUGQG2UdzsPYEZRyDx9S3aQbA5Ju0kxx8oJ/VEbSq4nHd2Iob3GAJpshG
	 zJnxUmH/NcDfKY6U7v/Ai3ghV9rmZgbkkp8CidLovekB3NWGVUk9o50syWAXz3DcD1
	 luiTyZ4FU4UeA==
Date: Tue, 11 Feb 2025 18:36:56 +0000
From: Will Deacon <will@kernel.org>
To: Itai Handler <itai.handler@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com, ardb@kernel.org, usamaarif642@gmail.com
Subject: Re: Issues with kexec on arm64
Message-ID: <20250211183655.GA9618@willie-the-truck>
References: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
 <20250103161637.GA3921@willie-the-truck>
 <CAFpOueQa2EOSC7=5xsWU85B0FG8xsDoqk7btMQCEV7wBdT1GQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFpOueQa2EOSC7=5xsWU85B0FG8xsDoqk7btMQCEV7wBdT1GQw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_183704_732887_DFC0DFBD 
X-CRM114-Status: GOOD (  36.55  )
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

On Sun, Jan 05, 2025 at 04:46:42PM +0200, Itai Handler wrote:
> On Fri, Jan 3, 2025 at 6:16 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Dec 24, 2024 at 01:36:41PM +0200, Itai Handler wrote:
> > > [Sorry about my previous e-mail on this subject. It got corrupted.
> > > Please ignore it.]
> > >
> > > Hello,
> > >
> > > I'm encountering kernel panics / system hangs when attempting to
> > > kexec a vmlinux file on arm64 architecture.
> > >
> > > It happens both on qemu and on real hardware.
> > >
> > > These issues occur on all kernels from v4.19 to the latest mainline.
> >
> > I think other folks have been using kexec on arm64, so something smells
> > fishy here. Is the issue intermittent?
> 
> No, it isn't intermittent. It's very easy to reproduce the panics/hangs.
> At most we need to perform two recursive kexec attempts of the vmlinux file.
> In v6.6, using the configuration I supplied (config.sh), a single kexec
> attempt is sufficient to demonstrate the issue. In that case a panic occurs
> on the first kexec attempt. In newer versions I mostly see hangs but sometimes
> panics as well.
> Please note that the configuration I supplied sets CONFIG_ARM64_64K_PAGES=y.
> But I saw issues also with 4K pages, but in that case only when enabling some
> debug options (KASAN, SCHED_DEBUG, KCSAN).Also please note that kexec with the
> Image file (instead of the vmlinux file) seems to work properly, without any
> issue.
> 
> >
> > > A sample panic output looks as follows:
> > >   kernel BUG at arch/arm64/mm/mmu.c:217!
> > >   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
> > >   CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
> > >   Hardware name: linux,dummy-virt (DT)
> > >   pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >   pc : __create_pgd_mapping+0xe8/0x3b0
> > >   lr : __create_pgd_mapping+0x44/0x3b0
> > >   sp : fffffe00804d3c20
> > >   x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
> > >   x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
> > >   x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
> > >   x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
> > >   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > >   x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
> > >   x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
> > >   x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
> > >   x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
> > >   x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
> > >   Call trace:
> > >    __create_pgd_mapping+0xe8/0x3b0
> > >    map_kernel_segment+0x74/0xb0
> > >    paging_init+0xec/0x4f8
> > >    setup_arch+0x234/0x52c
> > >    start_kernel+0x64/0x500
> > >    __primary_switched+0xb4/0xbc
> > >   Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
> > >   ---[ end trace 0000000000000000 ]---
> > >   Kernel panic - not syncing: Oops - BUG: Fatal exception
> >
> > So this explodes because we find a page-table entry at the pmd level
> > that we don't like the look of:
> >
> >   - It's not a block entry
> >   - It's not all zeroes
> >   - It's also not a table
> >
> > Sadly, the actual value is clobbered by the time we take the BUG():
> >
> >    0:   f9400300        ldr     x0, [x24]
> >    4:   92400400        and     x0, x0, #0x3
> >    8:   f1000c1f        cmp     x0, #0x3
> >    c:   54000060        b.eq    0x18  // b.none
> >   10:*  d4210000        brk     #0x800          <-- trapping instruction
> >
> > Maybe dumping 'pmd_val(pmd)' before we crash would be instructive? Maybe
> > it's a pointer...
> 
> I dumped the bad pmd (on v6.6).
> It's always the same value: 128000017901ca60.

Hmm, I can't make anything useful out of that but it certainly looks
bogus.

> > > I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
> > > ("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.
> >
> > Hmm. I wonder if the rodata section isn't being loaded properly? Can you
> > add some traces to check that, please?
> 
> Could you advise which traces are needed and how to add them?

If you can find where the .rodata section lives in the kernel binary
that you're trying to kexec, then you could instrument the kexec code to
check that it does indeed load that into memory, for example? You'll
need to use your imagination as you're the one lucky enough to hit the
bug...

Will

