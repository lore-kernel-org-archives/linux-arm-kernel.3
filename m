Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FFAE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 22:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GYZguq+bOqaLBNmT5LzVDxT3aVxG2gbJEu2POu819ug=; b=uDditAK1OH0ztY8xteufXFEYk8
	a6O5rjWUvvioIWjo8wT6EFUmhsl6q7Z+21KVnVzdan3XMWs7Ey10HcnVktPcNXLzkKZhpcnmcDcBb
	bNGC+OpkWWs2o+kFguK9aD7WROFLhQggmboWbrc2EnMqgrT6hlckm5wW1JUDftB5igzwdwPMToLuo
	pWA8PHZ80N05sTH8D8aX44AIlPHDmYaHA4vE3datAfkD13NNMjtuqEu442JkJM4zncxgusK+6NSDZ
	CNxL+UbOsjOFWG+AiUoxOV4mgzjIrj5Fe3mHeaPcrswRyM/Tma403gvgTH+IH0cxi23UyahKMoiVS
	fxfOZ3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMxN3-00000008anI-1u1d;
	Sun, 15 Dec 2024 22:45:53 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMxLv-00000008aYQ-2gNy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 22:44:45 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3ad272538e8so11042575ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 14:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734302682; x=1734907482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYZguq+bOqaLBNmT5LzVDxT3aVxG2gbJEu2POu819ug=;
        b=ETlUqLYhUJqFMSr2JG+S66108VJnCCQkfVkFPChdwfvZFWc54+MS0XfOpNSOuv+M+n
         0yt3vnpTC+tG4yZZvVobo0a7+pWy75Z2TN1hOytT4CTDu4vBlXw3ZUpg//CyX9fzptoa
         oU3FRPnD3PZTHDicD+LKVwtIyptwM/BnoXpyfJH4bWOnC4GS4r3qWNICqc0Ya2ajal2c
         uP3L3eHmrypkWiGH4jm1l0pyOwppstreMvyyNdRSNCvU1Wek1JNxPsQM/9usRjUKSbhM
         D9Jvgr+YpSGTKrO4Tbmw/bgmmndLmj8RXJZfwE2kBNqmj++/o/v9afOVPdl/CUHdf1wS
         E41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734302682; x=1734907482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYZguq+bOqaLBNmT5LzVDxT3aVxG2gbJEu2POu819ug=;
        b=B2FuFvLP8cgoYkg62jxgHmIQDH5HR4OE6UX4Evu9llx9vTS8IqwzyhPDEkevwgofkx
         4Q7Qji/amWW/yajekEkEZioaNvIjRZyoc2Ix5yle9ZxdNZNTX94cSBSW6haG0L7/Uo/b
         xplyRnJRVS9O2s+YMywbxiS6nclF7OYsM9oEvwHdjB7eN9857g/iMdILufTR/9QrdSn8
         41XeUmEkMm7TiOQ51alYR3nrQAnYIB76K0z8Ya6z0eLcQrj/PQK25b5rvqG2YlT37Qzh
         EYnFsjcuYwy9r14zw+GCCHakG002GtAG19QlcqY2TnbPnFcu6+BXFK7+ZuMZoowAxm1G
         efBw==
X-Forwarded-Encrypted: i=1; AJvYcCVNcmnsSVAtLQEyrXogyp8dYbV9hUgggRtx3uuWOn0xymXydcjdqg76AX15SR7NDgZ9N/yJKmlvtfUmr5wQXDsk@lists.infradead.org
X-Gm-Message-State: AOJu0YxlJOmq+SeIOD7bOlSocmnPtTuDA7xkCJm3G4GZUlUP9VPC7JUh
	9WgRJWo1FVuVfP/puXCVdpj1Cv8MK0fr+1kLsaJs+OXUHELKmfy2
X-Gm-Gg: ASbGncvrobT4ef+BupzGetFCVMwA0Ma9ScGHjIzHgJ2UKuJGqfkxQ2UatKT14cf3+eR
	wTdQeeadaKDWzrRPS4JlVDsc2dOvDKfOG+soK0uENLvzHQfqRhKkIyaUWdAUfOM6vnJMXNpsgGc
	tjAXvT/FI1zqHheF825cOijk75MAmTs+Raepx1tGT1TKUey/DKLjbGp3V1+ZMubo4ykU0rjEGbJ
	QRYW0oq7vc8RlV+TTPhkneIJ2l8Nl416ZQ865KaXO0bbm4kMzzlVzyPq2F+BRLPVQuw
X-Google-Smtp-Source: AGHT+IGePq+VdOyJwC/DP6nHlG7iOFgBuuD/YTZRBrTEMTV7bz9Y/zOVCSArMUyH99zVjxlIVgJnKw==
X-Received: by 2002:a05:6e02:198d:b0:3a7:cf61:ded7 with SMTP id e9e14a558f8ab-3b02e0383f4mr90832675ab.10.1734302682348;
        Sun, 15 Dec 2024 14:44:42 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b2475af2d9sm12349775ab.14.2024.12.15.14.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 14:44:41 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: fabrice.gasnier@foss.st.com,
	ukleinek@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] pwm: stm32: Add check for clk_enable()
Date: Sun, 15 Dec 2024 17:47:52 -0500
Message-Id: <20241215224752.220318-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_144443_695781_BFED4D99 
X-CRM114-Status: GOOD (  13.72  )
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

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: 19f1016ea960 ("pwm: stm32: Fix enable count for clk in .probe()")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pwm/pwm-stm32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index b889e64522c3..b94d186e3c0c 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -858,8 +858,11 @@ static int stm32_pwm_probe(struct platform_device *pdev)
 	chip->ops = &stm32pwm_ops;
 
 	/* Initialize clock refcount to number of enabled PWM channels. */
-	for (i = 0; i < num_enabled; i++)
-		clk_enable(priv->clk);
+	for (i = 0; i < num_enabled; i++) {
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
+	}
 
 	ret = devm_pwmchip_add(dev, chip);
 	if (ret < 0)
-- 
2.34.1


