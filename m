Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E8C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2U/x1GfGP9j2cvu14gMbHcehw03jG1C+3eyWlyvy1zM=; b=WETv4BjAO0iycx+s5DHWr1D3NI
	hRccSlRygfgGWAVqOsZ2ZlA5DKcxqwMKSRnaLQoRpRXvzUvME+XUx+wotKd2Q5W7aebSc3JHjzU0t
	H5usjgnDK2IG4dnT9tTrApUcZRUgawfMXAkFQoivfMK+yHzN/+walKmLxBLX4dXX99u04dqkKvKDJ
	KqM8yA91xnmCqzqv++SfpUmZ8VPRS2gpdPM6iJBRyD4Xjx15478Po1q0T5J4Wx7odSMlDR4UMWJZB
	m0dszE9gX4YBJakgx49z0svwQieAEy89IONNiUDZzm2Um4OQC5SGekomQHkNpWbsw52wEhu/JWXyI
	BVE7HDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzsM-000000066Id-3KBW;
	Thu, 06 Feb 2025 11:16:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXA-000000061cl-1xcU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2U/x1GfGP9j2cvu14gMbHcehw03jG1C+3eyWlyvy1zM=; b=laO5VTWis+Ew6TN6IDHw03UI70
	/ULqCVz7R8ajfESw3ILM5YHkQM4Jtp/1IytE9RqYl6VFEDDLva21vPf+QwaVbng2gARCpMyzGB951
	yX59IkgZ4YRZIHNIGivuO4KjfNwSbcxRaEfSJcBeNfKILEq4Z98Sn9ggS/kiDDj8xek9dDM718CVB
	z3fnBYdNZpPIy/NAbv4LOtyJVcYcqltLk9TxgiI73Qc3X/ZFHC9Hj8q0IrwwntlXwAJalUHrjJSIu
	6bDy8xjA8upxEDovUjyJMJ+ews9tMuR4e8y6sRSj2FaM1XWbBMJyuHZsSpoQ8+j1jbwzufmaohlqC
	BikGM6zw==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX6-0000000GuuQ-4Aqj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43624b2d453so7936385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839295; x=1739444095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U/x1GfGP9j2cvu14gMbHcehw03jG1C+3eyWlyvy1zM=;
        b=F05kbMgigUjlEKw65Ezp5zAMoLbKs4+5teX6j8wq+/jJo1eoVN4hiC3uDdIdrLWfge
         OJBYma+nASs/R+ylEqcuHxc5UJ5PYmRZwjmXEcmF9K4oh5wkShXdmK6W/OVPmoux66EI
         /giJtNVQsc+qZ7tP5E48iZM28tZdM1D8OgmeIonqZiJfW/jBuC9m+5FW2PJOCprlZblb
         OmPBlYYLAGsGm5IrCpepKbsEITV/drQ6BlBhUnzJsONUyZaMe78fwiiaXDKxM0khEY9c
         xSAhIUza39boyuLVwu/cNxlBv1q1aybSd7DMRQaMUnuxdSdNPjRFEJYgYGLrFJO/et54
         sKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839295; x=1739444095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2U/x1GfGP9j2cvu14gMbHcehw03jG1C+3eyWlyvy1zM=;
        b=h5b5+oEGtvPHsSwNcnNPXH1htOd2fNX1+1LhqkxzFRbG/XhvLK0a+hKOiRfAqrGos9
         P9QrppFZRRrVOzgqrCNYDhGdbr3SL2v0lCwaeO3cIp6jsaJLdYrzae9K93aUrQCwYpE3
         SMzWqxtvJfbDARPn4XlxiSTPmG7N8UtdBSzMcfKoZFwRotvTOpMhri+Vw6EnLTIqnHCo
         ct/fnIcNCCAaWwRaip9J/i8Z1QnJBJ34CiEDS+hYRxZqDEDFkZmZh0x9PRl8M47/hNA7
         A41pkW2pPzo+zoLH2liqrUCyLSNclocyOOqex+odbArXI0SXViYcy3CvACnUNTpBsPk9
         uSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDAq1WrEHsBkV3BVX2ga5GIqO5tiCrZbp7QpN0tZ1slrsL5W8tgmiscJETigheLkZffFG4Q3/FXoBcWmGB0QY+@lists.infradead.org
X-Gm-Message-State: AOJu0YxDlW8DJ+jUrmsbAlo0hOT7/iDMSgHGS6CnGmSWGlShtGZQRj77
	b6Xy+o5UBXszjg/CGSZyLvZyE4nMyuRITGri8fv396zFtmdUQ0RO
X-Gm-Gg: ASbGncupoI5ftdD+Ockip8rer3dbfsC37M7qajWd4ZNfspW+UiMWKgISMvwi3kU8IfO
	5nxCLDXUO2l80cnkxQZEWia+hX14leUE5pbdgsTjNo5J9Yz3NTftQk96DFVrrmuU9qIB5Q+t3jD
	8iBuUE6WpoUxsqHX2hnToNLq29cQPlNpgazefGhIuB3JjU+rh1ISVaG9Y6JhgdSuy6WjPLqvjzE
	rmQ0l1V276p2CwtHrHrXC1suGZV5AEX/pW+WZ1Vz5CxVoM8KJyFPiCVBkYceniDLjfQ43cOzN8T
	jtU9
