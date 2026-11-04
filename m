Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742AD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+FxLL/c;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=vFvvQ5wF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BQ87gBPtkwxoz8xl4Pe/IUMApvOi36VjXgZ8bl6jw0Y=; b=u+FxLL/crYqIx7GuWkCEhBks0N
	nguGChnS9ZQdfJa6d9ntlB0h7/1JvfjjViNO50oE+1Awtqn3PQ2swoa4pVR+xTF92Ywd0g7cWKNMW
	yoAO1OarQvSqcqgNX+Sse7tYzW+UU+bdqHJgCU8YRL6F0x312vcEQses1mk8730kI/p9U4Q5aij7E
	odHOg29ZZQHWoL0YUVhJpDO5iPzTh8Xj8TrxUSnlv0BSMp8cRaPcQ6/JPzoQ9YGIAW7ImsIEyPbrQ
	nqrx/2HrK407QfvJxfLh3Z/539wLqeLD54n9SbOdJvBvpBXkGGd6/+Thcf4YgfZICOzO8B+1UDdKU
	OTFdjzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWUr-00000004j5U-1Xko;
	Wed, 04 Nov 2026 08:37:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWUp-00000004j4R-1xjJ;
	Wed, 04 Nov 2026 08:37:28 +0000
X-UUID: f40419b6d82a11f1afed4741b24580c9-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BQ87gBPtkwxoz8xl4Pe/IUMApvOi36VjXgZ8bl6jw0Y=;
	b=vFvvQ5wFm21BJG4i+zgcMs84ELWwisuox3ZO3lFd9uTZDVpRQJHYocGnljAFm5zypOR+8VyKUxX93bFAJ4b95MFMC4/u/gBUDE576jkQDDvNrv1ST+O15jFPVifUv7MiTD+iC/H/iugUwiLoOtHeQHWOnGylsdwi8JwRiGzCLlc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:88a2e5f4-5a56-4b8d-a0c1-e3a291e4e713,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:8093917f-3613-4bd1-a0b7-c3a1d3e04ced,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f40419b6d82a11f1afed4741b24580c9-20261104
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1763910981; Wed, 04 Nov 2026 01:37:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 16:37:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 16:37:18 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<Yt.Hsieh@mediatek.com>, Zexin Wang <ot_zexin.wang@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] watchdog: sbsa_gwdt: Limit the MediaTek WS0 race workaround to revision 0
Date: Wed, 4 Nov 2026 16:37:02 +0800
Message-ID: <20261104083714.3026535-1-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_003727_513411_5412E196 
X-CRM114-Status: GOOD (  11.63  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The WS0 race workaround is currently enabled for all MediaTek SBSA
Generic Watchdog revisions in single-stage mode. However, only
revision 0 is affected by the race condition.

Read the revision field from W_IIDR and enable the workaround only for
MediaTek watchdogs with revision 0 in single-stage mode. This avoids
unnecessarily restricting the minimum timeout and adjusting the
keepalive interval on unaffected revisions.

Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
---
 drivers/watchdog/sbsa_gwdt.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 3c5bfd8641c6..eb79c8049f95 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -71,12 +71,16 @@
 #define SBSA_GWDT_WCS_WS0	BIT(1)
 #define SBSA_GWDT_WCS_WS1	BIT(2)
 
-#define SBSA_GWDT_VERSION_MASK  GENMASK(3, 0)
-#define SBSA_GWDT_VERSION_SHIFT 16
+#define SBSA_GWDT_VERSION_MASK		GENMASK(3, 0)
+#define SBSA_GWDT_VERSION_SHIFT		16
 
-#define SBSA_GWDT_IMPL_MASK	GENMASK(11, 0)
-#define SBSA_GWDT_IMPL_SHIFT	0
-#define SBSA_GWDT_IMPL_MEDIATEK	0x426
+#define SBSA_GWDT_REVISION_MASK		GENMASK(3, 0)
+#define SBSA_GWDT_REVISION_SHIFT	12
+#define SBSA_GWDT_REV_RACE_WA		0x0
+
+#define SBSA_GWDT_IMPL_MASK			GENMASK(11, 0)
+#define SBSA_GWDT_IMPL_SHIFT		0
+#define SBSA_GWDT_IMPL_MEDIATEK		0x426
 
 /**
  * struct sbsa_gwdt - Internal representation of the SBSA GWDT
@@ -238,15 +242,17 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
 static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
 {
 	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
-	int iidr, ver, impl;
+	int iidr, ver, rev, impl;
 
 	iidr = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
 	ver = (iidr >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
+	rev = (iidr >> SBSA_GWDT_REVISION_SHIFT) & SBSA_GWDT_REVISION_MASK;
 	impl = (iidr >> SBSA_GWDT_IMPL_SHIFT) & SBSA_GWDT_IMPL_MASK;
 
 	gwdt->version = ver;
 	gwdt->need_ws0_race_workaround =
-		!action && (impl == SBSA_GWDT_IMPL_MEDIATEK);
+		!action && (impl == SBSA_GWDT_IMPL_MEDIATEK) &&
+		(rev == SBSA_GWDT_REV_RACE_WA);
 }
 
 static int sbsa_gwdt_start(struct watchdog_device *wdd)
-- 
2.45.2


