Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C89606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eskfm+/i;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LdkTRSH9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=; b=Eskfm+/iEgL+w5
	bV9vjuEHmVdsd4rNObCitf7eu3Z26hExAtYZ4gXyJCIq8o6d8PZqr9305XQJNL28bo6rSRestfCph
	+3ZxXM95dqNZOzVwAeMvgqn7z9T+5QTXiOMP8ubLKalPrCJWazlm1C4prSrrdKgCL9deS6m7k2PI9
	BjNvA3ZfnHTI1iyhwnyO1E3feldqeKXUrfdWB5gaFPJvv7PAX4lFVwpKdYpVYts6jiKtbLplnpkf8
	+w+HyVzYjCFRUpMMImoUdLtp2416tfzq8/R4+gBIE4nDhCa1tWVzUAjqe+HEHegU9hZ0rLJn+pNn5
	FWYU7iK19Y44DhhN2vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxn-000000037dj-1Nsd;
	Mon, 26 Oct 2026 19:02:31 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxh-000000037ZG-1ndC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:02:26 +0000
Received: by mail-oi2-x09.google.com with SMTP id 5614622812f47-5179f3beaedso1472290b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041344; x=1793646144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=;
        b=LdkTRSH9oajDSwkuBLFfo31BdfbY/gDBHzDlk6kiQUkMgw/KB5rbUk/TgaGV+UkuJf
         T5m2Zu3xF4nz8hhI+SHCUzfojLbcIWtaLIOK6fsSGVYz6qEYG8nxb8HAemfThamZ0hGO
         3NwXYCP4TRr72bT/aF+y6ezMWncCi644+kNfuBuvnc3EnJ3TfK9NoBmNcTvlj/kMIEje
         jEOt+c/B9Bm06RIxHFQMCOIfnRefapvXiKuVkRyR2LjViegs3aB+mRQKAIp9ArTnxNwe
         GSQpdiqCBpxHgVbnqhy2GgTINVKDKuWI8AH9V9Ixulc23f1PM+4HcJRof9QfykD3VKk3
         xx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041344; x=1793646144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=;
        b=DakFfzLNxCqFBngWMxkKMJ3teV3dYiQgZiYg9f429kOtzkm/1NtSPVx8KEKW43pe6m
         jSrpUl3MTgK9tQk/T4DZC9qLVlssAbReJ8NfZuBjAouB1JQN25Hy+gO9ltfUZkuXVWrH
         CJGwll2PElLvaUokYPTywcME+ZBhC7v9RzlZMbzJ1ijFEkucln2qUWE6q7cxSxRggFM6
         2puBZS09hKA6sMdsHg+j9eW+fBqDhfMoIYLJRd3ukz5eqWRjZSnWdSMp0EjWXLh5b8L5
         nY47vOEQYwP1t9I+ay+Mw6i2Yxl+Lxhw7VupqEgXHLmzyTmyTo8cdu+8XL4pFpFOYMxI
         L7jA==
X-Forwarded-Encrypted: i=1; AKwUvBx11gg1PDQfmPqG/NMEvkedcXBdPbMetX8g8RYsO8T3vE8n+u8qiiMNIpdFx7siwTfXzOSIHZ6xfJDnw0vFGkcG@lists.infradead.org
X-Gm-Message-State: AFq9FYKi6Rsuc6d08c6JRBNixNYMVMMVJhhZ5wtoihrNdr3KZmAmMpqF
	XGY8pPL9i+/2ImV6O2IsS+ZibWY1QEF97dHuxppWGWXb5iWN7KcpeV5R
X-Gm-Gg: AYBFou3kDS9PVcFs5lxsF6ianrh9Rts11C6WSqqzynjTo62VpMLkwvuFDF8CLA8IwMq
	f0LLrjC9F7IlCveyUX09Sq7OVndixutF3bgSOwuUuFoCNTyeZ5zSpM5Jz/ehs0zKFZ/xpw6oK0c
	LyJB2DImbnq4bxdrEVuNXL1L5L9i6G1h0VFMlHnJvzGIoICR/va9xBTiWCihJ9l/OcVFpZZ1UU9
	0NqxBWvot2WMmkejNFpj07xmFqVTMjZzEKaT/gCKxt7DeBW49dnR4GdAsiNd7KaYOW5OXSXI0rc
	6ns4yOVziHfsRUqNCkultQldDbI2cGLW7iIk4T8G1lNVPN+P+grC0AIwcZMOMjgMOeedMNmfU9O
	QG1KvRBozoz2PNpRWnW6BcmOqcAXLD7tEZoT28ujEjJClgUkD1Tvd+XayvkNOJNM9rxLxNeXMaE
	qZmV0WpXcbhh7ILjLUuZylr/Ly82uV1ZTWjbiwUB4bqTgiEydYqT+K2IxRXCngqBxr9lMvqJObX
	o8H01KBd0IhXdpUq1Wayxa0tEgo0nEciFmuZnzjV7lKeW210TnUN9/IGhzDj91gRKcls9/zbGrk
	JV9m2Fn+wjxv50OILgOe6j3OwRYReSHX14vgXPq22eZExMXyxde1HtT/j0bTlNTUTGe5nU2KcbT
	6dMJsCL18LC9uOU5mqnc=
