Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7F6C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=odmYbKO993NxcWEpTO6zguNEI5nHkuOupq9/kpSUARA=; b=BQeO4xx3e0zJwt2ROeKSvM2Tni
	8SPyGgxoU3YYuBw9s9qBGOIacuyRkOPC7HWV0VUIoFWqneyG9qbkq+UNTFgJt9wR77tqYLTwESjRJ
	gO1i68du6IaylRQjxmvqXQwam99HfeLF/mzpAIPYgxc+giYFGb0RA2Pup3aU8kY4KXcPJwYMBIsIi
	x/PBeebuPvBW9ha5sQU8dCNzga05h9yp3jmj8NQ+MtLyQNCDZBYLsUq6CaMgY43re+aeb3V1NHIBv
	zBNoYMb2SrEn00PLzvhg85z8zivx3fbcNs6j6x43Rbvd1h+pJNJOYC7leYuFX01FdMLbc18XEN4no
	r7GynQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOZ-00000007bqe-0AeX;
	Thu, 24 Jul 2025 13:54:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuRe-00000007Mdz-1WSA;
	Thu, 24 Jul 2025 11:49:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1047703f8f.0;
        Thu, 24 Jul 2025 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753357745; x=1753962545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odmYbKO993NxcWEpTO6zguNEI5nHkuOupq9/kpSUARA=;
        b=ROKxWV9X8AbQPYDaap2pSGpEclpblLKVevWJ/JxbToYnzilDko6LvJg6I3PmLpVGDM
         PJjeS5C/SOLKhkEybgrQ2Ab+upoZViPX8Ui+oVPgw2CYjk7ImTTSIVJkyiTL5YXgzwDc
         gVcFvp9G3BMt0AvcI9m7yEpc+1B33PJEkBBWVsbaDjNu3SAYMVOwKh68b6zURiCOoH2K
         bk/Iv9MnKY7l61hmQMsAotJyYP388pKNPdWlHyils5JmF+IHxC76+O8n1rQN49HDgPTL
         Oousf6fD5PMPh8GtiAB0ngf+mGNlBWfbyis6RMt9Qo+ER8D2JvEKycFNRaXUc2kbaoMO
         SlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753357745; x=1753962545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odmYbKO993NxcWEpTO6zguNEI5nHkuOupq9/kpSUARA=;
        b=uQ+YIUcKa8uwpg/aQm/dJ7w7SB1JYzQgeYveMEbDJ7m63Pa61zQ2BBAPCOfZsxw+7d
         tLltpRXGoP8iXN3D5VFP7SbWvNnze7eV+B03ftclcZGaiZ5pkw0k9S2gRioKZgSDgMQr
         hfmjHnRiCpuAF+NhVSKJNQ7+LctC+x03vTPxfL03cCuIVT0DA2l0i9atT9APu7C6ReGF
         eAEqo6rmgXqpuzflNAZfIwNyO4lQ6EmEvhzRwCPp1ieYUD+u43zICuKYZ0sQroRwJFz5
         2VBQpiaqtMT2+c7Gsei0PVEM7caGq1iAb/r7rhW+EZMCWPi0PiMoe+RYddFDAs7Qkppu
         L52Q==
X-Forwarded-Encrypted: i=1; AJvYcCVs9suElxj5ISDxhu6Quzmn5Z/n7fy92XP1EulKgDWkl7SD26R9d8V2KKTjzvZrWIzzHaHWUxlSsm3j/0hkimsK@lists.infradead.org, AJvYcCWywozH5tR8tFibG18XvJVjuAr6CEmxwsQlItm6kAtz4XT1pBYfvYDsi3ewaGiGULyX3YsPHshpkLLr/n7CBks=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZBhRzenEBIRI2SJDyHtCHgIzZtcjrR9IUdnAih5kvYQl9HzdA
	cxIx0ZROy+VEI1kMV7YbMfb3tLYILWE837xM5zX9InLNw8Ml4AA7UV4mQfzzna4Sbr0=
X-Gm-Gg: ASbGncsuoOYGuQFnu1f6ZOyk2uUm/6YJlMh0mFB8tWeh56sjwLAhLpw+CGFKr6A5TdZ
	PC2+vqXnWO+X31wq3mpIEEVfK7AYs2J0JHHYgNfT2bEH8/obDny5kaT8M701vLt7pj3+ruXZhZi
	4gM63rjN/fhS2HpOqMuJXTKsRfGrMbWBmmRSVC8kfH/nXF59hyxOCgyUyg/r3akpDfBgpO0WCLQ
	YX4XZWYA4hIsGVFUujITMLcVSyguW/fJQjElJ1vAiyWVbtPCCtIRlmx0dXp4e7EMTw9SWCXhqd/
	2eUqmhIEekT3DAcYT+U9G/bZy5R66xo1eYD8a3hJdSEn8j6gzta4hYIig4Hn0KFfXKeyQeT0KD9
	Px9uAMkaH11b9Pg0myl/j
X-Google-Smtp-Source: AGHT+IEgfaPVKq/DjehMIBnrjBayXpQZKOBR49FXizcPSeI0nOTLp5DVN96/5/+8kz+MV5eS9OEGfg==
X-Received: by 2002:a05:6000:4007:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3b771356fa0mr1567580f8f.18.1753357744674;
        Thu, 24 Jul 2025 04:49:04 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b76fc6e5e1sm2002425f8f.28.2025.07.24.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:49:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] regulator: mt6370: Fix spelling mistake in mt6370_regualtor_register
Date: Thu, 24 Jul 2025 12:48:32 +0100
Message-ID: <20250724114832.146718-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_044906_421722_0EB9D8EA 
X-CRM114-Status: GOOD (  12.55  )
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

The function name mt6370_regualtor_register contains a spelling mistake,
fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/regulator/mt6370-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
index 27cb32b726e0..c2cea904b0ca 100644
--- a/drivers/regulator/mt6370-regulator.c
+++ b/drivers/regulator/mt6370-regulator.c
@@ -320,7 +320,7 @@ static int mt6370_regulator_irq_register(struct mt6370_priv *priv)
 	return 0;
 }
 
-static int mt6370_regualtor_register(struct mt6370_priv *priv)
+static int mt6370_regulator_register(struct mt6370_priv *priv)
 {
 	struct regulator_dev *rdev;
 	struct regulator_config cfg = {};
@@ -363,7 +363,7 @@ static int mt6370_regulator_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = mt6370_regualtor_register(priv);
+	ret = mt6370_regulator_register(priv);
 	if (ret)
 		return ret;
 
-- 
2.50.0


