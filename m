Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A96FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 23:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE4h8lAMatl8zOgx47ZsHYZprqFSGIay3bVnFsp5zpE=; b=1D8AobvuGQP65kzV5k8h6wq8t0
	tBwk9+L6+I0QRJaaRgCreP/aTfZT/HLv7Mn0etOCwMaX4r+/NJgP5WvImQgAm00mxsvt5DGzIT3UB
	VkfkjKjBkuiebw87whVIi2zgQLCWyBu5wKZiavyVEzOdmPS3t3SFmCHnPmfoJqQ2o7yQ9u8LIeev9
	NR0xkmigmNE9uzn+pPUc6Tq+CrHYWZRsHxS8Nx041M7Efze7ed3Uf2QqsuhJg5CyvnMsrER//nHPR
	3gucbsCPFVxre0VcNARU5gl+7jsVd3z1edNVXIIhnjbjHO28Mr5qv+JzcSs/OUUpGfNVeZgelYMUa
	gsmHnmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwTJ-00000007rST-1A20;
	Wed, 03 Sep 2025 23:00:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utshp-00000007NYY-485v;
	Wed, 03 Sep 2025 18:59:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-248ff4403b9so2724175ad.0;
        Wed, 03 Sep 2025 11:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925981; x=1757530781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE4h8lAMatl8zOgx47ZsHYZprqFSGIay3bVnFsp5zpE=;
        b=JQuBQ4BdxO7Dzgg2W/c4+d7LKCCeSP4qUWVkW3a+qwqT5pTjM2TnzRA1Mq1OZMr549
         4KbsNPyi772e9HsgbvcvCTDBgCFHf7rfzuveWMASN4r9mN/9+1J26szoAuM0eo/aIYkL
         YTN5i3/7jEOyveaQyn2ii2Myj+LvtlFgb355SjiuIEz/JOJum+0ySYRUHRoMZOdF3b++
         wwc8X5d6iQOgenaQwV5KYi4sxe5OsPPZcDdD7Xfny3I2ZbMDSdIdRZeDQzbC+DZSQAXL
         KOHcCCD25Gp80TA4XgWVPKNkPKBPfTrKFG5gk8fendMwNq2BPO+9N9oIkuMUwiyoFWhX
         flmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925981; x=1757530781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE4h8lAMatl8zOgx47ZsHYZprqFSGIay3bVnFsp5zpE=;
        b=nHbGEHZKKT3HIOj/vh5LH0SKLdjL3zGEXwqU3GOHvtnngVDTfulMbOPJu6+QmSiMEg
         6ypfW5j+jWdoqrkeUqCyg+ibzRUgoetqhU+3XsbIU+HZS7lIFhA7NT0Ut6ZbKVW1wBgh
         4rq3smAxYWWkz0BQeBMe11lHFvb9zJyf9oyenNKlMd3LpiXLvCzvjwuVHdQlGbQQd6Ih
         pBt6UZdJMji/LJFW445M90x73tG4jfTw/iFYov1qXOvk/eLGP/9dZ2N1gIe42LcAkAFl
         VJLZFHoYkqv6jNfKTZrtJQRLYNE95UcEiT2x+49GgewuN+KA1F5l37ogVCZomMfR7LnK
         NViQ==
X-Forwarded-Encrypted: i=1; AJvYcCU48zzw7OT366xKMHcnYVjcW3ME6wuErLFLe0rUo3q706ed3AnbF79emKkcNzETdNe+KNG6tvngeBqOwD6KMMSZ@lists.infradead.org, AJvYcCWDcVvhzl5RQ2Wjjxf4Z9xmH+kDp6/M936YSk86tBmj+AjBITNa3DFHL2FfRHgvN1NzMRYoEKLyXcBvfYM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxX4EQ/ivXUiWtnR4iY7NyiTHDhGo4aGQx/JUQjiC4gitQMKLp
	aCeK9OHTX5coMzoe4Gx5iLE80Gm3XG7TLkqrt2HT9Gxg2izJmBRRXAQU
X-Gm-Gg: ASbGncvOxi+sem13nvVWkWxZ7UMudrXiMSyVPIPyfO0iDCHbyKB+zO8kK4F9W5a81Bi
	L2RvWqNo7fYkQF4le1JWes3rSTUEAood963b3lmqqCM9HjjE44T173vnFfCTUpQ5bKbJ2WvB2+x
	joVW2fu7r7i6FfwVF6zqiVr7FzfMP4IAMomSP/ivJ3cSwxc176f2hf8rM/PnGUlbenTbdOuFYAt
	/roHJj0nxtTFYArlCykCGfQI/Rf0BbtVwrES7T9PNWGdeuKb6nmmOLXtZYh4/lr+JRDGTyiVCTj
	2wNdUS84cHGdZIqAe9UFHxhG3gq6IUrbwT1JgJKqt08ZahlSPtJqxlcAak+Q2ZYl6rzDdNsPswy
	JQbTq5soV9Rb2nnfsPX4qRMWSoCLAmM7hK3Sf6JvCx0QIwAZaikZ0GoaG9C5w6XQT
X-Google-Smtp-Source: AGHT+IFOzZVS9DP4L6Y226muKjeIB1JH5DNA05hxxzbj7ORa/S2amssbHzjMdMYqRSy3xMpxXA++JA==
X-Received: by 2002:a17:902:cecc:b0:24a:aeb6:f1c8 with SMTP id d9443c01a7336-24aaeb6f63bmr166407785ad.43.1756925981346;
        Wed, 03 Sep 2025 11:59:41 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:40 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 4/7] riscv: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:18 -0700
Message-ID: <20250903185921.1785167-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115942_020912_1A8A2A96 
X-CRM114-Status: GOOD (  12.10  )
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
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 15683ae13fa5..1056c11d3251 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1624,7 +1624,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 	if (PageReserved(page))
 		free_reserved_page(page);
 	else
-		free_pages((unsigned long)page_address(page), 0);
+		__free_pages(page, 0);
 	p4d_clear(p4d);
 }
 
@@ -1646,7 +1646,7 @@ static void __meminit free_vmemmap_storage(struct page *page, size_t size,
 		return;
 	}
 
-	free_pages((unsigned long)page_address(page), order);
+	__free_pages(page, order);
 }
 
 static void __meminit remove_pte_mapping(pte_t *pte_base, unsigned long addr, unsigned long end,
-- 
2.51.0


