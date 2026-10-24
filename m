Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5BD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rOzXGWuT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qGI8/TiH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UnXi3eekXKl70zsvSefuWRY6oQJRxJ2VpezoTiQGsog=; b=rOzXGWuTvFuVLLcOOVjCHHhla3
	LojbRoU348XVJagRca2GpC4U2X5IdHlvN6FCCHaj3U0CpEhZtLM1o1jG7y33HfOVVlVbYgeeX5+EZ
	Uh7gYzBkdbMk3j6WoI4IImOCt48l0YcLPZBmUw70yR+QBtjgmTA9tOpro4ZF0cZ5BhDu+QMq4OJNO
	90gpDrOCS4NryIx4Gu8hCDUwg1ZkMAzq5NY5MAs0Tsqsoxtyg21eubj2UzZF0x7KqixHPpEbfMcq7
	LaBZrKafM1bUrRlegnbkcD2BeUYeNVO4XJLdwNBRYdwEgKP8KsRQDjpwRWZ6z08WAJg3JAXCtjIUP
	eQqgWGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKidX-00000000WP8-0oCA;
	Sat, 24 Oct 2026 20:46:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKidU-00000000WOJ-2VqD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:46:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1034985a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874799; x=1793479599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnXi3eekXKl70zsvSefuWRY6oQJRxJ2VpezoTiQGsog=;
        b=qGI8/TiHMD5bz7f7PX7Tt4+qa1PrjVCLJswzeLm6raJ8otiPvOmipmT6TpDAP05zid
         OioHNJgZfz/Ukry7fZ2cKLMCTOdjLH5p6x9Rd/auw8DE/U5h1P+XL5FP42s0b903CSbs
         4S1Hn1q+CuU3JeDF+62r/SXCuJEy68I5+W9/Yphu6xxqtJWouPj8IjhvZGqLd4N/EvL2
         QImfvddb2ujT0bvFwkn5CFkFu/0GZVWSKaXRRBvaRX8dRC9lc1++Io9bd82dOOoTIqcI
         UjfjyR+TFe4YaK7p7A8mY1Yw2GDdEgqNIe3p4/te9I+s/JI49y4qlw67SWq4IVQLmM8A
         R+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874799; x=1793479599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnXi3eekXKl70zsvSefuWRY6oQJRxJ2VpezoTiQGsog=;
        b=Oi2FtUC7ELDzNxNi/VnxguoxTDTXnXVnsaO0Od6Cy8zrmYSUod0DeqUDFzSyiZ1npP
         w5r8jkKN4159tWQKCgCYvvidK8hB/vW3KCqCWAICW3B8FBkneIGchlBDio6oQ4iBYwKB
         gpDAyfuYCJQiwExSrfmb5AsffOWzCMFgE2tDdbjqgPctOONKDDfAOzS1XUJ9QA/zbVUx
         HUeJdACBZA7BAmRFIPUqlE3Ij28JLkcDtWueWJa6GaE486YjHUDKQpsb7ciAIFuCfBVJ
         UXM+/TmyY8LjiwPnsmbcczXJ2VMBrTyG9WWybKYSZACLxRPIbEvESex0M79twJgPa9ZM
         7Czw==
X-Forwarded-Encrypted: i=1; AKwUvBygLg+hsWmIklL7BvpDDlmwhKD+ajtwQdfzKuRAu8FwNJyDgvLE8y4ZQ9hynHU6gzwpTwTsBMSeyWFpGpILpMEG@lists.infradead.org
X-Gm-Message-State: AFq9FYIoA4JwU1efJiGJoDRB3bUHsLKZGhFu9/WAKxKnrzJXdKnMApEb
	R3BnZdf8bQMhjBXAjX5sdWtlzPXKlXSrw5GpzrjtR8xdQGnbDZjgTFMUTI3nkw==
