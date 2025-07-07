Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DBAC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFSE80Z52FJNEJJjSL/hUkB6ZfO89AG8l158WQvBna0=; b=a16lxNeCxTcdtEgs1Wta37quHH
	L7NkWlNRFEHUFYWWkmCOwpIzGctLyUzTf1SIGJ3wBoetNHsOgBFV+9CzvkI14QnxJekA7A8c+ZN6B
	sviHcHpKYmv+BW1baeUkPdDQpWdhwDz5gJQDRY76lOcTa4ly8dKZp3PFHUzDkLqBDZrW200kzWRYe
	lgtEYg5O29DgDLDw9o1iYjcSQseS/E9cmDlrURUEp8HY5EOEAWBcmEf4TpRGNwmKG3ksJ+VteVtWu
	Yq8QCJv+Xnft4tt/RXN1C5GravqzHXGUuTC2XCqikN8E4Xh/w4jkIzsoB2gVORs1Z4ERROF6Shikj
	2SytYgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoRP-00000002zCT-0Ti5;
	Mon, 07 Jul 2025 16:11:39 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHH-00000002x78-37xS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:13 +0000
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a44b3526e6so51464951cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904071; x=1752508871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFSE80Z52FJNEJJjSL/hUkB6ZfO89AG8l158WQvBna0=;
        b=pYX177ytqfUJf/bfNqQwXjzCy69zhEgsKFfRefWOH8KKt5UWESd7IhxZEF9cS0PzfB
         DC+L/RFmsSKfuHx2IQbGzywsrtrC11Z1ZNzWPxFAArDrwU9CuQTD9FT7GG/Xk+ZtRZgh
         5tj4DmqTHOfHstGEwZFE7qv66ot42bUaujvFfgAnytyE2353TNZRGLCYU2KSEseIn0XI
         QQd8fdWyMbuNhasqV2rZZfGH5mQcvavfV4/pGEC0LC+b5ouxa4tAM9tQec1TK+O/V0ll
         y9VFkUdDohCVUuuvQsn1np89UdGfT7RptlJqfIemYZzRtIFIEba2PNlipcJ961j7zcY5
         KbvA==
X-Gm-Message-State: AOJu0YzPOf4FNXvfcZZHht9fLMm92N4FGqrTn2r0bhP5CquPKTYbI2zh
	n56MHeN+Bi/0Ol/aFDGoaodOGXtOQKBMGH9Pf8wgK8x5esaCnP6QGeQE
X-Gm-Gg: ASbGncvl/En1ZhwspxIO/8+wUu9WLphIMFt+yWvVIgpuA3elv/yC9Wm0YFSsrNdeAN0
	+KAOB9G5WXrY3KrCVk9hmxPoiuzb7ib5iOF/cR3ppDOuaAr0i6Po3ahvK2Vd+UyAEE+exzNv4Dr
	8zARms5jJONFcZRzugBEUumRf7MCcjzVa7WDv0aXm8yDOT5zlbgItowyqE2nr/1z6xUugbUy0Ge
	9nVRYev+AbhOxVXfpvkbby1OJmUjESQ8qXZuMKRE/XlQYYeuU9dT+tYEjpE0wkVZOq93yWlRg3B
	ItK0686uE5Q85pUUcW3zzA8zPmHYgeP2UXf7O/PIG4fDR9o2/6dTEqbONOZA1SA=
X-Google-Smtp-Source: AGHT+IG2bDjz8U/jivIfo537GoxBEUIliWuiKoH7wAKCcIPUVfYDbgzZkFIFWWe60PAaWYZnb9UavA==
X-Received: by 2002:a05:622a:4e8c:b0:4a4:31c5:fc8a with SMTP id d75a77b69052e-4a9a69abec4mr145687111cf.47.1751904070356;
        Mon, 07 Jul 2025 09:01:10 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:1::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a7a9e9sm65925241cf.50.2025.07.07.09.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:09 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Jul 2025 09:01:02 -0700
Subject: [PATCH 2/8] arm64: efi: Remove CONFIG_VMAP_STACK check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm64_vmap-v1-2-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=leitao@debian.org;
 h=from:subject:message-id; bh=AWcDwEaXce/sX/AWhtimr7eCGYzpjHt9k/AolPLC7d4=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9DX54jFJTcy8xfqR9DrHCzMBCal79scVSM9
 jDCLskwppyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQwAKCRA1o5Of/Hh3
 bax4D/9MnLN2FeTuY4JCgIXmAL/UBGsGnXZX/ppObPSfuS3pvWI9ahzc9cBKO22ZeStDUDZEuml
 zDUmaDcXnzGPLOLo4JTg6FiEsgEvO3RaW8Wv7tiue76uKah5gUO4ROuq2TKYCaunQkHFAQzItcX
 x9xN60cmf/78rROdj0y8Tf/nzLt8p6/X6wJ/Q3VuVWZKsMZNhztyeIysjqK7RH9zZ68jM+g+k/3
 n1UDQaN3GzxO32sOEc+RlOJiMsSiMV/kW1ezYAXovVFo5bGdIihJXhqV2kCjJN5G9deHf9jKFhy
 velPTGXMAGQAPY425E2KE8cN0jLAbdwc7EPzVOuMwLk5SihJJtTzwQ/pUrQZQG0BR9cY6F9wlfp
 qX+mlgpUaLojQ2k4oUSOfe5OsI6XwCmyq+E6EYrveGbOkg2sFYEqoVG836TJSr63eVmNvl686Zu
 ZxOmOQdxki+fDQ54AMDEuBPzWkZVbbIeF+RvXtp41lWgHTp5Vo6423fx0rUdzu8r+xB1wHAnE7d
 tPEve+xhW9vN1NjkDmXl0/Iu4sDyi1Pbi+bqH31qyTxXq84MBehRjTNqZaqHJCR5aiusR7pVUw1
 olDRILYLMTxksa2sVJb3CqBFaAaCJSw1VNmmfZQQSbeyqymtibkezL4hR5CgFleTqUUQu+ye0I9
 fXIf/Na0qPRXruw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090111_785159_83CEF125 
X-CRM114-Status: GOOD (  11.04  )
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

Remove the CONFIG_VMAP_STACK check in arm64_efi_rt_init() since
VMAP_STACK is now always enabled on arm64.

The arch_alloc_vmap_stack() call will fail to build if VMAP_STACK
is not set, providing sufficient protection without the explicit
runtime check.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/efi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 62230d6dd919..6c371b158b99 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -215,11 +215,6 @@ static int __init arm64_efi_rt_init(void)
 	if (!efi_enabled(EFI_RUNTIME_SERVICES))
 		return 0;
 
-	if (!IS_ENABLED(CONFIG_VMAP_STACK)) {
-		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
-		return -ENOMEM;
-	}
-
 	p = arch_alloc_vmap_stack(THREAD_SIZE, NUMA_NO_NODE);
 	if (!p) {
 		pr_warn("Failed to allocate EFI runtime stack\n");

-- 
2.47.1


