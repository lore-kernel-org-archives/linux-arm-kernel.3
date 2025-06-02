Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E792EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYJABjVP2iDArJLMl5gj3ep5scI8fjcxHEMsai9rZ0Q=; b=mTMIId3zrPz4PDpclbJkQZ0fvn
	bq8jxePI1ERFQBUVPDosFBCvVkBeP0AdrIe6jQLnV1NTFrmBcZXmyHZbhA3Eyd2RYChB9fLnrx3EB
	l0gI9EcUxhqaolKAFzq0COOZg4j6ovOayICPI8vR5iCYXfRTgxAApmh4MOEcOYYexvSP479rMriG9
	w/DOmR9t17uCuxNZxedyJbaS42eXKtmI+Vo0XA6+QhSyN42ihRefEgBo09VSD2yhhr+UDvr2Xjb50
	NyXZW1tScITuzE4aFaXN09IIwp/3AivYNdSNXEPJA2RSAQBgGuqK8dd+nD3C5eSpsbc72eolrImvW
	a+tguc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMB7o-00000008aiu-3myc;
	Mon, 02 Jun 2025 19:47:12 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqH-00000008UEK-3SnO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:06 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddaf7f2fcdso14026185ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892544; x=1749497344; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYJABjVP2iDArJLMl5gj3ep5scI8fjcxHEMsai9rZ0Q=;
        b=fyasyPC9rt6fgHk6bcRUBh8Cgccw2EfIhnk4pWBrJJgfs2k1LGt6vYd0n3OVakbrpw
         yNYteGlwVLMcqDpMvwzmxTu6Fo01o1XidEaoC/jAMjZXOyrvunb8/C9FVy6HHkji25oo
         BWeoIOS4rXrBEoq3Gw1ATdErLbjIB8dJAjZjL77dQXmh6R3eikWnStX+eyywJmL2IIAx
         S+oQ3ovg7X3RR9sgylGQPX3AdU8nbRKWA4EwJxZKfgmORAkIT8CVKO6OlvAe053tYNur
         MG8u0N92E9pevdBonwKREQ2HZVxjSz/YdQEsZ7IZU/GRvlm2ISl52FCH8nksqltJ7HeG
         CI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892544; x=1749497344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYJABjVP2iDArJLMl5gj3ep5scI8fjcxHEMsai9rZ0Q=;
        b=cg6ESygIynF0c2bOn/za6VDPgUnWyCMne4kAQ/f6yQv4hQSx1lVpFsRC+MxJSaFAeo
         eF7pJYIDiH20ieuELzi1Pl7k0M8e+uINCQeP5f+0j+wOCSveCf5C7dNkeYqccvDCG2Fg
         6vyz5MjnThJ3n9weajDEciYYCYcA9CL68HRKy3bidcF7grZxG6goehDTC237J+N/2+Cr
         MD0y9jGgYJFN2I/UA2zBjTeJ3J6/Z5GAROUliC6QQA+6RpiU2Q9xK0k5cb0p02yelad6
         OtqSnxqjzu070Qbhju15uvFLiLTZgHy4+5Yyp1WbbezhFR75q0bPQWVbxkvq+6uvySGk
         7n9g==
X-Forwarded-Encrypted: i=1; AJvYcCVuM0uZ8OtDy67mMeMTB7WXmWld0YidAbG49x5yHGOoay0+Z6rdlDuQFo8Uhz+KXBhL1l51ZAxbjKrpSG2GNRuR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7tMPwvwREAl+UGRi3LS3+ZUi+V5WItMDLiQWg/JYfjb95tb95
	OCCjVM0H5cC7+ORxUj8J5gWqEgWWR7ETiJSVyOMXJBjv7lb+25vN9QPJn3qKuMguTvb4/emF0YN
	Qh3gy1tPYT4SynfqJ5Z5sEBkHwA==
X-Google-Smtp-Source: AGHT+IGg2rWIw4S1SBhgIdtyOl3kiwsQOgXvBToZBQsbPlELmXsPKjt1+hk3s/Rllj0rwiuIByf4uJq1ToD1VufkVQ==
X-Received: from ilbbf17.prod.google.com ([2002:a05:6e02:3091:b0:3dc:a282:283e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:b46:b0:3dd:89c4:bc66 with SMTP id e9e14a558f8ab-3dda3342b61mr86473295ab.9.1748892544754;
 Mon, 02 Jun 2025 12:29:04 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:52 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-8-coltonlewis@google.com>
Subject: [PATCH 07/17] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122905_875755_5A9F4114 
X-CRM114-Status: GOOD (  13.24  )
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

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index e506d59654e7..bbcbc8e0c62a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -502,7 +502,7 @@ static void armv8pmu_pmcr_write(u64 val)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -738,7 +738,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a2..fd2a34b4a64d 100644
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
2.49.0.1204.g71687c7c1d-goog


