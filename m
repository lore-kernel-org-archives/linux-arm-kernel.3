Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cm8S7fxMLu6TlkbuGaHjv8eWStidNKhc6ejgToCRJ4U=; b=i2OUeDKM6zFG2VmsYYcZH3Adp+
	kHBxa3QFnCndaeF9ko0Fgf6lE9ToYjWXosO8e4eFTdhdVlC8dJRC7Km2Kcg2r0lbdz1/TTb/XCH88
	RxwDFO4/YSjK2j+uiZIJyvm+KtTZLCVmTyZ45f1c3kuMQAtISbfq4Y1so5DoaLwJIhPcDlSqbxjib
	DcDe3+HWIpXZHdI0AP03ex0U9UFPYyt/7wnxHSnpJMorkJFeD7qBpZ29dfXcxPYxLWRe4Hwn+ZW1U
	KPgpytzwrHxou/p3MFhB2FHdW24NkGd/8jjFU3b6Svc2ZzqbgAV8n00lRmIzTmeQ4aZBVIk/I7Y93
	SjgtLfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVk0-000000003Jj-0tIg;
	Wed, 08 Jul 2026 17:07:20 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjw-000000003Gk-147x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:07:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84830c774a0so985822b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530435; x=1784135235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cm8S7fxMLu6TlkbuGaHjv8eWStidNKhc6ejgToCRJ4U=;
        b=SJrCH6FHDOmhq8BVv+KRcl6xJwVquH5oK1K+voZWOHKEc4+I1mH3mDkZRWf4alo4sE
         lZ4i14uQvqYOxhePLwm0zOt4j16fNEZVS8ysvEea8Ifxn0uwrsp66vrLfO1rPZEurNCF
         Rvnfndqb4VMKUDsiJyhNoduUDyxBLqquxHmI+I7PjjuBtbddAnnw719jipsbVA0K04X/
         z2AI7iuNNvGZi6dRzOjsy0GtDhUiWvL7HnCCb2q3AuihpQlnQhrDs11j9q24k8KK3rr6
         s3e9XRjGHTNXu3Sg+R4eeoMcA4Sku+ykIFrubnUO/j/OZ6aE9Ts8DskVCGdr4BvFpzMD
         MICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530435; x=1784135235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cm8S7fxMLu6TlkbuGaHjv8eWStidNKhc6ejgToCRJ4U=;
        b=rzvJNRY3kF2eUsvwtvCgWfuI3iCxNMtl1kVjXzO2lPk2HNmjW9DRWcZjRmYP/JLIfh
         g6YFxz2O2KFBecn5A2AjPiPfJ9nNFVY+MGfMvkVbbJxEak3ACCRrIXMGjH7fgTcB1oBY
         ljGTy/wK7OmrGS3VHf1pXH/UJHRgBFK0CdW2PGfaDM4i12iIkniiEydfx60ls4OkdZsC
         F2+oL249+tlH7gVqVA02ZRXT9cDnOPLhNlNkkDt5xLVdqfEF6j5roYbgJh8Y2W0CKndR
         Epww+Axk7YHBTVXOaUUgZmpeWQEK+c824RFMQdsXU56V4NafOppVTfPjUsHM58vWwzcp
         +D+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQhkUxdBsnWiuo25B5cIyZoL4afraBsZ/0klC6vNoa0Fo9/dCXs3zgZjJgM/Zc+2S6WcMQ+rsjx4Qvjyn/2J+a@lists.infradead.org
X-Gm-Message-State: AOJu0YxKQmDZ3CPKSd13qtbaEfDQv7RskrS5ZYE6/Q/Ep5kS4NrJ3Cln
	vzxbSawnpbEgHoCOTHnVNnTUdo/dNVbT7TGl1BVGp0uFVal9Sh1i6Nv/
X-Gm-Gg: AfdE7cnV2reI5ybJA2RjkBeXa7tJVxOp3n7sHIxUljfzndAo1HRgrtEG1JfouCMMLwH
	RVeU0zPDyxVyq0PeMP4S/goNMnMYqxyHGsKqLJzfzA7n2zeS1IHagLAHQXVJvbmeJpZeAE/ouTq
	4A2qn4YizSKTO9clIvAXsd+u7UfdfEDcEKAkr382qiGidK2aSS/kJOetLegdqviwY/yJRrrFO1Z
	sd5PzASmlMNHyTqiGjDZ0UmBMAepN78MFJRudv5BzBdZekoYYCx7iB/bzj/fDPWA8//D4DRQ+2/
	6yFwSKatXL8LR6RxLh7+jg5rXOAG5NvTFBQiKvHYOnhEXU2FbAro+j8LicJ6e8xSYTmO9Z+b1x2
	5DHa4fh2qBGIm9Ao10oJdqVy/wnAqKWwMQq6fcGRheB/ZiJemjDnb5LbkTDYaRYYlm+YmM4MQuJ
	F1oUtiuhzSz7KKl9+rgA==
X-Received: by 2002:a05:6a00:6f0d:b0:848:438d:3665 with SMTP id d2e1a72fcca58-848438d3bb1mr2984905b3a.41.1783530435052;
        Wed, 08 Jul 2026 10:07:15 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm1119528b3a.22.2026.07.08.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:07:14 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: akpm@linux-foundation.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] arm64: remove early_ioremap_reset() call and __late_* macros
Date: Thu,  9 Jul 2026 02:06:47 +0900
Message-ID: <20260708170647.362562-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708170647.362562-1-ekffu200098@gmail.com>
References: <20260708170647.362562-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100716_288917_8010F302 
X-CRM114-Status: GOOD (  11.23  )
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

On arm64, __early_set_fixmap(), __late_set_fixmap() and
__late_clear_fixmap() are all __set_fixmap(). Calling
early_ioremap_reset() changes nothing. So remove the call and the
macros.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/arm64/include/asm/fixmap.h | 3 ---
 arch/arm64/kernel/setup.c       | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 65555284446e..abd9800aabf7 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -110,9 +110,6 @@ void __init early_fixmap_init(void);
 
 #define __early_set_fixmap __set_fixmap
 
-#define __late_set_fixmap __set_fixmap
-#define __late_clear_fixmap(idx) __set_fixmap((idx), 0, FIXMAP_PAGE_CLEAR)
-
 extern void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot);
 
 #include <asm-generic/fixmap.h>
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..29c6100f0c50 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -347,8 +347,6 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 
 	request_standard_resources();
 
-	early_ioremap_reset();
-
 	if (acpi_disabled)
 		psci_dt_init();
 	else
-- 
2.43.0


