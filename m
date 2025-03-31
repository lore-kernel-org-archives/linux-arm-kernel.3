Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B67C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6OeNAcmiThB49WdycxJho/lyo9T9VpLPBujpK5ApRhg=; b=B6Oa9YWyVuUxAOfg2q95/BRYSV
	K5PgbgH1v2SreqOHi9tNuocAIhdWEt48XPvZb90vPhbQDXw3vIGHq04Kz/cmmn9QUediSwKL3Mu88
	gLOPPN7wkdxGKZSoxBehpE9dxW0l21MFXk8qaJDk8IXBUshNPDpzlBJsU4Boiwker5SCSSzINk2Cx
	73V1HcNYKmTzq8Rsqc+IQ8XfmH+U00zUbJHA6XlLGsuZp8+WcWVSDmZQWgzruHCTQaA7aTQgnehyh
	g5cNwh/Wm3cULpB8NSK11Dm/clz4f6Ag3Q+no3qD4g3VYrl60Bn95MmeZ8ftZOruFMSk/Plnujiqc
	acyYwsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGqi-00000000jPh-092W;
	Mon, 31 Mar 2025 15:14:52 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGMS-00000000byB-0FuA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:43:37 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-22622ddcc35so6631725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743432215; x=1744037015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6OeNAcmiThB49WdycxJho/lyo9T9VpLPBujpK5ApRhg=;
        b=aHQDMXjLr7mF0GOiczShjmGSaDCcHCCBpM614L8Qg5HHBlgczXJ5T0rTVI5INYaxXy
         fllcolJDJnTIizY6hKmS+vjhQ7vFPSKPpWe//zBt35lXHLK+2UGbzPacbqEgD9uccHQw
         q5mx/0lVw/Nb8/F2lLvIUXipLGXnW7EVzGcSpJgldYTBZFkWg109djSNWBanVWs5UNKu
         cG8wS9AirLRf3Rtp3p5In/HCiMYXCNlHhULXm6YF0SPTkW/FFIsEOF2AWBVl0MpchvBH
         weBX/qFYNsrJsPU/5/ZJ60k2Ud+cN6KWU7W4HAQEjkUctKifBXu47g1pXMLaK0pO48zv
         HYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743432215; x=1744037015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OeNAcmiThB49WdycxJho/lyo9T9VpLPBujpK5ApRhg=;
        b=GOapl7aKNL/Ii3hPI4UfR0hXGYD1T4b44ZsXo3SwHdmQ/7VeTOhxYmKNd2u1kUdJaT
         OQMfgfo6wqDlTaLH57Dk0G7EaI1XAibY3rh/yX2zm/KW8sQiARRtzlO/0bOp9C2tvXXQ
         uddi49x12agEntbafofnpDGQCwWWUfCFTDMzi1GppB2OHKrkXN6qJaNQaU8Jx1UYqBY+
         PEsUhwgAbat16Ewt83lJbarnKAW+/uR691OLkJNfq9FUsEneIQMjVG1zr392Alm4MQsx
         6VkXm+ZphEV6b3Ozc3xdNW74mk/jpY3dg+B+oSX6gdhNPdHkg9DPcCfp6NjkfmHsVWGJ
         rnrA==
X-Gm-Message-State: AOJu0YzSrJKMZuUGG43hGFcvCr+Ads7dIg5MK5nrrtggejYgyU2yZB5M
	V4rRfGRjlwKl3oYhXwwXCS+IAyTuKpX/Mgv7pDotTqk4I0lcL8Zf
X-Gm-Gg: ASbGncsnNslKAMm1PEgMftj3k4Dkh8jQ5YvbB9teYhMEYYDXKqFVs6RAwZI2uPgf/aP
	UE3WFORj1DKqAGPZT3NMGcYbbgpmXXIiw1w186Hrteh3ANP92O+w+/rxW1mlA/q9/drJdKjDJ/Y
	VxqQDqUKMQwJSNwXAtrXejKjQWOuEAfB/QYV2b8l9/tF6r9riVirgvxvP8PHI2PsBkjoo1PzCx9
	cM97ppa4u+JEwveen9ZV9kZuDvuhe2/Y/0SaFcD0x0fuxKm5dB4XurBsEsYW3kdEYvb5LCJi2P/
	FYJmbOzWOS7fmskJ2IdRmvSSvw1KcpRsezcRfEXiW1y535N4WuRfs87KSjEX9BGGfEwmca0=
X-Google-Smtp-Source: AGHT+IE/DDrZ2ZWjOx8brhjMz69HQaVZRBK9VOo82IiKfky+Z+TK9eua/q/0dyP8hsucVMqNqGEVcg==
X-Received: by 2002:a17:902:f709:b0:224:7a4:b2a with SMTP id d9443c01a7336-2292f942aa8mr171906545ad.11.1743432214969;
        Mon, 31 Mar 2025 07:43:34 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7dcdsm69548345ad.216.2025.03.31.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:43:34 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v3] driver: tx2: Add NULL check in tx2_uncore_pmu_register
Date: Mon, 31 Mar 2025 22:43:24 +0800
Message-Id: <20250331144324.12940-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_074336_095607_4E616CAA 
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

devm_kasprintf() returns NULL if memory allocation fails. Currently,
tx2_uncore_pmu_register() does not check for this case, leading to a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.
No automated tools were used; this was found during manual code review.

Fixes: 69c32972d593 ("drivers/perf: Add Cavium ThunderX2 SoC UNCORE PMU driver")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: Dropped the redundant error message as suggested by Markus.

 drivers/perf/thunderx2_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 6ed4707bd6bb..24443ab5d998 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -738,7 +738,8 @@ static int tx2_uncore_pmu_register(
 
 	tx2_pmu->pmu.name = devm_kasprintf(dev, GFP_KERNEL,
 			"%s", name);
-
+	if (!tx2_pmu->pmu.name)
+		return -ENOMEM;
 	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
 }
 
-- 
2.34.1


