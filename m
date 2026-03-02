Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84C9E9B37F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqGOd6ipwPciYOEGbBHYVc1F4qmoJna8wv2iZM4469g=; b=J8bE9k/JLjijYr6VliQ12ERVhj
	xE6/sK/CfepPpvT7OGLiRI8iLU4G8h9vICnS56X4uanG6MHWgn5wf+uY/uOiDlLrW1R92zPhiywjK
	netiKgO7filLdkx6QJTUFRQkWZapEf153Hb4W/kH5CV9q/GC3ayenEbUipHqmm8AsHCx6cNxX40ib
	+BlKgdHH8kxsZa986qaS2kNh09ocdrlBGD45WCNeBoX9HqXuhEMGepaOsgQYLptksdAryotCA9ZB3
	evODZDuyVhjy1uA9/l2Sdr1GqyndZVYECOaVqqRIf0uVbDH3h+toaFH1y7X3Oq2s5hWMFGJ96IxAo
	0jgOPLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KG-0000000D6eR-1t6R;
	Mon, 02 Mar 2026 13:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KC-0000000D6YI-0TjF;
	Mon, 02 Mar 2026 13:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=DqGOd6ipwPciYOEGbBHYVc1F4qmoJna8wv2iZM4469g=; b=G7tgJaHBhw1+Lgg/iFgipDYIKL
	k+8qk7w3MMs6tYnjejK9+9X5CycggyEmeIw4jTVlKzsWUtUF0GsKY9Bl2yk8VVFm+0B0teBVE76nk
	D1bmV0HgF1/Oflc0ExHIBr7H2plCT6JMMK9bEf+ICn5yD0WRXE8ljcM7KaSbaRSz1RjzfB1bHNsGV
	+uMGu1aXaEkBl7FTczS+4Raw4SLmYijvedMBcLqD+Uw8hutIquLc5zcX9qFTuI1HhcvdX1fiw4q4j
	ezO2+g5leECjpHFRjsZP0rhpxkr7svhLeiPZxnWOhMCS3AThOYjALI3aGF7vFCR2kGW5A6DsunFFb
	wF3mFp8Q==;
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3K9-00000000A7U-1YK1;
	Mon, 02 Mar 2026 13:28:39 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-003bl4-7x; Mon, 02 Mar 2026 14:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:To:From;
	bh=DqGOd6ipwPciYOEGbBHYVc1F4qmoJna8wv2iZM4469g=; b=C3w8X+KCNPwwUnlCUtq46S90t1
	DaIzVd1U67pGzKoSNwRgDY0CkJR1WNOs2reVFFLbpCZJ5PTfZVq5TZTYpBtxMw2AfBFKsnU8eNfzL
	UyKZj1Ao3zw24M6GhXmw4q7AcjpvZz9fajrVInZguhOGa8NYPBkUrjhNlngU3Mr5PEAWm9Jc6JFne
	y3SR7NYQbKrUQi7nwwLTjarrREdk17HVYnhrX+G5V/PSUpfdGc3Axbaqn/zyoRSLpoMrqqb5dL7RX
	smVDc6yiyZoQchORsC5WgAugpAW3KLRRAwN3ak0bumYpByVPz6HVuheyobbQNDuH27z7AyGB9th3/
	IYE9RgWA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Ju-0001hC-Np; Mon, 02 Mar 2026 14:28:22 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Jl-008UTR-0w; Mon, 02 Mar 2026 14:28:13 +0100
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
Subject: [PATCH v2 next 5/5] signal: Use scoped_user_access() instead of __put/get_user()
Date: Mon,  2 Mar 2026 13:27:55 +0000
Message-Id: <20260302132755.1475451-6-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260302132755.1475451-1-david.laight.linux@gmail.com>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_132837_596167_9FE78359 
X-CRM114-Status: GOOD (  13.26  )
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

Mechanically change the access_ok() and __get/put_user() to use
scoped_user_read/write_access() and unsafe_get/put_user().

This generates better code with fewer STAC/CLAC pairs.

It also ensures that access_ok() is called near the user accesses.
I failed to find the one for __save_altstack().

Looking at the change, perhaps there should be aliases:
#define scoped_put_user unsafe_put_user
#define scoped_get_user unsafe_get_user

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/signal.c | 72 ++++++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index d65d0fe24bfb..fca257398cbc 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -4469,10 +4469,16 @@ int restore_altstack(const stack_t __user *uss)
 int __save_altstack(stack_t __user *uss, unsigned long sp)
 {
 	struct task_struct *t = current;
-	int err = __put_user((void __user *)t->sas_ss_sp, &uss->ss_sp) |
-		__put_user(t->sas_ss_flags, &uss->ss_flags) |
-		__put_user(t->sas_ss_size, &uss->ss_size);
-	return err;
+
+	scoped_user_write_access(uss, Efault) {
+		unsafe_put_user((void __user *)t->sas_ss_sp, &uss->ss_sp, Efault);
+		unsafe_put_user(t->sas_ss_flags, &uss->ss_flags, Efault);
+		unsafe_put_user(t->sas_ss_size, &uss->ss_size, Efault);
+	}
+	return 0;
+
+Efault:
+	return -EFAULT;
 }
 
 #ifdef CONFIG_COMPAT
