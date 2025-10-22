Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432B8CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:cc:Content-Type:
	MIME-Version:References:Subject:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=QD4vFggFMuOeGOcQhDOiteuemKWf4EcukV9nF7jSRjE=; b=UWYMih3fqfr8Zc
	MdCc4CwIEz8pXIjYmP+x6ulU8z5vPuAPtaexttCURJIgJZkJPulu+4+7baRPbWv5YtNknFv50DrHN
	xLT2vVW9Rh3xZmkuO3oxCaJKaaFzBc+NLEfP2Lf4C/CxXaP9iSZiLar8MnZls0PahKzGh2mluidaQ
	xGYgn6qs7tYsM/5NozYebgbHkkhcR/rHCljbkcUOdPSJmgRAfboe3U8Fk9jd75rjzmRZPiBPsyy7n
	aX4OxgANvnmfuJKl4uiG37qaqTvBM3PiG2vH3Bw2q2WJcZSaNBpLkgU0AYa0IJ827lg5gYHf5MwvT
	5k8fdqdBJ2bov/5blQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHv-00000002r79-0WGS;
	Wed, 22 Oct 2025 12:49:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHE-00000002qSS-1FqU;
	Wed, 22 Oct 2025 12:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:cc:Content-Type:MIME-Version:
	References:Subject:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=QD4vFggFMuOeGOcQhDOiteuemKWf4EcukV9nF7jSRjE=; b=TmtYU0ZkVamBJ9CGZW/9rvvCp/
	WlpOuT6VSYKMpTpJaFFF0SIisZ3CoxyAqfWaIZVrrPKt5DQJGpvsFWMM6osZ3sMt5gTP7GvW05dyl
	cqwM20sVr4EDlOPe22zAu0j5Mru8OyOZaTfmVFFp3eQUiF8kqkFrtCEzYt9VA8cuDV2NuyCnQ7FGr
	ATxisgs0QNHlA4yaNutOxqkMEX3SFRVoHiAxQm8X1K0XqYtXo6BAtOqwJexfegvNUQTpgiW5vzrf6
	UYOjOA/PeJcdQa+YhIdoRFWtNqzSZj6QnhPwIFheQLQnXNBSi4xjpDm7sbxV7XTY//UgmXYewBj9G
	7OUi/n8Q==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXPV-00000000X4G-0ctG;
	Wed, 22 Oct 2025 11:53:47 +0000
Message-ID: <20251022103112.358808928@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QD4vFggFMuOeGOcQhDOiteuemKWf4EcukV9nF7jSRjE=;
	b=S//Em47hao2SiEu4HhbNJvmg7y21pNf1gaVLrhJjCcmZbZo071nDxTNXRELCYqZoPooIxF
	ySg3zehiSqSGF/Zy/PoAZ0h0eWVHnK7p5NECvAG631LkvrKKpA02NnT8HJhQZpUPjjGdto
	DxLzSxnTExD3XmpQxp/1w9NAA1kCPWdDRNW5/s+Ed7BI6inW+w0EztY5DPaQKDxXkxI25m
	W2VKIMRifCPS/nvbDcv4t+ALLahmQ72ecuN0xD3h7xqOz54s2emMHzywywwyatoR89R+VO
	HWXCuuqWv5QLlnqsJgwt24DUtrnfgD83c17QYqwpHiorT55OZe+4eLnlakdUyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QD4vFggFMuOeGOcQhDOiteuemKWf4EcukV9nF7jSRjE=;
	b=jNKXbM8s9KXys2skLRaFhNaomPmHf3yWyLJ+u2hte0dUfgf8E6lPCUahh/LtI3X0E3G6xz
	MQOaMMLQpwzewRAw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V4 08/12] uaccess: Provide put/get_user_scoped()
References: <20251022102427.400699796@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
cc: kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Date: Wed, 22 Oct 2025 14:49:11 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_125345_344377_72A8A34B 
X-CRM114-Status: GOOD (  10.34  )
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

Provide conveniance wrappers around scoped user access similiar to
put/get_user(), which reduce the usage sites to:

       if (!get_user_scoped(val, ptr))
       		return -EFAULT;

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V4: Rename to scoped
---
 include/linux/uaccess.h |   44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -825,6 +825,50 @@ for (bool done = false; !done; done = tr
 #define scoped_user_rw_access(uptr, elbl)				\
 	scoped_user_rw_access_size(uptr, sizeof(*(uptr)), elbl)
 
+/**
+ * get_user_scoped - Read user data with scoped access
+ * @val:	The variable to store the value read from user memory
+ * @usrc:	Pointer to the user space memory to read from
+ *
+ * Return: true if successful, false when faulted
+ */
+#define get_user_scoped(val, usrc)				\
+({								\
+	__label__ efault;					\
+	typeof(usrc) _tmpsrc = usrc;				\
+	bool _ret = true;					\
+								\
+	scoped_user_read_access(_tmpsrc, efault)		\
+		unsafe_get_user(val, _tmpsrc, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = false;					\
+	}							\
+	_ret;							\
+})
+
+/**
+ * put_user_scoped - Write to user memory with scoped access
+ * @val:	The value to write
+ * @udst:	Pointer to the user space memory to write to
+ *
+ * Return: true if successful, false when faulted
+ */
+#define put_user_scoped(val, udst)				\
+({								\
+	__label__ efault;					\
+	typeof(udst) _tmpdst = udst;				\
+	bool _ret = true;					\
+								\
+	scoped_user_write_access(_tmpdst, efault)		\
+		unsafe_put_user(val, _tmpdst, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = false;					\
+	}							\
+	_ret;							\
+})
+
 #ifdef CONFIG_HARDENED_USERCOPY
 void __noreturn usercopy_abort(const char *name, const char *detail,
 			       bool to_user, unsigned long offset,


