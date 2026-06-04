Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7781CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 21:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVPQ3M4nO2cjo4ZvlqJcXIehT4M5f0oVzasV566Wey4=; b=IKkZ2jHBmtMmJ3O0rJ7GtBLeXL
	7EVGa/JSJFMZw6Eq5ZumASfm03eLyi0LFzUQa+3DaFMwUXIlCcQpPY0WA6heILUMsC6tNcTIVZ5Im
	sXgSa675GbAu98HSpsHlchYwdKhtuqA/w152L9xTS0SILUhlAUwkmSdVJ6XwCbHKAm1gtQkVEyYoV
	kzqCVh2RCy4fQ39N8PffLNFvDe+cLyr+kN63n72IVs3v35GMpmlpQbtgqn8TK+mVyTvQBft+PApil
	belcjpbKTj17EZzeQ6DMv73H8dooeuWX63479eVayTnaN1ZYOldyKiFNeCa2MEa+UudfENeqADxVj
	Nh646qTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFsr-0000000HMq7-3gj9;
	Thu, 04 Jun 2026 21:45:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFsp-0000000HMq0-46P0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 21:45:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC88B6001A;
	Thu,  4 Jun 2026 21:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076631F00893;
	Thu,  4 Jun 2026 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780609546;
	bh=eVPQ3M4nO2cjo4ZvlqJcXIehT4M5f0oVzasV566Wey4=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=RjNt1ZflgPOa3QCB1uhADhvuCHHeOhF9pb550vZ9YhQF47A5HGMNfdXAD6wxT6o+s
	 p4yLBkWFUmqeLxAf9JXAQbeSadGip4m6WTwSx2j06mVZMs9pomJwf6IfpxpYiCHg21
	 IOGpNWMEzRQC8XyjgcyV0q3vxkS6BIv8fYcuoXvsYbCAXYN89OK5WhQzDzXCOs+g4Q
	 xwXWWiO9by1OWL2iRaX38Y/NQ00OAFPcya0uwNOVdJwcJrhNU+tTEDOVJ1emi5GEqm
	 zGBt9qCmETG8CPbSSquApDhNk7saGl8cVIPS2ZUL4J0j3LCWkl964PCyneEPHWJ89M
	 XFYcOKm3Ai2jw==
Content-Type: multipart/mixed; boundary="===============3493038701439416165=="
MIME-Version: 1.0
Message-Id: <8642178be3be8efc7f19ac4a9aa37e699f2baa82cab200909b99997068c6ae7b@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
Subject: Re: [PATCH bpf-next v2 8/8] selftests/bpf: add tests to validate KASAN on JIT programs
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,john.fastabend@gmail.com,tglx@kernel.org,mingo@redhat.com,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,hpa@zytor.com,shuah@kernel.org,mcoquelin.stm32@gmail.com,alexandre.torgue@foss.st.com,ihor.solodrai@linux.dev
Cc: ebpf@linuxfoundation.org,bastien.curutchet@bootlin.com,thomas.petazzoni@bootlin.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,linux-stm32@st-md-mailman.stormreply.com,linux-arm-kernel@lists.infradead.org,alexis.lothore@bootlin.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:45:46 +0000 (UTC)
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

--===============3493038701439416165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/tools/testing/selftests/bpf/prog_tests/kasan.c b/tools/testing/selftests/bpf/prog_tests/kasan.c
> new file mode 100644
> index 000000000000..0000000000000
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/kasan.c
> @@ -0,0 +1,356 @@

[ ... ]

> +	ctx->klog_fd = open_kernel_logs();
> +	if (!ASSERT_OK_FD(ctx->klog_fd, "open kernel logs"))
> +		goto destroy;

[ ... ]

> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		test = &tests[i];
> +		run_subtest(ctx, test);
> +	}

The Sashiko AI review on the RFC v1 8/8 posting raised a concern here that
does not seem to have been addressed in v2:

  https://lore.kernel.org/bpf/20260425065049.BEC63C2BCB0@smtp.kernel.org

The original question was:

  KASAN operates in single-shot mode by default. After the first subtest
  triggers a report, will subsequent reports be suppressed, causing the
  remaining subtests to fail? Also, since BPF CI runs with panic_on_warn=1,
  will the first KASAN splat invoke check_panic_on_warn() and immediately
  panic the CI runner?

KASAN runs in single-shot mode by default. mm/kasan/report.c suppresses
reports after the first one unless kasan_multi_shot is set.

This loop runs roughly 50 subtests, and each one expects a fresh KASAN
report emitted via the JIT-inserted __asan_load/__asan_store calls that go
through kasan_report().

Under default single-shot KASAN, would the subtests after the first one see
no report and fail the positive assertions?

Separately, BPF CI runs with panic_on_warn=1 (config.ppc64el still sets
panic_on_warn=1). Would the first KASAN splat reach check_panic_on_warn()
and panic the runner?

Nothing in v2 appears to enable kasan_multi_shot or guard against
panic_on_warn. Was this intended to be handled somewhere?

> diff --git a/tools/testing/selftests/bpf/progs/kasan.c b/tools/testing/selftests/bpf/progs/kasan.c
> new file mode 100644
> index 000000000000..670318a956a4
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/kasan.c
> @@ -0,0 +1,382 @@

[ ... ]

> +SEC("tcx/ingress")
> +int stx_on_stack(struct __sk_buff *skb)
> +{
> +	struct kasan_write_val val;
> +
> +	bpf_kfunc_kasan_poison(&val, sizeof(struct kasan_write_val));
> +	switch (access_size) {
> +	case 1:
> +		val.data_1 = access_size;
> +		break;
> +	case 2:
> +		val.data_2 = access_size;
> +		break;
> +	case 4:
> +		val.data_4 = access_size;
> +		break;
> +	case 8:
> +		val.data_8 = access_size;
> +		break;
> +	}
> +	bpf_kfunc_kasan_poison(&val, sizeof(struct kasan_write_val));

This isn't a bug, but should this second call be
bpf_kfunc_kasan_unpoison() rather than bpf_kfunc_kasan_poison()?

Every other program in this file (st_on_stack, st_not_on_stack, ldx_*,
simple_atomic_*, load_acquire_*, store_release_*) calls
bpf_kfunc_kasan_unpoison() after the access, and stx_not_on_stack below
repeats the same poison-twice pattern.

> +	return 0;
> +}

[ ... ]

> +SEC("tcx/ingress")
> +int stx_not_on_stack(struct __sk_buff *skb)
> +{

[ ... ]

> +	bpf_kfunc_kasan_poison(val, sizeof(struct kasan_write_val));
> +	switch (access_size) {
> +	case 1:
> +		val->data_1 = access_size;
> +		break;

[ ... ]

> +	}
> +	bpf_kfunc_kasan_poison(val, sizeof(struct kasan_write_val));

Same question here as in stx_on_stack: the second call is
bpf_kfunc_kasan_poison() where the other programs use
bpf_kfunc_kasan_unpoison().

The intended store still happens while the memory is poisoned, so the
expected KASAN report is still generated and the positive assertion still
passes. The effect is that the leftover poison stays on the test_map slab
value (and on the stack region for stx_on_stack) until the next subtest
re-poisons and unpoisons the same region. Was poisoning a second time here
intentional?

> +	return 0;
> +}

---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============3493038701439416165==--