@@ -4705,12 +4711,12 @@ SYSCALL_DEFINE3(sigaction, int, sig,
 
 	if (act) {
 		old_sigset_t mask;
-		if (!access_ok(act, sizeof(*act)) ||
-		    __get_user(new_ka.sa.sa_handler, &act->sa_handler) ||
-		    __get_user(new_ka.sa.sa_restorer, &act->sa_restorer) ||
-		    __get_user(new_ka.sa.sa_flags, &act->sa_flags) ||
-		    __get_user(mask, &act->sa_mask))
-			return -EFAULT;
+		scoped_user_read_access(act, Efault) {
+		    unsafe_get_user(new_ka.sa.sa_handler, &act->sa_handler, Efault);
+		    unsafe_get_user(new_ka.sa.sa_restorer, &act->sa_restorer, Efault);
+		    unsafe_get_user(new_ka.sa.sa_flags, &act->sa_flags, Efault);
+		    unsafe_get_user(mask, &act->sa_mask, Efault);
+		}
 #ifdef __ARCH_HAS_KA_RESTORER
 		new_ka.ka_restorer = NULL;
 #endif
@@ -4720,15 +4726,18 @@ SYSCALL_DEFINE3(sigaction, int, sig,
 	ret = do_sigaction(sig, act ? &new_ka : NULL, oact ? &old_ka : NULL);
 
 	if (!ret && oact) {
-		if (!access_ok(oact, sizeof(*oact)) ||
-		    __put_user(old_ka.sa.sa_handler, &oact->sa_handler) ||
-		    __put_user(old_ka.sa.sa_restorer, &oact->sa_restorer) ||
-		    __put_user(old_ka.sa.sa_flags, &oact->sa_flags) ||
-		    __put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask))
-			return -EFAULT;
+		scoped_user_write_access(oact, Efault) {
+		    unsafe_put_user(old_ka.sa.sa_handler, &oact->sa_handler, Efault);
+		    unsafe_put_user(old_ka.sa.sa_restorer, &oact->sa_restorer, Efault);
+		    unsafe_put_user(old_ka.sa.sa_flags, &oact->sa_flags, Efault);
+		    unsafe_put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask, Efault);
+		}
 	}
 
 	return ret;
+
+Efault:
+	return -EFAULT;
 }
 #endif
 #ifdef CONFIG_COMPAT_OLD_SIGACTION
@@ -4742,12 +4751,12 @@ COMPAT_SYSCALL_DEFINE3(sigaction, int, sig,
 	compat_uptr_t handler, restorer;
 
 	if (act) {
-		if (!access_ok(act, sizeof(*act)) ||
-		    __get_user(handler, &act->sa_handler) ||
-		    __get_user(restorer, &act->sa_restorer) ||
-		    __get_user(new_ka.sa.sa_flags, &act->sa_flags) ||
-		    __get_user(mask, &act->sa_mask))
-			return -EFAULT;
+		scoped_user_read_access(act, Efault) {
+		    unsafe_get_user(handler, &act->sa_handler, Efault);
+		    unsafe_get_user(restorer, &act->sa_restorer, Efault);
+		    unsafe_get_user(new_ka.sa.sa_flags, &act->sa_flags, Efault);
+		    unsafe_get_user(mask, &act->sa_mask, Efault);
+		}
 
 #ifdef __ARCH_HAS_KA_RESTORER
 		new_ka.ka_restorer = NULL;
@@ -4760,16 +4769,19 @@ COMPAT_SYSCALL_DEFINE3(sigaction, int, sig,
 	ret = do_sigaction(sig, act ? &new_ka : NULL, oact ? &old_ka : NULL);
 
 	if (!ret && oact) {
-		if (!access_ok(oact, sizeof(*oact)) ||
-		    __put_user(ptr_to_compat(old_ka.sa.sa_handler),
-			       &oact->sa_handler) ||
-		    __put_user(ptr_to_compat(old_ka.sa.sa_restorer),
-			       &oact->sa_restorer) ||
-		    __put_user(old_ka.sa.sa_flags, &oact->sa_flags) ||
-		    __put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask))
-			return -EFAULT;
+		scoped_user_write_access(oact, Efault) {
+		    unsafe_put_user(ptr_to_compat(old_ka.sa.sa_handler),
+			       &oact->sa_handler, Efault);
+		    unsafe_put_user(ptr_to_compat(old_ka.sa.sa_restorer),
+			       &oact->sa_restorer, Efault);
+		    unsafe_put_user(old_ka.sa.sa_flags, &oact->sa_flags, Efault);
+		    unsafe_put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask, Efault);
+		}
 	}
 	return ret;
+
+Efault:
+	return -EFAULT;
 }
 #endif
 
-- 
2.39.5


