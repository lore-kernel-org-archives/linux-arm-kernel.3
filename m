Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A8ED167F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz66NQ88dNJPj70+a2nXyn4oglFlwPstRzUy8niGMUM=; b=sOjc/DCF4Vs5+4MHVVILIjANe7
	Hlsg3soFktEKPzlw73KaaPguNzjwx/ktyUPEgX7xXuCR5e4LR+gxzA7qOjR1sAeG2jLG4IGJtMKtT
	U+A832R9sov6GIlNJOOs2ml4r27IrqZcfJOwskoq+ueih4UEUE9JJFZvaqAUtTdVTgW7NSvNFchRx
	aplArRg18sOSSZHmRNSBFVH04rMPdSZmkm73dX4uJS8Xdxtjxiixnx/YO2kaPApRtLv3Zij2IeHuN
	V87y4vfuMYMuPDbhdBJNEPsKM0VyW2ZneE8kUFLxD3adhx3QgOyUCqCst5blTm7mAfKWF67Xdgik7
	QzFgpjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9IJ-000000024wh-1bL7;
	Fri, 09 Jan 2026 10:00:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9IH-000000024wP-3wGS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E49960178;
	Fri,  9 Jan 2026 10:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6C6C4CEF1;
	Fri,  9 Jan 2026 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767952832;
	bh=KjC61mIOqODHcylutLdggLP0FRktDFpqjmw1rF/3wLQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=cBTiOfz2nKGJ1BiFzFsVSwshzZVGKSQpV0SPoRg78s5JoHxLCetExjJrud9BiaZ6y
	 fZ8BOi8YqreEKSXKXHs4x6c3VPu8p6xMZyCijHidoH1IWzhlELF/w1p2fnMu3TskW5
	 gweOnNcHnqaUddxYgc2nn+BS4JDIu75TorsiR/tN/fzpMOjr+HcBk8QTdLz1Wc6xex
	 Sssd/VJayyIymb5tT8C/e++XBGTqPXtJejxlMf9LdL5JEn9mgQudffkssLmu1oS/7D
	 PodrG/THK7RMBrVe7qVdxH+5ORzoyA0gsoODve4+DorCRETDpWHbfg1KD602c1utnD
	 29AD3ffs4yo3A==
Content-Type: multipart/mixed; boundary="===============8986777221254853529=="
MIME-Version: 1.0
Message-Id: <5c0412b685d29327c8879e4b8a7cbebbe2398ac0d3a7d32284d69e1b9f8048e2@mail.kernel.org>
In-Reply-To: <20260109093454.389295-1-jolsa@kernel.org>
References: <20260109093454.389295-1-jolsa@kernel.org>
Subject: Re: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
From: bot+bpf-ci@kernel.org
To: jolsa@kernel.org,mhiramat@kernel.org,rostedt@goodmis.org,will@kernel.org
Cc: mahe.tardy@gmail.com,peterz@infradead.org,bpf@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,x86@kernel.org,yhs@fb.com,songliubraving@fb.com,andrii@kernel.org,mark.rutland@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  9 Jan 2026 10:00:32 +0000 (UTC)
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

--===============8986777221254853529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
> index 15627ceea9bc..f9a7c009cdae 100644
> --- a/include/linux/ftrace_regs.h
> +++ b/include/linux/ftrace_regs.h
> @@ -33,6 +33,31 @@ struct ftrace_regs;

[ ... ]

> +#else
> +
> +/*
> + * ftrace_partial_regs_update - update the original ftrace_regs from regs
> + * @fregs: The ftrace_regs to update from @regs
> + * @regs: The partial regs from ftrace_partial_regs() that was updated

[ ... ]

> + */
> +static __always_inline void
> +ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
> +{
> +	ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
> +	ftrace_regs_set_return_value(fregs, regs_return_value(regs));
                                    ^^^^^

Should the fregs parameter be non-const here? On architectures with
HAVE_ARCH_FTRACE_REGS (arm64, riscv), the setter functions expect a
non-const pointer:

  ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs, ...)
  ftrace_regs_set_return_value(struct ftrace_regs *fregs, ...)

Passing the const-qualified fregs to these functions discards the const
qualifier, which may cause compiler warnings with -Werror or undefined
behavior since the setters do modify the ftrace_regs structure.

> +}
> +

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20847954035

--===============8986777221254853529==--

