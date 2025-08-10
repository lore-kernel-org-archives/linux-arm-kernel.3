Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42047C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h68h73airkrs+kAVvkEX0IMRQ2gaMw8iuKT3JUO0Bw=; b=vLJPYNLqyxbFzoYkf7PGegQ1Vj
	8fPHaU51RHgN1Oeqn8b5x3oGWAlMUMe5XEfkltSAVw8Me43PIRzzFdoGCuzORtarYZnMyothZiE+9
	XPFqjpKHiP6koW7e5ki0Sh2CXRbBK2ZhR6MClK9rwL2TnJos1LLpkZGQIwbSFY+bO8ms7mnketATf
	jq1ZknNkpRG8Pa20mMeOeyQCVH8eDi9ZSGz0VtNE38NXvtZlvUYpuRZE3ZimdAukzaL/BMS1vyFWS
	lgaoaRI3oJasymEexYh1PqDtF2BEQljdNdACIC6vQ6GUWX+5pONe8vJF27/rRz+fzPP62ktagCSuM
	vk18+8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDfG-000000062i8-2Lna;
	Sun, 10 Aug 2025 21:33:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDL3-00000005zff-2787;
	Sun, 10 Aug 2025 21:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4066243ABD;
	Sun, 10 Aug 2025 21:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214D0C4CEEB;
	Sun, 10 Aug 2025 21:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860341;
	bh=cCogjkeCTWy7QuKE3sUoaYKqn8csK/aq59mUdEBQkG4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cTepRrXBwPr6Tliwxw3HULS5RIv6fc5lJ7zvK6ht8eNz64zDwaKYCWGTG+GdFAFNJ
	 GDeXnGy4bI1xc86e3XvRxMVp5CIT0zYH1ra24f4Xi+6OF1XeC+H59KkC3ZGig77T1A
	 fbd449HXQk8EoqkfeCfkdDT3EDYN3xA2K9CzrdsB1MRQOx26qAPxEcu7/ZUEII/tc2
	 euODO9EogWmI4ocrhXNOwCiNSMv52QpXGymUH6cV2cbSkAx9Cj8AfhFfjnkZTlAO0p
	 cztfqiY0xu7nzIlM3bbxzLEG9HPfQi0vBj6Xc4p+rvnsuN7dA9PGS+/l7qisGaVLs4
	 e6ur9KzIgXjlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC9839D0C2B;
	Sun, 10 Aug 2025 21:12:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 00/23] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486035349.1221929.9634317090323117771.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:33 +0000
References: <cover.1745926331.git.namcao@linutronix.de>
In-Reply-To: <cover.1745926331.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, pmladek@suse.com, senozhatsky@chromium.org,
 mingo@redhat.com, boqun.feng@gmail.com, longman@redhat.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
 catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141221_564929_DD49563F 
X-CRM114-Status: UNSURE (   8.88  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Tue, 29 Apr 2025 14:00:45 +0200 you wrote:
> Real-time applications may have design flaws causing them to have
> unexpected latency. For example, the applications may raise page faults, or
> may be blocked trying to take a mutex without priority inheritance.
> 
> However, while attempting to implement DA monitors for these real-time
> rules, deterministic automaton is found to be inappropriate as the
> specification language. The automaton is complicated, hard to understand,
> and error-prone.
> 
> [...]

Here is the summary with links:
  - [v5,18/23] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



