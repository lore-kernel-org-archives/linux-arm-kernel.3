Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E588EE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luYbbdZNCAXl/IP2EISod9yvpOfM235A0wCO9dfQi8c=; b=zUKnKpdha4WG1AjOyNokeC2AQx
	2uk6/Q8ofQmnVCsTujE/gs9DSgRR0Bnf8L7Ou8gpwv3ZugsY/5EirMQXGbTAqNsBAAoCijYNaPREk
	IC7Zd1b60F0jIunLBc/rYgDUZoPcS4SWmGb+DDYcR+1ZIfZRS1OdDtE7NXJPb6P2a66HBGGJCfTVl
	1ra3FpqAOyDXnQJFmSgoHOUh0b371gj0aFYVOU25DlpxfL7NdyH3w04oAl6u1wHLVk+E7qHmJJ8Lt
	DPQgLMbawaeWemSA/lIdwmSGCAEWmfmoFqSqarD0fiU+sFZpkSYSlKLMDSYr74CAdRvVEfkvH1B2d
	jdiraYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS2n-00000007gTc-1rxx;
	Wed, 08 Jan 2025 09:08:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS0Q-00000007ff0-2x5I
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Jan 2025 09:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=luYbbdZNCAXl/IP2EISod9yvpOfM235A0wCO9dfQi8c=; b=tMvp8CYW0r3s5YEZEfs9ZasSgk
	Qo57v5YSAzAyRPGQvkcae+e4yhv17k7iWCOma3aC4t0q+gpZI4HC97wIfDJXV4eRSTylEZ2cjlsve
	0PQeRQ/8jSrIe38jqt71jtJta0C90AbCSTgGCuPgs3OH8zmjjPf5LedWaO1DMZB60GYYYiO5ybMLM
	4J/Lu+GuXtyDpqq6DmQ1OnQw9SGxwDC2oxtg6Uakg0d8TaiSsDtLPjby4oVBi5zot9msbeBZ3vJfZ
	AoShypkkATg48xMpYCMzWcjUjQeGlY9nl3qwzW0dskPD+QwGsyx9zUTcq4k4E51GBXXprlcWzXdrG
	aBQXHYNA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS0J-0000000ESbZ-2uma
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:05:37 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736327120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luYbbdZNCAXl/IP2EISod9yvpOfM235A0wCO9dfQi8c=;
	b=qZGqUNiLevk3ULvmOAgodsKpMRTtpdv6zZ5qUtcVO8ZwmriORfqt+BAiiwnzpFb4pj7wGJ
	qqIrEs42Lod/4DpYI4l0IL434kVxZV3x+XaZ3TbpdcrNBYRR4lP0VEUHk8ZUzgfPd+3/MO
	a+FI63LXtZjf0rHQ5aK2L0M0T1UZOb4GeqtD3Y5HvX3pJKhuimEoUeA/AhEZjRj0pYyfL5
	+amDJ/rpmcycJ3/zeQNMje5n0Xnql5aGiTx6ld96PiO6RPYSW/AGgTbzc8k2h7yTa2mj4E
	k9ofqTkV3//mwiIDmmTC20MOYsAaVNPdrp5VNOXL6tRR872cXmzwLhnKHPnm7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736327120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luYbbdZNCAXl/IP2EISod9yvpOfM235A0wCO9dfQi8c=;
	b=JhnK0Yu4bXTsTOoq/2QpxdG2IUFKpBcbjrCKe3W7xFQhlFCjP6V59gChgnIT16k/VUPy28
	I8OAkeg4E0fvk/Cw==
To: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v3 17/28] arm64: module: Use RCU in all users of __module_text_address().
Date: Wed,  8 Jan 2025 10:04:46 +0100
Message-ID: <20250108090457.512198-18-bigeasy@linutronix.de>
In-Reply-To: <20250108090457.512198-1-bigeasy@linutronix.de>
References: <20250108090457.512198-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_090532_007385_491454BA 
X-CRM114-Status: GOOD (  10.54  )
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

__module_text_address() can be invoked within a RCU section, there is no
requirement to have preemption disabled.

Replace the preempt_disable() section around __module_text_address()
with RCU.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-trace-kernel@vger.kernel.org
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm64/kernel/ftrace.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 245cb419ca24d..2b76939b6304f 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -257,14 +257,13 @@ static bool ftrace_find_callable_addr(struct dyn_ftra=
ce *rec,
 	 * dealing with an out-of-range condition, we can assume it
 	 * is due to a module being loaded far away from the kernel.
 	 *
-	 * NOTE: __module_text_address() must be called with preemption
-	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
+	 * NOTE: __module_text_address() must be called within a RCU read
+	 * section, but we can rely on ftrace_lock to ensure that 'mod'
 	 * retains its validity throughout the remainder of this code.
 	 */
 	if (!mod) {
-		preempt_disable();
+		guard(rcu)();
 		mod =3D __module_text_address(pc);
-		preempt_enable();
 	}
=20
 	if (WARN_ON(!mod))
--=20
2.47.1


