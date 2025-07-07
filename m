Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2078FC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUXQYJBwA1uXvCLtyUP2xQTMFYJ+RrG3hsh4utkJxmY=; b=w6IpvSN+nkcrPhC5wi48GdjCaD
	YEvYwnJlA1Cf5VKwxdpSuzZWwPHAr6VaBF7hVxARomo2LcRRQf2wQlqL8EwWrm786xOTaWqQwKpwM
	BUTuizOCOuqjqacQv0zvYU3Nptt//rlmrqBxrXBw7zDLBOyN1uUJMlm8RGGsTnQ7bnThCnbOi+skB
	kEURPpdFXg9/uYh4MO0SirXenU5lKL4WJM+eFMKdqNUECCeq3mRmKR0UoU3ILxrT2l5uc801NLCAy
	3Gl07sAwG1lmOa4K/Z7at4c+s+4QH/fGybGJDhI6ZkxkxdXtxUFYGOqBVoAUaOdJeNt0gfWrWETrc
	U5tdmOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYohV-000000031HL-1kfU;
	Mon, 07 Jul 2025 16:28:17 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHR-00000002xB7-0fYZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:22 +0000
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d7f2600c17so203366185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904080; x=1752508880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUXQYJBwA1uXvCLtyUP2xQTMFYJ+RrG3hsh4utkJxmY=;
        b=f6ll3NIjpi7awYUI8ARMpr6XxGeGUERiKYrGR60fwFSgidGPoEscQ/3iMmZjGSPCNB
         aR6iMP0wA34GO1/MhYeYufBTo9iSOkR+a4Kv13T3Mj2kMHQbwsG9M3hRdqPVkmar46P5
         aFLX9z6KMiwEKsuiBmVnzjx2vUZz3yjTjUw/k+2BhYXOpL9nyyzO9Dp7Ewru3Lb5lWi3
         a0S1HW8uG+e0dHPE2QJzhBsd3YUvsbzvdanE4TVNykmzdzs3qlkwcMz5LUqSFGVFoxTC
         Uq7QQ6/msuEyJGaiXxXPUzWWpS2o49Rvn2RIZp4DrX8WI6pVWvlwQqd97o9LDYQfdBsF
         gF8Q==
X-Gm-Message-State: AOJu0YzkGloqZ49/7OjIe/dDMNGJGuOsAaLKITIUf8ZYHx2LAnU9Q7vh
	hJ5j9Bw8G1NnHio+hVSubA1xARlL12bEr/vMO5/Rnep7S5JcZPeIaj1V
X-Gm-Gg: ASbGncv90+Aig97pAZQ/DUQDAMUdYZCkzCFWqSQJ/z+jaMaBz8H8kkf7JmNYUleFFSZ
	9KJChwFkqH99AQHY+jXvtqfABvRsAxbgWYVz55BHkGMU+pMrnPFcOaaFMcJ3mvdF5xHR3Um2YcI
	2cTshS6LbbldMobQWGT3ICwQDdycXUUkFot15gOGwZnj/hOo1uklYd8C8JR1328J3dWOmldZVoP
	U8FfppQAPqp8/93WKm+dvbYqD/ICLtr57gSDFy0QCTI5SLGjhpkedjSuSMZ/Mg0mfYIF45CB+ba
	R39zrGj6q1b2GQJc6eSHNEMyaNlAye9bC+mVFq68ywSkjYb3NzZpng==
X-Google-Smtp-Source: AGHT+IEYTHvTkTF6zJvYOnCbSBqGLN3AcGqauqLf5dj2dNagR9TYhmsTSLG+AMquAUaI9gWUZKIT4g==
X-Received: by 2002:a05:620a:40d3:b0:7d5:e3e9:72ef with SMTP id af79cd13be357-7d5ef4e251dmr1463325585a.2.1751904075735;
        Mon, 07 Jul 2025 09:01:15 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:71::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd93f73sm631776185a.4.2025.07.07.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:15 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Jul 2025 09:01:07 -0700