X-Google-Smtp-Source: AGHT+IECKDGAzq+Depq2+nIptoAD3ksbrPRr2mBSOELhwPjJa2kOGcthn5Lo7ZSMn0/ZXamyQQJB4g==
X-Received: by 2002:a05:600c:4f05:b0:434:f739:7cd9 with SMTP id 5b1f17b1804b1-4390d4350c4mr57549575e9.9.1738839295278;
        Thu, 06 Feb 2025 02:54:55 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:8::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd7f081sm1429621f8f.58.2025.02.06.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:54 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 13/26] rqspinlock: Add basic support for CONFIG_PARAVIRT
Date: Thu,  6 Feb 2025 02:54:21 -0800
Message-ID: <20250206105435.2159977-14-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266; h=from:subject; bh=zXQSTFNS/c2U8KM3FgC7kOLmnF5sm9qLW6KNbuMrArs=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRlcUneWOnutzdUSHTyEeSH9ShV4gvRxjc/jId8 1YMMoZSJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZQAKCRBM4MiGSL8RyojREA CAY3vlIDeTRuUpYBE+KFscZYPr9H8/q9UrVdKjYtlSmP4kUMnaYDdROM+/Z1eAE/ooLx/8vdb6tzBt fc3B+DxVL7tQO7jgkFhs8TWzKKlBa8uCE08YnUR183pRuI7FMMaaHbBakUz76eIN1rHwUUZnragSZK FI/5+wGEKE4O3AFSc0b6AVE2v7Ac5Qz5hBBsks/FANKm3Hdx0yJa1axdExsWkJREbmmLTO1RDjCoQZ MVoAxyPIBWrHsWFp3WUr3AGAwW/LT5cz1ADzDNURb97YC4QLdg4MG3NfjpdyWd2jj378mOBYDMydU7 ifjlmuV1KLLhJCbrDsvImh8rxY4aiH1tOMPpfC/pCCARozVsCCt/0NqyneZEa6ebt3Dn6xqnWrSM0D P8kjr4HmLnUenqsX6gCzKA1pntH7LoAXkWLdXVX0Ekt+LIx9dUbZSsloW9AwF+9r/JRRMOBYnNcUDq YDOdMDyfNFfvCjHd9qxbMa/52CU9Tl7upwFr/RbcEK4zY0ZgsV0kmffC3TAPnB+MzzJZwwtdF0ajVp nFsUX1lkdCe1xJTlMFPMzPgqFnxoN8cIGLIKW7BMNq3lr6eU9cBn3XZGlQqrCRwdk/yLylSriVacdL F0y6Ga5GbeLS7YaM3SQtcTwKK5K5ODeXnTU57iP8D7BcG5/WmFu88d6x4oxw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105457_334371_0CFCC044 
X-CRM114-Status: GOOD (  16.90  )
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

We ripped out PV and virtualization related bits from rqspinlock in an
earlier commit, however, a fair lock performs poorly within a virtual
machine when the lock holder is preempted. As such, retain the
virt_spin_lock fallback to test and set lock, but with timeout and
deadlock detection. We can do this by simply depending on the
resilient_tas_spin_lock implementation from the previous patch.

We don't integrate support for CONFIG_PARAVIRT_SPINLOCKS yet, as that
requires more involved algorithmic changes and introduces more
complexity. It can be done when the need arises in the future.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 arch/x86/include/asm/rqspinlock.h | 29 +++++++++++++++++++++++++++++
 include/asm-generic/rqspinlock.h  | 14 ++++++++++++++
 kernel/locking/rqspinlock.c       |  3 +++
 3 files changed, 46 insertions(+)
 create mode 100644 arch/x86/include/asm/rqspinlock.h

diff --git a/arch/x86/include/asm/rqspinlock.h b/arch/x86/include/asm/rqspinlock.h
new file mode 100644
index 000000000000..cbd65212c177
--- /dev/null
+++ b/arch/x86/include/asm/rqspinlock.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_RQSPINLOCK_H
+#define _ASM_X86_RQSPINLOCK_H
+
+#include <asm/paravirt.h>
+
+#ifdef CONFIG_PARAVIRT
+DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
+
+#define resilient_virt_spin_lock_enabled resilient_virt_spin_lock_enabled
+static __always_inline bool resilient_virt_spin_lock_enabled(void)
+{
+       return static_branch_likely(&virt_spin_lock_key);
+}
+
+struct qspinlock;
+extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
+
+#define resilient_virt_spin_lock resilient_virt_spin_lock
+static inline int resilient_virt_spin_lock(struct qspinlock *lock, u64 timeout)
+{
+	return resilient_tas_spin_lock(lock, timeout);
+}
+
+#endif /* CONFIG_PARAVIRT */
+
+#include <asm-generic/rqspinlock.h>
+
+#endif /* _ASM_X86_RQSPINLOCK_H */
diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 92e53b2aafb9..bbe049dcf70d 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -35,6 +35,20 @@ extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
 extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
 #endif
 
+#ifndef resilient_virt_spin_lock_enabled
+static __always_inline bool resilient_virt_spin_lock_enabled(void)
+{
+	return false;
+}
+#endif
+
+#ifndef resilient_virt_spin_lock
+static __always_inline int resilient_virt_spin_lock(struct qspinlock *lock, u64 timeout)
+{
+	return 0;
+}
+#endif
+
 /*
  * Default timeout for waiting loops is 0.5 seconds
  */
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index ea034e80f855..13d1759c9353 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -325,6 +325,9 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
+	if (resilient_virt_spin_lock_enabled())
+		return resilient_virt_spin_lock(lock, timeout);
+
 	RES_INIT_TIMEOUT(ts, timeout);
 
 	/*
-- 
2.43.5


