Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BB0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVpMlVUJQAlumPynsGYr0TxnqNKdRJaMWwljNSs8dl4=; b=kZd3fp0NbgJjcQ6tLV3629jAfS
	gXlmN0L2W/55jIs75jjBnj3XeiK14Vf2ZVxhkwqo60AEj0uNx0oDWx80xKGxQ0bI5sAMZLqwungZY
	yZBOB9ilwE5BcYBIz+aJLMgATBc6eFSJCiZ1RCpEcqS+enur/OiTaoAjlvpvacbMp+J0BY7gwc9gD
	LvMbzeCpavLOrWF8pt8P5BQKE33nh1VcdHiYhS4sDDJ0QVB7bJha3e1IEKNk1zpKM2O0UlfCJ8TtM
	LARCObJj3v3ZaTnurSb84RsHctW3GF8nYekKb440Y/4rb6beg05g57Z8jRx35nGjMvEfeWU2+EoQQ
	/e7cD10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj16d-0000000FzcJ-3d7a;
	Fri, 14 Feb 2025 19:12:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0gs-0000000FvfV-1AeZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uVpMlVUJQAlumPynsGYr0TxnqNKdRJaMWwljNSs8dl4=; b=hErY3jXXJMK8VI15rYDML7O74M
	mKAhr8v6p71eDstcrwiztYMb2NrDkSzxYniFhhk7rIwakpHjlJVOIsHonnEhK1VCIElNCxOeQN8VN
	/2JPs95w5TpNFQZ6FgQS7JhysyRJxY70MPuKPSVOudZh6LbbVtWsOd+efrTNs6R24Og+5Hfg13mvp
	uSDOhOiuE7DfX5TzDnHS/s+Ywa7pCGuZaKGrFBmsglgwUyxa+JX2Hhw6ofAsfxIrKKAK0hu6htFbC
	vidGWvD5mNIAn8qk+h7YxQhNNuJutT7fz+qv/Aw32imHE6jx7oEg1LseS9/DrOkycNuT96gMcUYie
	3NLxLLdA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0gp-00000001JiS-0HcJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22D535C101C;
	Fri, 14 Feb 2025 18:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACCEC4CED1;
	Fri, 14 Feb 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739558723;
	bh=hhnbXVudW3X9Ob2dmDCWIf7SoirkZhCcBkp92o1UP/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exnUPGgXUpVDJXfejHV+qS8UhaO6MyTm9FhHIGy7axieRMhiCYpxEeV95XUqEQV/z
	 dWba2REJty7aNMPZvd9Qp0s+t19qx39nouxaC7aOyQDi4gQdsE76u1ASz5BBjPuo7O
	 d3XH7wnod77QHb+bL+nWASGq0iMT8Knn3iNc6FhfdD6ovJB/lIBbH13LgkHLcxVcA2
	 SXkKx+ag/Lzr2L14KoHqK0SZhS9nFlpdA5PSXmR+XmBBk65mNp3Vdw+4keQWEwoCIm
	 H64XCqnLZsYDQzUr7PH73nT8o2NSP5ql6wYrx6gf1Pguyni+nrMRlVp00fnzPZ/1NT
	 1b0lxMUIoA9fw==
Date: Fri, 14 Feb 2025 10:45:21 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm64: Fix compilation error
Message-ID: <Z6-PQVOVLrZqey-u@google.com>
References: <20250214111025.14478-1-leo.yan@arm.com>
 <aa347f0f-ebd3-4744-9053-14dab87d06b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa347f0f-ebd3-4744-9053-14dab87d06b8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_184527_503829_195DC8BA 
X-CRM114-Status: GOOD (  19.48  )
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

On Fri, Feb 14, 2025 at 11:21:52AM +0000, James Clark wrote:
> 
> 
> On 14/02/2025 11:10 am, Leo Yan wrote:
> > Since the commit dc6d2bc2d893 ("perf sample: Make user_regs and
> > intr_regs optional"), the building for Arm64 reports error:
> > 
> > arch/arm64/util/unwind-libdw.c: In function ‘libdw__arch_set_initial_registers’:
> > arch/arm64/util/unwind-libdw.c:11:32: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
> >     11 |  struct regs_dump *user_regs = &ui->sample->user_regs;
> >        |                                ^
> > cc1: all warnings being treated as errors
> > make[6]: *** [/home/niayan01/linux/tools/build/Makefile.build:85: arch/arm64/util/unwind-libdw.o] Error 1
> > make[5]: *** [/home/niayan01/linux/tools/build/Makefile.build:138: util] Error 2
> > arch/arm64/tests/dwarf-unwind.c: In function ‘test__arch_unwind_sample’:
> > arch/arm64/tests/dwarf-unwind.c:48:27: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
> >     48 |  struct regs_dump *regs = &sample->user_regs;
> >        |                           ^
> > 
> > To fix the issue, use the helper perf_sample__user_regs() to retrieve
> > the user_regs.
> > 
> > Fixes: dc6d2bc2d893 ("perf sample: Make user_regs and intr_regs optional")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>

Thanks for the fix, I'll handle other archs too
Namhyung


> > ---
> >   tools/perf/arch/arm64/tests/dwarf-unwind.c | 2 +-
> >   tools/perf/arch/arm64/util/unwind-libdw.c  | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/perf/arch/arm64/tests/dwarf-unwind.c b/tools/perf/arch/arm64/tests/dwarf-unwind.c
> > index b2603d0d3737..440d00f0de14 100644
> > --- a/tools/perf/arch/arm64/tests/dwarf-unwind.c
> > +++ b/tools/perf/arch/arm64/tests/dwarf-unwind.c
> > @@ -45,7 +45,7 @@ static int sample_ustack(struct perf_sample *sample,
> >   int test__arch_unwind_sample(struct perf_sample *sample,
> >   		struct thread *thread)
> >   {
> > -	struct regs_dump *regs = &sample->user_regs;
> > +	struct regs_dump *regs = perf_sample__user_regs(sample);
> >   	u64 *buf;
> >   	buf = calloc(1, sizeof(u64) * PERF_REGS_MAX);
> > diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/arch/arm64/util/unwind-libdw.c
> > index e056d50ab42e..b89b0a7e5ad9 100644
> > --- a/tools/perf/arch/arm64/util/unwind-libdw.c
> > +++ b/tools/perf/arch/arm64/util/unwind-libdw.c
> > @@ -8,7 +8,7 @@
> >   bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> >   {
> >   	struct unwind_info *ui = arg;
> > -	struct regs_dump *user_regs = &ui->sample->user_regs;
> > +	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
> >   	Dwarf_Word dwarf_regs[PERF_REG_ARM64_MAX], dwarf_pc;
> >   #define REG(r) ({						\
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 

