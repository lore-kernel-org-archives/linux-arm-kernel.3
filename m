Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB0DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DywDJj+TP6Fy0BegsYxCLBJnBZZmwEA8i9S4As70Fkc=; b=XLmP9UjTyrXzXrITipBgmnaUAs
	5gBa10CwgTsdRmNgyXzURzoixBwB1XJA4OmNki8r/ZBzyGBxOV5T2iFs4PmEcXDXWWWuT5zLsM0Tq
	993yhVl3kKAD7pmeq7DbO4cVq9+Qkb2RBhf4rRzDU4ghi6+CsmWeScLWqEdPenvht6VBcGGkG+HgP
	esIOrv38HmpBT94773o1KA9+LAgCPfumgaUX1HxMFoL/HvgYwziQv+VyxHFGM0AwjSS1dcqRRACc1
	/Je9gFNJ6MJJxOud5P9GONpBP0JO+66epqO+fmu/Rh4nz6FLufT8AmCFK96VJ+41bk04NsdResScx
	u7fWDlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pJi-00000004CEB-0TIO;
	Mon, 21 Apr 2025 11:28:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pHp-00000004C2y-2wkS;
	Mon, 21 Apr 2025 11:26:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so28703515e9.1;
        Mon, 21 Apr 2025 04:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745234764; x=1745839564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DywDJj+TP6Fy0BegsYxCLBJnBZZmwEA8i9S4As70Fkc=;
        b=gyFXjXP2ExCOjKjuN+qzY3YoE88PxgWn8O38dzQclqBUgi2k9B/vFASSbrmBqevxEb
         gaLGBocjdRCiANBkv68b9k8QegQZletgKSSOzODFcKTSft3mq7AWr03YeqB9/bFTrmGQ
         gbjbw6IOx174VDqsKZky+EoiVLZqgsAS1bVB+tl2Iti4XA7Q57Soi4UIqiTs6YyUGNDF
         P5podbwLaulldorLIXyeFksr4t78YySO1dz/m/QqxhOL7nTv2kjAIfFSgsXIWUjDxY6e
         z0zpr6lGuwSx151CiE5S7guXFieGv/v+GDL5d4H/mAjHdeawFq2G4GXCCI7KDx8yIBps
         qZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745234764; x=1745839564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DywDJj+TP6Fy0BegsYxCLBJnBZZmwEA8i9S4As70Fkc=;
        b=o13Hs+EvMTXl1TtDCTGZmV7FlLNkSGv6JLkf0L0t7OiqDCYWPFmVWsHTYib0QKnpr1
         IrIAB+cLHRrQl3B8R0IIMDXCuSmXrtON9pQRb2HGvMjOMRfpOQUHcfm3zPcbLTItqQIN
         QoXVcAtWYMeuUEN9+GIDlZfCIBMdcYNKFRZ+WqFBhRyNfc8+p4HnhBIy7HmhdBctrCNs
         XY0oNIovdQkNOOfrrQ5Hg349OAYB/8PN1Tm0t4NVmijWTt6JMpPPi3nfKuCQ1pjx5pwu
         fGAxC1ZvF9FsZBdm3+TNdM2EIjCxrJdLpxVd5/UjtBwGBt7hp1LRHjTzWRkFEB0Fko0V
         lzjg==
X-Forwarded-Encrypted: i=1; AJvYcCX4pKcVCg0gMBn9pAtzGWTn0Uo+WOyVixAIyMXhvFsg1bNw7neLaNUWfBwLDT8X7zmciR32ap5iAbmZyalQQ2k=@lists.infradead.org, AJvYcCXYXZvodh8VB8QmrWgAH0FNK0aIDekzUoYffbsxofq3FdC8BxnmgL/mBOwVx/Hq9dDDWvXdeFcULVhZcR49obVO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1RzJSi5HIBeILybeozmHMCx1ZKUjvsqBlHRX38pO8TTPkipSQ
	toDDg2ZLS7gHGVOiShhoyzJjwZA9zL50dTn5ONrLUF8ioNIEJ4bs
X-Gm-Gg: ASbGncshemuek858hf/urxMenvJy2IegGGUcXSXtYq7Em8ABYDZVk28sfOJL7tTsxcM
	5yZXLgi/OCjOdbS3Kjeapo1+/0qAsS1Wvr0jrMFoPJ/yNQOSKlRZuzNTFLYTXlrD3Lv1BDjLkuR
	33y7nm5W2jXeqqK/jH+H1XErvziUpjOHf87V2+69nCbYuhzt9qaSDCwtBuTzZCIwZCSvIHBBwky
	wIllWO/cEkZQVhK71V+LeXc13CtAKwZ+xpr1ZZ2bWVD2uXpFvdQt2yWVlzfQM4C2mRABVZBlP/w
	WsIJKiwTiVyPgmbwZfnvV4WjgSAMtz6X13kuPvQrsc1nwUaaOuaoZxG+6ODLQ6tAdA==
X-Google-Smtp-Source: AGHT+IEyd/gCLe6uVv+NRUValpX0NFG/QctCP0805z/W9pjLxvuoIW7drtqziovnyPlzm17OYnq17g==
X-Received: by 2002:a05:600c:1c8f:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-4406ac21897mr78319485e9.33.1745234763686;
        Mon, 21 Apr 2025 04:26:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:fc11:84a0:480d:20a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207e6sm11450879f8f.7.2025.04.21.04.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:26:03 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] wifi: mt76: mt7996: avoid NULL pointer dereference in mt7996_set_monitor()
Date: Mon, 21 Apr 2025 12:25:44 +0100
Message-Id: <20250421112544.13430-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_042605_739421_6B7A3E63 
X-CRM114-Status: GOOD (  10.97  )
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

The function mt7996_set_monitor() dereferences phy before
the NULL sanity check.

Fix this to avoid NULL pointer dereference by moving the
dereference after the check.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860..32846da51cbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -414,11 +414,13 @@ static void mt7996_phy_set_rxfilter(struct mt7996_phy *phy)
 
 static void mt7996_set_monitor(struct mt7996_phy *phy, bool enabled)
 {
-	struct mt7996_dev *dev = phy->dev;
+	struct mt7996_dev *dev;
 
 	if (!phy)
 		return;
 
+	dev = phy->dev;
+
 	if (enabled == !(phy->rxfilter & MT_WF_RFCR_DROP_OTHER_UC))
 		return;
 
-- 
2.39.5


