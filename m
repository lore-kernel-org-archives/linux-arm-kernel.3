Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD91C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 23:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ZR2UVpqmeFDPx4PfDo4Uk4g9Hsu2oDRhSNi1KzWe7k=; b=dLd1aaK0+tvcC7b+UiqaCsAUdG
	b0fTSxDZiM2lTl/XFTj+f9NqPtknWfWGNWjru3qafSRGpGYgaDG62wlAuvywegcgpiOB7XqGVyPCL
	tWOdmC0UrklvvcjM0iNnOTsvtPvlrwmxLbWFm3VOmR/l4g6vEET2Jy++pbVh8+RADOcSbcgKkoA6g
	xtemI40564yX8HTxgvUENASnrckqDcjU2UXR60qzArVNEOxagIODKvLKSXxMEQImVBg7HUfb6Xkbv
	7SA94TuCDTwstn6kxx2EIFLYPGVbTwxuEOdG5rWLjvz+7xRZ43kVlP8FqS9ZVtcdHO+3JZbmPVAmo
	GxH2x7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw7sD-00000000Ps0-1pvN;
	Sat, 22 Mar 2025 23:03:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw7qX-00000000Pmj-34hF;
	Sat, 22 Mar 2025 23:01:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so21221045e9.1;
        Sat, 22 Mar 2025 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742684500; x=1743289300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZR2UVpqmeFDPx4PfDo4Uk4g9Hsu2oDRhSNi1KzWe7k=;
        b=NN3Yv0eudOu2c8PYPaJ+sspAi9zlK0WxsAmdN4ObYuxLIEDLVxY0HIgtJqORjLhSAg
         b/7vricmu23IObBbDguftgUxjF5usGp8YnJ/KmcFxar1AiLottdiY7dYhURS+XP21LaC
         ST/xNkm4O8SwqVxj3r+2jVIYSb31zUho8Epk7uOYxHsnzsuSL66zxhLEIHyi3SjwBoeH
         YM62taNMvWjyZL7KdXveYSLb03UpMKe/8NlEiJdmGLs6uPcnChk74eAdxf53RuztguQQ
         k6n6/6vQRynnL07HQwVdNw0KLsCHWZz7O8oEEfT9CqZAR7fiTXFSlgQofrelY6RsyNzv
         g8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742684500; x=1743289300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZR2UVpqmeFDPx4PfDo4Uk4g9Hsu2oDRhSNi1KzWe7k=;
        b=ODCxNA9D9xHmL9Nye1UEOIxzhrzq7lyYxQdZMBn7z0fO/d633ITIvrAd4NSCArvWes
         LaQMaGjuVbwujS89o9igXHe3cRTt87qbdFFf55hleiQrZ/Adb8laSF6xhPqc9JoUVhhR
         k5Bn/i5dwTsXq/fF9aVK444JwQqBM+9njvBjB++1jgn6kMjJBTVikME+3hImgqRzVek0
         wXT1jkKHqflRX2nTfU5VREVBr+IGQJx2sPdVxk6X9RVMa8RyUvJMfCRuI3BFgEtz24T1
         ETsu5gg8HEiO7WybXdjlbl6/WIl8t1gAS1hVlF67tSMvOxMcLbdWbmLiBeds01K4C7pu
         psCw==
X-Forwarded-Encrypted: i=1; AJvYcCVwIrPWkU8agCogwrvDjPr5jOSebc3Kxk9lhQUhYTRyMq/IThxBQj0cJDV83EL+ACsUg5eSGEfGlr5lV2tHASo=@lists.infradead.org, AJvYcCWDg199QvwjMCjAe802roqBDur2z4Nl1ZxqsKkgphmWJcyTOtXJnMqcqslOd1BVmv9CfN2Aa/0QNskgEjjIs4Zx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw74hqvvzmdtdLYtyjdKtj3uo2zWrlNYzAkFf80JTHdf5j1VcRN
	9iMTWxDe0k7gmyKzNvP9U4nwhZZ5aS6T8kiNSXHxS3xIlHDSlR6g
X-Gm-Gg: ASbGncsd7lwZWqsQW6UcLoApAPnx5dKNLlHuolm0DEFcGg2W7vWYzpRw3fvtOnl4RUY
	CpLLDDk0hz38Q45zR/5KoCy3zPYEcKOkFVTvC2VXEOQEq4dX/9h432hCnwoneKbJU3EgQVGlU3t
	G5qUijzn92g4wXbCS+N5klgPEqxdZgh55+V4J1qldRTqJHijoGubeCCL752Go8uh/K+8IsWb/MW
	ao9wrUVfnwf185gDWJk1nY76FWPLOysRPxDQpCXIakFvR3iVlmXfgTbpsT7WOHugzgXEc3NSDS7
	vHq+Y2pzqMgFuNu8cMksHuZgR+30RUT4+kxOLf1f4VxZOQ==
X-Google-Smtp-Source: AGHT+IHjCKrhSEzyg1bOP/bYmKQPvVEa5OEsNqQOvW5LA8oKHtiOj2mV+K4xOb9q373wp3gepKGEtQ==
X-Received: by 2002:a05:6000:1448:b0:391:253b:405d with SMTP id ffacd0b85a97d-3997f933da0mr7944371f8f.41.1742684499903;
        Sat, 22 Mar 2025 16:01:39 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:ec99:3da1:428d:90b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f2asm6261120f8f.30.2025.03.22.16.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 16:01:39 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com,
	jonas.gorski@gmail.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] wifi: mt76: mt7996: prevent uninit return in mt7996_mac_sta_add_links
Date: Sat, 22 Mar 2025 23:01:37 +0000
Message-Id: <20250322230137.28164-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_160141_770755_C98B1C55 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

If link_conf_dereference_protected() or mt7996_vif_link()
or link_sta_dereference_protected() fail the code jumps to
the error_unlink label and returns ret which is uninitialised.

Fix this by setting err before jumping to error_unlink.
 
Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support")
Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Added missing semi-colon as pointed out by Jonas Gorski

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860..70823bbb165c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			continue;
 
 		link_conf = link_conf_dereference_protected(vif, link_id);
-		if (!link_conf)
+		if (!link_conf) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		link = mt7996_vif_link(dev, vif, link_id);
-		if (!link)
+		if (!link) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		link_sta = link_sta_dereference_protected(sta, link_id);
-		if (!link_sta)
+		if (!link_sta) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		err = mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
 					       link_id);
-- 
2.39.5


