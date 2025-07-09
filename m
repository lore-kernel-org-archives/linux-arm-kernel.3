Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767EC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rYBWS+8dYRZolFFfJVTsJDzUHqNW8EbfvHKt/uobe2w=; b=NK8qGLvU5Q6UDO49i4QSGAmFMY
	21yMO999IwtZ4hcdn17bZsjug87C03GpuukWcjHyO2Ql+ZwBXvX/Xnf0CxAoetsPjb409u77MQRF7
	zy7dgBhlLWMRyaFpdWuWX7DWiLM5QXo4hB1jGVEhpRqVXw/eAlYTbDGfO8xx45IhD0rH/80sIQL36
	8gyKZIi3VALuUkaUmrzCOxfu2Df1W17RLNts66xUu3PW7Nl2ItYcRt/MASQiHUkUD1K5Q7SdXvnTq
	g8K7xmvWDUf+bMNuTRt1bzsDxJX7SEOpLr3GVDpmo5KIezvH8FN8XZcWPGl2E7FfjLAZ+UlTC6zbo
	hWwA2tXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYMV-00000009PMj-1wNF;
	Wed, 09 Jul 2025 17:13:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWD8-00000009498-02Ku;
	Wed, 09 Jul 2025 14:55:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23c8a505177so40261145ad.2;
        Wed, 09 Jul 2025 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752072949; x=1752677749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYBWS+8dYRZolFFfJVTsJDzUHqNW8EbfvHKt/uobe2w=;
        b=iQpIapIoYkP+BcCtP5kgyykrbWRi8JY9CHt1TVcaUR+eyTypYFQ49zrs6yIWAOHYPa
         vXwtcQEStrXS4tVfA3j1/vTbrAaCcsHGuVmwU7mJ+7hmIWuJmxvUeicO6uRmPIvVUQIg
         D2H5L+Q8JqZLY9y9Lnc4OhYubDf4KjdubnTXRXfSbsWCg/tDUPOD3H+xCmlHcasFaSl4
         6fzQyTGUrBBELpeJga35mjAnsOxXnl18wgbDL2al/QVR3mZV2nFUIKBQY8L2j0vBV6NQ
         XlIxVTZqjsgXPS51kGvRgBzgxRO6OsG5vf4NbYn3cOYI0RczVUFVF1UvXWwcjejm0WQX
         gRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072949; x=1752677749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYBWS+8dYRZolFFfJVTsJDzUHqNW8EbfvHKt/uobe2w=;
        b=bM3V5MvDxkkXGbpZdqwXwEbE9gio2YvK+x0ZhCUXHz33lmvnbtMJwo6li63qK4+aIo
         Th/RI5gX0I5wEzYUEWjCG4E6yHE1hAaXlTWrtyEivKD3nfIrfGOUhxUxnQ/lMRTdD+qM
         N86JLFRX5BT95Azqvfj1c7FKtrZnckJAUTB5xcT1n4CNXpriWuXi6sVyvGWPQTAIC+r6
         oIbK+8U9qcNhhBRedGbgs3qPc1qiGQ0zxXKGPxf04xmgPtsiWZekTaC3EHL96I4ML6H3
         pndMHAux7fNfVyw6zON3ezqaMm7LI96GDS3WBudDuLfLO1PMuhImgyx0GTHkeMntpmby
         HTyg==
X-Forwarded-Encrypted: i=1; AJvYcCWfFWlnAUhD1PUJmrBsuw1k2oR0H7WSaGHmLuWK04Ij6wIh0h20KQ1X5injZWGIdncHEoIhKvpvjyIlAF8Ue/k=@lists.infradead.org, AJvYcCX1sK5TlqNMLMSErsfHluPQh3T40f8/CxFoC7NfBHOR3s/XlFcRugONrbA+BoL6o2WdG80yhANDH8Zfhcdg9Dab@lists.infradead.org
X-Gm-Message-State: AOJu0YzEzTqdMPar3u0KULjdGpfUi9rnisGI86m9z2OluIXj+Z2hNpVw
	y/QLTvtQaD0ezMFtz65I7mk5gzJKtcrw5Scqsk72WhZzsvf7fO1p84Ft
X-Gm-Gg: ASbGncsTzbv609nCi8RnxlFbxQTRPUBfmDi3dpY8PxRU40oNadcar3nv5DeuJkyHzmD
	1mHjaFea9/2jdgDgVh8X0RtunQHXvg3khfMhz0Vfz1iSUSnjeuYYokcrD0k3ZvM/ynXi19RwgIt
	zpwi4sTclwJ1AMuHstm4LMTrl3/qDU2KxyEmbhNd/dKfjw5RJi/dX/LHHPdE7wz/13K6gmLAazP
	ouoRG/e4hvVqTWF7w4es16hzev/gUux1ZgjUVfJwYlWCojpEc3XAF32c0pIaJvKBJSWA3oa2Wcu
	QgYpATzI8+Thg0WWxqxmNg2//6yCPFRs5mbtCABa1Kvg1wMoGwDc5sQCYrGrvTl5m504Y99sLUy
	ARA==
X-Google-Smtp-Source: AGHT+IFPaUkBhW+7RcmFLLxMld4EFtuUsmWLGviLtfem1SfGzG5MQLw/zhlVTkW8+jGL3KbSDC8E6w==
X-Received: by 2002:a17:903:17c6:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23de245f590mr2955225ad.20.1752072948825;
        Wed, 09 Jul 2025 07:55:48 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23c84593e0asm138530505ad.193.2025.07.09.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:48 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: nbd@nbd.name
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kvalo@kernel.org,
	toke@toke.dk,
	jeff.johnson@oss.qualcomm.com,
	jirislaby@kernel.org,
	u.kleine-koenig@baylibre.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: fix potential memory leak in mt76_wmac_probe()
Date: Wed,  9 Jul 2025 20:25:30 +0530
Message-ID: <20250709145532.41246-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_075550_043327_3D523534 
X-CRM114-Status: GOOD (  12.61  )
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

In mt76_wmac_probe(), when the mt76_alloc_device() call succeeds, memory
is allocated for both struct ieee80211_hw and a workqueue. However, on
the error path, the workqueue is not freed. Fix that by calling
mt76_free_device() on the error path.

Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
This patch is compile tested only. Not tested on real hardware.

 drivers/net/wireless/mediatek/mt76/mt7603/soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
index 08590aa68356..1dd372372048 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
@@ -48,7 +48,7 @@ mt76_wmac_probe(struct platform_device *pdev)
 
 	return 0;
 error:
-	ieee80211_free_hw(mt76_hw(dev));
+	mt76_free_device(mdev);
 	return ret;
 }
 
-- 
2.43.0


