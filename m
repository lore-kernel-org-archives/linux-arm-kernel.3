Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0A1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw0YEWuasSELzyN3iJrE8ZYwT4ynNuVYIAHj0t2PlKA=; b=yoxrWLpTYMSxKmHtjADVG50uyn
	Us2SfP20mNN0+md9KZWqBrZGEfphcgACfikN9WWlQj6p4eKcAbKLOTKtHNywsgEWUuKyF5jPgc/Aj
	uksPg57Fe1SL43rJm8ogXSWFCG1Azlyau7tXkV7oJ3p/uwm8xe1FbO+kV0BH03rOrvBdkpSikFlQO
	hFOJ6My5IY7BLJveffDIlCW/K9cToWYIZvHr1FZGnVTidZFVFBqr2oWGlDmSQ10Wy14Nstk24P2x0
	qKqWQvH8K7cFXry4o8v8DlfDtqz0tSH5lgynIC+FQS3tpRPFSK/I6lk4kJ8HIQDaRkQ4bq9nmoWr8
	E7SjUw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxbC-00000003p2O-0qna;
	Thu, 09 Jul 2026 22:52:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxbB-00000003p2A-1l5T;
	Thu, 09 Jul 2026 22:52:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E09E443D8F;
	Thu,  9 Jul 2026 22:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791EE1F000E9;
	Thu,  9 Jul 2026 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783637524;
	bh=Hw0YEWuasSELzyN3iJrE8ZYwT4ynNuVYIAHj0t2PlKA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=casgykThI4O4unGWnXTN9WG4KF/VKUV9GE6wYwIRge1Tt+l0NfI/WlVJnsZzjY+Dn
	 FPytoxw9GkCKjWGqUuHcEuDMu38yUmPcrSFXSAYAG08vHsPut/iQvlgqLzQeRpqunK
	 SlYYhv7OobZIYv4bhXb/mK9KVFa9Ff/2fMi9UEXHWUSzBlq1xGLr0LpXT5uqy5Ap73
	 WyILKIFInr0hVE29AWhzb1PjGfL0WBJmPtIctAzxitq98MJ/5Cg/lHePzfoxYtyZtI
	 sCf+/tG8zIvS8yNKLqRZ0VImJ4H+4D7g0gp0P2dE6i/524P30v40jS/HNxRPNe2Akd
	 twoEoZCkL4JWA==
Content-Type: multipart/mixed; boundary="===============2104876237906351994=="
MIME-Version: 1.0
Message-Id: <de3ebfe684f280473617b560a9dcf501df07833f835a08eb6e75720cd03662b4@mail.kernel.org>
In-Reply-To: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-1-5ac5a2d6797f@linux.intel.com>
References: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-1-5ac5a2d6797f@linux.intel.com>
Subject: Re: [PATCH 7.1.y 1/6] bpf: Support for hardening against JIT spraying
From: bot+bpf-ci@kernel.org
To: pawan.kumar.gupta@linux.intel.com,stable@vger.kernel.org,gregkh@linuxfoundation.org,sashal@kernel.org
Cc: bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,loongarch@lists.linux.dev,linuxppc-dev@lists.ozlabs.org,linux-riscv@lists.infradead.org,x86@kernel.org,ast@kernel.org,daniel@iogearbox.net,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  9 Jul 2026 22:52:04 +0000 (UTC)
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

--===============2104876237906351994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> commit 96cce16e26dd02a8678f1e87f88a4b5cdb63b995 upstream.
> The BPF JIT allocator packs many small programs into larger executable
> allocations and reuses space within those allocations as programs are
> loaded and freed. When fresh code is written into space that a previous
> program occupied, an indirect jump into the new program can reuse a branch
> prediction left behind by the old one.
> Flush the indirect branch predictors before reusing JIT memory so that
> indirect jumps into a newly written program don't reuse predictions from an
> old program that occupied the same space.
> Introduce bpf_arch_pred_flush_enabled static key and bpf_arch_pred_flush
> static call for flushing the branch predictors on JIT memory reuse.
> Architectures that need a flush, can update it to a predictor flush
> function. By default, its a NOP and does not emit any CALL.
> Allocations larger than a pack are not covered by this flush. That is safe
> because cBPF programs (the unprivileged attack surface) are bounded well
> below a pack size. Issue a warning if this assumption is ever violated
> while the flush is active.
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Acked-by: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>

The reuse path this patch hardens (bpf_prog_pack_alloc() finding a free
area within a pack, and the size > BPF_PROG_PACK_SIZE branch) comes from
the pack allocator that first packed many programs into shared executable
allocations and reused freed space within a pack.

Should this carry a Fixes: tag pointing at that commit?

  Fixes: 57631054fae6 ("bpf: Introduce bpf_prog_pack allocator")


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/29054648899
--===============2104876237906351994==--

