Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8164CC6B3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqSDYo6KhD6hgEBtaTlJT8L3XlR4DxinwiqBOqVxw9E=; b=VyIrmi7OOuX/abCVriv7wTXc94
	ycNLVMN3zMQbnNs9ite662cVDojq31L2YdMYF/gY2qpvlNSvNXPltzhfqiDIeS2LZXeqmREgMMlmY
	SCHGL9ce2K38Oh9Rnd9VJAY2MTwpyimJ8E06ChI+cN8Nhuq/4OEQFMF1pAfj1kwQnsgsLGqMxsTtm
	l/oekqJ4ud4jczSO+ZGlVGUgz6MZ2+nhE+G0IIrf5AZqPsgmzlTEJ139EciGh2ZLbot+5o3rXJC4B
	TfFFUcn/ZhBMAMFcV0OVvS0xkDkm8TNx+/XcjBWWeWKDoaSHAAMwaFIIHA5lnY1/Hsk00AZqrE8X9
	zxFOiRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMcS-00000000PaF-357V;
	Thu, 15 Oct 2026 14:39:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMcO-00000000PYc-4APH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:39:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E27D1516;
	Thu, 15 Oct 2026 07:39:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B010C3F871;
	Thu, 15 Oct 2026 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792075179; bh=Fb36/syZUNEYWdl3Bd5gIsdA6lsDxAgZ75KGLzG1fss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWXUtV5zaitH826ccfvPYjomPlFmVtSeNOI6RA12yH7xkeg3VE985hpe97OSP6/tq
	 KNyaSJQbiNlaGn6slCznCJZNl756BSzO0c+9fmdJVbflg//LUF2Z2R07xFJaLMyqTh
	 3ZhmHaBDsFr6pH5a7iIx5wOD6t2/ALdTRvQOFC5Q=
Date: Thu, 15 Oct 2026 15:39:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: cki-project@redhat.com, linux-arm-kernel@lists.infradead.org,
	mmalik@redhat.com, will@kernel.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (7.3.0-rc4, upstream-arm-next, d820e3ba)
Message-ID: <atDlqCgB72yHmDHN@arm.com>
References: <81706.126101500420900200@us-mta-510.us.mimecast.lan>
 <atC4Ce9AQxjCwYIB@arm.com>
 <CAFqZXNsV_P_jxt9ZVYBYdh9vuFDPrsCh-Ch7niccns0WRgbs8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFqZXNsV_P_jxt9ZVYBYdh9vuFDPrsCh-Ch7niccns0WRgbs8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_073941_102146_6EBFD9B7 
X-CRM114-Status: GOOD (  22.41  )
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

On Thu, Oct 15, 2026 at 02:39:43PM +0200, Ondrej Mosnacek wrote:
> On Thu, Oct 15, 2026 at 1:31 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Thu, Oct 15, 2026 at 04:42:05AM -0000, cki-project@redhat.com wrote:
> > > Hi, we tested your kernel and here are the results:
> > >
> > >     Overall result: FAILED
> > >              Merge: OK
> > >            Compile: OK
> > >               Test: FAILED
> > >
> > >
> > > Kernel information:
> > >     Commit message: Merge branch 'for-next/fw-rmi' into for-next/core
> > >
> > > You can find all the details about the test run at
> > >     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2947827228
> > >
> > > One or more kernel tests failed:
> > >     Unrecognized or new issues:
> > >         selinux-policy: serge-testsuite
> > >              aarch64
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:2947827228_aarch64_kernel_kcidb_tool_1200470666_8
> > >                    Non-passing ran subtests:
> > >                        ❌ FAIL Test
> > >
> > >     We also see the following known issues which are not related to your changes:
> > >         Issue: [upstream] Hardware - Firmware test suite - auto-waive failures
> > >             URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
> > >             Affected tests:
> > >                 Hardware - Firmware test suite [aarch64]
> >
> > Is this another infrastructure issue? From the logs:
> >
> > + nft -f /root/selinux-testsuite/tests/sctp/nftables-flush
> > /root/selinux-testsuite/tests/sctp/nftables-flush:1:17-24: Error: Could not process rule: No such file or directory
> > delete table ip security
> 
> the above is not the source of the failure, that part is expected to
> fail normally.

I have yet to learn how to look at these logs properly ;).

> The problem is the failing binder/test, which is a
> recent regression in mainline that I'm currently investigating. I
> created DW issue https://datawarehouse.cki-project.org/issue/11475 to
> waive these failures for now. I'll update it with a proper link once I
> report the bug / post a fix.

Thanks, good to know. So it's unlikely to be something I pushed into the
for-kernelci branch.

-- 
Catalin

