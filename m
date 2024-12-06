Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75089E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 21:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1ATQ+hwSVg06F/3XJmwp6Pc51et8mTf/y94acpTuzc=; b=nOYk3O8d6vl+KnI3llucC3omuE
	2kChGsrwa9qyaDdelLMAEd57+Ycjx0jCMCYvRCKLX69B5qGInP75yAzeYOSifsouoSEpDWGLBFRa8
	6Trx4qV6hDdGuwunioYJvPZBbAWk52sn5BBlYN4mXsVM82qWhAUS4ssTktDvGusfcGbovY7BPawrK
	xQK+MS6lfCA1pkQ906bY9+kr3sbYVsDrFn/WTB8YI6+b4wxeOwV5ukUFtWfSci05Ogu9alKvjvq/7
	SNd/KoupTVR+SqHiASFOq47roNpXOTKKq974Ja2C0D2Ok/Et6LaKR0kZKyQ0wfvmQXbzO4riYg5c4
	2+R/U0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgE7-00000002pGv-2Jxn;
	Fri, 06 Dec 2024 21:51:07 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgD5-00000002pAY-45e5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 21:50:05 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e38938a55e7so2772963276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733521803; x=1734126603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E1ATQ+hwSVg06F/3XJmwp6Pc51et8mTf/y94acpTuzc=;
        b=eC6P8E9uY256J/TeNLzAi9/LO5RzRrx4qFJ0YfIrvnqRrl6zThKviTxuVFUj8ZL1ks
         nfQYAkiKUh2mghcjV4HPRamSAodOqdJF/U2qncbn4TqG4+dQDRjjGa83CN2q8GABZFc/
         tNuN4ri6n2LbUfITEDpxHqBhTfAgatQmq64gCzhSwcC0Q4sUAjYph4S0ytNPPKKPdrw7
         F7ncXq/urbz3N12f3xFTKXLbZAyNonxzh+jwbLjd2E1lqx27qbToNZ2IKKrdpOIDIzM9
         fHHoAqIpWFHwyH8NIN6Io4BFkbch5HT8oExcR3xaescNfCd+NKWG3YizfDFshlwIgcBH
         GzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733521803; x=1734126603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1ATQ+hwSVg06F/3XJmwp6Pc51et8mTf/y94acpTuzc=;
        b=wijg7Z17CEFpDGe0mSwW34fY7XDG+8TwjvyKX68XXqYNtW7yxudbSGPi89CnPD/zR5
         VDPEn4aNmZtwkoisWfhG42mFa2SxWAX78o7+a6LvH1sC6KB9UOIbgWW6TY0ogrBwl0Nc
         rxSjItNFzJTVAvH3++FcbBkqgu6IZzp8uxmC4rPFUAymwhqnWYEaw83XqcPcVjy63kpW
         roXpn9gyjT/AEUIyk25jk1WKePK6s39WodN02CE46OKzXxSO7Xo2BPJTFP4oT4bFAmlw
         mcgXrLEdcIRZeSMyDHGXPMTC7BX9n3uykidl9qqvlTbCOm+EaxbZZef5CB86C/DXjHgd
         vugg==
X-Forwarded-Encrypted: i=1; AJvYcCUbk2kcQXsIsKY0Ol6duOXEjoCxTcaJhk9B21VhgoC/h7fR+wLyuqR8kVQpOw/NzushG9/zLqcPZZsCqKrDAQAV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf0hFlpCbxbJboJp9YDgOFGoW4xap5CoPsAYuceUi4wPSMErMK
	M2PCUQkPKlc/oAtA4DCTMW3TdvadsKtnoXtZ+h6mRhMl3m/UG4Qh5uMb8Mue
X-Gm-Gg: ASbGncu9E1fnRSO+DCsnDFjBlNhCYnGaSfMv2mv8hqNP1bSxpgSqvFKzOxgYFSxU3sx
	C29tsJXu0BxgtQdGW7GHO/0q0L3blZFYAn/5QbaC+UvpEyJhxmJlvPMrIaTbJYTsXYi6fGpIIFb
	mxKtQEBB5CC1OsLnAKVykMOCkJIkhhpKfPZicT6gKW+blh7t5dx2JcObU4/J0HhtqOyfkiO4eq/
	spqvgnAxxOktaK+ULleMlAk/FyrI0KVHeZ1iku5kPdMl4BRhvzKD+KqepiosQ==
X-Google-Smtp-Source: AGHT+IHkD9Ci5WOwSKQRn4HpRXLx7B5Rbt64C1MzXq6No2+Ek1WnLIKvhB0xUCl9WeQHCE1aUg0ICQ==
X-Received: by 2002:a05:6902:2b88:b0:e39:a3d9:48eb with SMTP id 3f1490d57ef6-e3a0b133286mr5243945276.26.1733521802732;
        Fri, 06 Dec 2024 13:50:02 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467296f2d0bsm25474161cf.39.2024.12.06.13.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 13:50:01 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: ukleinek@kernel.org
Cc: fabrice.gasnier@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hierry.reding@gmail.com,
	lee@kernel.org,
	linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v3] pwm: stm32-lp: Add check for clk_enable()
Date: Fri,  6 Dec 2024 16:53:18 -0500
Message-Id: <20241206215318.3402860-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_135004_013796_B1069112 
X-CRM114-Status: GOOD (  12.58  )
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
We used APP-Miner to find it.

Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Add tool name in the commit log.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 989731256f50..f09d097d6284 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -167,8 +167,12 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
 	regmap_read(priv->regmap, STM32_LPTIM_CR, &val);
 	state->enabled = !!FIELD_GET(STM32_LPTIM_ENABLE, val);
 	/* Keep PWM counter clock refcount in sync with PWM initial state */
-	if (state->enabled)
-		clk_enable(priv->clk);
+	if (state->enabled) {
+		int ret = clk_enable(priv->clk);
+
+		if (ret)
+			return ret;
+	}
 
 	regmap_read(priv->regmap, STM32_LPTIM_CFGR, &val);
 	presc = FIELD_GET(STM32_LPTIM_PRESC, val);
-- 
2.34.1


