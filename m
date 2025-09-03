Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75996CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA6weTM8vdilC/EIGooLzDUuRuJzTtRM53Ib1Pd9QnA=; b=zSDVElTwT5w50S85jshss1/HGp
	qE7WVNmA/A0Jigk58pogVfr8xKz+Mx6r3rgqqRi4BkPSWV7OaVg5nuaRVKh6HslcLeBnnr2vH8luK
	TmMINtDRD8xxvB2Gzm6qK+qg9EfgBzc1aaZwXZsB1qBuW9FYP1dpDW3B5GB/fFn7bljJ+0odZaAGR
	TO8HakUy3RQCx8dHJhdXlznMc3YPBNFIt+6mnDTH1HCd8MNX1USQjIohlPhWfZm8NZys/RTzGDHdV
	Jeg/lNSjnEWNIxv1iEQFbAo2O7+UQrgS4mt7XwQlInmcu5qtFPqAIQ8DXJNK6QBNH0HrYZptyBLww
	+Aah/l2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQQ-00000008DxR-1NuC;
	Thu, 04 Sep 2025 02:10:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsht-00000007NbU-2VJp;
	Wed, 03 Sep 2025 18:59:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-248ff68356aso8762985ad.1;
        Wed, 03 Sep 2025 11:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925985; x=1757530785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA6weTM8vdilC/EIGooLzDUuRuJzTtRM53Ib1Pd9QnA=;
        b=gWFzQBY/5hIJt5Ng3bypy/i7Wueu1i2BiUAQbmkUTFOMnZjAa23thVOx0bXN+aaQyp
         /cBlzw/iMMmH27Vdt5m2/VY9Y1yiiI1YlsdR9lW9X+T8YWXK6R5cG86Ya0MeKuQCm88V
         m8+VR/e3Nhr8tGkPVFuuuMCqe+4AnHTscsN2PWsDGX7LNBAGqEMUCn1ncIhFmAyNBhbK
         yjKNby2qvCFteeys05eP5L4J0lIkOfeFCBFVU3yRHfMs5L+xSz/9d/xZyuRKQ6SM4jKD
         CDw/4wISq8peIoZAtalSPyyKyI+aXz3dUiJ0v1LYqRir8d0OHRUSnhLScEpWvT+JZwY3
         3gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925985; x=1757530785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA6weTM8vdilC/EIGooLzDUuRuJzTtRM53Ib1Pd9QnA=;
        b=Z86z91YTV0REwgcXT7ZAeX9vYGUAOFpEdgvUVojqQs2XhpQy4oI/jT/52XKduQqJwD
         12mjl9K4nV8fm/3AQPFPv8Z4Roqs4gkqFxjrtD8T46oU0U0DULG1jkWZO2ntH3SgQvdm
         iJbtwMpxD5GCgJts72aOLirBAAWg8NKU//aM4wQUkdB6rAcSIDMw02YiouAus0J9SE8h
         iRV3RgfBPdnNl/VMRnnOSNZmOHcbSWLUaT6uvdc6dgZ+LLK/uPMAkn868afSLtSkxRff
         mgmZwcc3A96ZtVGVkOKv9KE8/GX6Ic2wdU219Q/VXjlpLF/2ZGCSn6R9Iga07G8nb0wT
         tLGA==
X-Forwarded-Encrypted: i=1; AJvYcCVjGcat+84cvphJza9fjxOsLnsiFxCyjR68o+B0G0FVYmsfMaBdoXgzvcAyad4TgLs6iWIIyOgZMW3GlcY=@lists.infradead.org, AJvYcCXzwoZ/ukyDaL3nHgenFgXo8y102OqHHAjYQw7Q9SVqNGtUnB+wmW6GjbVzMGfjgYMp5VuD6y24XweGJGTyd9yv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/BfFGriRM3NILbF27WbHMC+OArTkRD7/crSLXCbRmtMSz5xsO
	dfrxOv+Z0Qzp6iw95Q2s0adBojsv8+CfmmzDWG/VkazDK7/0MtmAuiR6
X-Gm-Gg: ASbGncscbjHuSL0eGI6IKtb3UalTyE4Qe9r3iYMMBzjZd2XXD8PHwFNQVnvLSUsoJAm
	cSHIpUQg7J/8Q0EJfu0bs44GZrsholJZXQpZbTMOKxxHFvejuzRDPyMS1k0jKEbE7l/VyYc6vqz
	MFdVwgFNEWSJ+g9eBZdbvEt5lSqRiIY68gpMyCOKHUxHULVAB/zfck/LJs/ZoyoLmQ0AB95KR+H
	7o0ARrg80swp62smrJkErNePXS2aBSDJfM/2lA2UYYISjpSAw3Pa5wF9aur2MGfv7vRptP6x3LQ
	oCmmfgsv1l9TJr856wM3adVvE/WD2NzXLrnDHBRV2lyd9FxMD/wnoGCwGYX49mW6SZMe5Bn26eh
	zO5l0dNBB6zHJICqY9/JE3xNFGlZNTCNmERZkIRlrCA9Cb9FBKVRWUpLZ+kWejc3f
X-Google-Smtp-Source: AGHT+IFoYEL3/2HJDWoKxsFsnkPmdjG5vBre6hTTnok3nMNP8kBMsMcFaEho42lHd4bWFQ52X19GJA==
X-Received: by 2002:a17:902:d489:b0:240:5bf7:97ac with SMTP id d9443c01a7336-2493ef50b32mr219143675ad.16.1756925984962;
        Wed, 03 Sep 2025 11:59:44 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:44 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 6/7] arm64: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:20 -0700
Message-ID: <20250903185921.1785167-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115945_634663_BAA984F1 
X-CRM114-Status: GOOD (  12.72  )
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

free_pages() should be used when we only have a virtual address. We
should call __free_pages() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 34e5d78af076..e14a75d0dbd3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -843,7 +843,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 		vmem_altmap_free(altmap, size >> PAGE_SHIFT);
 	} else {
 		WARN_ON(PageReserved(page));
-		free_pages((unsigned long)page_address(page), get_order(size));
+		__free_pages(page, get_order(size));
 	}
 }
 
-- 
2.51.0


