Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7441CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVYS1QmkmunlPWb8BqMD8qeEPXnJn99EKXuuGpXAWnc=; b=wV5I1kx+4f/OhSKYXVGktc07gm
	YKQFHAuvdjFpF3fK2KI1UKLwvx2FY0HIIPAB7Doz7WtqadHe6Ehh4C8cKRu5IAi7PdhL5zfOSDqet
	bel75bUlzG754TDaM8tzfcqRPsPkFMpOm+J2u9LZgOL4IYo8piUZrj6W3T0OpUtRbOY5XPyWctIff
	bNJHrHiuf1e1E9PPSkNyVje4EIPWgFjRyqpWeoqYCFYfDZHXLm3RKx9XJk93x1G1T99Zl4O+vkoLu
	te9DTi9UnHHiv7WqmnSqe9QDEXSwWesiSToSRDe04J8BpffbRSz4UsGrk0X/m48TR5pG6NwQBggAR
	g56O6TCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Nh-00000003HvU-2jnj;
	Wed, 27 May 2026 03:56:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Ng-00000003Hv0-47NI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 03:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rVYS1QmkmunlPWb8BqMD8qeEPXnJn99EKXuuGpXAWnc=; b=aTsnQ8W9ozb0AZth3Zg15O9y1c
	C1re0TTiFXUDRtjbghSx53F2VkCHymjlN6aF5sme/ghwhngYstMwzP3+ec+PknIw/pgxF0POpD+qA
	H2K4RDKp2a4FTyJONGGQ1bgxXU2OlN1/oVb/zf4eItLFWBxL4ZQvk2uC2tOqdWCFNKSuKF1drpOx8
	+B/Ram9OttayPTrtJbsbVtBYqEOdqbgLZW//cSTWTvBNTupiWmWIlORRtsui4UR1ix0LG7hZ5Co66
	IbKuMVT2tulDxOjVhuUAs9g9fAs78OJg/stSMvdu48zUFUuGQmdQvfS4+NHopdR1HPcl3p0bjp1fR
	uv3j5YRw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Nc-0000000CtTe-3pPW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:56:31 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-365e54bc4cdso809685a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779854186; x=1780458986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVYS1QmkmunlPWb8BqMD8qeEPXnJn99EKXuuGpXAWnc=;
        b=QJYr8ff8FpeVWngLW/jwM8WwWHrc9lOybL8zL4Ty/174chdxxUS2umHcGLKnpwEn/4
         Omw7RHehjEIAm6UaNsxn6ZMA7V2dtf1LU+Cjjn8jLf1yM3lmbF7/EvYYNRLmOjpH0NB1
         Qs6QQ7fDXJM3QtuRrRLgLEaTAsbxAZ/489lqORuavOqM8O2blrnxwbHBpr5HEsiEHCoI
         4myrsJWjncFeqEfWyUW+hVMhGYsrer4IqKItB1DM0mSmAP+GWHvgAOqU1DKTyERYhtRr
         4obBLHGPjA89Lr3y2jYaO/RLPwqyviwWMqCtcZ6bTOHoIkFXgQsBvQ3KUq0Q0UokEqew
         yLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779854186; x=1780458986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVYS1QmkmunlPWb8BqMD8qeEPXnJn99EKXuuGpXAWnc=;
        b=UTXKR6EW5K7hAPyAi7U5ydbymduWcCGiN6tShLftjiHw7C1cH8xFX8uKnUtZTmQ8IW
         /7+nvx9Z17dAlEXePEPdrHekLZUtp5jeBM9i9b+cmoyPpNzVYamAciIW0+t8XLWHais7
         O+37RAIr9Xac56dOwaFjpCrm/CQFKqF6Tn6VXbtJVoTf+Dmjg46NnCiYxTIUZzs1IXyD
         IdK5UBAoAcU8XjSvoT0w8C8PXAsGW9DFFRK9Ns2D2BY8kUMbsMEImR73nBAbWNUnaqUn
         JSvO4670sOImBDCbzY40d0Qzp8CdguYDryiXLkwWvC2W8aoeNnEOkI6rKfF75eTgEgvN
         tLEA==
X-Forwarded-Encrypted: i=1; AFNElJ+EA81Uqf18ZTgQwNu/tfxxGAHWzWsjQoet0L5KEsXRq2OtaySnYSnmFhrrSTQMhpmdKBnzRxb1NfM3wnF/JWJ+@lists.infradead.org
X-Gm-Message-State: AOJu0YzRDWPu8DZd0utYB9PnE1KpiibGp0AnnzCPE+J1HEMzBEbl//Ck
	xMNxzQz8ftuenHQ3SoXoYQa3FW6k8czAjNRzhCWQnxEzCJXCVeswEu0Z
X-Gm-Gg: Acq92OG20UltXjcdFZv9pDhaKH864Q1ampvARTegN/9rfKHVtU+6Kw/Ap7vGxA93Bcf
	6NNAnRkEYSj4VVBN/7GTOOF3X52z1081ASyNX/Iz7Jlen0is984qMRXxIuApU31EpZYHXYNSN8w
	Kvb2lGXnLnvxzWxIZXYKiS7bSpKjk24Nev1KVq4ElFJ5YUJHRyyXjaqkwEaj6EaW5mxhjcThNj6
	WQgHtz1IcAv7HqKVx05OCoGxnvqbnor+fndn2AozKjTUHnktwIHoym47jnl1WxY/JFWc6kHc5CD
	M+D9nqb4iWLFfF0UT1JMUnD2IwFN+GBC8Kr5WGWEi4XvsV3KZ8qTrXJnN3dbrlzcf+DbybcozLV
	tX+611Rc8XYsX8yANqtH01BX9ANrVFt6YGITKRionM5pWn/wMWZfrERYYjA+ZTh2xoBuOkiTpAT
	b6Bt74pRzBnQIF5ffyxuStdD83VTPdol70Ogl4l77yuqFEmvYkb3qmMuM9h5v3UEUN/uyaUo6B9
	JpYFxNoDshWGCJrSIRCqBNsP6RKsqruNMAc6Mz98TP33C2N
