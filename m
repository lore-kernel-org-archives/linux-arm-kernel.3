Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FDC606D813
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=17WbDaIg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcC32mY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=; b=17WbDaIghLy3Fm
	cbA25zdBCmhnHBxJ2g0Ge00GsR7ciJiqSBqLQLvpaKxYrkeds+V4VR0LsIY67LuLBu7ro7Xgxmuji
	i3OdSkARz6te2oTEOv2LLqsumYVaKM4cJRN9Z9tsN7XFKh8qPznutB6xQUY73Z5+z7AMQETbvTAJc
	pySBFKch1Omrs3aQhG/L6vrYBu21MbZHhrdtn5j0FZwf33/3BVwK5z2SZY8s07BufhiNWxr3HvMfr
	RybVVAb8xMcwiUFRM5YyjOqfcIlZWa57J/x5eHJZGXCjlVCquoH4WIjiYS60l14DJZhquWh+cEo4G
	HIntohmH6biV7Qc1++qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEft-00000002a4K-1C1W;
	Tue, 03 Nov 2026 13:35:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfm-00000002ZyV-3Mzj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:35:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48c4be28b82so4374653f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712933; x=1794317733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=;
        b=wcC32mY7/rsUMvq+yvBEYAlIGlGBDRmJIXb+Yuiw69KmR5Bocekve4yhpRrVcnYWr6
         jhhIwuwOykK14Elt1sfQi+yzBWRMLSFX+dYnVzZy+ofsX3vzu2nrNmAamblPgfLF/d6R
         5+RtF5I380GbMytvEAAH4SNsxYspX/mvdvw8/c5UBAUuqVHFQAGEfUQ1HA2RJasa+N61
         24d0/awmSAm4dxU375jgf/iQKaxpjy1sv7DNpwaX7xl7A+f6JbGNmfeVtIWe8cUrF97M
         VNN+u76fdL7xQXZVpaNTTvPBaHmldU+zDxdQ3ZiGhAG1HdvucleWJdqJWiKQnslC+0q2
         UynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712933; x=1794317733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=;
        b=0870WfUw85NgAzbUEXZkHj/zOJvObkZSE88Ot5s8Y8Yy9UNv4RzMfa8n1H4jckiUvj
         aZB7MgZ5YCwzsjE2S/jXy+vJ2ko3uG3s618TkGxIhL2biGIXTAYwwMHeQjlaHbuzCNRV
         KzGbj06/NYuTLQC6FmFc9GsnF01lHednt4BfkolZq6MymS9I913DVnabyaKjtFWbaaGA
         vznox6xpFPPoiM7exth+6qg52TU/GC3mwCrRclH1vGFgboBHnohU3vvDUMd3owKtAU/0
         p1x5ASSJ6Si1WG+3XWTvS7iHovjil55qbiZM5dXulMdvhMJvXPYU4JEP+RT93WMl8jWZ
         JtgQ==
X-Forwarded-Encrypted: i=1; AKwUvByD3N8sJ9f85iORZENJD7KcXk90bzXOZdFjqoTRVLCeD70LgNORmLi3h7xh4KSm14akTF3MCkBP+HPbwTHRKVuX@lists.infradead.org
X-Gm-Message-State: APuU4Z9wecYxsTRIUP6myQH9K102ceWvBayHw03MQpQ0hd0Xn9Fsb5zM
	bKgMU2nBeaSpXOh9k9qoqDy5lXAQaJaU9NhgSSd1LIRP+1xftKKSPxln
X-Gm-Gg: AYBFou0XFpozqA6ST+BXs4ldM2OOIwvWLaOhlUAETILkXXIdEyifJEOCpUUfEVocbuP
	c0ZBT6R/u9LMZ1iKTNzUPzjushejf5v+lntlf6czPStQLFwUUmfvHAJVmUSOYPteehGQssOrMg8
	vEokNAReW5OmTSZWZCSE8/7WP6YMqQsCQ+ZUrvIGgxzumWUOtxtwJRorZoPjNEIGhU8oqm+tKUO
	p/l1ADUCvSHp9GUYaAfiaiNi0WVKE4n6VRAu3UuUx8tNpxlivFSu/egeKtovrb1WeYR3YxRILGW
	Qulj8E/ZYGgWbA4kRL+hafSG5CQZllhZdhWTeMME20o5tvhIcCXSMoRbllyJtT3i7+a0QsFNvyv
	0CbwpcrRMhNxh6De3imTQP9vvJfNXkwIWIX0wk7PyyCaga/kQyIx97uZq8s0MnG/QLPY9c/VoVA
	1nbevpoqobfVx7OvRLtvJmCvhIE2cjGlpkskUXpQ4KgnlEuqIFelnD8QCHES9nO45qSBlv87us/
	w5mcEutkwvPyIELYs/e6B05X7l/MijcDCvdeDSXLUas0JkUenCaFT6KHvnLSAViOy3ko5VOuhs/
	OR3NY6C4/Yjf2WIUbNEkMZuynvL5/Rw29FdbJa2387AOLWNxWauy5CKRrz0XwOoh0YmJ/+64hO7
	RTY8a0mQAJJ95RcBTpHtySUmQlGHi97EGseByKdx0ffKsJC9yWiPL8FtShVs2+2dGDAa6kP9gD6
	0NgGNfCOXsJW1iOewg8NfC+jGwd8EoRzzeOJ3XtsOh9M4zvYwQjrrC84c8I79IATzM/TskTU4h2
	XkW
X-Received: by 2002:a05:6000:26c8:b0:48d:f014:63ee with SMTP id ffacd0b85a97d-48e6e3040a3mr28458056f8f.20.1793712932549;
        Tue, 03 Nov 2026 05:35:32 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:31 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/2] wifi: mt76: allow LEDs with only brightness_set_blocking
Date: Tue,  3 Nov 2026 14:35:27 +0100
Message-ID: <20261103133528.53197-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053536_487424_FD65A155 
X-CRM114-Status: GOOD (  13.42  )
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

mt76_led_init() and mt76_led_cleanup() skip the LED unless the driver
sets brightness_set or blink_set. A USB driver that switches its LED
through register writes has to sleep and can only provide
brightness_set_blocking. Accept that callback as well.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index c9762082f473..e3eea578a97c 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -193,13 +193,21 @@ static const struct cfg80211_sar_capa mt76_sar_capa = {
 	.freq_ranges = &mt76_sar_freq_ranges[0],
 };
 
+static bool mt76_led_has_ops(struct mt76_phy *phy)
+{
+	struct led_classdev *cdev = &phy->leds.cdev;
+
+	return cdev->brightness_set || cdev->brightness_set_blocking ||
+	       cdev->blink_set;
+}
+
 static int mt76_led_init(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
 	struct ieee80211_hw *hw = phy->hw;
 	struct device_node *np = dev->dev->of_node;
 
-	if (!phy->leds.cdev.brightness_set && !phy->leds.cdev.blink_set)
+	if (!mt76_led_has_ops(phy))
 		return 0;
 
 	np = of_get_child_by_name(np, "led");
@@ -242,7 +250,7 @@ static int mt76_led_init(struct mt76_phy *phy)
 
 static void mt76_led_cleanup(struct mt76_phy *phy)
 {
-	if (!phy->leds.cdev.brightness_set && !phy->leds.cdev.blink_set)
+	if (!mt76_led_has_ops(phy))
 		return;
 
 	led_classdev_unregister(&phy->leds.cdev);
-- 
2.54.0 (Apple Git-157)


