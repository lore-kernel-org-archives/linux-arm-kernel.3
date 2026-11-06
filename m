Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82676606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XWL0EsZa;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEaRpNx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0UaxTG5x25gmRjc6KZfHadcJjXgPqxLqtyLeTH1tBMo=; b=XWL0EsZan8blha+5wUrO5RlAb3
	3AQZPIga9+DIQ6n5ZsVdCnug4OKJRnk5V/5p9OyDMLVLShfdAw1J7sKnb2LV7nyZb8POA+qnrlLqK
	9kmxMJXuHoNG4QM40qYo2AtoLRQUhR3ZGrKTmUlOUkyf1n7KtMpiJ0vGX7PHDlGVphV7WDK7XDzTv
	aO0+RU1qyn/4MSmxZhtTBlTaW5or7HNb4ayyJM2Y76n2LVlIxvrsTe3xKm/G77Y4UfuBD/PrT8sp9
	4PKbDUeUlREWwpoXT06J0s5LrMMiQgTpuqsTHwuonKrsLGFfg0eKPoPveZ66JO5EpZzid7LlNyRGt
	zXAGVP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9zz-0000000B6tr-1u6I;
	Fri, 06 Nov 2026 02:48:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9zy-0000000B6tV-0yYf;
	Fri, 06 Nov 2026 02:48:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C96D43231;
	Fri,  6 Nov 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793933293;
	b=uQs9iv7cvDd0HHy6i3BusgHnZ4bH9xTHWJ8CM3piV/pLPYPWK4Y8holKK+xDf1cBYD/g
	 OLkrpiyelcwzeNgsW/khjUcfdyBsczcKsV3iL//pN47xgk5Uxq7ozcLnpwKGDd93igPvW
	 OLWZxkjdKdzzh7ZsFpck+67TX28qio62eykwG+unig/OUMORCVL5pdmPhd/UDgzkyrMGd
	 B9/0nJcbKCs+wS3uQT1d7sc5nbmhJqgUnxrJ852COLzfGyoxb9cdtLFlu7xZL2HNWKUaR
	 kZhvuW01NGq3N9CtR8m6YUdwhAXJ4ZArhhkSknLu4cYaNBajVyi06BeWyfcoGiuUjgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793933293;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0UaxTG5x25gmRjc6KZfHadcJjXgPqxLqtyLeTH1tBMo=;
	b=OUQoi2nnTu2A2U3UMhAgIn406JQC7nzp0OY5hDNSCe0ATTPlY23fiyBZFESCemQPTdNY
	 X95yi5c6u4K7cNfM/l0EZj4ZS8NBIgWhQ8RLknR2Wvom0FySjMeiNJ8eEowKsJ79nynLE
	 /MxIivopNGAZUu+H+mqcpp12EpsX85s1BKyRKple8C5X05w0KSE0scU2h6SbBZDnegAqM
	 dauqiQ34fj3lyuySBJZRauhlHtzzvm8k959Ok4GY5VgWyldsBeTFTwdl2O//T4Xrd3JTT
	 agrYV421lBePE6j4m7ZseRY3zzAsqk5Pqp0BS6Oo2Sr9ZoXjyCLQ1LYSahXht3a6DqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C99811F0089F;
	Fri,  6 Nov 2026 02:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793933293;
	bh=0UaxTG5x25gmRjc6KZfHadcJjXgPqxLqtyLeTH1tBMo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=dEaRpNx16Z9GiFUKj+kDvv4bXGPG1PD+vMpUefteWq8CKcUjOvQBBQ9oPX/ZniTps
	 PmwsBgjSCEde8hgm6dAGxDOv2A7RC+NFnyILXwK+/jHzDS0U0iovDrDyAiIVirAvzh
	 4JKa6rtlPiZHbxk5CxzfxxZjk9DYaLg6P7YnOkWupCm6K5w0OGRzRc1wqun3/rgnK6
	 tPhr/CInY2O8uYaomiVZ9CI76gV4gLM0QHwKQDes2+pczy8RsVZmF0Nwr3ysbRBJp5
	 FnMXjAWcNxUcDDIK9Hf8MsiGsG7GousSSwAaDG9ke4wo0Vn63pDRrAihEP2nxTmRbU
	 omwbO+vWzKQaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 45C5545B53;
	Fri,  6 Nov 2026 02:48:12 +0000 (UTC)
