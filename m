Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE34D41C1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUUJO08oM+ZIak4io3fwTWUbAx7PbiFis0a16dmFfjI=; b=AtnXAAHb/fhttjzpU+8Ed3REBr
	07DHO+dJvEnYUoaZQCH+VONuGd5nQGjGOaXVc83v9RBGMr03HG9a8di6rvFxjJwrFWqgfunA6Imty
	o1A9aUhQRRZH2e+B3+OzISLaba9sUhbjiKj+xBq4E1mmUoljwfGM+YRbxR9/bL0GV5N9gxM9nG8Ua
	5GE6pXK4C+uqqAeXQU5bUinfU9R0/MI+YobQaoW9TNXu2lDe50VRoiFJeP/R+9T9R6vRblKqKD8Hj
	NBz6auQCLEJmQ/wo/Wrhf2GuEGkFuRan9SNPK7DSSGwBqozkUXIhsBLnh3L1Kg2HIb7hCmgRMMois
	CsII2gUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCk-0000000GUz9-24zF;
	Thu, 11 Dec 2025 10:47:26 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCe-0000000GUqh-13rT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:21 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-649729effd7so812637a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450038; x=1766054838; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUUJO08oM+ZIak4io3fwTWUbAx7PbiFis0a16dmFfjI=;
        b=lEkvbfbMCUMefzobqqpYINOB0SrD4wbIFko7MWswINN+6Sdt835n+1pmIVr9nEP6Jn
         5LknyJZXdKk3/su4s48E8rlcOl81k4fL6RgFqDXwwjLywSGkPNYlcj+pbyqwpG+iGRta
         jLpXjJnUp9Li9oTI4J+LA6QkByuLylTGmjhaO20QBoum+HgVpxx7CuNGmmKF2e8z9QFm
         ZgMX4AEw2Wb7qH8dwCEVqJ1uMuNR2cBRhnS9O3QOtox1CLLous2tz3ACsBZc/4BarZqC
         S9CNmGxQBdDZDI0/SpZic++F5MWeZu/Qd4G7BUbjtlw+fBzAX0NExc+12YqNOP+5362o
         wL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450038; x=1766054838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUUJO08oM+ZIak4io3fwTWUbAx7PbiFis0a16dmFfjI=;
        b=YtELA3EkyVnHo92a1aDeTg6kafHVIqfB46Bci95O+1adkIjRe6xEhBSVSq0Ot2wOVe
         2Mx6g88rn8kRRIa6iL0ZazKAMuD22iOIsF0OpmeRbEGEFNVGhH4nUPdaaHWgTKU/61pk
         REpfuMp/TXGaoje+mjmqjG2ZOj+SfZVtSUYmy5zQquEIaAApxPonehabAvMzwkhE7WJ4
         nBbbZK1wksXs33i948Rn4mh16N9DY+segCOVMtPSYUleYlhL0UEJEeWjQXRxrJX+ci9R
         MQ+zg9vuUJ3nxcJ9KBjvT5/GDs0JD4qBdm70yaQNYePhUJ6642sEllz3qziKICrKur6g
         mJqg==
X-Forwarded-Encrypted: i=1; AJvYcCV3XtsYsBC4RbYf+aXrnXjRV18DpLWsfeCNEUb7wWqkIbQLpEeqkhamS94cH1R7MvMKO2v6RwaBxdWjR4Tt/gyi@lists.infradead.org
X-Gm-Message-State: AOJu0YyvzxtZMzoqFSyPnftb4/cOqw5D42Iv2rKDMsl1LdMxsc4DB8U5
	+yjwECZfVT8SOmRDWBI3OX9hfn3yw2nquZmN+7Za+JAi239mgs1rxTcBY8dUrz26GneFtQVIwzR
	Lvw==
X-Google-Smtp-Source: AGHT+IEarHaHYeX8TaRF54z2z76wqA7owm+qT+LrdA1o1Q5fRCRwCa8o4E9r6jCnF+jUICEAkFE1ff4+iA==
X-Received: from edf1.prod.google.com ([2002:a05:6402:21c1:b0:649:7070:60b0])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35d2:b0:640:a356:e797
 with SMTP id 4fb4d7f45d1cf-6496cb90e08mr5358305a12.13.1765450037542; Thu, 11
 Dec 2025 02:47:17 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:08 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-9-tabba@google.com>
Subject: [PATCH v6 8/9] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024720_353221_30F44A8C 
X-CRM114-Status: GOOD (  14.54  )
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

Certain VM IOCTLs are tied to specific VM features. Since pKVM does not
support all features, restrict which IOCTLs are allowed depending on
whether the associated feature is supported.

Use the existing VM capability check as the source of truth to whether
an IOCTL is allowed for a particular VM by mapping the IOCTLs with their
associated capabilities.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 21 +++++++++++++++++++++
 arch/arm64/kvm/arm.c              |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 5b564576160d..0fa8c84816fd 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -9,6 +9,7 @@
 #include <linux/arm_ffa.h>
 #include <linux/memblock.h>
 #include <linux/scatterlist.h>
+#include <asm/kvm_host.h>
 #include <asm/kvm_pgtable.h>
 
 /* Maximum number of VMs that can co-exist under pKVM. */
@@ -43,6 +44,7 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_SVE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
+	case KVM_CAP_ARM_BASIC:
 		return true;
 	case KVM_CAP_ARM_MTE:
 		return false;
@@ -51,6 +53,25 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	}
 }
 
+/*
+ * Check whether the KVM VM IOCTL is allowed in pKVM.
+ *
+ * Certain features are allowed only for non-protected VMs in pKVM, which is why
+ * this takes the VM (kvm) as a parameter.
+ */
+static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
+{
+	long ext;
+	int r;
+
+	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
+
+	if (WARN_ON_ONCE(r < 0))
+		return false;
+
+	return kvm_pkvm_ext_allowed(kvm, ext);
+}
+
 extern struct memblock_region kvm_nvhe_sym(hyp_memory)[];
 extern unsigned int kvm_nvhe_sym(hyp_memblock_nr);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 1bbba79e2686..d9a8745d0bd6 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1921,6 +1921,9 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	void __user *argp = (void __user *)arg;
 	struct kvm_device_attr attr;
 
+	if (is_protected_kvm_enabled() && !kvm_pkvm_ioctl_allowed(kvm, ioctl))
+		return -EINVAL;
+
 	switch (ioctl) {
 	case KVM_CREATE_IRQCHIP: {
 		int ret;
-- 
2.52.0.223.gf5cc29aaa4-goog


