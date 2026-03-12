Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAFE106ACEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUO+pMmTcPibtGkBh88N+ypMpXVO6Biu0tT0Jaz5D9Y=; b=o46g/gv7sep0v629sODbBTYB0c
	xSUBp9Fu390zkPa0hpNanrNl5MEDhFduU8kbjrWiVUsHWmoOUST9kir14G6HOezATamrR8D4NqyQV
	oYHED5euK87E7UXkboUE7q7LfCPy3SLlga+10joJxd539TO6XWrluKhctKZZVSBVQJon0txbJnX8K
	JMsRGtQxQc0w9UDft3CmaQR+97rMW4V4mPL+v6A52jqnJkFGGLRGIjjOrXOeLGu1o2GaUw3RGGM+U
	3AY+daCGe/GWBVGHtKjU0dsjj+i4uEgN/vj1V8UJvGJmtZBP7mKCxQfM2LfO83qZksnA0mDK05bYR
	DWFOngKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oCq-0000000Fak8-3dGI;
	Thu, 12 Mar 2026 22:08:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oCp-0000000FajV-2wo5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 22:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5DEF60053;
	Thu, 12 Mar 2026 22:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE226C4CEF7;
	Thu, 12 Mar 2026 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773353314;
	bh=TVqWbgjpZje8r40f9joOR90Fu8pz5GOFfapDTXbFcCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lv9mXKlOHaf5VcCuSm6v7BkVfbltIzxhOFx1iohg0A2COIrjXOE4y9NZdGKj9D8Fg
	 /yoxraizcGTVG6KmlpmcDFtaRjnP0dAAEve+f9CNOSgliMTdE2Fh8m+34/4hhLv44v
	 qAFG6CtglTDgGZGOOjCHcNRfQ4EhPSyoZtZfzeF0+X74pCD5T5G+I4/BublthsCMOc
	 I3EUhhPd/t6l6y11STfSJK0UTfKs9s4ZvZ3U8lwUqYXoA6giD0wR+dvglT+EvCCFKz
	 xUK3OHUh9YAs7xeqEM0HL20p0dbolcfWiSwT8DAf/QjVPkcLdgEptn31/K2ObFxqDY
	 0oTbp4ddHnqbg==
Date: Thu, 12 Mar 2026 15:08:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] KVM: arm64: fix include path for ring
 buffer implementation
Message-ID: <20260312220829.GA1068615@ax162>
References: <20260312123601.625063-1-arnd@kernel.org>
 <177333027972.824271.5682048908167993643.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177333027972.824271.5682048908167993643.b4-ty@kernel.org>
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

On Thu, Mar 12, 2026 at 03:45:26PM +0000, Marc Zyngier wrote:
> Applied to next, thanks!
> 
> [2/3] tracing: add more symbols to whitelist
>       commit: 7e4b6c94300e355a72670c5b896ccc26ac312c63

This dropped the SPDX indentifier line in kernel/trace/Makefile.

Cheers,
Nathan

