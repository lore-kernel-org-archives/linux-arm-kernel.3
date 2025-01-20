Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9CCC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4W4c0/LuzN7tD5LrAqYqsKuJBLRBMa73Tfh2EMWw5FM=; b=mEjVvZmmDnDtRydHgfxfdm4x3V
	prTjB1FmmtAQkb1hlpps+eeOB+Li9xKU/2sErwwLEC8xCmrd6o4M3ROeYkqIce0HwwaeYV0rV1YkJ
	NDoZ+yetUaUrP1keYLKuwqZ2aEGo2X7VJ6oA5lkBUiz8qlrJMZuIVS2rFVnfYW53KjlfSVADcYI9r
	R8bRTMdnNjG2vWtMRpgZ/JKkUuhm4zxFBKAx4aU2rnDQcIlYYbWodxNnR38wgQe6coHUO1ZDX4BUE
	FK/Pyy80E1lKzXpHiyiXJ5Mpg9F2gfi2Z5F9fNQUC0Bppla86Ru0MWcDEZmcJpiq8ICCI5ffSRJcB
	MZWrj3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtwE-00000005ujb-3T0g;
	Mon, 20 Jan 2025 15:43:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtux-00000005uZb-3xfI;
	Mon, 20 Jan 2025 15:42:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43624b2d453so50870395e9.2;
        Mon, 20 Jan 2025 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387742; x=1737992542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4W4c0/LuzN7tD5LrAqYqsKuJBLRBMa73Tfh2EMWw5FM=;
        b=cFAhogmacRfKLyiwTirktQC5tk/GG5onsQFj0naPcdtifm6PuK1rEtM0lxr08ek3FT
         R1/GLgCcLR8sZatgT+1CXKULHCqri1NDsaP9+Z9f7bchy0ccuYHfCtninTpOHEEZ+TQZ
         let89Xf/N3qM7S/C9ANZ6KA1pUrJRK/18BAmC/OrGweOry4bd1BkZV/2I1p0f50RieG2
         fUfPZnF7I3Pbceopl0RM8spR7lUq2dCGya7qJ7J7CmiifQwqB2EAFEKMHQUFngv/34/r
         Ja1Bfkeh/GhF1gOBgJnAAArEfa/Qo7iuvSihSHukeEpfK8GIxO2HZiDj24DLgi/ZXMZ6
         KORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387742; x=1737992542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4W4c0/LuzN7tD5LrAqYqsKuJBLRBMa73Tfh2EMWw5FM=;
        b=dBLVH1ocX/ChvFT4Edp/xyVdcfMdLAbZAnX3dtqyiGDn+F03y3mS67lYSQ9wdcxoJF
         E3FVhEk+nFFFQ9PV30ftvLGQJbu8ZUzGtFtE1ZZoEd/wQUnMmgwPNjFsJNXp4IpytM+k
         wySipk02SJ95ro+qEQChx/wav762NhOelNJLy4/P7nH7Ui5LKpfz2tlF9lqG+ubD97kD
         GxqIKsfM87JZsFG/yDByHYC6QiYQolkPsuvFf/r/ttwbyAi9QjnZfsDbvC7jppa5lqk+
         awkB+Dkf4X8fnvS4uTrukCWWCJ9WXXCCtCUO2FXRLmGgMXE5qutwirOYbyFuLy1F43V0
         mNNg==
X-Forwarded-Encrypted: i=1; AJvYcCUme9Ru8jAOM1Yt6+/KtWNAJD+BtdCTs7eRj6ZCoKLv+T+tnhrK/cFoJI2KhQOLzRQJzq11NUlQvem6weAOYdQ=@lists.infradead.org, AJvYcCXf1ah+R0gNslqBgngnI+aCCAnx7zwlmh0pm1ngk+p0CGVgB3WR8O2zHQ29qxWoxbtKldTiO6B5kPS/rSEjvn/e@lists.infradead.org
X-Gm-Message-State: AOJu0YxljzYBj8w1qFwU7vJQNXC5WrEXaZDXC0CrdQHODWVT6gBT1Ffg
	khw7NegLMWfnuJrkSA7tsyJswIv/NOjZjffvXiIQ6J1gnObJcgc/
X-Gm-Gg: ASbGnctROpTQ3icqTsXi17wipJ+fPrL3iE70UpAgzW1cAv/1D3S3Uly03gjiElsUxHQ
	svQe1E/eW5kfPUd4ndqyxNRyqCXmjD8KE6R9VWq/FgA9SPPF/6LtW5meG3DLxxtzdTLEg6bMgOE
	sIBwX2aGOiv1OdtpMlUUMBRQFsQ5ZcnpjAmBU+/gv3uqvpKHYTE1GyQXlvzfcwk3PqcMoGJVZF7
	zs15mHo56jhMF311C1tGwlBl40xPpTRmNJUjEGKsPjryNIvvRjrjIRwT6hwMD6lTdegencuh55j
	Qv+R+840G1lGebOoLcyoDLxofkk+u9gURBuVQxM=
X-Google-Smtp-Source: AGHT+IHArWGZJYxMqqA7FIuh1RrMO/IPzuG8Jyig93HVcMwBqwDYBNOX69/XG1Nj0C8lDam+sizI7Q==
X-Received: by 2002:a05:600c:3548:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-438913c6150mr125730205e9.3.1737387741983;
        Mon, 20 Jan 2025 07:42:21 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm158637895e9.0.2025.01.20.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:42:21 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net PATCH v2] net: airoha: Fix wrong GDM4 register definition
Date: Mon, 20 Jan 2025 16:41:40 +0100
Message-ID: <20250120154148.13424-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_074223_984458_34643D93 
X-CRM114-Status: GOOD (  13.22  )
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

Fix wrong GDM4 register definition, in Airoha SDK GDM4 is defined at
offset 0x2400 but this doesn't make sense as it does conflict with the
CDM4 that is in the same location.

Following the pattern where each GDM base is at the FWD_CFG, currently
GDM4 base offset is set to 0x2500. This is correct but REG_GDM4_FWD_CFG
and REG_GDM4_SRC_PORT_SET are still using the SDK reference with the
0x2400 offset. Fix these 2 define by subtracting 0x100 to each register
to reflect the real address location.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes v2:
- Target correct file (fix wrong downstream branch used)

 drivers/net/ethernet/mediatek/airoha_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 415d784de741..09f448f29124 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -266,11 +266,11 @@
 #define REG_GDM3_FWD_CFG		GDM3_BASE
 #define GDM3_PAD_EN_MASK		BIT(28)
 
-#define REG_GDM4_FWD_CFG		(GDM4_BASE + 0x100)
+#define REG_GDM4_FWD_CFG		GDM4_BASE
 #define GDM4_PAD_EN_MASK		BIT(28)
 #define GDM4_SPORT_OFFSET0_MASK		GENMASK(11, 8)
 
-#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x33c)
+#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x23c)
 #define GDM4_SPORT_OFF2_MASK		GENMASK(19, 16)
 #define GDM4_SPORT_OFF1_MASK		GENMASK(15, 12)
 #define GDM4_SPORT_OFF0_MASK		GENMASK(11, 8)
-- 
2.47.1


