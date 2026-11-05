Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F29B606D814
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TRmht8G3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YMyuTpQ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kHN/2mSyJLVzMG4IiCrQSn1f2cnCCP3IrwJXrvsgJlc=; b=TRmht8G3YYbwor
	K4FPMg0/VJWqpDTj20ZB+QfWhatKeVq8+kXvUixyKoYIX3gXB7fVVwP3WVmlZJ2yUqkWHpju1YCF0
	ewdLymnjXBfCxdYKqKHruFiOES67bsS/cl2fZeJs4SHybRYc4N+RB0azQGNKiepk5riz/wRlGU36U
	6Uhm7rNcF6TaO3YD198GK0cw9UKuGUXl+ADlkoux3akt+wbMOpujDeaxMo7JB8fSxmtUFK3Awuhi7
	AVc4Uz9jTA9ztJKRXK1YPENvr2IklAlD2pNzbIldU4jv1jP4w+uK1rU4hDh14JpMcnlIyLMM4KRHN
	DDT9YaRKAVjwjn88Tq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7j-00000008Vey-2Zbr;
	Thu, 05 Nov 2026 10:55:15 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7g-00000008VcV-3DkI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:55:14 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so19334035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876110; x=1794480910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kHN/2mSyJLVzMG4IiCrQSn1f2cnCCP3IrwJXrvsgJlc=;
        b=YMyuTpQ+NeTysAXyLUegtyxMD2e62VvPMsaFMsLbBGFbTi1VzUXveYhtSAOTAgD70R
         jy5rf9D0KG6QHf7/einvJfajQBajpyWLMyYNdl3wWp4f2XQoLOLAJsmvQ7oph6PdWMDX
         WGDpLYwwrGG9alb3dvq95g7i0hiIO4rtrR050EQXhzs+zcRg1t1rEPMLs+PJzquVdy7/
         W7Z99uoKcf5pCEAFSkv7eUpo8Ija3jwThmQcPlMQRh8XhVudHmgtmnn/W99Sb1PrpAR6
         StwfUPuz2y6LPwAMUvx/KS0v/a5sGKRmdX4ACJ180/VsIQDGBrSf0RNPSRdSi8hasCpr
         Nc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876110; x=1794480910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kHN/2mSyJLVzMG4IiCrQSn1f2cnCCP3IrwJXrvsgJlc=;
        b=dzFNUPO6VLJVvC70J2VjvaiwUM6r57B4r8Fa9Tlrjn8yZdTX9jBXhNFcyCoXiOtncw
         JxSHYBatUMdp52SXfTKEHlmNv3GEEQLwTzL2oTX8LVlferm/rLqn90wMZvLWEaVFXCc/
         lJU7pj3OhfldhrPI+JerRC+5XLuJ56i2XEhJH6ZhWlfKvQt+MMtTS/nQsWvuK/gmdFJV
         tDnuapvn26j65luS4u9oAIRGdaJch2ZqA9cAVLoPnhHXoiXG3p/CUG2h4q34QKCVt/sz
         NaY7Zctyn0+YQ/S5Ks6n/QzqnqQ1XTBDBekePuHiv0Yd0Ux4MIq8Co+LKVTXd2wRZY5l
         Vnsw==
X-Forwarded-Encrypted: i=1; AKwUvBzotkF4NJqvJs46q0ZuZy4KBI4HLJkFlrDOIEn+sxVP5SMZsS4iMX68wG9V0tfpHWr7qBPnlZAdE6rs+9n9RVNg@lists.infradead.org
X-Gm-Message-State: APuU4Z/i2yORkGgdAQWsx4FLAYitDFK7yFhRUd2M7tKywQc8dAJpD4P0
	h2tQ96k6LFAoZyHrw/Xo6ObxL14w8EgNGYwtO84j751b92vTB/TVu/ha
X-Gm-Gg: AYBFou1SkwVDx/tzI12bWIu+JTlIYEiQTRB5Ny48QTGVcwt7tpjcsA+30hjASVsF3xY
	wRpAeNN704MsRV/FEkMAM7SfXJdpxHkpbUnG5YlQTCc8xKxNfnmm7fsxK/s32rwdn4Y/Mz3AsHe
	4lRDuqEPa7bLZFhjnqFjxbaFwqGb1vyTihTJdGLfqMQF0b9ASdizL9wa6CAXtK/vhxGxPkkoXWA
	OcfN11gNCGuGbVVzT5ys7hNmyTap+YIJR2pBsEdFGje+VoYYB2yFddG4yccRjJy5H/1UpyQmMfq
	rOOGAMfm+QGE1EV6W/Cl10xKNuoF1lmTmZS6WR8NdzhO9cJGqKE6vV7OEYVmLOoKW2Xs3fBjHBC
	SRvcud5UaxpOaZA+HqA3Ei96hSkRKuqELNIWrISVyZDqs+gKTT7k4Ikf1VJiAPzorYu7Ff4TP/Y
	Gf7GEvM0v0UjE7ddW0Wi1TvaMUa1mPhjfoJpQGTmE8hoW67R21nx96GAePKEBBs9BJqxT0Spgxu
	3BNxmgv3rHOSxqgTLgM2rWVYslL7nl18DXHZrx9jeSRRppAJh/IIAnDzK+e5NRIrMEhaFO+kKvw
	FyqPkJ2BXmJUboAmRO/kdVlFSi89xfy9UmGoMkDjXFnDYbk1jlXMUqspXe4DU3gB64iu6YL5G50
	KC49brbnF2gYp8pY6Vhxb/sNT
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr476747035e9.7.1793876110240;
        Thu, 05 Nov 2026 02:55:10 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:09 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Thu,  5 Nov 2026 11:54:57 +0100
Message-ID: <20261105105504.1024-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105105504.1024-1-ansuelsmth@gmail.com>
References: <20261105105504.1024-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_025512_943618_C71C6234 
X-CRM114-Status: GOOD (  12.01  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 4c4eca870bde..3e4fb899a85b 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -36,8 +36,8 @@ static void __mtk_tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		*tr_high, *tr_low);
 }
 
-static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-			   u8 data_addr, u32 tr_data)
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data)
 {
 	__phy_write(phydev, 0x11, tr_data & 0xffff);
 	__phy_write(phydev, 0x12, tr_data >> 16);
@@ -45,6 +45,7 @@ static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		tr_data >> 16, tr_data & 0xffff);
 	__mtk_tr_access(phydev, false, ch_addr, node_addr, data_addr);
 }
+EXPORT_SYMBOL_GPL(__mtk_tr_write);
 
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 79e09727b81b..3565e39b96a8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data);
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-- 
2.55.0


