Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C942FC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AArfjhux8w+v9l0Rc0rtYFYmlM/gfFMtOPPaicduOhY=; b=VeJEiaddBq+xsA7JdKhKSoKfT3
	qS/C6S/53DD4xoI5ctkgLbqrdAXz+Drvv8DoWR72fyGGe4mSxxDJ3HCyTjcHjU9wvmH0aiIzmWeS0
	ByD5FIZtaCYejObJduc7ZEEYj8J/pLa/uU+GcPF2QC3G2gcU6kTJGWrKkySemEvUa80dSL9uXiMZ3
	zpAX4VJMy000jsP1MIFFGjQeKdNJ7r/k04QbWIciditlkRxQnxjjAWTtSG2Y8Wb5HDkH19HqG6CMP
	mlVRMCVybL8sulUKW4b/dNyOEAAEyEmUVGnrA6k4xWyDZBVW9pI+cQIRXgmBtZiNnAMz0nEfMKYAs
	YhuyIRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMVJ-00000002qAO-0V02;
	Fri, 08 Aug 2025 12:47:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMLy-00000002p6R-49GM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:37:48 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4538f375e86so16690935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754656664; x=1755261464; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AArfjhux8w+v9l0Rc0rtYFYmlM/gfFMtOPPaicduOhY=;
        b=Haj4hpieFzhPcYG8lm0ZprvYLBxs4cfYAig5xjsHOf4gyXFWiTUy2l75phdGPVdVFv
         xIfDUlmpCes8va/aQAD4YDh6obaIg/OXPPzf2BINB4RipMvezXFkMBHkctjQk8f1v2/l
         wECAmhgRJUKC+yTsuVZyxyau+OlQYLhhAH5RV/Umh4XpNM/Ye8z+/jvbREENxXui+3DB
         32Aenp3ihLpGITuc9LGPqp1AmaIcPZVlji/ehu754wdW44EB8ndkfup2/EJhPqE8bUlO
         mKoiciXndH3WjqcsP5lLI8CtQ5rBVCbKr8Lem0pCO/ye/mr/wMROJTVOAvQlbGQ878k3
         /PJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754656664; x=1755261464;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AArfjhux8w+v9l0Rc0rtYFYmlM/gfFMtOPPaicduOhY=;
        b=mnrLy7+CCb8NFs0KblucjSTgb6OrmsPCRAHUoygQGbc7QmiTygmLfHqwpsMbNqzuZl
         xsjmUE91r8U59np6Rhcq62eV5cJqxKWczrByTr4hdbUbUJgqZTd+UR74ToupOt49OUU7
         kp8xx9Fff3t3IGepaZM2VMsycgNa90JIYYZ4hFCdmWNKZZcuH3WAT4Yj9zGbAjYR+7yh
         3zmnP4h4XRMWF3DVxn7JcAWyrwIwOZVC7mTUfrdSFGFi9iTgh8XZRks0fuZY7QIdVDzQ
         vNUr2Tyu5kDlZVwGkMgNT2gwMksSoWKntDvAaLaAfIpKnD/LQHTY1COzIPWvjh0pFzVz
         7shQ==
X-Gm-Message-State: AOJu0YyjAsDq8aqXKVh5SjcZaXVYsV6GHM5pvBEMhwE2WSDqzmmFGKE0
	Z/0l4m9Bat+HDJKmwhr531kr/j+cOqSnDg1/q2t2/NnD8BksdQ8c3rZc8xJdTNq3QzT4HG6R+yT
	/FfLz5DUZXWU5f45yNiAiNdxwEYcmDCOs5VbF/GkDIALlA7eQH59v1wbc4Bi+uI1cm7PfVH1vcV
	hGvbjqP4d/Pr9D3TbTyuJvgKRCyrZw/mY1Q5B3ocha8x0nQ+8XUw==
X-Google-Smtp-Source: AGHT+IHeWfHn5Tg1OH+wwZCvg0IM5vAaU7Z246Mo/MbEp6mAe0fhcf2lS5niiPJtdTBzi6COEkCPWb5wvg==
X-Received: from wmbep10.prod.google.com ([2002:a05:600c:840a:b0:458:c08e:f549])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b10:b0:459:10de:551e
 with SMTP id 5b1f17b1804b1-459f4faf9b9mr22145285e9.27.1754656664587; Fri, 08
 Aug 2025 05:37:44 -0700 (PDT)
Date: Fri,  8 Aug 2025 13:37:43 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250808123744.2087648-1-tabba@google.com>
Subject: [PATCH v1] arm64: sysreg: Fix and tidyup sysreg field definitions
From: Fuad Tabba <tabba@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	broonie@kernel.org, oliver.upton@linux.dev, anshuman.khandual@arm.com, 
	robh@kernel.org, james.morse@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_053747_025630_4C7607FC 
X-CRM114-Status: GOOD (  14.65  )
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

Fix the value of ID_PFR1_EL1.Security NSACR_RFR to be 0b0010, as per
DDI0601/2025-06, which wasn't correctly set when introduced in commit
1224308075f1 ("arm64/sysreg: Convert ID_PFR1_EL1 to automatic generation").

While at it, remove redundant definition of RCWSMASK_EL1, fix typos, and
convert the only instance of spacing with spaces to tabs.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
Note that NSACR_RFR isn't used in the kernel as far as I could tell, so
I didn't add a 'Fixes' tag.

Based on Linux 6.16
---
 arch/arm64/tools/sysreg | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..475494d65306 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -31,7 +31,7 @@
 # Mapping	<name_EL1>
 # EndSysreg
 
-# Where multiple system regsiters are not VHE aliases but share a
+# Where multiple system registers are not VHE aliases but share a
 # common layout, a SysregFields block can be used to describe the
 # shared layout:
 
@@ -54,7 +54,7 @@
 #
 # In general it is recommended that new enumeration items be named for the
 # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
-# item ACCDATA) though it may be more taseful to do something else.
+# item ACCDATA) though it may be more tasteful to do something else.
 
 Sysreg	OSDTRRX_EL1	2	0	0	0	2
 Res0	63:32
@@ -377,8 +377,8 @@ Sysreg	SPMOVSCLR_EL0	2	3	9	12	3
 Field	63:0	P
 EndSysreg
 
-Sysreg	SPMZR_EL0       2	3	9	12	4
-Field   63:0      P
+Sysreg	SPMZR_EL0	2	3	9	12	4
+Field   63:0	P
 EndSysreg
 
 Sysreg	SPMSELR_EL0	2	3	9	12	5
@@ -474,7 +474,7 @@ EndEnum
 Enum	7:4	Security
 	0b0000	NI
 	0b0001	EL3
-	0b0001	NSACR_RFR
+	0b0010	NSACR_RFR
 EndEnum
 UnsignedEnum	3:0	ProgMod
 	0b0000	NI
@@ -2441,10 +2441,6 @@ Sysreg	PFAR_EL12	3	5	6	0	5
 Mapping	PFAR_EL1
 EndSysreg
 
-Sysreg	RCWSMASK_EL1	3	0	13	0	3
-Field	63:0	RCWSMASK
-EndSysreg
-
 Sysreg	SCTLR2_EL1      3	0	1	0	3
 Res0    63:13
 Field   12      CPTM0

base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
-- 
2.50.1.703.g449372360f-goog


