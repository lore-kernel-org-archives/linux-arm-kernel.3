Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1BFE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 03:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7pzYjRDOZjwQLGfG7tztY2fF9MD2eQ633kRSm3R85gQ=; b=UqBJCybpNKn0Ecvf+wRmG3a96T
	uK1Y41JR5hsLnJITGGMF+ApLURSRSJ1NQK+Yq2bouhZ37H1fJlxVUGEfSLDWeFGuK4GnrFBWnctmo
	4bcrLvpkntqk649WszDhB/3aoj6Zg37X321oaslg5Q6m6HcsG/c4zUE84hk8mdDrLZxHu2WIYHe82
	43qIc8fFTa2uUlvJ+BhYUfikPLxJHOBKWkbZnbOASdpo959BtGruEkF9Vlw9753YgbKvM28xYsgo4
	6z3WhZ9yk/SAxmh9Pe7z9LCfWgRuHuhTcu1wJrP+szKW6dVM/m1aLCGG0oNgpRXwmDa65hNzveLuc
	6DZQR2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZyi-0000000Gp0G-2E9M;
	Thu, 12 Dec 2024 03:35:04 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZxe-0000000Goti-36Tx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 03:33:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7273967f2f0so165319b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 19:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733974437; x=1734579237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7pzYjRDOZjwQLGfG7tztY2fF9MD2eQ633kRSm3R85gQ=;
        b=iiik7eX2n5HZmgrNXtN0V8ifMDzGNXWYdQLzUIkO4ue1ntWppovalblvTokfDsP2q2
         nzK2ryDF4rh1MKzzhRna4t3PF+v2xyzj4Mm0TJmd17Gpw6RwQEp0u5KFQadDJhXUSPiE
         1tkHsL0I46JLaNslWRTryUIKZ9etURnwwoiH85KyJM3E0MM2BYbcKnov7e1dUbN4TkZp
         5fEq0f+IcMnk/yHMuh9y7LSmSkGkk/y+TibO5B3RnhwzplzVe6VaSybymMEl7fw/O6sc
         cDd3JIT8qadWiUtDMyAsFgqX8mXUMuM5MxBut2I2zATq+geEFBKIjXTj+B4e7hJ3J2Xf
         rq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733974437; x=1734579237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pzYjRDOZjwQLGfG7tztY2fF9MD2eQ633kRSm3R85gQ=;
        b=QIHf1mrsKhiLnCldGa1k+xGWoMpdTGSBFcKaW0oOMpzw/7/zj7wug0vJL1qGrhWxqO
         q+Ap07Sarva8ZWnU+NxlNilJCqYCJQvOh910LFoVYNHok5SRIB9nj/lSOt89UWMju3id
         UttUFlJOLbYFs4XvnUH8hdQ3rAKs0ABX680SdarHHsSPdjGQYPeg+LKxLEhu2srSAh+J
         Vs22BuoWAknStONCHTBdIo6eZZmhsoaVTyXz1IkbYwUYFeP8SEpdWEpNX60er+1mtP0z
         gADx87Qc67Av0VkaQDopTf9/3t6THPabyEI2QmsPz/KEEqoMAwfixOBFe8xXoSH8yg5T
         2SoA==
X-Forwarded-Encrypted: i=1; AJvYcCVwLXRYqGud9+acWkiLPSo24wD9XntOlEdWTJrd0FfF1WS3aUYITFXrai2Ozp/Yzl1T7Bxtaf6DSDMHt2fWzMoD@lists.infradead.org
X-Gm-Message-State: AOJu0YwTmHTrqDgzMkIV9wXw0SRNWsHWPzmkMIsAl4LLKx6Evk2ggL+1
	Ztn3UbvYQrgXxGO3Pe1qRQ0evVWxXY3TvVHDb2a1vtK+pxlhCRcZ
X-Gm-Gg: ASbGncsUS+JD0yP2bngddbEp7cKRqeoub3G+8QTx0x4dAPjakiKwSRSnkAWi7jpzF68
	A+c74IbIDQZO5Xe4Va8iO0dCHGpzJwWDgscYDYIaeYr7T5mV/vKnrhC22MuxTCM3I9p62TzQZYA
	3kTHqpC4R3C7+x7n5l49Z+LmvJywlJfTvLn+mqmnKgp7uMob3vYbpf+68EYtmHjtUVO/l2WJ72W
	/Z1xwDI6YeqoHtaXwivm9zBlfJrMmVl6yGqvBioWJzQvRAkVvcs95GyQsthxHZpERWFzg==
X-Google-Smtp-Source: AGHT+IF2HUGVgJTHXHp2yZPxjGH98+Grs5GenuoQqTTyxoTeHaymmzl37DBT8/NhlfehPqg/7Ou6EQ==
X-Received: by 2002:a05:6a00:17a7:b0:725:df1a:27c with SMTP id d2e1a72fcca58-728faa2e5a2mr2417893b3a.14.1733974437292;
        Wed, 11 Dec 2024 19:33:57 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725f03a0ca4sm5879236b3a.113.2024.12.11.19.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 19:33:56 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1] net: stmmac: Drop redundant dwxgmac_tc_ops variable
Date: Thu, 12 Dec 2024 11:33:25 +0800
Message-Id: <20241212033325.282817-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_193358_842360_BCF30F0E 
X-CRM114-Status: GOOD (  12.29  )
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

dwmac510_tc_ops and dwxgmac_tc_ops are completely identical,
keep dwmac510_tc_ops to provide better backward compatibility.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c      |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 11 -----------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 4bd79de2e222..31bdbab9a46c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -267,7 +267,7 @@ static const struct stmmac_hwif_entry {
 		.hwtimestamp = &stmmac_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
-		.tc = &dwxgmac_tc_ops,
+		.tc = &dwmac510_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxgmac2_setup,
@@ -290,7 +290,7 @@ static const struct stmmac_hwif_entry {
 		.hwtimestamp = &stmmac_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
-		.tc = &dwxgmac_tc_ops,
+		.tc = &dwmac510_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxlgmac2_setup,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e428c82b7d31..2f7295b6c1c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -685,7 +685,6 @@ extern const struct stmmac_dma_ops dwmac410_dma_ops;
 extern const struct stmmac_ops dwmac510_ops;
 extern const struct stmmac_tc_ops dwmac4_tc_ops;
 extern const struct stmmac_tc_ops dwmac510_tc_ops;
-extern const struct stmmac_tc_ops dwxgmac_tc_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 6a79e6a111ed..694d6ee14381 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1284,14 +1284,3 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };
-
-const struct stmmac_tc_ops dwxgmac_tc_ops = {
-	.init = tc_init,
-	.setup_cls_u32 = tc_setup_cls_u32,
-	.setup_cbs = tc_setup_cbs,
-	.setup_cls = tc_setup_cls,
-	.setup_taprio = tc_setup_taprio,
-	.setup_etf = tc_setup_etf,
-	.query_caps = tc_query_caps,
-	.setup_mqprio = tc_setup_dwmac510_mqprio,
-};
-- 
2.34.1