X-Received: by 2002:a05:6a21:6711:b0:39b:91d1:6c10 with SMTP id adf61e73a8af0-3b328f122bbmr11576536637.4.1779854185699;
        Tue, 26 May 2026 20:56:25 -0700 (PDT)
Received: from firefly-aio-3588q.. ([36.28.158.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f1ed8sm828385b3a.43.2026.05.26.20.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:56:24 -0700 (PDT)
From: Xueyuan chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH 1/3] mm: make persistent huge zero folio read-only
Date: Wed, 27 May 2026 11:56:05 +0800
Message-ID: <20260527035607.14919-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
References: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_045629_613590_8815B24E 
X-CRM114-Status: GOOD (  20.06  )
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

From: Xueyuan Chen <xueyuan.chen21@gmail.com>

The huge zero folio is shared globally, and its contents should never
change after initialization. As Jann Horn pointed out[1], the kernel has
had bugs, including security bugs, where read-only pages were later written
to. If the huge zero folio is read-only in the direct map, such writes
fault instead of silently corrupting shared zero contents.

For the persistent huge zero folio, set this up once after the folio is
allocated at boot.

The permission change is best-effort. If the architecture cannot safely
make the direct map read-only, keep using the writable persistent huge zero
folio.

While at it, mark the huge_zero_folio pointer itself __ro_after_init.
READONLY_HUGE_ZERO_FOLIO depends on PERSISTENT_HUGE_ZERO_FOLIO, so the
pointer is initialized during boot and never replaced.

This was inspired by Jann Horn's read-only zero page work[1] and follow-up
discussion[2] with Yang Shi.

[1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 include/linux/huge_mm.h |  5 +++++
 mm/Kconfig              | 17 +++++++++++++++++
 mm/huge_memory.c        | 25 ++++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index edece3e26985..45d1352619d1 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -5,6 +5,7 @@
 #include <linux/mm_types.h>
 
 #include <linux/fs.h> /* only for vma_is_dax() */
+#include <linux/init.h>
 #include <linux/kobject.h>
 
 vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
@@ -554,6 +555,10 @@ static inline bool is_huge_zero_pmd(pmd_t pmd)
 struct folio *mm_get_huge_zero_folio(struct mm_struct *mm);
 void mm_put_huge_zero_folio(struct mm_struct *mm);
 
+#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
+bool __init arch_make_huge_zero_folio_readonly(struct folio *folio);
+#endif
+
 static inline struct folio *get_persistent_huge_zero_folio(void)
 {
 	if (!IS_ENABLED(CONFIG_PERSISTENT_HUGE_ZERO_FOLIO))
diff --git a/mm/Kconfig b/mm/Kconfig
index 776b67c66e82..f31200816646 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -787,6 +787,23 @@ config PERSISTENT_HUGE_ZERO_FOLIO
 	  Say Y if your system has lots of memory. Say N if you are
 	  memory constrained.
 
+config ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
+	bool
+
+config READONLY_HUGE_ZERO_FOLIO
+	bool "Map the huge zero folio read-only in the direct map"
+	depends on PERSISTENT_HUGE_ZERO_FOLIO
+	depends on ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
+	help
+	  The persistent huge zero folio is shared globally, and nothing
+	  should ever change its contents after initialization.
+
+	  When supported, mark the folio read-only in the direct map so such
+	  writes trigger a fault instead of silently corrupting the zero contents.
+
+	  If the permission change is not supported, the kernel keeps using
+	  the writable persistent huge zero folio.
+
 config MM_ID
 	def_bool n
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bf9b480bb3b0..c568755dd58e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -75,7 +75,11 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 static bool split_underused_thp = true;
 
 static atomic_t huge_zero_refcount;
+#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
+struct folio *huge_zero_folio __ro_after_init;
+#else
 struct folio *huge_zero_folio __read_mostly;
+#endif
 unsigned long huge_zero_pfn __read_mostly = ~0UL;
 unsigned long huge_anon_orders_always __read_mostly;
 unsigned long huge_anon_orders_madvise __read_mostly;
@@ -305,6 +309,18 @@ static unsigned long shrink_huge_zero_folio_scan(struct shrinker *shrink,
 	return 0;
 }
 
+#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
+static bool __init make_huge_zero_folio_readonly(void)
+{
+	return arch_make_huge_zero_folio_readonly(READ_ONCE(huge_zero_folio));
+}
+#else
+static bool __init make_huge_zero_folio_readonly(void)
+{
+	return false;
+}
+#endif
+
 static struct shrinker *huge_zero_folio_shrinker;
 
 #ifdef CONFIG_SYSFS
@@ -965,8 +981,15 @@ static int __init thp_shrinker_init(void)
 		 * that get_huge_zero_folio() will most likely not fail as
 		 * thp_shrinker_init() is invoked early on during boot.
 		 */
-		if (!get_huge_zero_folio())
+		if (!get_huge_zero_folio()) {
 			pr_warn("Allocating persistent huge zero folio failed\n");
+			return 0;
+		}
+
+		if (IS_ENABLED(CONFIG_READONLY_HUGE_ZERO_FOLIO) &&
+		    !make_huge_zero_folio_readonly())
+			pr_warn("Making persistent huge zero folio read-only failed\n");
+
 		return 0;
 	}
 
-- 
2.47.3