X-Received: by 2002:a05:6808:c2f1:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-55c0038dac2mr5576376b6e.59.1793041344128;
        Mon, 26 Oct 2026 12:02:24 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:22 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:02:13 -0500
Subject: [PATCH 1/2] Bluetooth: btmtksdio: wait while Wi-Fi downloads the
 shared patch
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-1-121792305f72@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=3241;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ddztoRYUESDPWb2PQYPya2Tntue+gD/4f8ofmkkWRzw=;
 b=Xpakt9Wyhh2fH44z/HY3v5CV//e6jdBro+k8eFbYlXhtJ3WfwmxDtQGqwSusmrwJNYH6TjbNb
 2hHcf/PxIVLDax2JTueLWoyqslFrC7Zmb2Rbz+fxerGE9NUNOiar/kM
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_120225_481462_F4C94D2D 
X-CRM114-Status: GOOD (  22.01  )
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

On MT7663 and MT7668 the Bluetooth and Wi-Fi SDIO functions share one
ROM patch, guarded by a semaphore in the firmware. The WMT semaphore
query answers 0 while the other function holds the semaphore and is
downloading the patch, 1 when the patch is ready, and 2 when it needs
downloading (MediaTek's own driver: PATCH_IS_DOWNLOAD_BY_OTHER,
PATCH_READY, PATCH_NEED_DOWNLOAD). btmtksdio treated 0 like 1, so when
it probed while mt7663s was downloading, it went on to enable the
Bluetooth function on a half-loaded patch. On an MT7663 module
(Amazon Fire TV Stick) that left the chip unresponsive until reset:

  Bluetooth: hci0: Firmware already downloaded
  Bluetooth: hci0: Execution of wmt command timed out
  mt7663s mmc2:0001:1: Message 00000007 (seq 13) timeout
  mt7663s mmc2:0001:1: Failed to start patch

Map 0 to BTMTK_WMT_PATCH_PROGRESS, and poll every 100 ms, for up to
5 s, while the other function is downloading, as MediaTek's driver
does.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b9563df72983..bb311986271f 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -234,8 +234,16 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 
 	switch (wmt_evt->whdr.op) {
 	case BTMTK_WMT_SEMAPHORE:
+		/*
+		 * 0: the other function (Wi-Fi on MT7663/MT7668) holds the
+		 *    semaphore and is downloading the shared patch
+		 * 1: the patch is ready
+		 * 2: the patch needs downloading
+		 */
 		if (wmt_evt->whdr.flag == 2)
 			status = BTMTK_WMT_PATCH_UNDONE;
+		else if (wmt_evt->whdr.flag == 0)
+			status = BTMTK_WMT_PATCH_PROGRESS;
 		else
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
@@ -842,20 +850,35 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
 	struct btmtk_hci_wmt_params wmt_params;
 	struct btmtk_tci_sleep tci_sleep;
 	struct sk_buff *skb;
-	int err, status;
+	int err, status, i;
 	u8 param = 0x1;
 
-	/* Query whether the firmware is already download */
+	/*
+	 * Query whether the firmware is already downloaded. While the Wi-Fi
+	 * function downloads the shared patch, wait for it to finish.
+	 */
 	wmt_params.op = BTMTK_WMT_SEMAPHORE;
 	wmt_params.flag = 1;
 	wmt_params.dlen = 0;
 	wmt_params.data = NULL;
 	wmt_params.status = &status;
 
-	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to query firmware status (%d)", err);
-		return err;
+	for (i = 0; i < 50; i++) {
+		err = mtk_hci_wmt_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to query firmware status (%d)",
+				   err);
+			return err;
+		}
+
+		if (status != BTMTK_WMT_PATCH_PROGRESS)
+			break;
+		msleep(100);
+	}
+
+	if (status == BTMTK_WMT_PATCH_PROGRESS) {
+		bt_dev_err(hdev, "Patch download by the other function did not finish");
+		return -EBUSY;
 	}
 
 	if (status == BTMTK_WMT_PATCH_DONE) {

-- 
2.55.0