Subject: [PATCH 7/8] arm64: remove CONFIG_VMAP_STACK checks from SDEI stack
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm64_vmap-v1-7-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=leitao@debian.org;
 h=from:subject:message-id; bh=XwtnCAizPM4mNONRdmM+LWN86wthex6fymK/baD6ebY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9Dn4x8YaJSTfJb7G6Cqhkv+jOC8ONk9zFsQ
 iJ/WqLC2JeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQwAKCRA1o5Of/Hh3
 bdBaD/0WnjGPnhJAL5zph1bBb1N+rPYW83xmPGrHb/uE8ea/eHdf9sjhMixTh4XIS2rWn+BoJIJ
 yrzVYU9b1GCCy7EKVnZR57WdC2QjLYLIy+06DrLmMFP9w/HgXYBNyZlqkgrLySg/0iLeSe5YITF
 ZtoyaK89w3z4ZWgZHxssNnOU+CtqEpWGAdr7ABlGRK+tMTWtX+OWgkXsJ7YlgLusVoCF+Q3BQnM
 0/kceN+nBMjFrTcHcFdR51pHofMZWp52FXcLcME03j8CQPL9v4T29LSXMix2fthIGSt9k7xnQBM
 pRsh5Yl61agtI3jd9uyaIX39pp/T/+XP1pncmXsIISPjH7b0NJ/zK4grwB4pn/EwNHCsNAPCVDx
 OBMC/JXUq37wv3Kh+g33WR5IVJAD0dVIW4gqayr/eZsYfmaN0ZLcJlwfyCz94gbA+FlhSQ3AyMr
 epM20hCAWFByqbyBUdbtztTy1GvCqfkds1S3zU2KRNO9Y2gsLfaoj+6JM1tMxc/xau43Bn9CB2D
 D+pRSiXs4WoXkXdpxN/khuJeTxOAmFRvwSqtLX9uN91LTS3FPLjhubLBMogjtKnxBhCI+P8st2A
 ZnTYEoi0LeqOBkd2WB5VHzThRHEg4nsWc03pJbFqs5oqrHMAUIuRjaKe8ll+6fsTvBztX/qR2YY
 oSuXfvD7AMaGXmQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090121_200918_514BD057 
X-CRM114-Status: GOOD (  13.42  )
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

With VMAP_STACK now always enabled on arm64, remove all
CONFIG_VMAP_STACK conditionals from SDEI stack allocation and
initialization in arch/arm64/kernel/sdei.c.

This change unconditionally defines the SDEI stack pointers and replaces
runtime checks with BUILD_BUG_ON() assertions, ensuring that the code is
only built when VMAP_STACK is enabled. This simplifies the logic and
reflects the mandatory use of VMAP_STACK for all arm64 kernel builds.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/sdei.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 255d12f881c2..6f24a0251e18 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -34,10 +34,8 @@ unsigned long sdei_exit_mode;
 DECLARE_PER_CPU(unsigned long *, sdei_stack_normal_ptr);
 DECLARE_PER_CPU(unsigned long *, sdei_stack_critical_ptr);
 
-#ifdef CONFIG_VMAP_STACK
 DEFINE_PER_CPU(unsigned long *, sdei_stack_normal_ptr);
 DEFINE_PER_CPU(unsigned long *, sdei_stack_critical_ptr);
-#endif
 
 DECLARE_PER_CPU(unsigned long *, sdei_shadow_call_stack_normal_ptr);
 DECLARE_PER_CPU(unsigned long *, sdei_shadow_call_stack_critical_ptr);
@@ -65,8 +63,7 @@ static void free_sdei_stacks(void)
 {
 	int cpu;
 
-	if (!IS_ENABLED(CONFIG_VMAP_STACK))
-		return;
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
 
 	for_each_possible_cpu(cpu) {
 		_free_sdei_stack(&sdei_stack_normal_ptr, cpu);
@@ -91,8 +88,7 @@ static int init_sdei_stacks(void)
 	int cpu;
 	int err = 0;
 
-	if (!IS_ENABLED(CONFIG_VMAP_STACK))
-		return 0;
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
 
 	for_each_possible_cpu(cpu) {
 		err = _init_sdei_stack(&sdei_stack_normal_ptr, cpu);

-- 
2.47.1


