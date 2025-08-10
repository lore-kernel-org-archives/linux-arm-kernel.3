Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B58C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgPdcK0EnBU4WxmTrlNAR/bi7QvTrLJTPzM2cynOZAY=; b=oJBERpIKm/OeleUYojKXEXV49T
	IAogx8RgTQlZosVv5wNMAyTvgf9aSx3Bn2dnXMioZ/MRGYpPacQyK4B6tTva5Og/WmdaCyMkkAHK1
	Y16VVo2e+Damwx4tBN8OasKpuVdvUqds4TWduH7sBjgPUdwzionxhBkOZHn+Kce+Ycn6i7qvZVnYw
	QZf7z8AZ4kW4l7RsHT3cdRVt0rKXBRfWF0vTJHoovB23a1+FKS0ZD7TlJe54LQVHK+owzaZulzxo2
	WnK3MYgODXRSPNaBl0FJlVDYMW5mn+tgOjfYKswUxhOylrCHrjdqeXiCra9QIBlW3KnPpCp6EEICd
	1Ecfah5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDmu-000000063Qq-1I5i;
	Sun, 10 Aug 2025 21:41:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDL8-00000005zjW-1Jyn;
	Sun, 10 Aug 2025 21:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3AFAA568C8;
	Sun, 10 Aug 2025 21:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51578C4CEEB;
	Sun, 10 Aug 2025 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860345;
	bh=xViFvDPQc1cyLyFxFjlh0Pd2JS6XyL/kGzPxiW6LrnY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qb9avz3T8nhcxxOzyZ5dZfHWwvEPJqQa5COovnRKRZPOm7d94jIfh7nWDVYnT2j6I
	 fzeOi40lOQz6w3U7TRiS0JBezpPlGv/FonX2w2kF1IBqMcyJkTPG6ZrZVCUbKw/iVb
	 L+nDJ5s01P9/LfLIHMjn+PKSUYHatPrSjP9bSt+YRmUOEgXkgd/yZESB/L+WkdK6UW
	 AyZteBHDWYI8dss2mv6G4xdNbv+jdrOBlFuInQYbyLMttKFyEs1aFS/QcjJZlT5O+U
	 s7gSjsYYOsgBDUOV/HzZG0sRUOkln3An15YbiNRYW3jXIiONIyYpNy4zN9sAU62/tq
	 2jWggxKDCj0ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BBC39D0C2B;
	Sun, 10 Aug 2025 21:12:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 00/22] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486035774.1221929.10309183570543138134.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:37 +0000
References: <cover.1747046848.git.namcao@linutronix.de>
In-Reply-To: <cover.1747046848.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, pmladek@suse.com, senozhatsky@chromium.org,
 mingo@redhat.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141226_423402_31C8CCB1 
X-CRM114-Status: UNSURE (   8.98  )
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

On Mon, 12 May 2025 12:50:43 +0200 you wrote:
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
  - [v8,18/22] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



