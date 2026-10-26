Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89903606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YIy/mmHd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rjW39+W3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=; b=YIy/mmHdin70ji
	VM/crdU6Ge78uK+AEjNGAQNbJFbuDSEDjJI1Tul7m/0rbcuP6EMESk1L/JHd9dWo6k/GRnPc4yjBE
	l+I7PgBjaWZK/QGmjA78t90hDVK8jOF7ylARuuIITLMMigZ8XpqkAqslAIAdJ+L2xxH3zUVyoc9IG
	SmMIcvYw/YgxXQNdtbnGtBrAfUJxp1/0Buhe/uAr4zzDocskLHVIhxj5oDt7iMn0xjoyborNf+ikr
	/VWb39QZqmfVnkKX83F1lBGoxmKpc3xJ++iBQWeYQ/P5GVwacICBLshSu3ZqeqNfMf1E1YSjbjdAb
	TpaPj8xm2WMxbCx3oifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5t-000000038XT-0sFv;
	Mon, 26 Oct 2026 19:10:53 +0000
Received: from mail-oi2-x07.google.com ([2607:f8b0:4864:32::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5q-000000038Sn-21oL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:51 +0000
Received: by mail-oi2-x07.google.com with SMTP id 5614622812f47-4b39374fab5so1426139b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041848; x=1793646648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=;
        b=rjW39+W3BrasfTAnEFvXqK9+OIwSZhRcj/ZY3ahWE70+gRci9geIv2qPMJWY5K4D6x
         qMmibq3UMl0Dgs0UO45NHdroe18VmOR3myTwMJ8SA12a1nJtBdw5u5OwN0n8E+2qbTQ7
         hG3AvWexgQHAMgftp90zIwaLDBIpHADGNGjAd85wi6qRVaHB4zyCjFMyRhJGORD1G6Ak
         LFsgE3Fz5RpCIGr+lg9lScg1emp4/aRY3Oatf50eIzlqjX04lynBM3wCNvcSggTYI49s
         qXErVS+32z6ktW2Mck+yPKW26qP51y0L+T+McXRww/xdUziFc1A4qyaefCpxNAEvtDJC
         TnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041848; x=1793646648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=;
        b=YE9dcksSvsp6oRcE0lz/H+9+cjZoC/QUPo6gfOgROjuZhxJQGDqh1jlo9zPB+LcWwU
         oujT2xhEtVl3Y7E+JifPO+RCUc3gc+CIJRim6fJyzD9nKaTt/cpCS+DrEER3Uz6cMl/Y
         hVrLxCQHtkLxX4Wa2wtPBsNNabhoF6+Ah0C7bcgFGlvPIIBCGzK3kDDWZJ3aKo1i5+OS
         umDL3EmDkupnCmghSZbH5kcpSx4joB2F2ezvMv9E2u3BOathzLunMirWHuLAXY4WrHTz
         mvLoYygJZEhBdR237TKkBhhSdtTcPXsI6FupZuEPfR5qcZ4QRD+ktvH6+2Gs0cJiy1bK
         DzWw==
X-Forwarded-Encrypted: i=1; AKwUvBzSOONC1Xee3qhKjZGlP0iCzrVO1jRD/lTjpsF1vNNYO4GZIed3E5mGhOuQTpCs0qKB+kyH27Xq2RgfyA1iEGGC@lists.infradead.org
X-Gm-Message-State: AFq9FYLA/ltbtxNBaaiDXkUYrWWljTeZQx57jLgsBuzhqC/d0rnJBY9L
	8g5tXPu9C7x7OeQlyV9XUB4HI9fUVZpDGw4x8e6V9RaKjcn8fBf2E4sA
X-Gm-Gg: AYBFou3+DipcN68GX7Mh1gz2wYe41pI6lWAqaRmhrGmRFVpiN8KtoiGqtyUpAud4Zwg
	tHf5waS8ssN8RexVXnwbpbMjHtu3f/6el82ZTlbcF4QkphDjNG5y84v64XEarZpd3GKi4A4EtLQ
	k7DvVf2qzZP/+7SktGJELqFR/zRKDtoyMT6wpXK8DIeQm8OWXdSMaUjtndlCbNdYf4OnhmGmLuO
	YSwg/FhVcGfdkcy5AxLOAZdDIJNGSyeG7QvsBMZE6TnrJVCv8UMzJaNIoVCcfjkjzmbZpf770XP
	7aeAYAIpBkXq/ZVPSIs1Ppi1XtRl4uAXqPX2kmk9JT1Fbl5Ns14LtVQFCDkLRGMpnLA8Yw4HWm6
	I68cyt8bXrziVHNFPdzVpr6JVa1s5AyeIaw0GiG3U7jyvyh09XdR92BOYWacLsmnMSI/ZaHh9G5
	n8S2t0ImgcyUh9G17yVhSYTA2rbd2qWmnTqkA5P39S44R7qrgsDg+xFlUwsisFVuWpidhVQkNvh
	7S/dGyBjPg7f+i45WcEHG4NX4Hcx6cOdyXk2i4qCkJG9lup4EF4prj3Wti332o9WukYDzgSteh0
	HFkNiBNdj/Vn95XwaiJLVqmBoaG3Waohte9IfNaunnxPUg==
X-Received: by 2002:a05:6808:30a6:b0:4cb:f21c:a794 with SMTP id 5614622812f47-55c00261d33mr4881021b6e.28.1793041848572;
        Mon, 26 Oct 2026 12:10:48 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:47 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:38 -0500
Subject: [PATCH 3/4] wifi: mt76: sdio: use CMD52 to mask and unmask the
 interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-3-944b1f7e63a8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=1910;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=9KbBbuhojfi8oGqXT5PidIszoMscEC5hDq/fupskgeI=;
 b=GzThTvCATPI/ee8BIDVBMnOGZfI02Dm40DZnZKhDEynwCCp6k9M/V6+94HfyPX0T6bmxTpVzO
 4ZYw0j+17aTB3Y/o9OUS/sxyVi3rCA6VeyIZ/kuxBLRQX4KxMFuEwNT
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121050_579240_82016642 
X-CRM114-Status: GOOD (  11.72  )
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

WHLPCR_INT_EN_SET and WHLPCR_INT_EN_CLR live in the low byte of WHLPCR.
Writing them with sdio_writel() costs a 4-byte CMD53 with a data phase,
three times per pass of the txrx worker. A byte write is a CMD52, as
MediaTek's own driver uses for the same register.

On an MT7663 SDIO module (mt7663s, MSDC2 at SDR50) the writes take about
17 us instead of about 40 us each.
The worker is shared with mt7921s, which has the same WHLPCR layout;
only the MT7663 was tested.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 3f314e8e1e69..311c31e87ee5 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -319,7 +319,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 
 	/* disable interrupt */
 	sdio_claim_host(sdio->func);
-	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
 	sdio_release_host(sdio->func);
 
 	do {
@@ -351,7 +351,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 
 	/* enable interrupt */
 	sdio_claim_host(sdio->func);
-	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
 	sdio_release_host(sdio->func);
 }
 EXPORT_SYMBOL_GPL(mt76s_txrx_worker);
@@ -365,7 +365,7 @@ void mt76s_sdio_irq(struct sdio_func *func)
 	    test_bit(MT76_MCU_RESET, &dev->phy.state))
 		return;
 
-	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
 	mt76_worker_schedule(&sdio->txrx_worker);
 }
 EXPORT_SYMBOL_GPL(mt76s_sdio_irq);

-- 
2.55.0


