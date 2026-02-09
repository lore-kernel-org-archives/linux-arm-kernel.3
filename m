Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CA4E9461B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imeQaLzXrnVqs2xwe1B4fumETENHcf/y9Tb2xZBjKCc=; b=VtDTwfoxn2iI3WUd26p5rurbqQ
	A+Eb5aZGz0LJydqF35KDiwiwXY9rk1rZ0DY6diFvCiROOEBghlthU1nwi4qrgAzN0epkuddPIglAF
	OdmvuLp5VWr2CBVbQxtU6Z9SPPtNsXaroDOYeKI4aCF6qDyzns2q+an2hehgefgTXgFlA/qHUpYP5
	oKpgTkeZ3LmnMEJk/Ls9LkR9l/kmX7gnOocKco0UoXFweggeN/9nNhf4JZMXCau1MikgEJtQEqy4K
	SDyxNX3Qiq7/dEmM6aGkQMRqrze0hmKNIIIU1bSyjR7El4+9uK2cO8XgVEA4xLoRsb1emriS8HwVr
	wCl0g8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwH-0000000G7Tm-2QSZ;
	Mon, 09 Feb 2026 22:41:05 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZw3-0000000G7Jp-0d8a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:40:52 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7d1936b8a7cso1075832a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676849; x=1771281649; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=imeQaLzXrnVqs2xwe1B4fumETENHcf/y9Tb2xZBjKCc=;
        b=nNBYMkN09sH04urVrhJi18REo14N2CC8FiSKCrc0Gt4hcqYKfsGhoYhedVoEDtOTE0
         s8K6jEBjDLhghNHQtwIqxt2G1X/r0ACXYNO4pleaTSC+9+H060wYRShsgzTc7LH1nBJ+
         J4lsvMP1e1mvfGChCeOFkEiRjBnhyExfZFVmougcsHRmpNhs1rA7KRCucSh6EWEh6u6v
         DDwbMx4rJWCcNh72Dc5uFq6l2NLe5aFEGCGuBJmDbgZHoLtbJpdN4+rni09sh2KZJuAS
         rFYAjFET2dnY7cvyHjsFCMrc26CwblsqCpWkl4zKJrxd+PPTgW/REjn9Iq3FWJiloKxX
         ipBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676849; x=1771281649;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imeQaLzXrnVqs2xwe1B4fumETENHcf/y9Tb2xZBjKCc=;
        b=Mo25pSFhjaAUEVK541/96s+ukhpvqwMsqXA5pIT0HK65/dqh8mvNtqybNZTW+rhzI0
         sAmKE25kuQzniUWfK7VIkveYVxUjKyOuDXJhU18RzRz9l2GOPGysua6MXYexen0qhrc3
         bNlTvNYK3ZAHHHYWaPnE/ZQbdnPs7qRNk45x2kLgbVted8X+T5occDWIO/pp6tjqMj5a
         NtJhhGAWJz4t9JBUWVKTjxW7dVFjAaroeuWXYz1yb4F9yRKgjeFks2u9K5KMlMoiwy2e
         I73L+sQs/4iDyhXE/l0lGppk4W9fs5AeXh2JZg9tagvbvBhE87B77LyTMCX+TamI/GtY
         xitg==
X-Forwarded-Encrypted: i=1; AJvYcCUux8OVbzkuqlxCygXdzGt2CCDMgfLQzepcUFTqMPgZ4THJh2x4wg2lQldE6SMBkSsmbt+CBVEw3/2f1EFyT8g0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4R8aI/0ILtT3/gbGQ7AncIvXku3pTVC6QYybg2pbxH/4Q075t
	c55xOyLujbKp+75JxM+NryDMOoMHOEGIZIOlW73DV4kDt9IwwMq4OfgX/VbTuH8qQpEba1j71Kx
	yZxogssefhfl+mxm6Np69xcsYiQ==
X-Received: from jabfq6.prod.google.com ([2002:a05:6638:6506:b0:5ce:3e9c:22c9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:3088:b0:662:f61e:759d with SMTP id 006d021491bc7-66d0c666b89mr6055036eaf.62.1770676849224;
 Mon, 09 Feb 2026 14:40:49 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:00 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-6-coltonlewis@google.com>
Subject: [PATCH v6 05/19] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144051_216965_134AB435 
X-CRM114-Status: GOOD (  12.92  )
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

The OVSR bitmasks are valid for enable and interrupt registers as well as
overflow registers. Generalize the names.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 798c93678e97c..b37908fad3249 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -546,7 +546,7 @@ static u64 armv8pmu_pmcr_n_read(void)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -782,7 +782,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a27..fd2a34b4a64d1 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -224,14 +224,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C | \
-					ARMV8_PMU_OVSR_F)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
-- 
2.53.0.rc2.204.g2597b5adb4-goog


