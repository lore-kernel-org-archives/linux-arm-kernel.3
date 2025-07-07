Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7687C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wI06xDd3KMPf7PBFbeho4f71DSOiqWBSCgPPOMFntI=; b=yoNOZZ8aWgnOvDYFo5A5I1L9n1
	vTCReYE6m0ZpwcbhO0YG9rVX82axxuufnYPHK/e48KMGCZYlOkAbfxvD+7+9RygiG01whKjJ8jRZd
	S2AL+7J28miNegD5WqVlLRrDRug6surcD4Elz2eVhs0BESVRWPgKEQr1tmCiZA9u0WgNaCXMu88mG
	qI5CwCoLmDvGXpJ+Qz34ln70zSG+aYW+p+ATc0+yPBu02A5S7n+ykIuVB7I1MShXrXglQ97BEQZ2A
	CmxhqMYvC4jKPFntlvuU17w2yqcjHVJbHaiX95AUNULhARLj6kfVvGmKF/Gcil3sasRcaR6pGJiSz
	+jl3QNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoP7-00000002yt0-1kUg;
	Mon, 07 Jul 2025 16:09:17 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHH-00000002x6z-1F4V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:13 +0000
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d20f799fe9so407136185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904069; x=1752508869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wI06xDd3KMPf7PBFbeho4f71DSOiqWBSCgPPOMFntI=;
        b=Yt/VYXGJHz2jElWTWbVcCfiPltkI+c8cD7dZkq8PCBklzHtpjNKWFegRyAdD/Ur6Wl
         SrOYO7Qigd6zdprnfJxcuf4II1D4U+9VZPha81r+gscqOOh6pzIsW60qKOgXzwngcU2H
         BN/Gq8U5dFAuelckjkHwpYk6RfGNGTZuvrLZ0XefDGitccXlMV8eUcb68NzndIss3fQB
         SONXKgCwY1FPbnR2lFKls9D6k29Jk+czIR3DAoqxBjCC4SwnmVuvacdCeX0+ACsKf/L5
         O0kp3jHS4I1w4V5x96H/eANO6yVGkXMxUk37G29/rKe6e5JyG6N4WJqB/nG+Pe7BEvt9
         2yjg==
X-Gm-Message-State: AOJu0YzjVBcLBlZz1K8lHmHpHZTIRunynIiYunusbsQGqE1RCZmbpYGj
	CogQRYeOTtreDZKF2wyTTy4Y2U8QL1cfuOMk4HswIAdFljeAavNgu518
X-Gm-Gg: ASbGncvadPCJtDGNUz/aYHXZkzWRlnV2ywy8F0II7rcgwyT3sSw1ObYzp0InJ1APOBP
	//4EvNx6L6HL17Smi8ITk1anKz7vnTlEFdAdJBTyZtX1swoSF08eepx8kIk007xhbdOfnIayNGg
	KaHcOXCB8mnrBniBLPtRrJLxVAiYeOmCnwl6FA4uxmlmZ0yDXgU2zalhADRv7Hg41Ts97CfZJ9u
	6RJsPdOMy/iSf/F99DRJCzGBoDcnzQqg2sZzhr+tLWz0IZsPclrPiBkweVnIWtZ0Q0gMeKzpZWY
	AJ/a/qqYUZBRucKLPVLPDWKnhRgO8ikhVymQgnpmhjAvqpoLa+dzN6zaKTjr
X-Google-Smtp-Source: AGHT+IFPK9/gPx1ZbaGNaw7eswyMM2L310plt98IyfAdXroPLTHAMtNmSktqVWPPuuyEr8/IsRIHeA==
X-Received: by 2002:a05:620a:2949:b0:7cd:1d87:6c79 with SMTP id af79cd13be357-7d5f350e572mr1472918485a.53.1751904069330;
        Mon, 07 Jul 2025 09:01:09 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdbdb3dsm623109685a.46.2025.07.07.09.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:08 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Jul 2025 09:01:01 -0700
Subject: [PATCH 1/8] arm64: Enable VMAP_STACK support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm64_vmap-v1-1-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=leitao@debian.org;
 h=from:subject:message-id; bh=Jq5rya2jqyIEw+gHL6Gmj9Aao7CMRSAv2UZUv0oVQc8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9CB5n8SRVbBXjgzk5X9mZQlnynOZq78Sn3w
 igTEg7vOz+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQgAKCRA1o5Of/Hh3
 bRtXEACdXX7XUhp94ssDfTSb/2jAteNG7IBhyhvkmD7yAR6hzxGRGUfXpA8+CPQaog8WCcvih4J
 T95eFz6M28TAA0w0ex8v7q+YYx1ajEqCTlfb0WHV2R7NFaN6VLwrJ2/VyZwAxp+nLNI774TOIAT
 TobzjUGikd2VH0iKlOMRxfJ5QQNve1G/rAbDQ1IQF6gIZftlwR6gBaphOC8zLiWuZY94UzQwDur
 QOnLXZWqVhIavCYxaUza2P+Y21/ZsqWfrdHvGoRs1f+pLbggOH8WGKC/PjUCOmThnesQRHcOfBU
 Cxta06dLVOjEhwsbPXnUTOHfcm0RPWpeNCfMmMgUKLYPhhoJnezkVnfYiZPLZBamkvqcQQuOXCQ
 PvONA/9Bda0q9MKuHoaUWojFblxLnyANfshagyj6WM1mQVY0Zs+FhTjl5fyPDMD11fCgAM71m7u
 jZVc2r7O7wjfLHqVqZxHyXu2L5zjoNZkXEdszj9dfNdEDQ5vdF3uxSgQeK9cuY2C1QiBxVMj7Gu
 S08YM8QJgKyKt8fDB6xKJ0QCGCmnnBQE2dPR7lAURI9ucmzB/GL56lUXmfP878w1ms/h/Gmm+wK
 maqRdLgDTQAcc8XJWf0Mle0ZlnvD6iZ+nZq3KtM6zaxobuWEa6aFzucSOORC6qaXSd5jbyZelBK
 sWv3SigvwOy/4SA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090111_338896_1AEB7A06 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

Enable virtually mapped kernel stacks for ARM64. This provides better
stack overflow detection and improved security by mapping kernel stacks
in vmalloc space rather than using direct mapping.

VMAP_STACK helps catch stack overflows early by placing guard pages
around kernel stacks, and also provides better isolation between
kernel stacks and other kernel data structures.

All dependencies are satisfied for arm64: HAVE_ARCH_VMAP_STACK is
already selected above, and KASAN_VMALLOC is selected when KASAN is
enabled, meeting the KASAN dependency requirements.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 393d71124f5d..179b302f43c2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -280,6 +280,7 @@ config ARM64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select VMAP_STACK
 	help
 	  ARM 64-bit (AArch64) Linux support.
 

-- 
2.47.1


