Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A468CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uSwDIRJjQ0SnoqseAuVGbS6urkWwRwNKXj4wXVyjL8=; b=i8WwFC/IcO6N6oyUOgdziRFaVB
	nKIbtFCsNbM2URzwf7M4/17NV6iPUtEh+EaqoFzD3SWSWmt07nU1d+CiE53t0kwW7MnWrmxGttZpt
	hA0VpmC6uKxZLlYtb37uEPX018ZnYsruJ1jIdghSqSGhIYwK1FqL574LtQwWfk47ZMRtUYyl0tQ1z
	cJXeFhS8zLrcQb46swMxJrB4SbQQLDiwUXjpfcPuFynk1z7Z5VN2Xn9kPQNLAIRkAidAcluW/REu9
	D9VVNlGZYzMsy+Q5m/SO4Ce+QR/MsD0z8xIGu7W3iwkOUWAW30FNlE8MY5MTP+ONom1zom9YkhCb0
	rAnCPg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3ib-00000006Vny-0Y4K;
	Tue, 11 Mar 2025 17:48:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fL-00000006V9r-2aqo;
	Tue, 11 Mar 2025 17:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D44D5C6360;
	Tue, 11 Mar 2025 17:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0F1C4CEEC;
	Tue, 11 Mar 2025 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715118;
	bh=iTxm09vzIwOGZsrbO6SwdKjRP6DnRsKoA/tAzDLV3+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EFtkSaTpBXdx2hNabFoaSSPMyDP1I4bHIRE5td75prZ7aWgciiuT4ds//BbtMGCuH
	 0EBrXqY/QER9KqQMYoaVRg9RZaZdmVTPvbUU36uTez+P8zwuXYiyOJEj7ra/gMwrgk
	 zcmFKyQRfckF2SPGNGFylAANHJ1wPqidaOEa/9lp/hzVxvgxuDYyf14HPECH4c3QoF
	 8hs9Q1ZsfLDxse7DnhWIN4XNTkePpXcgzZfpk+kaU7ADQ75I+TIjLmv6TQ+uGsa8i1
	 zqvcTi+6XYXPNRBf/zaWiERjfGMGN2D8EnyTBGh38NicLoI19EXnvAE5iXEWYyNOPM
	 egOu5AQqnSChw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:00 +0100
Subject: [PATCH v2 01/13] wifi: mt76: mt7996: Add chage_vif_links stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-1-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104519_720169_A7C693E1 
X-CRM114-Status: UNSURE (   8.81  )
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

chage_vif_links callback is required by mac80211.
This is a preliminary patch to introduce MLO support for MT7996 driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index b01cc7ef47999793f4815e4f3c6650c573f8cb28..c0e7ab9bcae5fcd503c10e1a02508977b6921d17 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1650,6 +1650,14 @@ mt7996_net_fill_forward_path(struct ieee80211_hw *hw,
 
 #endif
 
+static int
+mt7996_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			u16 old_links, u16 new_links,
+			struct ieee80211_bss_conf *old[IEEE80211_MLD_MAX_NUM_LINKS])
+{
+	return 0;
+}
+
 const struct ieee80211_ops mt7996_ops = {
 	.add_chanctx = mt76_add_chanctx,
 	.remove_chanctx = mt76_remove_chanctx,
@@ -1705,4 +1713,5 @@ const struct ieee80211_ops mt7996_ops = {
 	.net_fill_forward_path = mt7996_net_fill_forward_path,
 	.net_setup_tc = mt76_wed_net_setup_tc,
 #endif
+	.change_vif_links = mt7996_change_vif_links,
 };

-- 
2.48.1


