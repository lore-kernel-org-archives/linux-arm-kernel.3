Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F0CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhilvN5aSWTGwC57M5NdEtZmpsttzMJLF7Z7dKXPBic=; b=Xos1RlMh5/FpACOBiOGS/H+HLb
	K8xVlB9vFcKhTguXvA4dhqmksBbDurWtKP6nTcnv57cYneOSIeEmntTGup9BRI2Q7tyIKAR7uGq6d
	oQXkXl2l7bxqTW5X08M0NbOUrDMbwwaYq+VL9vVsDCA6ftEj+jjOH0h4BnBa1hyQTZrZi7S0cVvtm
	n0bBR+53HuoNziUczI01BxC8vumYcqEZKW+sUOZlUJP6O61F7z7hZ0NvlpXBsJf1XzHeR0J9JvOkW
	eCiQkG2GiNjPcoQHlw0/PIhGZN/AM9Kh5DrsnZkk8/38Pax/ur2msJJTzan3Mg+fDAXrBT9GGKYy6
	80XWDMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVjc-000000037Q9-36dP;
	Mon, 08 Jun 2026 08:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVjb-000000037Pz-3D7U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2291D6001D;
	Mon,  8 Jun 2026 08:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7821F00893;
	Mon,  8 Jun 2026 08:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908806;
	bh=QhilvN5aSWTGwC57M5NdEtZmpsttzMJLF7Z7dKXPBic=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=VVKylabzMp3qTG1Y8XpYVm2td1ZJAiNomj2Dsel3X6DlStYttHKw6UziREvzu6bvE
	 qeTsW+6f5YjsIdtXMybXSWiJUMBzhBzid2B0KwytadnWTrnPmVkRVpnzZXn5rCSj6z
	 +2F/nf1YIDde22M+boo8HcElj18/w33+swdiixEwKVdUfrpfTs31gip6NZLQIxoRw9
	 wY0NMamP5C5iWi0IXDxyxvB93QoQKp4GXDCxRB2crVs/NkaQm3JZvzT8Qec1NPel9D
	 jyw4HritvyVZFaC8AdWv/C8M5QM9xpog4nTUrxEqyjTn/oFABVn6amVkQuABfoJG01
	 JmhbKeRG1ndrg==
Content-Type: multipart/mixed; boundary="===============1553892507643223952=="
MIME-Version: 1.0
Message-Id: <7d2189443a0181a123e53e5ea93f3a905b1cb4d71d5d6bdfa27a77ed4be65448@mail.kernel.org>
In-Reply-To: <20260608080440.127491-2-ankur.a.arora@oracle.com>
References: <20260608080440.127491-2-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v12 01/15] asm-generic: barrier: Add smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  8 Jun 2026 08:53:25 +0000 (UTC)
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

--===============1553892507643223952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..c56df9513a08 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -273,6 +273,75 @@ do {									\

[ ... ]

> +#ifndef smp_cond_load_relaxed_timeout
> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> +				      time_expr_ns, timeout_ns)		\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*(ptr)) VAL;				\
> +	u32 __count = 0, __spin = SMP_TIMEOUT_POLL_COUNT;		\
> +	s64 __timeout = (s64)timeout_ns;				\
> +	s64 __time_now, __time_end = 0;					\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		cpu_poll_relax(__PTR, VAL, (u64)__timeout);		\

__timeout is held as a signed s64 but is cast to u64 here.  On the first
iterations __timeout still holds the raw timeout_ns argument before any
time-check has run.  If a caller passes a negative or already-expired
timeout_ns, the (u64) cast turns it into a value close to U64_MAX.

This is harmless while cpu_poll_relax() ignores its timeout argument and
falls back to cpu_relax().  Would it misbehave on an architecture whose
cpu_poll_relax() consumes the value, such as an arm64 WFET variant that
uses it as an event-stream deadline?

David Laight raised this on v11
(https://lore.kernel.org/lkml/20260508093206.389d9af2@pumpkin/):

  Yes, the code is ok if cpu_poll_relax() ignores the timeout. But for
  WFE it is all broken. ... if you assume/require that the converted
  time is either 0 or greater than 200 then it can be used as the
  initialiser for __n.

The Sashiko bot repeated the same concern as a medium finding on v12.
The v12 cover note opts to document the valid range rather than clamp at
runtime, but the code still passes (u64)__timeout unguarded, so would it
be worth converting timeout_ns into an absolute end-time (or 0 when WFE
is unused) before it reaches cpu_poll_relax()?

> +		if (++__count < __spin)					\
> +			continue;					\
> +		__time_now = (s64)(time_expr_ns);			\
> +		if (unlikely(__time_end == 0))				\
> +			__time_end = __time_now + __timeout;		\
> +		__timeout = __time_end - __time_now;			\
> +		if (__time_now <= 0 || __timeout <= 0) {		\
> +			VAL = READ_ONCE(*__PTR);			\
> +			break;						\
> +		}							\
> +		__count = 0;						\
> +	}								\
> +	(typeof(*(ptr)))VAL;						\
> +})
> +#endif


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/27125050324
--===============1553892507643223952==--

