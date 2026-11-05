Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xy0cjllq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AheSl2z7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yd94sB33j+7uHnUeucF6H8CRpAAVi5CgN1RGqzbz/fI=; b=Xy0cjllqMsDAju
	xMYMuzLaZlRc+p5rGIBX5QuFAjjk16FWHlYNIhF5sX/8v9ZV93MPp4RUAKCA/soHQiJkA+4lJ+zUw
	Y7F7Zo1zw4i1ZUQaEgByu91OQDOz4kPnO4takanIpqGHGBKIr4424g6IuXocdPU5D6vRL5wS/yhxY
	mX09Sen+Xa2ebX9Bt5sckbFiI+1qD6A63R9fYdiFWctOj1f0k9UKiTBwI32Kk5k816/5ZKMXBhO9R
	Oox51GCYe/0COk1/XoQX6ndqMukuYSO834yoKDSO/R0KGxKjYdMCYfrLSPOb/LpNL2YN0wHnaBt+H
	6fyywFLN0kyMGzjzZzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsSP-000000085gb-1kjO;
	Thu, 05 Nov 2026 08:04:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsSN-000000085g8-0tuZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:04:24 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1396056a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793865862; x=1794470662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd94sB33j+7uHnUeucF6H8CRpAAVi5CgN1RGqzbz/fI=;
        b=AheSl2z7Jnrbf7byPZmO69QA2kt00uWZXm0F0r9I9NvcEaT13gAuUZe2dmvssv5DS5
         2/gZhj6w7tKvR1qHD2WSlz0R4/O0c2JqGEIysS5S8StH2UHtndsgRFPExwerbrMlKYay
         rDQ1tVcYpMwcfCR8bC/66LgaOYCpyvdeJKDqIaNMwNpp2cPnYkKORqY+0AnBksWabsiP
         O3sO7A8vI5Xa78Vyszs7wK1ldR8bSOoHso+d2YyZv200MnH21re9FvSg+lm0GmCINhkP
         0Xdl5y2Ncc/tDcaQECEmoPtO/ziOoypKXQCvxWTXqd91bN6SGZ841FPllxC97Yz95ClA
         uHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865862; x=1794470662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd94sB33j+7uHnUeucF6H8CRpAAVi5CgN1RGqzbz/fI=;
        b=Ml9O6KjBjb7tPvIe0V7d5mFnkY//qUv1II4NYozEpQEs4z9MrPKE3g00JqMPv+gs2c
         suW4NGVJd5n1qS51H1CybG1N0XbrPphN+YD+vq4bLVVrVKBkywphiaChyJXkGrjK5lNm
         qg3l1LDRCAX1f5sYJqA3ixDgI9Un0uJucgmluNbsJWm/mTj5V71TiDPE4yc7/AVGmyIS
         jDXlJtpazZMXTMTq4RZqNQQ5jKcaXedAkXbDlF4ZdVpP42C6ags4Cm0bvsdzX5RjAXn0
         HaVhxwcgPLmm58L4vqkerL1BRUe19SYKSvZLAVQbdt7f2rmo24lO0Jatgt9MHsMaYnGF
         37LA==
X-Forwarded-Encrypted: i=1; AKwUvBxo92vFaJ/Npe9x3KpC0723kLU1ZaPFF3VCnGbCBlwKB1F11PfwWIkb4yCTmv9TTIu+LWmJtq4pn8bihHlwATe4@lists.infradead.org
X-Gm-Message-State: APuU4Z9UKc2BrOwYn1zvRIVzECkuSZc3mKqv02ubCjoh1JrxyBebYZk0
	CHwo+eRtwxEtv7BmL7LfHT8D1OLMR+bfFRS7hIXTSOphqiL3giTGWO4=
X-Gm-Gg: AYBFou2NSjyWoI9emsPYGg876VgVSnE+N44kIOuMDONQ0zYOaUh9f3Y2cjg2pIE95XL
	EfSQSpZ28iDuQ1h7ASY/9l1gqJXaE5hpRPrcAFu8eFshMoMJY8WyZSKQb65iGIk1L+JAyCVLzE3
	wrInDzYnYYRJJ57jgY7o5Dih4PqDoIjxe1zrkHRbHq9KXw3q4f46kvC+qEIFVMVWGzZ84b2r2/1
	QEsTINJNLgDiEPIrUFQphPAE5i3u08PZuPzvWTRO7AUmF/toQSJAyF6G8sD4KrKKmVBtL1CeZKr
	3CWEeJqUdy4kPTkDss0GXmGw+JJZa3NqJ6W77pf7mfAcx4MfjTudMfO9FEmb754rwrOok3EBdcP
	M9SUxlWG7wLVKvZTzAFU6mWeBca/AAQGAZv8LlTvwjHrzVMFdiRjXvm+ai4WJLZodgrTcVO7IhL
	SC3u6u/BdxwDVZ72f8Ii0BIqz2/n5EVlsVRoxmn411wGSjEVYWq0ZfUvdCtdobGX/oxkN2Y9xhf
	IoEiqkLRHbii7puIzEkRPvhyaU6HQJNms257VT38TulFIzypwAJvZsnz9CQb886VaCY1AMRe6yU
	iH9qMYzWlhB9qNluDLEX1Jfw/jg9njjC/XEKpYO63qFRJBMuBjQ0
X-Received: by 2002:a17:90b:2e52:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3ae897ec759mr15992932a91.25.1793865862020;
        Thu, 05 Nov 2026 00:04:22 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b328a04asm2617818a91.14.2026.11.05.00.04.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 00:04:21 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-fsi@lists.ozlabs.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] fsi: aspeed: release the master device node with the device
Date: Thu,  5 Nov 2026 16:04:14 +0800
Message-ID: <rc-review-20261105-32-59f96c1fdaf1@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913060242.1426845-1-lgs201920130244@gmail.com>
References: <20260916093914.2005582-1-vulab@iscas.ac.cn> <20260913060242.1426845-1-lgs201920130244@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_000423_258350_7425FA5A 
X-CRM114-Status: GOOD (  11.41  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fsi_master_aspeed_probe() takes a node reference for master.dev.
The posted error-path fix releases it before directly freeing the
allocation, but the successful registration path still retains it
when the master device is finally released.

Put the node in aspeed_master_release() before freeing the containing
object. With the posted remove-path device put, this keeps the node
valid until the last master-device user is gone and balances the
successful path without repeating the error-path put.

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Link: https://patchwork.kernel.org/series/1166294/
Link: https://patchwork.kernel.org/series/1163700/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

This is an incremental patch based on the following posted fixes:
  [PATCH] fsi: master-aspeed: Fix of_node reference leak in fsi_master_aspeed_probe()
  <20260916093914.2005582-1-vulab@iscas.ac.cn>
  [PATCH] fsi: aspeed: fix memory leak on remove
  <20260913060242.1426845-1-lgs201920130244@gmail.com>

 drivers/fsi/fsi-master-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f0bd760fa78b..cac0a8c73043 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -378,6 +378,7 @@ static void aspeed_master_release(struct device *dev)
 	struct fsi_master_aspeed *aspeed =
 		to_fsi_master_aspeed(to_fsi_master(dev));
 
+	of_node_put(dev->of_node);
 	kfree(aspeed);
 }
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
prerequisite-patch-id: 0d97a848987c2bd4195686f43f69a0d0c0f69608
prerequisite-patch-id: 00d7444e3a96e93c967d233b9c7c3a79c54647e9

