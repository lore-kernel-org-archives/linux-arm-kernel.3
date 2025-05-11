Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6160CC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUIuHKm5CrgLUrfb0rxe39olGMFqadKbva67STDygLc=; b=A+Wwo075n4EwwLxWpTqc/CWbYE
	KvXWvE2AvRxdnQc0K8o8s9rX0AjFj3lKcnF3Piu1v/KsGXGh0B7OCcvG33zyENlYUH/c0TaWIF6lo
	sxoGpL87yOU6wpau1jc0jB6XGz1gs8U87IRbvDfMCLmk7yfRqifWw9/0R1aFtmlpVlWsag+THjxSq
	oVd3LlMkCj7HRKpiyNyJ6gj7q/eseCCsQePunC/z0jBmaRvtj+3Qf+V3jgsgYhkioQRKJ6Czd2DnC
	ZmI/Lzx5dcaMjkJ3LjtOcBxPye31py1EMU2pN/3lliBXdnVaB6VdH55HnE90/xmXW4GM2cg+SN0je
	p7sN6OQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAV6-00000007bHK-2Z2T;
	Sun, 11 May 2025 17:30:08 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAT1-00000007b2e-3YXa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 17:28:02 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-47692b9d059so61085191cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1746984478; x=1747589278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUIuHKm5CrgLUrfb0rxe39olGMFqadKbva67STDygLc=;
        b=GhtOfjjug0E/FwAwMtQp8xK8k8+EUn1Z8t2mFHac1pAS+lzBzcqASO4vFZW12s8o1b
         ZireJ/qTxw6TR0/KHS3kFaaX1+5il366KhSmTNPcdW8s1yO6Jr3VU25cikAUYwHZ73mM
         jzmuwu0qnTIJZafE5Iji596hls3PD6ky1NH+Ax+nHKeqWHuBkm67ae+hSQcwMsLPd/cG
         eAPlvMuvwosjp9+Hhzsplj5GIp80tTft5wW4rGZL55r3aO8cFaXQQBYtXQLidXVCgfTA
         U6fOdr3dneON+n8B7swcZQvPKcuI/yoooB1lZxFBu7tv8d2wTpiAJh3RqDD1AiSqhXS+
         K5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746984478; x=1747589278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUIuHKm5CrgLUrfb0rxe39olGMFqadKbva67STDygLc=;
        b=kveSZMjzEy5woSxgLxXPkVVlm4JVNzgYdkRJDhfOm+N1pQjFBThnoYdUqSiJgS2WSC
         dPmApa9oQAy4qFJuJfa6CNBvL24j8jrrt/8yN2tCNrNJL18lbte0sduKiYYcTxH96tqp
         MvvDhc6msZegj7KCBIawxCbHy7xRj1YYCx5HWtl7Yc5+utj+MG6IBsTj6fkbZmPHvXsM
         aiaSijBGPlOW/rYWq53jjlgcJsZzEt0nTezoB26BZThiJ8m/FZCuUBRCb0Q6VcD54fhs
         AddnJkHd3MlraU9gov6E/qWVck9pF2xivgGIefoWrLpjo+ZJeupb7gi3UshAR6RoFAzo
         QsAA==
X-Forwarded-Encrypted: i=1; AJvYcCWVGiNLSn76fm9ekCUwqeA7fNxIOwCrRNVxS03cL0z2ahPDKHSIYc3rwoE0TbWd3p5aC4AzBH2DXPOVHM83i8fW@lists.infradead.org
X-Gm-Message-State: AOJu0YxPu0gjWonRbJS+98iLAJGkRizxncrTx1JcPUa4JNsH2Cr53qIX
	O+aFKVrcDwvzrVO2sbzBxAPa7xgTKXd7Rxl0lPbKZJrC4d3TfiHA9veyVteXgg==
X-Gm-Gg: ASbGncs+mWxe/AZIZV2kvZsiar4Gx82Vyx77edbdj0wENDUK4weGCsCuwURmLvrX/J6
	UXTDy5yE3xmAW55PMeFG9mvZOoCN7HKiyH6D8veFNN+CayExKC8lX/wv0ce6sIrkmFzkK7VQq0z
	q5aJJH/1YhhY8FKjGGRFZKiSioGfVKch7JUaGwFUrHrJONwO3I/gJ5xQRacW8Q7f4uNfcX7N3CC
	MSpmokaFBotBDMyNIVRa7IEfuWLSJ6iHu21uLIBYGo6RlAHaxoktCF/JzRcCudXpIBKZ0zVrFW9
	ZA5fH7/vUa9oiua68ehhyDJZTgfnuopnJu0l1Vu4c3kSnlI=
X-Google-Smtp-Source: AGHT+IFlP5l0H31XlZsHA+W4Q93wZy0iO7ylnNI0g0kBW6+BKRL+6jyRI5gTxis2QFwWchN0XCtGaQ==
X-Received: by 2002:a05:6214:224a:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f6e4801da4mr189887276d6.28.1746984478330;
        Sun, 11 May 2025 10:27:58 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f47basm39766846d6.42.2025.05.11.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 10:27:58 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-g12a: fix missing spicc clks to clk_sel
Date: Sun, 11 May 2025 13:27:32 -0400
Message-Id: <20250511172732.1467671-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_102759_995452_BA20E26F 
X-CRM114-Status: GOOD (  10.60  )
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

HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

It is missing fclk_div 2 and gp0_pll which causes the spicc module to
output the incorrect clocks for spicc sclk at 2.5x the expected rate.

Add the missing clocks resolves this.

Cc: <stable@vger.kernel.org> # 6.1.x: a18c8e0: clk: meson: g12a: add
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..892862bf39996 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
+	{ .hw = &g12a_gp0_pll.hw, },
 };
 
 static struct clk_regmap g12a_spicc0_sclk_sel = {
-- 
2.39.5


