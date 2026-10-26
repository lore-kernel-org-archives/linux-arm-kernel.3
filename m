Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2B5606A8D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bifXMR8+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTHsP4Xd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=; b=bifXMR8+SjnZ33
	LCFL/87uyoygCfpRsfGPXiSuqcWnztMCSw0UwCXEMUlKgDkgCxrF+nhgmSJiGBGFfz0vPkIQmxr8A
	IWjyJkZBKo8TApO9o6u3JZ6nKPwGP6Uw/rJJ6qD1ymGZZXF3FHKJA27+9tf0HfVseC3YNgOeEMsJ9
	nYxK6nFYYNCpvnLLac33TMfIn4MLXyLObkvlqlHlTjTd+G/bvREn/baHm9VOGo5DT/BJ+NdOwWMtC
	/h7GE5ZrXBblZ+BZKQAj+oatxXmZyCyppuNzwSNaVvwDCkNKQ5wctAQ5Ct56Idh9tA3etV1z+uYAR
	6X63JPCVOUoyOImAFTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHT7-00000002AG4-1IaV;
	Mon, 26 Oct 2026 09:58:17 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHT2-00000002AAX-1Wgb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:16 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so1942069b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008691; x=1793613491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=;
        b=HTHsP4Xdm057bpmSHfnaa09BrZYETt5dAU4SBbdaSgN3/x+glK/0xzsTrB5DOOHUjp
         GJKU2cS+AJnF4k8pDApQBlfUKWPVOLEM88SDNtOwwghZxEn4ci/ntS61zVv0/JMJoior
         sXH1socDZT5s8RRBza2kmo/FwuivSx6zvAoy335+yK4tKhl15+wb/tTjToGa4huGqOPC
         BD0lYZIaT82F8lFBt9+hSmwy2l9PtDKK2DKUgCS/dvxfv4azjIAUD8sv6/fG0Ealy2kL
         cBWeaF47CSp0G0cIvqKBhm1LFmwiU684KSYT1sc9jNAhm2g6FTWZISkhuIV7nA7Ogbgj
         gwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008691; x=1793613491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=;
        b=FJtuwz5/PT/AS6RBafERSt/QpEaCAZTAOHMidrqxPmIx0OaIeFwbYBe5sANuaE/00S
         /HCeeJhlMASzJ6Auph8Av753WcfY8d1STVGJWz926dGKfQkPx9e1WmW5vcYw4zBzaIIN
         ah1w9KaPNhPlpTmoRmcKVZ/cbRLfr09VS78n3KfcCfz3UVqHyYSTkH3B8DzXRu1UJshz
         o+lIc8ap0pKAcAF1vVFffUEUW6M+1WLq39YZ3bvi0zWVt2xe4ObZ9dPC6X8LVuSAsxaY
         exRoJmg9iVbWR6zpyd9A0EHn6ztb88uGcQiowhCws8fL3X/p4F8/SiXKcUzWcb+an4ng
         ODwA==
X-Forwarded-Encrypted: i=1; AKwUvBza37GtXGzDWFSoztzsTthY2kdnLZrXZXKEsBYOyrOC6Ejz+FBRW+NPvuBreY95nVzdSwat5A7WuZAZvnz0zOoS@lists.infradead.org
X-Gm-Message-State: AFq9FYK4hO7CvSLrbzNqU9d/zpKJVTlPoqz8gYjZuV2oeR9bd1ZAaG8g
	FyF1q2eCM46TzavZd4iiBKJIOfzp14hUuQOiDypq79otfR9Bm0bihaHs
X-Gm-Gg: AYBFou37eWRp/TXe8v997H55KQchP9Xs+5a9jOPZCNogTDLbT1l/TYxnpZEygvPYnOR
	V3ZE2NkFY8RpTwZ9lTHNLh8M1PPp9CmV6fr89VRY6Sj+X5/qKmuh/OfwowcA6B3cO3EO2LzPXuj
	vGPnfhRtGlY2RQD16C519MAqM6Sdm6nyIpnRwZ6L5G5y1HaENo3ts0OaPOBsYO0x8a0LwAUArgE
	Tzpt/k5qeexhyvHQD7YGcq9HrL9+Zk5Ax4PDichbnSr+q2sIBNOLU2lXMX5K2SyeNHkez7nr70A
	b7rB5kcBXTs1OEEk3UQCultufIFEUfb+3X0lPvyPGvfS+6Os1GPoVV5P1vOfnCDrCW1xgKOG9Eb
	LKIA6HQKQOg2K6yjogNviSs03TonxcDvu3f8cXMa2Z4eNSO+HfNrIw3c/laPd2O/l7fiB522aha
	glUKw3+hci+Ue1zXAb5tbaWegXKNV6p49AM7BMRXAIise/UU2ZNKTjE2unusabPiqyp6o0ru4Bx
	VjR3w/qhPF/3T8/cmKZC/6iZDGmKTlG1IIpcEsQrVdqAtFK7u+RqX4HQRewmLMK3n1vvIKrW3oV
	JHL9H5kr8A==
X-Received: by 2002:a05:6a00:2316:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-8a36715c0ecmr4862670b3a.12.1793008691320;
        Mon, 26 Oct 2026 02:58:11 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:10 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:31 +0800
Subject: [PATCH net v6 4/4] net: ethernet: mtk_wed: setup WDMA_RING_TX(0)
 for non-DBDC MT7986
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-4-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1813;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=l74B/Eke0qZ7NU7MKRfL71FgLu3ayn5XZo3xhiO5oMc=;
 b=o/Ca8KCeJJFPtmTThW5dHp5n7J18WnvI/QN1JZAsQxVBK/CreER8FmV3XQT3u+j99fYVg7Bfg
 Ok3/N85CHVsCAkBLu8ly/0e1F8SMpeO4aAGCIOSH7miuuN2dpmBRLok
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025812_480959_EA3079AB 
X-CRM114-Status: GOOD (  14.90  )
X-Spam-Score: -1.9 (-)
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

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if wed is v2 and
rx_ring[0] is not allocated and reset tx_wdma[0] if it's already
allocated also add error messages and bail when mtk_wed_start fails.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3044a7a8ea03..f40ac5794341 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2345,7 +2345,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
 		if (!dev->rx_wdma[i].desc)
-			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
+			if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)) {
+				dev_err(dev->hw->dev, "wdma rx ring %d setup failed\n", i);
+				return;
+			}
+
+	/*
+	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
+	 * but tx_wdma[0] is also needed for WED to function.
+	 */
+	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
+		if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc)) {
+			dev_err(dev->hw->dev, "wdma tx ring 0 setup failed\n");
+			return;
+		}
 
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {

-- 
2.55.0


