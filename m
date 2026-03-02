Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F3DE9B37E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3P/KaCqbTVRLW734Le3jm//dWEzoj6aOdRHjsDkHB0=; b=G/F3RgTrrpmRNNS06EbJHoOp5u
	pATAEjMdINABo10l4CNVO35QiChrXoqqkCY7uN8Qg3iwWNBRq1h2Oo6LEQUA6oE9JGax9vZhz19iE
	qTflsME0Z0t0z4egbU5scXeOIPUXCi6T94mFNnktF8RIGzFwmBFdGwo0LIxwudxaYg+kOA7mw2nO0
	uki5R1CLt7u0T22Hjmam1tv6UR/pB6cIbXWMcwL6MwkXgIowN6233qgNewlsprRyaXEXL3f/pUTt3
	gcg/xClnr6XoKaz5ZlzkumWHocQTm0c8TCOBWQTt8gEDJo0yfl6of9bgkskU9OneRDu8M3wiT+1cH
	gWXL4FWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KC-0000000D6aU-3ggU;
	Mon, 02 Mar 2026 13:28:40 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KA-0000000D6W4-29Tg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:28:39 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jv-003bkz-S5; Mon, 02 Mar 2026 14:28:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:To:From;
	bh=D3P/KaCqbTVRLW734Le3jm//dWEzoj6aOdRHjsDkHB0=; b=dr2IYEGXpLn70YtwZCSevHlElv
	/BDRdlUO4zDGofnTsHi42LvbEdi3VipTLE3qO2jms6/GGfUGILr2ElGxq76Qqa1IVjSRbEvOAc1Ro
	pNaEyMGT7NC4B24epdTZtJNVCwBM3fXGAKN7d+4ezQMOiK4oex69VUMtEUOAjx+EPd5g+ct38316h
	qxQXAxcAiiKRb6oyp9RzKKLymdA7Gx+8gSGQAGBZIzLD4BxE+G55Ccnmk/qMfgl9N6JGa4es8sujn
	nzOnVNpMKlbluysxX5nsv82z0JQ/qI/Tt/bJCX331CVLx9DxsrepkWNzyJUPNhYsRNbEfHp1c25Sv
	5z427ECQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jv-0001hG-7S; Mon, 02 Mar 2026 14:28:23 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Jh-008UTR-Jt; Mon, 02 Mar 2026 14:28:09 +0100
From: david.laight.linux@gmail.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Andre Almeida <andrealmeid@igalia.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	David Laight <david.laight.linux@gmail.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Heiko Carstens <hca@linux.ibm.com>,
	Jan Kara <jack@suse.cz>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	Kees Cook <kees@kernel.org>,
	akpm@linux-foundation.org
Subject: [PATCH v2 2/5] compiler.h: Add generic support for 'autoterminating nested for() loops'
Date: Mon,  2 Mar 2026 13:27:52 +0000
Message-Id: <20260302132755.1475451-3-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260302132755.1475451-1-david.laight.linux@gmail.com>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_052838_559644_7BC55C13 
X-CRM114-Status: GOOD (  16.93  )
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

From: David Laight <david.laight.linux@gmail.com>

Autoterminating nested for() loops can be used inside #defines to
declare variables that are scoped to the statement that follows.
These are used by __scoped_user_access() but may have other uses
and the gory details are best separated from the use.

Using 'with (declaration)' and 'and_with (declaration)' seems to
read reasonably well and doesn't seem to collide with any existing
code.

As an example the scoped user access definition becomes:
	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl)) \
		/* Force modified pointer usage within the scope */		\
		and_with (const auto uptr __cleanup(...) = _tmpptr)

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/compiler.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index af16624b29fd..1098a91b5591 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -369,6 +369,32 @@ static inline void *offset_to_ptr(const int *off)
  */
 #define prevent_tail_call_optimization()	mb()
 
+/*
+ * Sometimes a #define needs to declare a variable that is scoped
+ * to the statement that follows without having mismatched {}.
+ *	with (int x = expression) {
+ *		statements
+ *	}
+ * is the same as:
+ *	{
+ *		int x = expression;
+ *		statements
+ *	}
+ * but lets it all be hidden from the call site, eg:
+ *	frobnicate(x, args) {
+ *		statements
+ *	} 
+ * Only a single variable can be defined, and_with() allows extra ones
+ * without adding an additional outer loop.
+ *
+ * The controlled scope can be terminated using return, break, continue or goto.
+ */
+#define with(declaration) \
+	for (bool _with_done = false; !_with_done; _with_done = true)	\
+		and_with (declaration)
+#define and_with(declaration) \
+	for (declaration; !_with_done; _with_done = true)
+
 #include <asm/rwonce.h>
 
 #endif /* __LINUX_COMPILER_H */
-- 
2.39.5


