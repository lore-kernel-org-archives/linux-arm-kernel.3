Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F539606A328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kBxF0tqi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BonthFNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=; b=kBxF0tqiD/++C/
	bQqkX2rDdncCx1se9w2/YHcQQqqrNfCYaOwCfqrRMKpP8PtqzTEWeHTvCuCrp60M1CiqxUI4gP+ue
	PFTyFTMFcr8jeCImcToGzQuK+/wxjeY4LObcY4eKIQi7Hy2hxGqZpAvH0lrMvZ09WGTXpktqRkGm4
	HevzaBUrsaAmND6U6X1MraV8bWZ++e/kcakW1VO9AhQKfj68ow0A2HwlNw7gzBUhWFUH1/ZTxhpka
	eYUk3Km3BRTbXX/vWn2omtCETcLM7kAMarC9XJ+A+ZkzHdNrXdaT1SheOJ5gXvuT9XTFO3LuDru/8
	Zqh9j9eyd3Tu13HsGBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5t-000000038X2-0Hmg;
	Mon, 26 Oct 2026 19:10:53 +0000
Received: from mail-oi2-x08.google.com ([2607:f8b0:4864:32::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5n-000000038QG-1Txv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:49 +0000
Received: by mail-oi2-x08.google.com with SMTP id 5614622812f47-4b94bb43008so301432b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041846; x=1793646646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=;
        b=BonthFNXR/e3ra+/r8BgFJtrF1bTzw5p2h7JdhucK8y/CG/I/XjPpQ0mLFEgPSu8aS
         LHgx4RNqa2651I2KEvjYRYrocRO0ieGPq53+GjxFhLvFA/sW+OGNw+ACAaUQ8rzbw779
         iybKb2IwHJz6ZRMFR64dQByb98kfQSP4PxlP9ums+agBmDFldVzOqBZbS6shXuW0iSGN
         Ix+eGDTHjwOPl1tRr2Na+OCCb7tzsXgvlR8ub3fNQaL1dDIgzRpTocBzAkHv2ZperU81
         mlK5sz4PdUhMoi14mmz2104je+00XgP3PVkqw78HJl6wyRQOCnkTo9zqA5E++cKPyJ/P
         GTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041846; x=1793646646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=;
        b=StlzFFvd9w4A127xYz9xIq8cxaijMKFSFHXgGCeiTeL5yPAxWSc3eRi2SqKrtD56fg
         lxNdrTHVSI8ZwmorJpfoCedqarNbd6usn6BkvJ1rhxWQ/XR6Tu8h1HDikXXuwlDIzD/2
         vOoASU5JnZNUuVO5wmNnc0zZqV1AvfPjewsFgZ57rDwJFFDmZX7h2tywTN6KvPzWwl13
         i+h+LCf6WCWm6OtUh5d4n+UsIo+sxBYH0AmEns/vnSGc3Po1Lc1uad2Fq3PJPfrKiYzQ
         yN8ZTs0GcPyXTZI+GUqjfErrF1NBDDAAka7RDvW71VDMq39ohj8OVVgclNGYL0ElvOU4
         73og==
X-Forwarded-Encrypted: i=1; AKwUvBwWhDTudt5xG2MrvG7v+ZLKIMGwJNIQPUxcL8t7HYaNnBv47WmFPzdfD9WYN2ejS7sB9jrTakYb9k0i5Si+agxj@lists.infradead.org
X-Gm-Message-State: AFq9FYJQVJzhMrGDKBiNxiVb7wpLoYI839okl99af0HOUDPnojdn9KkR
	dvOWZu7neEGFI+Z93N3Ptz5VzrSbu4ZWoqxXC0AKs3RZkhTNcU3579cq
X-Gm-Gg: AYBFou0tc1355VEccu+DH2uxptx88t/SWVLdTYzEB7qmfd1XFX4xx13yZgghjeTKwUs
	npsNGVleO45zY3kNRFr+aynqPGDauSkGKroh4bK/QXg+ISMa0YXT2HUtKyG5+YA2ojQi5frb4wk
	R7hY8KmnOiI4y58VQlOZcjbr5jY80bAHq9BA2RT2ot6qn9zrXs2rJ73KkP/EH9QHtBejgdBNhdH
	TEG97A74Ri5GWUw0WIMfKJ7UGQxZCBytm6qlwau8jYRpAJikGg0AeiK5ZV0eU6P9/8dlj6S6hqO
	5SRg104+e2KvVPkIaZBcy/9uwyPXi8p3UzkANaYUvFSkfEptP8DP4vpcdQQvD42MEII/1jVuZUl
	n80Fz3jeFx3JsmOjw85EnhD+p++5tBTzSiY8VJj/djJe02fDHUkYC3LVCEBlrhTR5zd/XechIVI
	PUrl/Ujah1HdvHDExJnu1uu+3fUcz9ri+zxDjgI846Qh2BSHc40DyFD57NAFiG0LZf314EfuHTY
	nehpguafeMI/8AaEiERhgIwPNhfM+aR5eJvEdu7/vOeYKrHHt8a6tMY8bswPZrGA3mombo2sryp
	7ECmJh0pNDQQo0OZfESRyfihAJ4e6W3z/M2d1vVkbKdTq5UaoH6JXuHv/IDYv29kPK8=
X-Received: by 2002:a05:6808:1919:b0:4d6:90d4:6bc with SMTP id 5614622812f47-55c002d9eb8mr6575517b6e.46.1793041845770;
        Mon, 26 Oct 2026 12:10:45 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:45 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:37 -0500
Subject: [PATCH 2/4] wifi: mt76: mt7615: wait while Bluetooth downloads the
 MT7663 patch
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-2-944b1f7e63a8@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=2027;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=HkEhUCJzkwct3RuygSMeROndtW02Wv2ZhGyJ5rVshHo=;
 b=Xp3Ukesylfb4khPHpZ11/Jn435KT1nrvFR8ZhqyM/mUHsf6//IDNqy25niqgUN/TogKP5/5MO
 H4QgjZPCBcVCwSr69a0/W6h771CNP1sQjSp1Qa2GvYgSEJiwTO2+/Pa
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121047_401973_3E93AAED 
X-CRM114-Status: GOOD (  15.59  )
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

On MT7663 the Bluetooth SDIO function (btmtksdio) shares the ROM patch
with Wi-Fi, guarded by a semaphore in the firmware. When Bluetooth wins
the race at boot and is downloading the patch, the semaphore request
returns PATCH_NOT_DL_SEM_FAIL and mt7663s gave up:

  mt7663s mmc2:0001:1: Failed to get patch semaphore
  mt7663s mmc2:0001:1: failed to load mediatek/mt7663pr2h_rebb.bin

Retry every 100 ms, for up to 5 s, while the semaphore is held, then
find the patch downloaded. Tested on an MT7663 SDIO module with
btmtksdio built in: across repeated boots, whichever function downloads
the patch, both come up.

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 152b75178b27..e5c2ad5fb458 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1241,7 +1241,7 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 {
 	const struct mt7615_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
-	int len, ret, sem;
+	int i, len, ret, sem;
 
 	ret = firmware_request_nowarn(&fw, name, dev->mt76.dev);
 	if (ret)
@@ -1253,7 +1253,17 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 		goto release_fw;
 	}
 
-	sem = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, true);
+	/*
+	 * On MT7663 the Bluetooth function shares the ROM patch, and the
+	 * semaphore is refused while it downloads the patch: wait for it.
+	 */
+	for (i = 0; i < 50; i++) {
+		sem = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, true);
+		if (sem != PATCH_NOT_DL_SEM_FAIL)
+			break;
+		msleep(100);
+	}
+
 	switch (sem) {
 	case PATCH_IS_DL:
 		goto release_fw;

-- 
2.55.0


