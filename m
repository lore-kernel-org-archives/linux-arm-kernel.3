Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92B5C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsLB20r8A9TWpFYmeBGeoAYLDeOKWBDPoGFDVhsYAZM=; b=Ss0w4fR0GAJYueAwRATEH4OWY4
	IjuTh0I4j7J9mxlqGfp4gRgY0C1XvvNrCnLIqbMfNXwSFix/JFslpW5N+PcqAdg5MqcDwnDEDyPRi
	M/0afU/at0P3GSYhp3O6YG/uONB8ok+O3UXJVfE9vuHZn7DmfDKKYAqtpjKThHALjU4xV4b7002M2
	zXHiRG2/5ac3F4e4awA4yoedJnElBL51gwlDeaUd+nKbLDtXbADvfUvC7MF29eJSJrqFdUIxpNukT
	gYVWDeKInDoHrJ9LkLdwgsf6HPzCqlxi8iT4CgjC3EXyfREHy0gQNgVEBdjhCW2tT3LwPzS98283F
	tMUtmT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6X1-000000012EU-04Pl;
	Thu, 20 Feb 2025 13:23:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6SR-0000000117m-1oF8;
	Thu, 20 Feb 2025 13:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC5B75C5E2A;
	Thu, 20 Feb 2025 13:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C777C4CED1;
	Thu, 20 Feb 2025 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057554;
	bh=Q55FloXfLGhRafuisEE3Xol2q+krOa8epD0FSmkkY1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AxCdcgcYMeP3a+Idty9oTp4RAno+ZtY/HpOjnXnNArBiV5QhEyj6Bl+KumXwe9F8e
	 xaUuhvD2+n0ikEESnYOtWMDDkVo/AT6oVUgQJ71TLOnOn+mYdBcikHCurnIoXpCKjd
	 Z407U8Tbbl26/SGuDhUofWjqcs/ktgSbWanuNjWQ53NiwOxNLYUJVYmF1eGFXxNd9L
	 wv+VhODPnW5cEfCkJxWm/5S5eUAzu3Z8dyPHnTGUp0AKxnMq+LR1llvbF8B8/WD6Yt
	 f6L6UoayrQQxVMxMqxN4NFzbBYT7dhJw99feQhwrFpLLCBZGA/cYgljE4FxLxVyG2D
	 ei7HZZHlrBwqA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 20 Feb 2025 14:18:47 +0100
Subject: [PATCH 01/14] wifi: mt76: mt7996: Add chage_vif_links stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mt7996-mlo-v1-1-34c4abb37158@kernel.org>
References: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
In-Reply-To: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051915_529547_7A798D88 
X-CRM114-Status: UNSURE (   8.66  )
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
index 69dd565d831900fa344e214042a74b2e5b265741..ae603f1c098e16bd989b7b1579d22e0ad7dfb49b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1622,6 +1622,14 @@ mt7996_net_fill_forward_path(struct ieee80211_hw *hw,
 
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
@@ -1677,4 +1685,5 @@ const struct ieee80211_ops mt7996_ops = {
 	.net_fill_forward_path = mt7996_net_fill_forward_path,
 	.net_setup_tc = mt76_wed_net_setup_tc,
 #endif
+	.change_vif_links = mt7996_change_vif_links,
 };

-- 
2.48.1


