Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE47C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8diYz1cAxVXL8ty4tojeoCAMG1b3MlycRIC3CE5RSGw=; b=Euqsyw162y7e4V2YzdMQOQyXIj
	aZiADatO7B+gvlb00/0Mm6Fzse4keZ0N2HEioG3ySRUQHhUs5WAHG4dHEtKqS1CPUChGfGnxIMkja
	T93iB88O0xh9ngPKF7QPOfbmY4L/so1sPfCFwSGJG85rJv1Xu6unEbRS7gwNV2ieehtMEJmWs8gAZ
	VDpEGjtUHrqb1ic9VFHvJe8rHjpZJWwsD1CaURA7LMMDm3xw4EteYUbi1iTJPUGzvD1l9rMplu6Hm
	2/v3vpyMRkLpxz/slCnRUnzX5XglSPf3CGFkt9wpL7ITIEPhoSFsdDd7ef+F/HVnfEakxw7mGIsR4
	B8Iisyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieUx-0000000CKqv-0tQo;
	Thu, 13 Feb 2025 19:03:43 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidaP-0000000C8d5-1uGU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:05:19 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-3f3d417cb65so366760b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739469916; x=1740074716; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8diYz1cAxVXL8ty4tojeoCAMG1b3MlycRIC3CE5RSGw=;
        b=RfAYaG8HacA1Az+RFxXTkCV3zgLMEHcHeqYIc7ukkipJC6d9238nFOGmgXielQ2ylm
         yx2rn16Sv/t/Huo7JDsP4+dI0crVVSx0FPwn2QDU6j0Y9b1zKujCsaidLoPLarT8RWAk
         SMrvEmQRg03YaLIuOiudlN7pv2aaZi69BaV+XBoWqNmWoe5JI+6QXeMfGEyep8n062cH
         6fSqmplfK467St3RbXuYDmkVOUScfSL7gvJBsYCsNANN6iDBme53oXk76xeXqMiu8SMi
         8xbqirMEz1RJnGMpTwDWNUOPvNHSUrLDinIreKpB8Eqci2DkuqKf0ds5DKycS6ycQnpe
         iosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469916; x=1740074716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8diYz1cAxVXL8ty4tojeoCAMG1b3MlycRIC3CE5RSGw=;
        b=dw2eLUgbbJb1hNqhEssxKAGadaK6ss55WnSnS3fFapvfYJlFp1OLPnv9J0cQ4G8Nnn
         y7Hx1d9c1RWvVAbUVpUyEGxTVlL3aqrOP5xWBzww1qmzMUJPOpXE6RJEYBR6g3xbPTGw
         dE8ryVAb9S5iP+8nHkY6XQpYSdiShXlOf18aJGHyDOHKd3tylI+qaVE3gXVZkGRfS+mq
         LJ8FKqHhTT2xspzFOT3gERcu2QFK28OnMCxKLNmOXFFUDd/4ACMxejEB236whtEFCVuU
         4aQi3PHgypKCV6LEXy/GUjoYpIR+Tfalt1mq4qAjLuuom90UThihj8JB1Gn7ZmKtYwQs
         B5qw==
X-Forwarded-Encrypted: i=1; AJvYcCW8uQrW1IHFwwd7T63Mmg0VhG2KACquIgC4TJ0Fu796Po97J8da9hs+P4VzQ5YslSgAhf9LzmXwZWtyEF+LJWuC@lists.infradead.org
X-Gm-Message-State: AOJu0YxEiEw0PcSifD/vc5bTQhlYRsTz/fDRdjKAJ/HQQ3b6LH2s2KVT
	tU0mqDFrlS9/+qMQSI4auv1sBrJEknYsPKZttmfHKK6XcmdaPzg7DXy/KNs/CpDDqaEJlOwvt0G
	n9iu9i4wzBe4VKB9E3mj7xA==
X-Google-Smtp-Source: AGHT+IFtzf5pcp5r1tyE0JHhxeZ0XLYC1m++VuQDuMxIrOxQ8Q/cXtGme3LXnvndLb3NfHZ76eNG2gQDi5BgD5rSnQ==
X-Received: from oibel5.prod.google.com ([2002:a05:6808:38c5:b0:3f3:c8e8:d97e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:23c3:b0:3e9:2090:c030 with SMTP id 5614622812f47-3f3cd9df52amr5725988b6e.25.1739469916055;
 Thu, 13 Feb 2025 10:05:16 -0800 (PST)
Date: Thu, 13 Feb 2025 18:03:10 +0000
In-Reply-To: <20250213180317.3205285-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250213180317.3205285-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213180317.3205285-2-coltonlewis@google.com>
Subject: [RFC PATCH v3 1/8] arm64: cpufeature: Add cap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100517_490392_14327EE0 
X-CRM114-Status: GOOD (  12.31  )
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

Add a capability for HPMN0, whether MDCR_EL2.HPMN can specify 0
counters reserved for the guest.

This required changing HPMN0 to an UnsignedEnum in tools/sysreg
because otherwise not all the appropriate macros are generated to add
it to arm64_cpu_capabilities_arm64_features.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 8 ++++++++
 arch/arm64/tools/cpucaps       | 1 +
 arch/arm64/tools/sysreg        | 6 +++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4eb7c6698ae4..396327b4da7d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -538,6 +538,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2842,6 +2843,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, IMP)
 	},
+	{
+		.desc = "Hypervisor PMU Partitioning 0 Guest Counters",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HPMN0,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 1e65f2fb45bd..9242e460ebe6 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -38,6 +38,7 @@ HAS_GIC_CPUIF_SYSREGS
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1
+HAS_HPMN0
 HAS_HCX
 HAS_LDAPR
 HAS_LPA2
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 762ee084b37c..35aa5f6476b9 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1240,9 +1240,9 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
-Enum	63:60	HPMN0
-	0b0000	UNPREDICTABLE
-	0b0001	DEF
+UnsignedEnum	63:60	HPMN0
+	0b0000	NI
+	0b0001	IMP
 EndEnum
 UnsignedEnum	59:56	ExtTrcBuff
 	0b0000	NI
-- 
2.48.1.601.g30ceb7b040-goog


