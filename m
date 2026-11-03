Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C0606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FPmw2ck9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7co1epQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=; b=FPmw2ck9Wc2kJkf3fZ8JWA5b+O
	3vavpA+Uu0bVP/Va5K4Y0zfOUtEDtupNVpxD3EmTB5qHoev/RJgfwPQqcVG1TCMSm2H/kR1X3iZnC
	/4BDSR3sEvmchY7NNUwHwRkxxVV2okAp4wjnsfgpIrA+Uamw87DeXmm+kPAiLOiowMKHZ3dItM/VE
	EDcdXgxQzFlCq0eeMw9P9itQeXSWGutWHoSqK8md1MRxjxkWYX1UzTOxFs5R3HDgQrEcX4oh3b7JJ
	TZPFOlMKu16VthZpbvsncxLgA8Hcmi1B/e78QmPuR8WQZ2W22kjvdbLgTiQqGDqALGo/AWqClsXCv
	uPSlDiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9wU-00000001YhW-2EJJ;
	Tue, 03 Nov 2026 08:32:30 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9wQ-00000001Yg5-1Eyu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:32:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1855461a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694745; x=1794299545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=Z7co1epQVPVpiBNFcD0U5AGNEQeSxHM0iK2SEX8VMjjK+JzEGaWN6Dz6PNHIejKBrb
         2/qaiX7p1rxFOuVZPWxahWuQFKcdZ3CUGxDVMpPKLPjGMMToUQsF4IOs+POzsezxsLAA
         XSylNEB0lL6AYCSDeUgVc+Wbzr9Vf+Ro46nCBoN+eghSyO2Ca/yJbWjCC5gBlEj+ZS9t
         UfGyIaxYlOatzVC2yZxzwmkkoMlO4tUFhpauMKx5cVk4+8Cm/t076FdjyRmCFCqkAG4N
         Xpd9BMr794aNjTJ1JRhE9z/NtmHrzOGsMIJ3pnvStd0DryLknrNvjA5NzZvsfvekOziz
         /V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694745; x=1794299545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=mEPV1a26SYMbI/XhYkrMwVnJkPzWqGM9EVd9lCnYTXzKigcmA4MN7SVI9z2MMeAVFV
         HqWUwKXK40OKR0XZ+6gWfbCr+Vm7bfrd/tWujqGHRMtlBideWQG6rNRhXImtKiSPHFes
         saaBYx3SUHFRZY4Rdug0sMcArdfz56FGOCKBRI0Gh1AaAZbPjAeYcc+2xm88VWIqUGuV
         PXqT81zxXch/oPFS3/ONVTGZwxzaeb330UopDbevHPfnH+Q9tNQtRfMuqAHMZpKeBH7P
         nC5gFtmpDQQbaxEQeZYORGRyUikPYr2TRPpwgvXQOW+tx+G2U/K7KA8Y2Hl8fKs3fkDg
         klMg==
X-Forwarded-Encrypted: i=1; AKwUvBxZedxpZrwazAFI+xUceD/HXuriDiB30DcB3f1wJj86Icm4i/q3Lnm9HkaqL7JIB/fi7KW4m5uPJ2zCP1mP7J+M@lists.infradead.org
X-Gm-Message-State: APuU4Z8gKCTjvSQwjplqMV2GrwzK1ti8+UaTIsdMZjL4L2cjAVtPmRJO
	351WSnQwad6mhpQSzsVNs+QgU0H7MOn82+7XWFW93gLkkOELh3tMFidp
X-Gm-Gg: AYBFou2+lUe24m+ylgsIoaxbulcHqvzE8j5nk2zOMDG56GaiEUQ3AhWlWuafL20tyYf
	jTiyuK14e3Hf/2roS7cm44XyMwZKQXVfxuaWLNxSUwdpcpym/WP6afznjwnkh8LPKxQSK3ZYRTQ
	f0U0zMwbdti2FiM+d3kuKRDxZd7kPGzc6cEvwZI65H4eD9ZtlCNBYwxAxcomUZzOy7zKKGgLFO0
	P8H6akikJ24wY8SfTowzkmwbTBC9UOpmXM5SzxtGIQHaCfuXn+8zgFvDra4qidgfWAXFB/Gb8ab
	m4e0diadjVuO9gcP3W6qsMKMH47P/u95MKLQL5kCza+FwOYICxy+hu1G4zs4kqCxQTxi8vzWKOk
	uLWtf2wMENDMyqLhxEQRSa29uDrGn0FkoUwTo5YU8bk3IciKjtiDpAG7+MUnDGfsf5ZtPJakGHO
	ChA68FI+HzUDq3jlmAcSvLP6Ok2he8PWdQRnqceAIX/7v++qawuNLU+c/+3xinbeX6nYR0i/FhT
	ojsF5/v53SRWpWO+lToPyDvJiLZlcCWY+sYvqfqlSEOLII/QE+hMUcbIvk29vYCVCdEPW5zyxB0
	cfkwwee/OOXsdpzvC/r45W73IPsoV5ecB9R5/5mYxzn/nA59
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr9133105a91.56.1793694745256;
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm3232140a91.5.2026.11.03.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: fix memory corruption when active list is empty
Date: Tue,  3 Nov 2026 16:32:14 +0800
Message-Id: <20261103083214.1682930-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003226_337860_5F40895F 
X-CRM114-Status: GOOD (  12.20  )
X-Spam-Score: -2.1 (--)
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not check if the list is empty. When mchan->active
is empty it returns a bogus pointer, which causes memory corruption.

Use list_first_entry_or_null() instead.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023073154.744365-1-lixicaicai@gmail.com
v2: rewrite the commit message in simpler words as suggested by Frank
Li; no code change.

 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2

