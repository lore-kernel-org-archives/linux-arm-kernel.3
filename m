Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6729C606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MEd7mOmI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r3AP3t6GqHgFMQ1XdVu4Hhyjy6C+AgYC+TMVyHZ5Uy4=; b=MEd7mOmI7LvgfcJjAL4HyR2Xvi
	55l1yKLTx+cokMHUR4Gs6eYLTWXMWdO/f4qXM6XL8OprsD5R63srY4sV4/gv6zeZY4bXLVVGXh5QF
	riWO2f57J46e56Awses6f3DhY6E91K6SVAKovwdMcb4lWxB33z2/lC/y6/1RERrlwfzsiHEyL5PS2
	hxmTYwSWu3c+FLi//1Z6RKJoxGbCtLkb51HY358+KpcsxxOaEFuWhxSni+HTbq+IBdEwpXezPfF8F
	GJDiaq9IS8cRBp/E6oK872IiERYq1O93EBqpnitz+9CHvrrBbWLh1hqOVLMWdeWqlt5JOwgCzCyJy
	eV0MuD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzae-00000009QXe-0ysC;
	Thu, 05 Nov 2026 15:41:24 +0000
Received: from mail-yx1-f51.google.com ([74.125.224.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzaW-00000009QW9-0K4w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:41:20 +0000
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6774639a8a4so2030161d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 07:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893275; x=1794498075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3AP3t6GqHgFMQ1XdVu4Hhyjy6C+AgYC+TMVyHZ5Uy4=;
        b=YOBkFGyrcVJUYTHAC/C1FpsY+JjNqtPMxyAmjPvETfPTgZOm6BAxZfTkbVYA9zm0es
         8hDW/jQzSQ/uPh1LYViOgDvC0RGh7ZjZZNJEKZB68y0pSeI7G4E9x5kLtYuU7Ye3etu4
         ocODjWIX8755OYj9PshGy8f2qyx8MCQLfqxRf3DAR7ZCg8GVwxeyryV5myA6fqgIB7YV
         aBOf2VEDKKbgoOcmaU80u4OJpJl38I02sJllkcxzBtQkIttRtMUBQZJQwmzAyQLfTrhV
         G/65mngsKyzp49sZ4pNdugXfMsfQaUxUsyRvOxRYQru5ZfLIllu3qZci3EXhOGurvMdG
         e2eA==
X-Forwarded-Encrypted: i=1; AKwUvBzNgV+B1xdkhDp2KzLtoSng2OZzupQHRL0tSTlQGysNIln2b+ZBdJkuwRcasPnBb431xU7xvtbranFb9vcQPqDr@lists.infradead.org
X-Gm-Message-State: APuU4Z+4tYN7lljHhQg0kpehJ8n1bsVmMjaLWz/YzSmUSJfWpRzAx3JH
	F++0y+DNLgDaX2ZPYxdcEedGslc5ebloeGm/dFCIasdM4roVQeJgE7Y3
X-Gm-Gg: AYBFou18ZYTWtCA6bWXaJ7TbBSlwLYRtsEsUIsUUOejvOhtOPcMOGLuceyIIK9x5BTz
	rCDXL1b6ggMyn3MnrsBeocgmmz8Zr9Ta/oT9GF03hvQZXgKMnaNRR2a31JGBxFhig8q5k1Vx8LS
	WSMmLe1BZfuwsG0USYztnM2Cvj4o02BtJUWSO6HD2rtRLKQt0ubLMfCI9PJyYe6ARol4R99ev0p
	UYVAVpuMSrq5nBCKE6KuQ3oG/oyDNLJgFbgBzLyUFWr2hFCebfWmyHMkGyUewL35WEB8GA1EZSN
	oAeu79UsrqHBzab4X4MM6UZnHMJZ9RTJ0luwwJNwPi5cd0kzx5ztY23vZZDuHC17fcvkWXuImuX
	FEs34MOBVWtw9//uloOVGW8jSJ3O5NWd7yMg/QmGbCZ+0xfadqxGJnPswqerA93Zv10zo3C5X6B
	L+xe+u7Oq6GwiZIRJplme5t/rYpneLWVzIvOPfFAMe0JHL7XAs5nEGzYHs9SLSikjV6Kp8W4gFz
	Jspf1V+F0ZXn0W2+99fu7gX2/ksJK+KoQnyn93Ye3H/IvE2RWFylVl8KVn7NK3Ad/QujKODU76v
	O8Akzj7FhyIPl1Nz+Ec=
X-Received: by 2002:a05:690e:1698:b0:67b:9051:e334 with SMTP id 956f58d0204a3-67bb304d942mr9266532d50.99.1793893274539;
        Thu, 05 Nov 2026 07:41:14 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:54::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee27bfddsm3766424d50.15.2026.11.05.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:41:14 -0800 (PST)
Date: Thu, 5 Nov 2026 07:41:12 -0800
From: Breno Leitao <leitao@debian.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Subject: Re: [PATCH v2 2/2] arm64: sdei: Preserve the interrupted context's
 exception registers
Message-ID: <auyjSmtuqkXCqMvl@gmail.com>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-3-kirill@shutemov.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105120835.3321912-3-kirill@shutemov.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_074118_503272_523DDAB2 
X-CRM114-Status: GOOD (  19.94  )
X-Spam-Score: 0.6 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:08:34PM +0000, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> An SDEI event is dispatched by firmware regardless of PSTATE.DAIF, so it
> can interrupt the kernel where the exception registers are live:
> 
>  - exception entry, before kernel_entry has saved ELR_EL1/SPSR_EL1 and
>    before the C handler has read ESR_EL1/FAR_EL1;
>  - exception return, after kernel_exit has loaded ELR_EL1/SPSR_EL1 and
>    before the ERET.
> 
> An IRQ or pseudo-NMI cannot arrive there with PSTATE.I set. Firmware
> saves only x0-x17, PC and PSTATE around an SDEI event, so a synchronous
> exception taken by the handler overwrites the interrupted context's
> ELR, SPSR, ESR and FAR. do_sdei_event() only notices that ELR changed,
> and warns.
> 
> The interrupted context then carries on with the handler's state. A
> task interrupted on its way into the kernel can be sent SIGILL for the
> handler's kernel data abort. A task interrupted on its way back to user
> space ERETs to EL1, at the handler's fixup address, with user registers
> loaded.
> 
> With SDEI delivering NMI backtraces, this happens in normal operation.
> The handler runs show_regs(), which reads through possibly-NULL pointers
> with the _nofault() accessors. print_worker_info() faults this way for a
> kworker that is not running a work item, and a single sysrq-l warned
> once per such kworker.
> 
> Save ELR, SPSR, ESR and FAR in __sdei_handler() before
> irqentry_nmi_enter(), which can take an exception too, and restore them
> after irqentry_nmi_exit().
> 
> Once they are restored, a nested exception is harmless if its handler is
> safe in NMI context. That holds for EL1 data aborts on translation,
> permission and access-flag faults, which never take the mmap lock in NMI
> context, and for BRK. Warn once, with the syndrome, about any other
> exception class.
> 
> Fixes: f5df26961853 ("arm64: kernel: Add arch-specific SDEI entry code and CPU masking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Tested-by: Breno Leitao <leitao@debian.org>

Tested on NVIDIA Grace (firmware SDEI) with next-20261104, KASAN + lockdep,
ARM_SDEI_NMI=y: sysrq-l under stress-ng, with a kprobe on show_regs() and
eprobes on irq_disable/irq_enable that fault on purpose.

Without the series the box crashed (a task interrupted in el0t_64_sync
got the handler's BRK, then lockdep/KASAN fallout and a hard lockup)

With it, KPTI off and kpti=1, ~4000 kprobe hits and ~5500 faults in
irqentry_nmi_enter()/exit() produced no warnings or stalls.


