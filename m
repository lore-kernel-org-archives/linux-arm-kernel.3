Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CC2C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=; b=S6SasCADtQBJuUpvUz99pXIHgk
	txEXJwNwGDsE9OSNzlhjgIov3G3zPeU1SoU9pXlMDti6czsNSaS4tnvNC6TawWUY1K4drb4S65rG4
	katyJ7/BY7VP7yXM16dHG62PgmZ9LzrlPBhWMbpK5F4BsX768UvOhh18HYzTAt/ySKdXoXMiG0A7P
	SUza7IKldgMDK8hvHxaqGs9RGQqA7fr/mmHiBUPkwmkCKkIBmGrwlFKQjWZbEmyu6EedZVE//UKE6
	tAi2tpdoN8Xk9z5JwSAwouONRdZyRg8F1Xa4F1808s/X67vGdaXbyIZ+OeTSxvWed1Zhaf9MSvNEJ
	dmFoqAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXN-00000005R3L-05FY;
	Thu, 06 Aug 2026 09:37:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXL-00000005R1F-2b6C
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 09:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=; b=mvRZ56VgpeI4/bXiwEW4Fffroo
	GRa2hVSVTIpnKJtm4GxkN4SJtypM8/zgntiyLTEjxxUy2czsh9Hp5FTSexFxCVTOq99F8Zq2Gguxf
	sTkvNuq2sJL9Gr2mnX+nuORVjWboQW2kLNj+ja+BWZurQ0Rue1G/XNwLpX56JwhicoAhIi5mF3oN8
	piNc4OTwr+Ev/mCqzDtu0//xo+SsZ+2uSeu2RcEfQdL4AfLHx81/Hjax3ECAO5w1hsqAH6kvYUSvV
	/8IXwQ9+yG/4Te32/GT/k+gFiNOesxA+qIPPm0EB3MD1n7QXFonlwmoRvMlIIiPr5zQl8w7ziHjOG
	WgstNWSQ==;
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wruXH-0000000BNZR-07Y7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:37:13 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c96a1a43f5bso78114a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009029; x=1786613829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=N73AwJSYHD6sg4hLqt69ovjH+PSEa6WRvURkdaDMbq+HjCIFZ76HggtErorca8XzxM
         WQEDmqqYYTCNTmYP9iFC/D5DpwWs43e8CwC0PrAvkKGp3GndgUaC07AjP20K0SvhBBxz
         vG58+l49sAUOd7Z6CY4WBCeDuWE5PqP+FJJ/81SoIWlXKTnL7q92KcIXowFVjmeXuoDz
         Dr5qOD01SSDpZrnMfyvhPndSxW2itu+UwvGGcFZUoo221CIoBTKVZ0iKXqofu3QCN1Np
         r30BU6Bxi/S1YlpTKCWrHtEZWWchKGkAycg7jeMJvfeOIWzkg/3IcLLiNQ8DWkAH1CmS
         fCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009029; x=1786613829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=W8TrBz7bgDD3xkfaKOjcdop0AwK0T6Xg8FN9AEIledv6Gjz85fr9NZvNvgy24C7DVI
         N60ewS6MsaLf/vwpHMRCfQr710tUzAHnypa9xXf1biQOkAiZflqrBBBv4Nxx4IZ0J4cE
         wqV8Qw3jpSNtBAYnMv9jwvkq5UUidGbJ2lYFLe5eY88haD94TrbWXE/WoVmgHtekUMJT
         raAZtUJfsCryD6djU6KXiNwXtmwfIPgoj2vnGs5xORQgv4bzsAA4CaNMIFEEtzfK2F2U
         aOixaMX4e+92t0IQrPmiyoPDSDcPWYODP4b51QJVqaVYwyON6S3dJ4PfdevEn3/d3g6n
         AJ9w==
X-Forwarded-Encrypted: i=1; AHgh+RqqIq2zKBEZwo8GYbHlz1gE1XWLrsIP7KnL5aK9zf0WemFiGXrHdbu7/4EehHVJIbT10CnOVIfAwhWHYTcW+xOu@lists.infradead.org
X-Gm-Message-State: AOJu0YxYv7rw0vpi0S0rYvBg1qm85WYUr+5Rnum62tL6/SJj3yGLgZui
	wrxO95rAz7Hnzn0XfFIwioLMUbCRq6pNCWR0kfgIWP0FnlqEe72C/PMj
X-Gm-Gg: AR+sD10xeBJrZZ2qLlklHz/MpR/jAHDc8UpFGPdLYLWWlYJ1Vha8sdRRIalfe28+fVd
	m4gBMYqWkFMBzjWj9DCeZ+c5Xso5nij6Ae0lTU56IRR7jg2D+F9RScma5gZg+gH++qKTuX/Nin1
	LejXUrNQeqjLiuKKb7HkuQCQsJ9zQphXd5llkD+REaMhja7DPdt9y2efsTpj8w7a9rehnqe+dep
	vVOT5+WNn7Q34xUWB0lS/IRE5UXGrxwlXqDm9EPeoR8hs2JszFhkRHnDZe1rDQmytZdzo8Ik2r4
	ICOa8BUvnVn2a21mzCgOQwRXfeM81UfzsOhCvGhes+gwy9ocaea+xzm9PNAQNqsVsxlm/baMuxo
	ubbhGQA8TZ9cfLBtA7Kuc22uuWpQ+JYQ4wnfdwm3urjgSbww+3okGOFggISN7tzyAEzz3JG+pMC
	ySAszfpCcCg+UDxmL4oxEeG8pIW1Y6iCu7BtLoAb8FK1YGjgDpknW6afeBgYjBuRDwtggL0GtTh
	Q==
X-Received: by 2002:a05:6a00:464f:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84f47dd0b44mr3119262b3a.14.1786009028817;
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Thu,  6 Aug 2026 17:35:19 +0800
Message-ID: <20260806093519.2907771-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_103711_155168_5AF914F4 
X-CRM114-Status: GOOD (  10.71  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index fb78b7814f18..8cc9d666bc54 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -269,10 +269,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0