From: kvnshroom via B4 Relay <devnull+kvnshroom.gmail.com@kernel.org>
Date: Fri, 06 Nov 2026 03:47:00 +0100
Subject: [PATCH] wifi: mt76: mt76x0: select the VGA gain from the RSSI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-mt76x0-rssi-agc-v1-1-9d2f3ad74096@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMz3dwSc7MKA92i4uJM3cT0ZF3TVPNEC2MzS/PEpGQloK6CotS0zAq
 widGxtbUAHa7S42EAAAA=
X-Change-ID: 20261106-mt76x0-rssi-agc-5e7a83697abc
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kvnshroom <kvnshroom@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793933291; l=4777;
 i=kvnshroom@gmail.com; s=20261106; h=from:subject:message-id;
 bh=GOUrR0SBzLl91iB01un4+ocyPS/13W2NZJubzZQmBUM=;
 b=u5iZ31sHOf1LNUdzPgpZzqWvjRaA3mYJPtptQvXyoEbww3yQIV9dtYYK4psF31FL6ZasMU6zF
 GhVWAqLvr/uDC+3Y+jAiie91KB5QWbRnMie1jQfhRTWOQRdUG1Duqk1
X-Developer-Key: i=kvnshroom@gmail.com; a=ed25519;
 pk=8lajK9/tD4YlPR/MOkqpgUU4drxTtsOnUfM8foTue/4=
X-Endpoint-Received: by B4 Relay for kvnshroom@gmail.com/20261106 with
 auth_id=1426
X-Original-From: kvnshroom <kvnshroom@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: kvnshroom@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: kvnshroom <kvnshroom@gmail.com>

Since commit e1534fef1ae4 ("wifi: mt76: feed the station RSSI average
from the chain signals") mt76x0 gets the real station RSSI for its gain
control. On an MT7610U (ASUS USB-AC51, 5 GHz, 80 MHz, about -60 dBm)
this makes the false CCA based VGA loop worse: with low_gain 2 the gain
moves between 44 and 56 and stays at 56 most of the time, the false CCA
counter reads 30k-50k per calibration interval and the receiver is
overdriven.

Fixed gain (BBP AGC8 bits 14:8) against the false CCA counter, with a
ping to the AP every 200 ms during a download at the 50 Mbit/s line
rate:

  gain   false CCA   ping p95 / max     download
  24-48  0.9k-4k     2.5-3.8 / 5-27 ms  51 Mbit/s
  50     8k-11k      3.2-4.5 / 25-40 ms 51 Mbit/s
  56     46k-59k     164-299 / 400 ms   39-43 Mbit/s

The MediaTek Windows driver (netr28ux.sys 5.1.38) does not use the
false CCA counter on MT7610/MT7650. It selects the gain from the RSSI
in three steps, at -60 and -70 dBm. Do the same: reduce the calibrated
initial gain by 42, 26 or 2 depending on the RSSI, with 2 dB of
hysteresis between the steps. On this adapter the initial gain is 66,
which gives the 24/40/64 used by that driver. MT7630 keeps the current
behaviour.

Same setup, 60 s per run, two runs each:

             gain       false CCA  ping p95 / max     loss  download
  CCA loop   mostly 56  30k-50k    1.1-1.8 s / 3.4 s  0-9%  18-39 Mbit/s
  RSSI steps 40         ~300       3 ms / 8-15 ms     0%    46-51 Mbit/s

Not tested: weak signal (below -70 dBm), 2.4 GHz and MT7610E/MT7650E.

The Windows driver was analysed with Ghidra. The analysis, this change
and the changelog were prepared with the help of an AI coding assistant
(Claude); I reviewed and tested the result on my hardware.

Signed-off-by: kvnshroom <kvnshroom@gmail.com>
---
Tested on an ASUS USB-AC51 (MT7610U) with Linux 7.3 and e1534fef1ae4
backported. I can run more tests, for example with a weaker signal or
on 2.4 GHz, if that helps.
---
 drivers/net/wireless/mediatek/mt76/mt76x0/phy.c | 64 +++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
index ec554a059..d052d8619 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
@@ -1064,6 +1064,64 @@ static void mt76x0_phy_set_gain_val(struct mt76x02_dev *dev)
 		mt76x02_phy_dfs_adjust_agc(dev);
 }
 