X-Gm-Gg: AYBFou0IDsbIw08eAknZNi5Gv4DeA3YYqsQ8utzxQEbDQY7zC8PtxFiosbDH+n2kJay
	oSS399p2KEGnjhjMu+9HWmIKHuy8RV68/2ogWf7dZkNnk1zqYPgMub+HAq+lG3H79tFVfF0Yxh8
	u1+Xept4B2og4BxAvIFphR5u/POthG7kfCXnhMOOgJT+fkalR6syncU2i6Qnou6dwTjfPqaRAso
	JzhOf8Oa9y20N10AeZ0LfGDbi5DbBPCdl9dl8PMbFGqEW5RvwJydrwlzKCY88VIM/NdKDjzTuwK
	pTfM1lt04dtdBx/OtagCg4JBgAu84WaWEbHGfq4PT+iKN96jXV8zbksgTVs9DAd2RB421AtY6v1
	SsywDzNZqTPiGI8vqJFu+4Y6DE/jcedBSGZx8cIU/+zTAOHLyG3gvRv1wC17chwYuD5oOeNcGYW
	0YIdXVLOQFogVGW45q62GXKBtwyHJug5B+WB81fBq9Av2m4BKWYqf5RSIlIqY/l90tj0w4iTwhZ
	WHp8+OS7oT0qXpG/CiFiHke4bpftVqFw3etXztlqnp3UG0vPQfen5ObMOE6KdwfwOZXNqyY/ufu
	Y/JE0MdH7lIwUGvZ5u6Qbdd56esvEzTqVM4VNoFk1HUYcAmjsYTGT/jJQxE3p+MjLNJCgMWXG67
	rkoFvAJdm8GMFbUrUucnHG8OVcXjG
X-Received: by 2002:a17:90b:3143:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3adea9dca65mr2434190a91.13.1792874798834;
        Sat, 24 Oct 2026 13:46:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0a7sm3793963a91.9.2026.10.24.13.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:46:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless] wifi: mt76: mt76x2u: limit TX A-MSDUs to 3 kB at SuperSpeed
Date: Sat, 24 Oct 2026 13:46:36 -0700
Message-ID: <20261024204636.23484-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_134640_635722_4D44DAAF 
X-CRM114-Status: GOOD (  16.25  )
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

At SuperSpeed the MT7612U stops accepting bulk OUT data after it was
sent a TX frame longer than 3072 bytes (TXWI and 802.11 frame, the
TXINFO length). The TX URBs never complete, MCU commands time out
("mt76x02u_mcu_wait_resp failed with -110") and only a power cycle
brings the device back; neither a USB reset nor a host reboot with the
port powered recovers it. Single frames never get that long, but
A-MSDUs of two full-size subframes are 3096 bytes.

Behind a USB 3 hub this happens within seconds of continuous traffic,
plugged in directly within minutes. Frames of up to 3072 bytes, at
MTU 1488, ran for minutes behind the hub, frames of 3080 bytes, at
MTU 1492, wedged the device. At high speed the same A-MSDUs work.

Cap the A-MSDU length for all TIDs when the device runs at SuperSpeed.
This keeps A-MSDUs of smaller frames.

Fixes: ee676cd5017c ("mt76: add driver code for MT76x2u based devices")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt76x2/usb.c   | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index ade15bddefc5..3e53b357858c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -29,6 +29,30 @@ static const struct usb_device_id mt76x2u_device_table[] = {
 	{ },
 };
 
+/* At SuperSpeed the MT7612U wedges its bulk OUT path on TX frames longer
+ * than 3072 bytes (TXWI and 802.11 frame), which only A-MSDUs reach. mt76
+ * adds 22 bytes (TXWI, header padding) to the MPDU, and mac80211 counts
+ * each new subframe up to 11 bytes (LLC header, padding) short, plus the
+ * 14-byte subframe header it adds to the first subframe after the check.
+ */
+#define MT76X2U_SS_MAX_AMSDU_LEN	(3072 - 22 - 11 - 14)
+
+static int mt76x2u_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta)
+{
+	struct usb_device *udev = interface_to_usbdev(to_usb_interface(mdev->dev));
+	int i;
+
+	if (udev->speed >= USB_SPEED_SUPER) {
+		for (i = 0; i < ARRAY_SIZE(sta->deflink.agg.max_tid_amsdu_len); i++)
+			sta->deflink.agg.max_tid_amsdu_len[i] =
+				MT76X2U_SS_MAX_AMSDU_LEN;
+		ieee80211_sta_recalc_aggregates(sta);
+	}
+
+	return mt76x02_sta_add(mdev, vif, sta);
+}
+
 static int mt76x2u_probe(struct usb_interface *intf,
 			 const struct usb_device_id *id)
 {
@@ -43,7 +67,7 @@ static int mt76x2u_probe(struct usb_interface *intf,
 		.tx_status_data = mt76x02_tx_status_data,
 		.rx_skb = mt76x02_queue_rx_skb,
 		.sta_ps = mt76x02_sta_ps,
-		.sta_add = mt76x02_sta_add,
+		.sta_add = mt76x2u_sta_add,
 		.sta_remove = mt76x02_sta_remove,
 	};
 	struct usb_device *udev = interface_to_usbdev(intf);
-- 
2.56.0


