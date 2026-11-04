Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD5E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sK/ma1+M;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lc7jVIpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IWWmL06wb90kr9ZgafGX5jq8f7GYOPQUZd6qyaBYJyM=; b=sK/ma1+MLoGQSeOLEMSq2+Ren0
	QtVa7DOoBBvkn8o8MmkCfz9/Q0OBrVFK660QhQQCzZsOBy1h9HIbaAlI35Xdc6hTjii/m7RYhewP8
	XsvKxodxXDqlRXJblwGhZMNeXkoq5aEtzMHwtUhTnXx6F+IBLytMfI+m3r4MDDSkuL7kxhFrIW6fx
	6YWgMpx9jSqwGuZjFjQ9XlkFkBZiVO9XXOc4MfT5xTs1QYf39+ftQr6pg4ChCYircxMnQggY9kbIq
	piyxMHzuCh132f3WZoTL9uXcKm2Gh86gpHa1MtZLqO4bkGfJTU92NsB8BjOcn0j34gkGebvbYoOpm
	r9kgiJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQuv-00000004B3c-1dby;
	Wed, 04 Nov 2026 02:40:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQut-00000004B29-0XqE;
	Wed, 04 Nov 2026 02:40:00 +0000
X-UUID: 022b9852d7f911f1acbe4559397dec65-20261103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IWWmL06wb90kr9ZgafGX5jq8f7GYOPQUZd6qyaBYJyM=;
	b=lc7jVIpRwI3Y4Qyrjy/KO8B93DxURKufihYqGrlipjzkuJ+sA9rPjCmwAHv8ZUhmk2gOavR4MxZF1IVw9KHfiLkqQZ+D0c9RvoMdIQ0OWWMljcnX+LPWfRD2Xyi7c2Ip4b9WuIk7BYiLVx4UHUodYFGO6INUkYht0smF0alIfxs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5fb194e8-c0d4-49d3-8d85-d7205c206bb7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:1694e401-2558-43e9-8f0b-3d83d8900872,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 022b9852d7f911f1acbe4559397dec65-20261103
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1370923905; Tue, 03 Nov 2026 19:39:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 10:39:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 10:39:48 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH RESEND] soc: mediatek: mtk-regulator-coupler: Allow building as a module
Date: Wed, 4 Nov 2026 10:38:29 +0800
Message-ID: <20261104023941.1687840-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_183959_197117_6FDA0ACE 
X-CRM114-Status: GOOD (  14.66  )
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

MTK_REGULATOR_COUPLER is a bool whose prompt is only visible when
COMPILE_TEST is set, so on real MediaTek configurations the symbol has
no prompt at all and is forced to its default: it can only ever be
built in.

Turn it into a visible tristate so that the coupler can also be built
as a loadable module, which is what kernels shipping most of their
drivers as modules need. The "default ARCH_MEDIATEK" is kept, so
existing configurations keep building it in.

While at it, add the help text that the now user-visible prompt was
missing.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
Resend, now that the dependency is in mainline: this was patch 2/2 of

  https://lore.kernel.org/all/20260903062056.1024263-3-justin.yeh@mediatek.com/

and patch 1/2 ("regulator: core: Export helpers used by regulator
couplers") was merged as commit 59951bd9c6b6 ("regulator: core: Export
helpers used by regulator couplers") and is in v7.4-rc1. The diff is
unchanged; it is resent on top of v7.4-rc1 as a standalone patch, as
AngeloGioacchino asked.

 drivers/soc/mediatek/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..4a2f2bccc213 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -56,9 +56,13 @@ config MTK_PMIC_WRAP
 	  hardware to connect the PMIC.
 
 config MTK_REGULATOR_COUPLER
-	bool "MediaTek SoC Regulator Coupler" if COMPILE_TEST
+	tristate "MediaTek SoC Regulator Coupler"
 	default ARCH_MEDIATEK
 	depends on REGULATOR
+	help
+	  Say yes here to add support for the MediaTek regulator coupler,
+	  which keeps the GPU supply and its coupled GPU SRAM supply
+	  voltage-balanced on the MediaTek SoCs that need it.
 
 config MTK_MMSYS
 	tristate "MediaTek MMSYS Support"
-- 
2.45.2


