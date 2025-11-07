Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85129CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGypl2/kaF+KoKL6FQ0VGpL6vtJo8PDjL27EA1zIxso=; b=KEgml/rA1Cg5lMf04F5ytHFacI
	WOk9xSQ08aS1azcg31tKzaAx3WWv80y4+ZwkqQ/ZPOCQRr3QAWg72orF/a8d/hGcC94vXPhuNmV2W
	tMTNBbLI4pRlO3ehP3Qfu+opKgVyc126a/h6ynqhtrm8MSLbY9xWnf3cPl9HFZYYTok1Mzs4Tlfh4
	jZieUDAJwfECKbo6PoRzqoQ20WWJqVZCcIQwAUct18IXJftlEFEhXoTRTWWnaJNP3maoDSL404CiJ
	gFlIDXmEVmXp1KytxE8hQJvKGkKW3sJIrBvilPERn3TpJ+OeriOWz5s4qbUiR3wj90FVMa3CmXw90
	lpqvNHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTSW-000000012JL-06Xz;
	Fri, 07 Nov 2025 20:53:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTST-000000012IL-3yFv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 20:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F01E618E0;
	Fri,  7 Nov 2025 20:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA43BC116C6;
	Fri,  7 Nov 2025 20:53:18 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	ardb@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	leitao@debian.org,
	mark.rutland@arm.com,
	rostedt@goodmis.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq stack
Date: Fri,  7 Nov 2025 20:53:13 +0000
Message-ID: <176254876744.3846522.7990642471970534019.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251105074259.209131-1-ryotkkr98@gmail.com>
References: <20251105074259.209131-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 05 Nov 2025 16:42:59 +0900, Ryo Takakura wrote:
> For those architectures with HAVE_SOFTIRQ_ON_OWN_STACK use
> their dedicated softirq stack when !PREEMPT_RT. This condition
> is ensured by SOFTIRQ_ON_OWN_STACK.
> 
> Let arm64 use SOFTIRQ_ON_OWN_STACK as well to select its
> usage of the stack.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq stack
      https://git.kernel.org/arm64/c/d3b570eba7bf

-- 
Catalin


