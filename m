Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84999C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 04:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RYhyGaWYmpci56QhJSuWVc944fdh64JWw/7VVEY/WQ0=; b=QadwLfD4Hw+j4hBsYMaIlBqi6B
	HhgX1+GpzyIdk/Mdh2iRT/Q66pB9P8Ap9IdLkNfqPxjmnbnn15gx3K6oKjBYMHE7BpgFGYPaHr16f
	gtPmKWnwPpibri9YZsVq45mSYxXtjojYnqUsfNz2z/9zPh5CB0NoonhhaU4OPtGDbuju5+jinWiuO
	dg21SHfwkeAynerRds60q3/KYB5HNodxNkKvLNOBCaEaYQNBvQLEfD1WGBLBp6tybMWjxZ+BcN3++
	6xx4b+kbqaCEMi1OuCHYkCHZ5tR9gHx/N6Wq1HWz2bKlommVzXcUlnn2/anAAnMo6VQy4LJAzUO1H
	eWTXJPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz5Ob-00000001tE1-2coP;
	Wed, 26 Aug 2026 04:37:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz5OX-00000001tCt-3TYc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 04:37:52 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C4E6A3FC10
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 04:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787719065;
	bh=RYhyGaWYmpci56QhJSuWVc944fdh64JWw/7VVEY/WQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=JzV68nQWsfORF3qNKEvOtpwr1ABOvX3CK5TIaFGZCRvs23PHiIRDLq4fzzLcdNYQQ
	 E26yh+St3jbZlisIlB05T4FuLPZK/pmWzBRVp2+7mMXbOUrMwaTSYSQkH+sMfOEoE8
	 bs1+um86oXtgsH7nT9EGMA9IOskzKqRpdbKbMwPDqetgv0Mei4gIDuP2zgstiBAsIL
	 KHynBj5xcNlMT6Eu4b13OpYtDL4wvZtXqd7lNDC5ou21qaHyxXaDI0YPA/CakQlkHr
	 MjZhafSzfxDYj/YT2uIDR2mGn8NYjrWkB7VZqLauVJK2oRQQjS65JMEeLXVT0fVZg0
	 KmYUZ0Ho9yx4aqYIPdHxthehupdxvfPXlrl1QN2somPnqYLjk2kqPLDup99h2/dGzs
	 J7j2UYH9IGfaXvR7TDPLYCSAUe4OBMbUlhQqSjT/yfciuadSxTDOjG7kGF9iW7YY+u
	 Nnhpwb9whccraxcC4urUGI5rP1cIjKDfaWYnn6HIP9eP1naq9JsEZoS5UBDBaTDKp7
	 TVT13w3H9yZh+qp59Nsl4BGejWx5u7um8K/Wxr6hSYT0Ioo0dKGk2f/kFMitxIeenY
	 K2UTKoW6wuYX/d9z8bSLtTQSyqtrF9eQAE/y/qYXqrbin0pKhy8XViYe4UPkjLMTPH
	 d2R5al5HWA4ZdWsst8C0UP38=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso534234a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 21:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787719064; x=1788323864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYhyGaWYmpci56QhJSuWVc944fdh64JWw/7VVEY/WQ0=;
        b=iPiK1mp74wJ0ikwl4Cqo4IWwfEvPEpGKBxovZaliMDTZceQO3paaM+GznmUj7B+llN
         b1EqKmQAQqJXCeYzkSwz60ilO/wcWRfeHu97jFJOXF+7ckX3L19kur2QXSOsaPNSYnlT
         1kFBxTNfZagUKeElPm42SO0gZyiRnEnciaPeyUus0AmbULiMVdXxaRmoks9pSnuuKm/e
         +bP3bp7v7j8xy2HJ7hSvIdA6ONd5nqt2KXJuywC7u4WWjmdZZJfTjTTpbbw4f1X26FzG
         ZyrYTKMeCTctsvSDtIUKaR74xMGjTk3CvpagB4IsCJ9oDlX0FOUZMHz6DC6neQbQGunh
         nhFg==
