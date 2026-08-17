Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D9DC5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=; b=bryrKEbJWjpusWgXME9KTTZ1WV
	atTn3nvqpRJN3DPWub4h7cXIVtEr9Tjboc9Sj89vSqbwA6R+YykwWgR6gcFx10t8u6L+AuuWXm8GT
	e3puFFvRGgxR4DfcpNpRtJ2U5Kg3Zs+T7JHiT8IGqaQ050fQdXdYjeh9t2pRtiXKTaBdtFE3FECJ3
	v7FPGKW9YOzk+ebizIGNTRCneM5TpFa7G/b/DgB2P1F7cv1ViKvUxw/sSPFP16rlsj4kChw4MKBCK
	mDX7mzD1x1u9SbJN7nTXykeU4w+H5ELd+E6k4zRtKS21Wr+WTrZtoArQRjKmQ8wvNFztv0iL+KvEo
	x+rxJ0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuud-00000005xaT-18lM;
	Mon, 17 Aug 2026 10:49:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuua-00000005xZf-2rdp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:49:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3179795a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963787; x=1787568587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=;
        b=ULkU6hqMD33g9vwLtsMfyXOQtHaJI/ERB5m8CN5xXIBaX5P1K0YG+vAfJFR0YwPfR3
         czXaJiG95PWw4O/6QdZQxn+6+D5wUq2zyeBa0cI9kPUuOoidUqZ6NpT+hU+9L6/4Hvf/
         dXx0XKKbIOXNZzrHZiHeXRK0aD/wRedNrAXCStQvmhsF2aAKx7fTwggzfgVyRMSme7xN
         n3GMS9iZXsJhIvxT8gSmLJpxO/8sk3HW5GHnQ3BcI3Pe7BkOEw0LGY2idg9lORxj7quh
         YyxkRkq0VtW/B2ZfWLV5Ba6/hvD5xA7/tN0PREroY2ZVaICdih344GovbhPFbDgo51OY
         O7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963787; x=1787568587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=;
        b=Jm8nTsZrAWUuTkUuFBaXReIxhOmVX8hHxSQ4dr4XtS7nLT6PUhwbZ1vaWRn7I6aRJa
         THhFYKjaqOetS+dTLCzvRh6vw6CzRtrgrNNc6fmEV83DjSuaTcyxXB7Lk5J1L1WrG+uH
         1hKKNDi/fZ6tVWWkbUztFQw06KzD93f7AUYfpa1V8vo/FRVN1KIX0yl5UeCHVRY9Ktot
         dxcIf8OEJnU6D+0Fe7n6LWtnm/1vvX6YaXUkP79FKt9dF81od0KqRVHRxBd5j5iiBFsM
         trAI0bTJgxGeyfcm5clQpCCjy9GlXjyad55ZYHWB29A+k8YEPNDl4Xz1lVJ0lbJ6qLcv
         RVew==
X-Forwarded-Encrypted: i=1; AHgh+RpjFyBRJUe4m3vIc6q6W+jhhiKXgntvSBbIUXt4WOkFelbYUHHTBflPlLUudLtsR/71RcKLv/fZgHYScyX6VMhb@lists.infradead.org
X-Gm-Message-State: AOJu0YzF73sHJ+pDHNLjrdNmg1V8/cyZDrGsTDoe3Q0Z4tEDVG9Aknsf
	gVF2vMtlTPdg4/YZliBmWod03xZAOJjzKZY6vR7cc+77uYk3ND8Alm4y
X-Gm-Gg: AR+sD12JkqDtPjQYFjdUSCsZhiaKDh3LRFIjxCGQxga+kK7L+A9n5ydoMXt8T+F/2SR
	QFRnjN9VpTGGT9Ie96Ad2EgskEhdtb8bL3yap18fLF8SYdXJc47d352Com/CZ9Jk7ZG1rJBlHHF
	Ns58BmRFCQf4pbiFWm+zFKW/7MVKPSVDvrXh9Dp6vtIAWo5731qyN7xtihyIYhlkvNQNHSx/MI5
	nlgB6Udo1WOnlaPyN1K1oRR/81Z8k96s8MNc69/sDqtxSlEptNkdRlixHxoTU7KAj10N7ExOymC
	2q0pi4eSc9zaV8FqrXv3GZbG6csqpaSVRTHUbzIyvhFUIHo1LrQ+qm0W3Azl3M0FlV4u9yRhIxy
	EmwMH5DEa57tSN5PbDiE7w+6TR8r7Uwa3eH2CQF9Jyb7lAMQQq9hE/DaD763HQLQQd5QEqQ0+qo
	crQhDH2n0xGQ8JTNknzc6+UwJpN6VGawXKUeZB/OBhXerugarPzVjZiu1H2MMl53EV9MdnwAwoB
	m9qtwkFHHdTNi7BSoK3mxFvYcTEJLzGsTIo4KBM1JxLyp2jzjdbhZVWpK39YNd8PG3mmjx3w8bU
	onmR
X-Received: by 2002:a17:90b:39b0:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-3933b500d17mr23620416a91.0.1786963787161;
        Mon, 17 Aug 2026 03:49:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional() for audio_mrgif_pd
Date: Mon, 17 Aug 2026 17:49:27 +0700
Message-ID: <20260817104929.63152-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_034948_719669_CB9670C8 
X-CRM114-Status: GOOD (  11.99  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The audio_mrgif_pd clock is optional as some platforms may support the
BT path while others do not. Use devm_clk_get_optional() to reflect
this.

Propagate other errors to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index d217f9320ad2..18f0f27bd8c0 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -89,13 +89,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 	}
 
 	/* Some platforms may support BT path */
-	afe_priv->mrgif_ck = devm_clk_get(afe->dev, "audio_mrgif_pd");
-	if (IS_ERR(afe_priv->mrgif_ck)) {
-		if (PTR_ERR(afe_priv->mrgif_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		afe_priv->mrgif_ck = NULL;
-	}
+	afe_priv->mrgif_ck = devm_clk_get_optional(afe->dev, "audio_mrgif_pd");
+	if (IS_ERR(afe_priv->mrgif_ck))
+		return PTR_ERR(afe_priv->mrgif_ck);
 
 	/*
 	 * Optional HDMI audio clocks. Platforms that do not wire up the
-- 
2.43.0


