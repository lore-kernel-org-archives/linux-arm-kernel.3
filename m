Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0ED6083602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gdFBq83L;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jWQ5cNlD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=; b=gdFBq83LXWF4+J
	KI9Gc2WlCFpUldTg+50Ulc0rLzDkWD1KJdAZIooDlGlzwpy5hATUkG2I992G6NruxMxvpsDqWwJgu
	BXpW0mreFLRI4LQDbj0eeamChNJTBYZrjeC0YpqtQwU2xhXCK/1OuqY7herp7W69Jh9OvJByclxMt
	14DnIjCgdGKLPrwS9w+MWaZfhQ+RkYMy2smc5LecSMHH6vUdzbYIDm9R7Qj+s+siErjI7fRUz3GZA
	srboLP2MNUkz5/f+GnAi0pgUgZRACMkvDFv57PVJFe2ho9mXiPkB0+ncXANxdAqTLDlVlvFLIK/IS
	cizhMzoayGIiVvnAzR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmO-00000003oC9-2eAG;
	Tue, 03 Nov 2026 22:14:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmL-00000003o9B-1sBd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:14:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e0d885929so56019f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744091; x=1794348891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=jWQ5cNlDjdF4ZRgBgGzz2lIoTZC24m4goxuOY346vpWbdW8aTph5cZxcwy76apt0ty
         c6+r33QX77l247abvDqdAhxTVbEyx3JGTzvRrYGnc6gLE0rkkUWqOKH2GQsfi+Dc4iS2
         L6QG/K4jAepTvV2XvIntg8zSmTZVptSdCOqvYWeFEz3jSByEYH23MccFvC84YQCm0aaS
         7SuNnFbDKxFNZzKbtSbfTLUJIXtIJQa4J7rToG7MF6Nu4ev7d6438pbLTgrNZNn9dNRL
         QiY8s5yJeWTlgUYBGq+0m1Tnt88xd3Qh+/0yoHJlBpwbi8nNbFmK1eNGW4idn7fmKGna
         Er9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744091; x=1794348891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=LO+JDBVDRhk/HytspgwfJBf2e5udOEKEj5IkiaOmp6TE2/wQ7+S20LP1qTcV7woH69
         qDDbV8Qwc9fXSISZ/BxdEZCP/CuzWwDHt4FH529pWi4vKnG06zExL6XddCElhHBCIrPy
         M88ILiNtTfmiUmihG7v35QYxW2dgOoextL5qOwIF0UycZj77yCHOV3lsBZ8FGPBARDVr
         nBDaMPWEyUsg4M/sgfIuS6i4EHt6aCMEVgjqLj7aBwdNWYHVajV1jFiSWwY+U0AQOlkH
         EJpV2/Z4KLecn3Q46T6OfIvYBVtrsm2gKaJSlSI5QUzaogQxm/T4Bu2bUeP+In4O7HcB
         OmGg==
X-Forwarded-Encrypted: i=1; AKwUvBw7BcdDFBT3qTUdeEk68KnjtERmkM88BYD7UC4DyEBQHd1alzRFYNuRJMdUZTYBPcwuS5dNZAyu9JgugcuMNPH/@lists.infradead.org
X-Gm-Message-State: APuU4Z+m+Q2eyn4OgM0fvZ5N05HD6Akp+9cvRuzfsiOfUcNvJIlmnRvg
	RE+ahVxJN4uPCH7/w/HqiVrDOalyySe72idDphpDX16/u51UHtlax+6I
X-Gm-Gg: AYBFou15uaxDAr2qma7jwS2uxdW3lwlOQ3Jc/EZFU1/4o/gJ23BvqWZdfdmWcedvZlV
	DBEsZejTzkyVoHMl3mlAegcn1LqAcAZBk838xI764k9yTWg0XDwzDwS3EQBgSFhSQ1al/4HpMKv
	65564EDL4knxLLFuDkrDwGfn/IV8Mu+T+2bkE/YW9m+MQYM9Bj3gcqceEXTkz930rGNgbG9f4zo
	0ZSvJCj2/hB9yoVfs6kv5xDJ+nGEo3i7W6iDadxZCBPDCZ6/fwT9NvcYUBFJJy4hh83ZGk917Jj
	NlvweqZ2CYIvXTJu9/1Nl9u7LvS/RsW2otqq4LpriwfqA5UprDRuZ10z8Yj1lEmXMFcZjA7ZY7S
	ZWbz83mq+94HTxyW4TD1rM+aH3guoRNNOkTcJ2DdVWCIPJ7TSqpcYZ4dzYe3YCFQB4o6UR2XkAd
	8ZRtl055Uxc9Ix9OYoxNVMBpcEdG+47jyekxy07i20Rfv6QWIOu9/OsOeeoWVbtbyttQFwL6sVh
	tad1l5lhSJVx4AUjZczSTM+FXrR4S9cK8YmGHZRsXojYr3qycZCiLZTSF1Gg7fzs8WHRuVcikgg
	//U0w6Jy3d9N6LQ6bjwY4dHMoMI08c/JwDYxes1jFCblOqQHL5tmedj/4R52uBfuUyfQSyVmQ1f
	MzsMsfqdbxP+4qOQaD1FehEWfP444pUi6uw==
X-Received: by 2002:a5d:5d06:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-48e6e303f29mr32359299f8f.17.1793744091527;
        Tue, 03 Nov 2026 14:14:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:50 -0800 (PST)
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
Subject: [PATCH net-next v4 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Tue,  3 Nov 2026 23:14:32 +0100
Message-ID: <20261103221439.30502-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141453_494265_3918A4F2 
X-CRM114-Status: GOOD (  12.19  )
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


