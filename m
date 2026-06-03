Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA1CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0uwFj2oVK8Ym93JzitEXh3ZnJKfgcyu+cm0Jby8VRA=; b=cgbbBf3OaTTQWQRq+LHRthsPh2
	U/d2vSHaBnSuKKGbo8sd9cjPPQzTGYkWdbI7zRvb1Z8maLKwy7BxcjMy06w/6+FSGrwTJIPSD9I8X
	hhr6MRbCB9GltnH2sercS6KaP2gSAgymZjixNh06CXlOiMTug9bBIYP/lDCR4KvNEML2FjTboy4uv
	3u1tErlRI5lVnFrc+EyeybjIG5Obr+OEcFHIwA0cLhJgIy5sWe0kBnU9tXSmKLXO6VLfE2UdC/yEo
	I947LuoDBXh96QKlgZk61qrlyqaTP3sc6BewJwmrjgv5IyRGKgACd1fa0qA7X7PwY0in8aXmz4zEt
	i8P2c+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBk-0000000FUeC-3ySA;
	Wed, 03 Jun 2026 16:11:28 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBg-0000000FUaO-48OX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 16:11:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b8adf8b8so8727405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780503082; x=1781107882; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0uwFj2oVK8Ym93JzitEXh3ZnJKfgcyu+cm0Jby8VRA=;
        b=knvr3GRFIdCrRnEsxv59SNVCHOF2HUQQYYwVKwViP1oAmOHB+8h317nOMZto6wzx5W
         KMLzlGLlP78AF8M822Djylt8CAMWVcOqFT+Yi9o8OANxDT6AeaWSECsmcFUR250MABfu
         NnHcw4uJl67be8AU80lalNmfoirdVdEYxav/wm8Y7Aj55q1m25XOEA5fGLZvkRdhN61D
         XFj503dhOrEbwnZ8Njy7WRG5pdc56eSECx90izoIteQA/s4ptNiGIL+ccLdt54KEht4d
         zCReohrmluDWirXBKiWI9VEiksUUMcdeeHXOWt//2AQD92lnVbHq1R4nHgv+vto2M3dc
         GH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503082; x=1781107882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0uwFj2oVK8Ym93JzitEXh3ZnJKfgcyu+cm0Jby8VRA=;
        b=iw79p/pH8HOvByiHFGx+a2ONKGJdQ4GiugpIir9D52QodO1rkrZl8hVkAXzFcAlLx8
         knaeI94bI+06lPEHoeDeRTmb0DUkJqLeDlxmif5Q5ITOjjO96Aoj+KbnlRRjx+3DhO1A
         Um3zw2d+r4fTmc2NOfwu+eJTjtSG+uWj2FYf1icG/KW8oQfmLm7TXWNbGUIXFtCyo9+N
         q6xBHZNxBMHGrZ4BkJjcBD5qvLvlmVRgtgatVBYfST2ia8pl48eCulOB7bh2PANM1zgG
         Q0UQbNsZCcWIGUtelWMopuatAWJP2AujcZ2T6hiXq794BQKR1PpI9lYPYhd0snWe+vfX
         B/JA==
X-Gm-Message-State: AOJu0YzgpZ6FqDgFs5s1M+PcWKEGVIkNvSWWjcMuh1ki9vP6kWwEaN8Q
	1K36iWv/70TdXxYeOGTdafYqV0FrlK8nqLKdtZT52cP6dYQqT+nWDj4AEhZtxl5vkjZxpocWOlk
	eWtUkQCsYuMPWAfrEkAdJnVlArQa6iZC6yOI6uUv/JkO3RFW8CtYDsalEqApC2pJINbG4Xt29+W
	6ij0XuKRoIuHWTg9cEbMeGZy/fCU7CyIwl4cc7a93rQDXH
X-Received: from wmog10.prod.google.com ([2002:a05:600c:310a:b0:490:b360:5841])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e87:b0:490:9d1b:f05c
 with SMTP id 5b1f17b1804b1-490b60e3f91mr74583475e9.33.1780503082036; Wed, 03
 Jun 2026 09:11:22 -0700 (PDT)
Date: Wed,  3 Jun 2026 18:09:53 +0200
In-Reply-To: <20260603160949.3372482-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260603160949.3372482-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=ardb@kernel.org;
 h=from:subject; bh=SJHawBMrvWNXo+6oa7fD+p3VxoLw7RWBCVzA/QDwCOg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUsh8FLd1w3h24XNTyeYGLFxHm72u+/DcGNVcbKX3jXWH
 UnCv092lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIn01TIyvHN4t/fK3iV7N0yb
 H3rcwJP5rHPc4/MJQYtmbpwYdK+Ut4vhr+SPVTMyHFw14pUUEyfzzTXYGGSy5frpGwsWtSz5UpT uwAEA
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260603160949.3372482-9-ardb+git@google.com>
Subject: [PATCH 3/4] arm64: mte: Disregard the zero page explicitly for
 manipulating tags
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	maz@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091125_030459_FE44E53A 
X-CRM114-Status: GOOD (  12.03  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The zero page is conceptually immutable, and will be moved into .rodata
to prevent inadvertent corruption.

Prepare the MTE code for this, by ensuring that the zero page is never
taken into account for tag manipulation, given that those actions will
no longer be permitted on the read-only alias of .rodata in the linear
map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/mte.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 7f7b97e09996..093b34944aee 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -80,6 +80,11 @@ static inline bool page_mte_tagged(struct page *page)
  */
 static inline bool try_page_mte_tagging(struct page *page)
 {
+	extern struct page *__zero_page;
+
+	if (page == __zero_page)
+		return false;
+
 	VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));
 
 	if (!test_and_set_bit(PG_mte_lock, &page->flags.f))
-- 
2.54.0.1013.g208068f2d8-goog


