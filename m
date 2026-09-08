Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80148C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ttyj7YvlZDm9hKVv/iwpJrgcMVPyuqSO8ZB2OYik/Po=; b=2+11ADh8SKLaTm1c0yXhrArjH7
	gs0i7TDpw9CL3KaorK1v5bdHz1BQE90skm7y7Mpk9iAGmETbQfPbf3cNMIvpIjkR5JArSliPfNIjR
	AUMve3ySDBW5wNUk2BNhT0qYgEENfYdqxsnydOmRCXk7rr8Mt8JjdkLDQx7GHChlL9gx4FH32ovTS
	ByXBRhD7DilgzQaHwSV2qGh1IUWHyJ+lwWSuBoZkaEJpVN2MvQQTuPP5BEMIgWvMM6abtItALCcjx
	FEe/UUnffCIz/Wfg1VzGhYs+bfzksxDaSynp5bDp9HSuOHvn58S1nAPU2+jEFw3v8NfNfN8WXKdi5
	gSKQz/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kna-00000007tjv-1mUW;
	Tue, 08 Sep 2026 01:38:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3knX-00000007tjM-3Hx2;
	Tue, 08 Sep 2026 01:38:57 +0000
X-UUID: 0a6b8da6ab2611f1afed4741b24580c9-20260907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ttyj7YvlZDm9hKVv/iwpJrgcMVPyuqSO8ZB2OYik/Po=;
	b=u5u5ZIb4EVT351s81iQ2ArWaepX5UqZXyItvhfD+mhQAkts7ajrXgf9quUfV6u0/5hFsslvB3fMkpCSlZMv7oXkyJuyRSVmDI2WruRQ8jOwSaB0JsPlzoTPbxiSaNi/+m0a/p0EAUiCdtjDxSJuwQqCcMG+i7iOBwy9JlzAr9F4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c8562832-2757-4c4a-ac6c-f7443209976d,IP:0,U
	RL:0,TC:0,Content:44,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:44
X-CID-META: VersionHash:7db8b62,CLOUDID:457598b6-8811-4549-82bd-027bf522efd6,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:4|15|50|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a6b8da6ab2611f1afed4741b24580c9-20260907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 472958388; Mon, 07 Sep 2026 18:38:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 8 Sep 2026 09:38:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 8 Sep 2026 09:38:47 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Douglas Anderson
	<dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Justin
 Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v2] HID: i2c-hid: Unfollow the panel on shutdown
Date: Tue, 8 Sep 2026 09:38:40 +0800
Message-ID: <20260908013843.368364-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_183855_835829_EBDB7BA6 
X-CRM114-Status: GOOD (  14.97  )
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

i2c_hid_core_shutdown() sends SET_POWER(SLEEP) even for panel followers,
but nothing in device_shutdown() guarantees whether the panel, and hence
our own power, is still on by the time we get there.

Do what i2c_hid_core_remove() does and just unfollow the panel.
drm_panel_remove_follower() calls panel_unpreparing() only while the
panel is still prepared, which powers us down properly; if it is already
unprepared no transfer is attempted at all. On MT8196 the panel is
unprepared long before us, so this also drops the ~2s i2c bus timeout
from every reboot.

Fixes: 96a37bfd232a ("HID: i2c-hid: Support being a panel follower")
Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
Changes in v2:
- Unfollow the panel instead of just skipping SET_POWER, so we no longer
  depend on the panel having been unprepared before us (Doug).
- Link to v1: https://lore.kernel.org/all/20260904035009.4114363-1-justin.yeh@mediatek.com/
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 0ff07fdab442..c7e46004f513 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1355,7 +1355,16 @@ void i2c_hid_core_shutdown(struct i2c_client *client)
 {
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
-	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
+	/*
+	 * Like in i2c_hid_core_remove(): if we're a follower, the act of
+	 * unfollowing will cause us to be powered down. Otherwise we need to
+	 * manually do it.
+	 */
+	if (ihid->is_panel_follower)
+		drm_panel_remove_follower(&ihid->panel_follower);
+	else
+		i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
+
 	free_irq(client->irq, ihid);
 
 	i2c_hid_core_shutdown_tail(ihid);
-- 
2.45.2


