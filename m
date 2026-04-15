Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3377EF41998
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRHac6+7OjGhQ4pPHk0arofb9sWAo1B2RbgwlWeamq0=; b=XQ1Qn6kSDMqm9EH+aOH5D9hgQR
	elwvlWYq3d3h05lr7N8nkyBgQjCSYqAJJEtYveE5z6cqVKFwji6n7ivVut11r5DIfqQ8XW2wp9bwo
	qXu5L/mQkncUfvlshY/RK2jwFt6KpcujfFuBcKVkoK0m7styaes2/gZX0xhelYq9dwSQfUSHWU45v
	d3qNYzu8uDF55ko7eUgCoM0WimXqpXTKlktHa1V32fAP1Oks7FGS7++Sumq6AuRGAH0+T1rw45K8p
	+fxnZCCBFPWVriMxqJzF+ULzG+kDxB47XlMjvkGJPuF0y2dkkmFRgflKpALmEsNupK/URsgfgWQN3
	wnwHW0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzVw-000000018Kj-08np;
	Wed, 15 Apr 2026 12:38:40 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzVt-000000018Jd-2bkM;
	Wed, 15 Apr 2026 12:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eRHac6+7OjGhQ4pPHk0arofb9sWAo1B2RbgwlWeamq0=; b=VXD/xn0hXIMU1iK3HIIAIyKapC
	OMlDpvUPFyN1cbc5rT+/MmehfjNFi2HHrnkB/3Jg7DeHi62tq31iZC+exinlj8mXgnvccnNw6OT9Z
	O9wYYry02IDoO1b/ysgwAjt5tdzY2ZbadG0m6aQKFgi9PIGxJU58VXorrpiQV6Mua+WAsI6j+s2vp
	0oXWPFE1B0dLlYgZPUZxCf7u6HRD8yBBdJQPpDyRGYflPiz30oo8X4I6UL5iavX3ijMHYlUNKP4nm
	iukmmtUTOM2hXYWgUv0msL8nchlFPgROY32FP/a4isRqWC4dm/1arhgNSsOpPz68yRXI9eI7u4tMd
	0RxlCEBQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCzVQ-00Dq5O-18;
	Wed, 15 Apr 2026 12:38:08 +0000
Date: Wed, 15 Apr 2026 05:38:01 -0700
From: Breno Leitao <leitao@debian.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/2] bpf, arm64: Remove redundant
 bpf_flush_icache() after pack allocator finalize
Message-ID: <ad-GmdGbXrZAi7WA@gmail.com>
References: <20260413191111.3426023-1-puranjay@kernel.org>
 <20260413191111.3426023-2-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413191111.3426023-2-puranjay@kernel.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_053837_664234_32D7DE14 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 13, 2026 at 12:11:08PM -0700, Puranjay Mohan wrote:
> bpf_flush_icache() calls flush_icache_range() to clean the data cache
> and invalidate the instruction cache for the JITed code region. However,
> since commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
> management"), this flush is redundant.
> 
> bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
> region via bpf_arch_text_copy() -> aarch64_insn_copy() -> __text_poke(),
> and __text_poke() already calls flush_icache_range() on the written
> range. The subsequent bpf_flush_icache() repeats the same cache
> maintenance on an overlapping range, including an unnecessary second
> synchronous IPI to all CPUs via kick_all_cpus_sync().
> 
> Remove the redundant bpf_flush_icache() call and its now-unused
> definition.
> 
> Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management")
> Acked-by: Song Liu <song@kernel.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Acked-by: Breno Leitao <leitao@debian.org>