+/*
+ * MT7610/MT7650: select the VGA gain from the RSSI only. The gain is
+ * reduced from the calibrated initial value by a fixed amount per RSSI
+ * step, with some hysteresis between the steps. The false CCA counter is
+ * not used, since on these chips it drives the gain into a range where
+ * the receiver is overdriven.
+ */
+#define MT76X0_RSSI_GAIN_STRONG		-60
+#define MT76X0_RSSI_GAIN_MEDIUM		-70
+#define MT76X0_RSSI_GAIN_HYST		2
+
+static int mt76x0_phy_rssi_gain_step(int rssi, int prev)
+{
+	int strong = MT76X0_RSSI_GAIN_STRONG;
+	int medium = MT76X0_RSSI_GAIN_MEDIUM;
+
+	if (prev == 2)
+		strong -= MT76X0_RSSI_GAIN_HYST;
+	else if (prev >= 0)
+		strong += MT76X0_RSSI_GAIN_HYST;
+	if (prev >= 1)
+		medium -= MT76X0_RSSI_GAIN_HYST;
+	else if (prev == 0)
+		medium += MT76X0_RSSI_GAIN_HYST;
+
+	if (rssi > strong)
+		return 2;
+	if (rssi > medium)
+		return 1;
+	return 0;
+}
+
+static void mt76x0_phy_update_rssi_gain(struct mt76x02_dev *dev)
+{
+	static const u8 gain_adjust[] = { 2, 26, 42 };
+	int step;
+	u8 adjust;
+
+	/* keep the counter visible in debugfs and clear it */
+	dev->cal.false_cca = FIELD_GET(MT_RX_STAT_1_CCA_ERRORS,
+				       mt76_rr(dev, MT_RX_STAT_1));
+
+	if (!dev->cal.avg_rssi_all)
+		step = 1;
+	else
+		step = mt76x0_phy_rssi_gain_step(dev->cal.avg_rssi_all,
+						 dev->cal.low_gain);
+
+	adjust = min_t(u8, gain_adjust[step], dev->cal.agc_gain_init[0]);
+	if (step == dev->cal.low_gain && adjust == dev->cal.agc_gain_adjust)
+		return;
+
+	dev->cal.low_gain = step;
+	dev->cal.agc_gain_adjust = adjust;
+	dev->cal.agc_gain_cur[0] = dev->cal.agc_gain_init[0];
+	mt76x0_phy_set_gain_val(dev);
+}
+
 static void
 mt76x0_phy_update_channel_gain(struct mt76x02_dev *dev)
 {
@@ -1072,6 +1130,12 @@ mt76x0_phy_update_channel_gain(struct mt76x02_dev *dev)
 	int low_gain;
 
 	dev->cal.avg_rssi_all = mt76_get_min_avg_rssi(&dev->mt76, 0);
+
+	if (!is_mt7630(dev)) {
+		mt76x0_phy_update_rssi_gain(dev);
+		return;
+	}
+
 	if (!dev->cal.avg_rssi_all)
 		dev->cal.avg_rssi_all = -75;
 

---
base-commit: b8e5b0ae8ff47240366d38e5d12c65f878724316
change-id: 20261106-mt76x0-rssi-agc-5e7a83697abc

Best regards,
-- 
kvnshroom <kvnshroom@gmail.com>



