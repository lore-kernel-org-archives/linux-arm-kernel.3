Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE459C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbT2ahD6n7IJIA/hkl9Cgk/pyVc+H2AXLyHNEbzdhj4=; b=bvVsiChVeaKydDy2o1XlZVD6+7
	zl6PzZ6jg/bqQKboKqP50N4LvDWj6mvqp9LG1aW2y1niZQg3K4sTXOoCT65oa+4U18A7Zey3nF4JK
	IkcaiJy7s2yi/6cL6ggD0hpjwvorqGBooY8icxLrntkmvi15sa0UbtagFmbta112sYyBjV/lzHiEc
	m6oPVT0XlDtSd1j6gF0hUi8kWoKUM0H0nYkfagNef6LCI7w4FO+bk9fDzwC8FtEnEik4zULSu4C4d
	qo1QacV1yxWXVEQL2sUkbbT6+28sLWst8dXVSjyFCW8FWhV8KOt6iPLiORsSxh7icemO/38YNTdvd
	fQgQLTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGUC-0000000Bk5V-0LS3;
	Tue, 06 May 2025 11:29:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEz0-0000000BSwb-3Byh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:53:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39ab85402c9so133592f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525181; x=1747129981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbT2ahD6n7IJIA/hkl9Cgk/pyVc+H2AXLyHNEbzdhj4=;
        b=XkxM2/u4ynA8SsM9zk7lnRFBuHxgBnXK0MznYF4dK2nGNFr9D2Pb94oNuviBOyBtSx
         EY+NAUfpd0Z6ho53XkOLK8xCLydzpDADadvsfwt6DdDJGadtqvCcnZ/JZDq/hPhm1xkn
         aGdMHEBbhomrRxlQpLvBi6NhbN3PnBnl/Eo0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525181; x=1747129981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbT2ahD6n7IJIA/hkl9Cgk/pyVc+H2AXLyHNEbzdhj4=;
        b=Knw/acntJCYzSRuP0bFCC+Sge4RNUroXgc1ITcYGITHgjwRgKFMXhMNX9zrmRSSX9i
         Tlk0Rl57QuhQKovviJZ5AAVFw30riSP2FLpRx2TVldPAIVZ1KEbb1E09eSJFQ/TNgRnY
         z7VuLmx71YC7heWGdgNbBWAeV7ThqyahdEr1HRgUnMCQqudYmkjNuObrsWhONZ3HzOWc
         ooIm1c27yc6ZSLbK6nZ6/uldIVEgASNf89q/lEUIGDiIhfY03XQZEB7PG++5aBjj+F8h
         XpsCPXW0w5x8Qgu15Wf6EjZE6ZiCxRSeJyfs+uMhHGYxsLwRLwDAZJ3oQsKHPfw3xscn
         QtWg==
X-Gm-Message-State: AOJu0Yw5jGLPBW5dPai7jyEe3/gU34UZp7HDBxNwzbUMpO6Tl9ECYZe7
	cKSMsQWSj3RB3TUDRypqk0RDSMRfdtmW2GJS8pYEuYeAXTNahQdLjD4XC4BUxGSbFNmRXiAOa9M
	=
X-Gm-Gg: ASbGncsY+7edQlwxm07Er/nbnOkTeEFWR47l9sqwDQ0L1oXJmGgptQDvqA/mA9BHwjo
	2ASEVrkBBhjY7QsFazjitv+oeWT+eJSqfkUTzHcXRBIn95HczyjRaBDnV5ZJVfL2KxVzjjmBFLg
	cYIr8jdDzaE7NMGhbP9B3i8HTagzMD17np8hCsOKDVyyl7Ezl7OyK0htnPVbClop5MbQc1TP897
	PGa4oT7yeCSSsSZX4dv9VfxZItbyf9i4G6Aa0k7MchiFUzjko1/EIgh4fXZJbf36w+IAJstxBsx
	Oc2QMWYQuC/BtyZwAWevvWdLnpr5g4TKl+qf6yGOjo7NCpWQLsWo/CMu
X-Google-Smtp-Source: AGHT+IH3Aw9R6eQGQyylIsisf/BriyDalEXmmHTIV0IM5P4uGRot/KrSe+pVAO+lSpHYSSWDHmWl7Q==
X-Received: by 2002:a05:6000:22c3:b0:39f:6d4:fd44 with SMTP id ffacd0b85a97d-3a099af36b9mr4255569f8f.14.1746525180660;
        Tue, 06 May 2025 02:53:00 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:53:00 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH 3/4] mm: use VM_HIGH_ARCH_* macros consistently
Date: Tue,  6 May 2025 11:52:23 +0200
Message-ID: <20250506095224.176085-4-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_025302_799927_F1A49F18 
X-CRM114-Status: GOOD (  13.57  )
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

Currently, some high vma flag bits are defined using VM_HIGH_ARCH_*
helper macros but others are not. Use the macros consistently so it's
easier to spot which ones are used/free.

To keep the VMA flags space easier to read and think about, VM_SEALED is
also shifted down from a very high bit (63rd) to a lower one (42nd).

Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index da8f99a026deb..b12549f0a6dce 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -305,6 +305,10 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_7	39	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_8	40	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_9	41	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_10	42	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
 #define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
 #define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
@@ -312,6 +316,10 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
 #define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
+#define VM_HIGH_ARCH_7	BIT(VM_HIGH_ARCH_BIT_7)
+#define VM_HIGH_ARCH_8	BIT(VM_HIGH_ARCH_BIT_8)
+#define VM_HIGH_ARCH_9	BIT(VM_HIGH_ARCH_BIT_9)
+#define VM_HIGH_ARCH_10	BIT(VM_HIGH_ARCH_BIT_10)
 #endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
@@ -385,8 +393,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR_BIT	41
-# define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
+# define VM_UFFD_MINOR		VM_HIGH_ARCH_9	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -399,15 +406,13 @@ extern unsigned int kobjsize(const void *objp);
  * if KVM does not lock down the memory type.
  */
 #ifdef CONFIG_64BIT
-#define VM_ALLOW_ANY_UNCACHED_BIT	39
-#define VM_ALLOW_ANY_UNCACHED		BIT(VM_ALLOW_ANY_UNCACHED_BIT)
+#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH_7
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
-#define VM_DROPPABLE_BIT	40
-#define VM_DROPPABLE		BIT(VM_DROPPABLE_BIT)
+#define VM_DROPPABLE		VM_HIGH_ARCH_8
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -416,7 +421,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	_BITUL(63)
+#define VM_SEALED	VM_HIGH_ARCH_10
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
-- 
2.49.0.967.g6a0df3ecc3-goog


