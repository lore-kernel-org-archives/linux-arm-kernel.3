Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26677606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mZabHX1U;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dugtSS7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=; b=mZabHX1U168R7q
	tkkWXiXX1H3gcBpxffyyv2PxEiodLl+xjz4OH9CeNIh6HZwamDILyl9vosTvDVW5hQyeZ/1KD6+EZ
	P22K7t1PXbyTNVQRczZQPCl46VKjEbnyAhfP2KucPWwQfmFTh/ttQegqrb2OIr8cSY3Gy1mBXPzKs
	J8X6P74dNrIG3rTOOomFEi0DJEaIt40QRQTnTJN1Blf7naXTqMKTz7EXKVanGVjADU7K8AL32Ahei
	b9RdUrGCEKnUBavRbIog1McWOptLV9CsbV8oUFBhYCKEEte+dn/JL/LvgNaSwjjVDCY/jLFZW7mWS
	6blhfPjWq5a92BpDbbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxn-000000037dy-1qEa;
	Mon, 26 Oct 2026 19:02:31 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxk-000000037bZ-268h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:02:29 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-53c4858eb76so1444433b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041347; x=1793646147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=;
        b=dugtSS7Gfoxf8l1IXEwr5Lz4M9P0knxSbn+qQjsJBQiSRsKHJj26gLxQ7lrI+VvjEH
         JrRaVcrS4akWkfMVlCtTzsG0ju8YX5dzO7n9MUpsWY0LjTdgjVEaZ+GIlOHV5aDZbFiS
         1KQ430qCCxpZGC4rToPGE6/RiIjshD8LXfrwAvqeP4o9/L1ExzyM15VzVTN4jYR7z2/n
         SlXd/ki6JMaXCYnl1kwZwOL6xVGe+oUyJcLJGnwtHq1jVx73+6MXfyMWgzbTYspV6IKL
         LI8cY94FysUatIV1Jx/vI5M1Aqu8cnqfVGWZhHfTiscrVxXphAm6qkNCAdkdqOZV1o/s
         couA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041347; x=1793646147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=;
        b=qH/X8IjuxfuiCTMh/j7w7e2ztpDDVkTFgPFZ09cdzUYWDoXotLS77cpyHKhVPhBdZd
         /TrEbTa5+/K4rOhksBG1apeKp7HDBk/0A8FRUd1bwMlaGqmHwcRA8rsLz4j70rFZ4Ybq
         4qJK06wkLSUdI+XP9ze/07hGBXLT8CwqGe9zjbvRie6GkaXWmnW3FFHOkwyo8HFufKhM
         /RIexBM0k/ilT8HHAS4mTifPcSrgc/Z2bkWIRxG333eeUXEPF9aRdslLgpwerQEQxSfK
         bMoY6R7v/kNNvh8L9Eb442e7d1Kj5YdYjdB2f/nZF3m3bFaHI6GV+mLwQFvG7Fy1ked2
         x0RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxffTQPM141qLX0jPriNme4UFkvZfw7FxLiXcoHEFHVWRHZrHiTXmR4riepOCRyKGAv3tyI/jjR80dgk1cQmYPW@lists.infradead.org
X-Gm-Message-State: AFq9FYLuiIx3i1HAX1VVNgxux95jBD1RcsRYftahAZk6GgDs2Db2XU+B
	q+iblijXiqctu6wBUP815Tre61Ce/uxDlRkduG2SomwQ0T7vKsgfQ1hP
X-Gm-Gg: AYBFou1o4eGuiBo+hop4BabHYL2vakEaxILJDrnNUPnqxsP0V1CSAkZ98iH0bVruj3o
	ODmqBC8q6oUP4iYB5pfk4kmOPqHrrEKzX+Z2nyfmLSd2cqH6ebj7L/p/Rkv/3VQVjVZ1sR8igRn
	7gt6ddEliZ4+d1H73DDBSWFf5w2Kd+7epkczy4tj+PswTXyaeogOq3ce6yhm8QbeS6TJnC+2FXC
	E6nVadDJKonEoeHdrNmwaYy/PafiLTFl6cqlX2HyETst9qKFJSHgtiFcrnM2/SfrRomTV/4zXeZ
	Vw4wAbxfXkvVqpSEuZJhAVWhlsRqHTokRJug8hyDcZfSwAITFUumdWS1vTQE7h7iqZ6GKAh9P+p
	wYSWFb8EBdz6y6D8u2Ny1QQzOcRv8tpSULEeo2aE8x7WWC6Nt/MrETNgULtnJXTg+5wWagCgSfc
	oZucU/muTSkIEDmqNZe7NjUwSPJ9qWMuFygh/Ns2nkhpvr0FWDtF0UR6WheewrSLFsGQNVrWg7v
	L0LusgFafZwhlctRBgsFhXZ0683TbEgmGPLNAZwRL+MHfN8PzecHHFETDdGacng/QwYYBfJLczJ
	JEannK6k1cEt+B073GZj+jiDfyfoX5/OeV9gj7w9gSiQjA==
X-Received: by 2002:a05:6808:c226:b0:4e7:851c:23f5 with SMTP id 5614622812f47-55c003fa3f9mr4544096b6e.59.1793041347210;
        Mon, 26 Oct 2026 12:02:27 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:25 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:02:14 -0500
Subject: [PATCH 2/2] Bluetooth: btmtksdio: retry enabling the function on
 MT7663/MT7668
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-2-121792305f72@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=2175;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=p5no/S8PpFqMwynWIKqGncsBNwjfIsmYO/W2PvcD6mQ=;
 b=IJ298NG14mxx/gBOBanVXzZJRrSHN5am2KydNnQfi4ZzU5GBakO03eJI17yPJL1Tz8N0Tb2xS
 iLeV3zN+1+pBrri+wlcCSBgNRlJh/9gFw2i6TTiZ85XBNSg0HrlsWbj
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_120228_560506_4405CE99 
X-CRM114-Status: GOOD (  17.35  )
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

Right after the Wi-Fi function of an MT7663 combo chip starts its
firmware, the WMT function-enable request is refused (the reply's flag
byte is 2). btmtksdio ignored the reply, so the following low power
setup command then timed out and setup failed:

  Bluetooth: hci0: command 0xfc7a tx timeout
  Bluetooth: hci0: Failed to apply low power setting (-110)

Check the result and retry every 500 ms, up to ten times, as MediaTek's
own driver retries its power-on command. With mt7663s probing first, the
function now starts on the second attempt and setup completes.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index bb311986271f..239393a15e46 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -909,17 +909,33 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
 		goto ignore_func_on;
 	}
 
-	/* Enable Bluetooth protocol */
+	/*
+	 * Enable Bluetooth protocol. While the Wi-Fi function of a combo
+	 * chip is still starting its firmware, the request is refused, so
+	 * retry it.
+	 */
 	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
 	wmt_params.dlen = sizeof(param);
 	wmt_params.data = &param;
-	wmt_params.status = NULL;
+	wmt_params.status = &status;
 
-	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
-		return err;
+	for (i = 0; i < 10; i++) {
+		err = mtk_hci_wmt_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)",
+				   err);
+			return err;
+		}
+
+		if (status == BTMTK_WMT_ON_DONE)
+			break;
+		msleep(500);
+	}
+
+	if (status != BTMTK_WMT_ON_DONE) {
+		bt_dev_err(hdev, "Bluetooth function refused to start");
+		return -EIO;
 	}
 
 	set_bit(BTMTKSDIO_PATCH_ENABLED, &bdev->tx_state);

-- 
2.55.0


