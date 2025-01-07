Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E23E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fMRSb4dnSsNjNB0J5PZBlf9Y068CCmYN8ovILPTjdbA=; b=IBfSh9NpRahPg/OV/Y/F1qGWFh
	98+lC0FUus89EK5xzWip6jI7z8zGqIk17OnoKQSeuGDi2EZdA3IdIfMalvzxM752ucOGeMjDfC65m
	C12dmWpDrLGiCeejgidvHNfhlaRGoKV5enmoDaCQY8Cdco/Oj0a88R4tSQRS1ViarN4yVBIK1xfcm
	yGY0dijgkSpSCTR/WSL951x9/o70hXl1mSNW+GRPNrfONKQa2kVqSFm/VsQapUmWKeYNnJTcCnphW
	N1ItHDVwiT7O41A6CpuSE3T5uoLgssLDLysMTXz7JAKIr0esu4+9kztAibLb3q+eFVWTYi1G9Dn14
	kPgLvoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4XF-00000003pyd-0Bns;
	Tue, 07 Jan 2025 08:01:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Qg-00000003ok6-0a0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 07:55:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21654fdd5daso205877765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 23:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736236509; x=1736841309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMRSb4dnSsNjNB0J5PZBlf9Y068CCmYN8ovILPTjdbA=;
        b=SqRTiJkzD8HbO1Hv49LssWnWMrNaKvEbo5Wewa41klEJGS6EtxhGm/J42PAt+Fo3aS
         /luS445o7JIYy1QI2VBD0fZTn6XnnlKmeqNa0wwPBXEv/BPHx0qSSk43WGGJC5Ce0OAH
         9ZXSO9OHariyyszWXP35XhP0oDGoYsvinJDDQqUYF3Z9227m/WwUzLJ4ZR30wTenldCR
         /9oKENUmFPx1UH+d86dUUJ8ED5dyA3bFIAUmWmTWOqlK5eHQutcSRFN+GzJclmYiny5D
         rGA6P7TSycMq9jizKBiV3oO//YjF73CnvaWhpIy37s1+pE7uJsTvMj+H9gvWztz8Xelr
         PyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736236509; x=1736841309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMRSb4dnSsNjNB0J5PZBlf9Y068CCmYN8ovILPTjdbA=;
        b=pIvujZEoeojaI8Ac3xZ9ui1daUn2tJn3h26Enpm/hE+zKF3ZMrNhX3DXk441YM+pLT
         4ySotclYnzq4fBrDTInH712aO70Tuh1OqtC3LuUa/XVn7n69HAWyPE63x2EczZ+1toWw
         ilJOEdhSfHjaF78YeiWyP13wFVS/TZXTFt+Po5ny+mDELwhLbedZ6qgy2XjMVSPVmB2C
         +tIqsr/AThavqF6Dsi+/nOktywu7xMB91/NXqepKdlbWxdMZUlX23tLoL9pBUEO5TLkc
         HcfJ3rAbro2CRcfJfBgYB2wNPO/ct9YfbIKQcZfmHiJrt4ZQGVN1fZSVXH9TMJLtfQ5m
         Ug4g==
X-Forwarded-Encrypted: i=1; AJvYcCUUx72eOXwMmGqJAHu9twdNAJd3wsznordKzjWDf8qGPRXUgSdxsdGYS4KJ3MbxNrXIPSyYvnudoH7OOojb7HiZ@lists.infradead.org
X-Gm-Message-State: AOJu0YworsrwRQcU6w8LlE/fHiPcCpy5zGGh3rwPBw1s/S4AY0QU0qZe
	Falzg2Ol/wvQYiozlRbAIpYfrarJyk6bZM+VYA7cDBeoPj3NQnOO
X-Gm-Gg: ASbGncsawnBA0EL1m9uMAl9PVrKnHaAU7XdPA44p6PcKBIz4tqKSDyR3AKORvNqQGp/
	FVZ1OsQXlXS0qg9XTyjce4+BAP+TjIjQJeAJzuSO3jLHYYa92QTMQ1g1pbooZOpl4bjiXVLrhWz
	FKgKfNB2Lqs+d8Ipotsevi8WuuEnEb6VGOGnv1nweQzxyWu9oLwBIA77LGPJPXFb5JVgB3PFJrE
	Ejdacy3jk8IjD9jO3+rGgQoxVFtgo1dLhoRnVfseTaXx2lAMCKYMlh36IRANCUkrjklbQ==
X-Google-Smtp-Source: AGHT+IHTiLKTTvGlPvf762xL6WD6qZDn+dCSTlEUSBZ2KuE+CZ/5XDACbnpOBQG5E+loF0NezMfxjw==
X-Received: by 2002:a17:902:db11:b0:216:282d:c69b with SMTP id d9443c01a7336-219e6f4312dmr754512945ad.50.1736236508633;
        Mon, 06 Jan 2025 23:55:08 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9f7e49sm304468635ad.217.2025.01.06.23.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 23:55:08 -0800 (PST)
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
Subject: [PATCH net-next v2] net: stmmac: Unexport stmmac_rx_offset() from stmmac.h
Date: Tue,  7 Jan 2025 15:54:48 +0800
Message-Id: <20250107075448.4039925-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_235510_174941_1B0637BF 
X-CRM114-Status: GOOD (  13.35  )
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

stmmac_rx_offset() is referenced in stmmac_main.c only,
let's move it to stmmac_main.c.

Drop the inline keyword by the way, it is better to let the compiler
to decide.

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
V1 -> V2: Drop the inline keyword (Andrew Lunn)
V1: https://lore.kernel.org/r/20250106062845.3943846-1-0x1207@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 8 --------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b8d631e559c0..548b28fed9b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -416,14 +416,6 @@ static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 	return !!priv->xdp_prog;
 }
 
-static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
-{
-	if (stmmac_xdp_is_enabled(priv))
-		return XDP_PACKET_HEADROOM;
-
-	return 0;
-}
-
 void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2f518ec845ec..24cc39d8edbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1315,6 +1315,14 @@ static void stmmac_display_rings(struct stmmac_priv *priv,
 	stmmac_display_tx_rings(priv, dma_conf);
 }
 
+static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
+{
+	if (stmmac_xdp_is_enabled(priv))
+		return XDP_PACKET_HEADROOM;
+
+	return 0;
+}
+
 static int stmmac_set_bfsize(int mtu, int bufsize)
 {
 	int ret = bufsize;
-- 
2.34.1