X-Forwarded-Encrypted: i=1; AHgh+RpoWIoJNIfIjxEaFFUHFYfzWcKJ7YOjJpYI7/SdSqIzOtS0dSwmtN6F8l1WurQCux8uiL6o7x8kEhY5YXEov3sZ@lists.infradead.org
X-Gm-Message-State: AFuF++l7hMtmZb36s2tWYkwfW6oboBZfm1BQm0Ma/0/L8OsZXzZZS/0m
	ZpH5kMsev+87LodN8sBG51XkYFYKsx4rSfeSjw4YCyAgshG4nwa+zHd0axM/9iwx/6+v4UFOpyv
	8xix0eXoEMslos04dKk22/oJ89JD55GVMvSQ7Ol0DeufRx+ZSkY3HUdlCyNOxAShs8e5G0XNwxZ
	60JtHE8Lmhe9XDz+wO
X-Gm-Gg: AR+sD13LSbIcaT0XTdGQWaGpjv4tOU85FVQ4PVrW+hd6JvMzr7vukx7vASl0Ojj3zf2
	NqAwMQR+f3h+0MWjgVAb7sLhZuibqyLLJkNh2XY7ZUaB82RNKS4IAIs9oHjCTbQSLuTjPnkSoke
	kRO0bG5FE9oedzeJzmsLH2VLZshVu86SL+Bh9U4Vr5PVWXdSj5kaj/XIN+sCe+VfA2Mp/pZqe1L
	XUZ/E4Y9J8Gmo2nxJQx7OU5DlJcA59osBUDySP6aiov2K6BuHVN7/F1HbJVJsay0NYmgiGlTNfk
	tEnmtGF6sPcC0HZrRTZEahn6iRh9LUNO+SMuodv4gECOqRxpV3Z/ekofdFla3+uEsioQObEa5st
	2OEhfxkyFF2ZSgEEQv/9rbK+kxd35Rt6+PfwC9XD9MRxacleWG7JQ5bl4ckAhBEpwCPxeS4vjGz
	IDW89KsQWHhC0PMurwKYgWPy7tbyMZmXghA7NGxw==
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr8498999a91.16.1787719063980;
        Tue, 25 Aug 2026 21:37:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr8498836a91.16.1787719063361;
        Tue, 25 Aug 2026 21:37:43 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396689fa52csm2423547a91.12.2026.08.25.21.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 21:37:42 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Stefan Bader <stefan.bader@canonical.com>,
	Edoardo Canepa <edoardo.canepa@canonical.com>,
	Mehmet Basaran <mehmet.basaran@canonical.com>,
	ElXreno <elxreno@gmail.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Jack Kao <jack.kao@mediatek.com>,
	Aaron Ma <aaron.ma@canonical.com>,
	Michael Lo <michael.lo@mediatek.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] wifi: mt76: mt7925: restore the legacy BSS after MLO teardown
Date: Wed, 26 Aug 2026 12:36:58 +0800
Message-ID: <20260826043658.2255553-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_213750_267056_8CEDA5CD 
X-CRM114-Status: GOOD (  14.69  )
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

Removing the last link of an MLD interface leaves the firmware with the
MLD BSS and DEV entry: the removal loop skips the deflink, and the
hweight16(mvif->valid_links) fallback reads the stale pre-update
valid_links, which is still non-zero. The entry keeps the per-link MAC
address, so every subsequent legacy association fails authentication
until the interface is removed or the module is reloaded.

Remove the deflink BSS and add it back as a legacy BSS on the transition
to zero links.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index e7e6d20848d27..bb93008d3d75e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2036,6 +2036,21 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mvif->valid_links = new_links;
 
+	/* The firmware would keep the MLD BSS and DEV entry: the removal
+	 * loop skips the deflink and the hweight16() fallback above reads
+	 * the stale pre-update valid_links. Restore the legacy BSS.
+	 */
+	if (old_links && !new_links) {
+		mt792x_mac_link_bss_remove(dev, &mvif->bss_conf,
+					   &mvif->sta.deflink);
+		err = mt7925_mac_link_bss_add(dev, &vif->bss_conf,
+					      &mvif->sta.deflink);
+		if (err < 0) {
+			mt792x_mutex_release(dev);
+			return err;
+		}
+	}
+
 	mt792x_mutex_release(dev);
 
 	return 0;
-- 
2.53.0


