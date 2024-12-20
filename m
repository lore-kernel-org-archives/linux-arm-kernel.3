Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E30E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B42kRDJLK5sW+Ny84inWQy8805pd8AwUNUb75zPNPLQ=; b=sBGwcMCafEFDMw4px79MFIGaOr
	jiR8aHS6BbyUmQvrxmjezozxoPaoC612N29uHHUo+q/7KgTlJhJZ06DnL0wNeLjP56YI1/StXrGqH
	YQXAtrUAKp/XLm1vxQjPjbKH4Ej8SLvsSVuV7U1t3K8OYS92/tt45R89TfSwPA0NtR3bZRKNmWG3l
	WQXmHNK2Pg8B/T4HdJkFm4gfZ3kOx1Okyd4wl4g/SJ/Gf3+3SDKhbv3kqR95dQkHnd0G7q1zs2xew
	HbFqcTMVXVA2S/NypGZCBDMBSzrsvmplkIw6B5hQHfVd0hJNm8V3DWen4Y5d+ZYO4kOE9q+CKmErr
	RcNWcOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCZ-00000005iA8-2fet;
	Fri, 20 Dec 2024 17:54:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOh6F-00000005gfB-3asg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:47:46 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734716862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B42kRDJLK5sW+Ny84inWQy8805pd8AwUNUb75zPNPLQ=;
	b=On3qaA/twJ77SLnuRkru+5uQE5ZKBQhFay/+nLBh6xN3SX7UJftST8sHfDPa7ea47vdNAZ
	idXh9UZrztg2QDpZqo5r2KDtqUdUUQy4DZW0/Q2kY3288WC8tbh+komb3VRtgLX2X/+eLV
	6gh5IiEbq6BPf0yzOqrCLK5mbo4GRvQoX1Q46SArpUKYkMbU+6gA+M7jKFKSBXqXzB5bNi
	J89qbyLyottgcWoow0Kz4No4atEU0CLK369SKj0d/7AO9q6Ro7NM21+G1Ovw0F4seLlS4T
	5faShVWC0FjU40sPhMXVi6QlMhr8B1f2wrUhEvXiYW905avRmgk16GoBN3lLtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734716862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B42kRDJLK5sW+Ny84inWQy8805pd8AwUNUb75zPNPLQ=;
	b=wP3SU0f9++QJgKMFDAs2/M0ayS1yvZ1EajxroFHRFh/A4bAKgjgkMzUWuOJ+6W/3JOSGb6
	Iya0Jf1kXqQFcjAg==
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
Subject: [PATCH v2 17/28] arm64: module: Use RCU in all users of __module_text_address().
Date: Fri, 20 Dec 2024 18:41:31 +0100
Message-ID: <20241220174731.514432-18-bigeasy@linutronix.de>
In-Reply-To: <20241220174731.514432-1-bigeasy@linutronix.de>
References: <20241220174731.514432-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_094744_036849_CF56C875 
X-CRM114-Status: GOOD (  11.42  )
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
2.45.2


