Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A5DC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tuxVMZTH96XP6FIpItXmNlPICI/Q5bWAFAVL7O6iwQ=; b=kVCmatLC+MgBpFBzJ+Vh7Uy9JY
	yWTGmsDXBnTpUMpmMnWaLm8t9zXyo7wIiA8hkEhoGRdv7Ra2Orkei+RPHvBDl/E4q7Wg5DAxcX/yU
	bP5Jq3YTTnFQDsGj/ieMO0L0XPRKzInYbul12G4SGKsx1/aUwj0rnsScRYH3XDd32HgnWFhLkcIpJ
	c+OVaRFl4V3PuA6kpC/4nejaN8n4TshoN9eZUmFrjbnIzKiQ/Y/YFaviHM9mL7TbRNcTWVB569EVV
	A0qhrZm9vefKLCZJbZnghXRArwoyM413iAx/EpwnnDhi7CGAOiY37eAC5tFjRAn2dQ+5A9gRJHkfj
	c2omH6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY44-0000000H6JL-3goV;
	Mon, 24 Aug 2026 17:02:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY41-0000000H6Ib-2BYl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:02:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4BC440B75;
	Mon, 24 Aug 2026 17:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8951F000E9;
	Mon, 24 Aug 2026 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590944;
	bh=0tuxVMZTH96XP6FIpItXmNlPICI/Q5bWAFAVL7O6iwQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=QKHNCGhk2nwOGhuntoAkgT+Z1TfNxCaqfv0DJqeMmQybpXDer+dv1BlG386XWX99T
	 BkylOf9y6Z4Tzx1bskYSDIGeGcp1wAhF48HMa652N/8T9y2BfJ2hsNyjnecRTu3yy+
	 y5UhATyH3lgjBsCkM8RbyUIfXNAedhYKJvMamf9Y7mbyEwSqILoXXD3Wig32ki8KcE
	 ei7uKjZ3BK+q+1oG67GodMDt91daxIHAbXsSRAsieCoXjY3HStm75iDEQfrO5T8PkR
	 4Z74XNMZd38WoQtD1nvg85M4LmGYBrT30Tl9x9f55Om9RFL2nWlocAwgDDoYKWBh+0
	 tgLpfCa3IGNpA==
Content-Type: multipart/mixed; boundary="===============0322628108546578997=="
MIME-Version: 1.0
Message-Id: <4310125e5984331a686a7319ec57a92796571f4b7b1780345652726f717e41c8@mail.kernel.org>
In-Reply-To: <20260824160523.3907021-4-usama.anjum@arm.com>
References: <20260824160523.3907021-4-usama.anjum@arm.com>
Subject: Re: [PATCH 3/7] maccess: Skip setup for zero-sized kernel nofault copies
From: bot+bpf-ci@kernel.org
To: usama.anjum@arm.com,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,akpm@linux-foundation.org,david@kernel.org,ljs@kernel.org,liam@infradead.org,vbabka@kernel.org,rppt@kernel.org,surenb@google.com,mhocko@suse.com,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-mm@kvack.org
Cc: usama.anjum@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 24 Aug 2026 17:02:24 +0000 (UTC)
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

--===============0322628108546578997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> A zero-sized kernel nofault copy does not enter an access loop, but it
> still disables and re-enables page faults.
>
> Zero sizes are valid. BPF probe-read helpers accept them, and KGDB memory
> packets may carry a zero length.
>
> Return before changing page-fault state when there is nothing to copy.
> For reads, keep architecture-specific address validation before the fast
> path so its behavior is unchanged.

This isn't a bug, but would it help to say in the changelog that a later
patch in the series wraps these loops in a bare nofault (TCO) region and
relies on the operation never being empty, rather than framing this purely
as skipping the page-fault state change?

The current description focuses on the mechanical effect (skip
pagefault_disable/enable when there is nothing to copy), but on its own the
change appears to be a no-op: pagefault_disable and pagefault_enable only
increment and decrement current->pagefault_disabled, so a zero-size copy
already returned 0 without touching memory.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/32751368606
--===============0322628108546578997==--

