Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1A5CF856E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/+XHzU0pF7aWaFutMnb2QVUneP4Even5NnnXd+XgY8=; b=Y3s1o8oNLNSMnhPr0YBDzTdfvQ
	Cn4xMha51KJDCbGlh+UplEUvT7Y6ebvfHR828Xl7uoUVbTsn1yF0437S6d4IAHVdwuIbbZ3YSANQz
	ft6EGALHgl7xycEjgKmrblQMbdr/Q5CTst5AihArymwFJQtWyZtBrLyFC4/4ag9GlPFE9W99o/qIv
	xTcGTEunIlKIjOuofyh5LDYgRo6dK+JSiD/Ibbs7wMyIFj9Z/Jrwdaqg25f4JIUimLIsqGkL200qK
	1GeWAJkWdoup5WS/+N26PgoRYuqNAyMG4P8vBiN3R9/ShPUIBnQsBl4P6AlqlQPWxPyCAPcHecub/
	A9ROY9QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM73P-00000006xYV-0fXU;
	Thu, 20 Nov 2025 15:58:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM73O-00000006xYG-0UJn;
	Thu, 20 Nov 2025 15:58:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E43C6014C;
	Thu, 20 Nov 2025 15:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E00C4AF0E;
	Thu, 20 Nov 2025 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763654316;
	bh=WNuap7absK6lAtucjrajzfMyXhK03+dzT1XbMmcXZ24=;
	h=From:To:Cc:Subject:Date:From;
	b=rHVvjXqQRwxehxusb/zaSyMFzSUvKHvQDdwb97TXCP11xcTnTywmClxRncatwCZz5
	 IQx/dnMRZPI5oMQeFyaQKC4sErxr8F/fJJOswU7oAewjAydFZD8j+WjBZACUd48al8
	 c9Dyp4jaVCYsF4+1Ss3j28kZ/jQFODScapoPl7czs9DwwKcrqaawYtkgv1b5NnAm5u
	 JuoYltiN7T2pZ/0WhZA27e1xKNFd0xw+b8Kh4/ALhZln/UxagFeyzkxzPVEv8w8iel
	 qaEw8AG8nr+KKvooZv/ip58WEY6uKFlA8gp8et+pegWcZiMa8hBtP3rT8Mjb/zl8m7
	 H9xvZo1J5mFCw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: Strip whitespace from build ddate
Date: Thu, 20 Nov 2025 09:58:27 -0600
Message-ID: <20251120155829.3494747-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On systems I have with mt7925 cards I've been noticing a blank line in my
kernel logs.  IE:
```
[   17.294105] mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 20250721232852a

[   17.314233] r8169 0000:c4:00.0 enp196s0f0: Link is Down
```

This is because the build_date from the header has a newline character
as does the dev_info() print.  As the firmware isn't guaranteed to always
have a newline but the print is, copy the firmware build date to a
temporary variable and strip any whitespace from it before showing it in
the logs.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fc3e6728fcfbf..eeba6deb100c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3101,6 +3101,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	int i, ret, sem, max_len = mt76_is_sdio(dev) ? 2048 : 4096;
 	const struct mt76_connac2_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
+	char build_date[17];
 
 	sem = mt76_connac_mcu_patch_sem_ctrl(dev, true);
 	switch (sem) {
@@ -3124,8 +3125,11 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	}
 
 	hdr = (const void *)fw->data;
+	strscpy(build_date, hdr->build_date, sizeof(build_date));
+	build_date[16] = '\0';
+	strim(build_date);
 	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
-		 be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
+		 be32_to_cpu(hdr->hw_sw_ver), build_date);
 
 	for (i = 0; i < be32_to_cpu(hdr->desc.n_region); i++) {
 		struct mt76_connac2_patch_sec *sec;
-- 
2.43.0


