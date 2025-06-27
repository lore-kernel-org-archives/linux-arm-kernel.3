Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9876CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jreIx6PtT6w4BeFa0dDuav4vW2DugASqzYf5r6DK060=; b=Rt778ZNUmpm46CMY1zMv6kK5W9
	/oUKuRB9wKDjr+c5uASenknsauxhxqWeIb80mEnp4Pjbm27UOvxRDGqbAXb2YIqvxaV0GYTMPbFRb
	Cr/KpwCdOh4I7qp5gUeE+Ue5L1EEa10IZHp1u2cE2LQ253anvnBnWabueQkLpBZt1ZILFVEwvY1WX
	UyZmu3XW9SyXCeCEChtXcX13xvuzmh5CmkydKAYmSCOad/JhhlA34qzKepSUSjDtuGvHzJ/ToLxSq
	DUEp28jrH9elHUw1+1lU0e2Ubz/LLGuMLG1x4MIKIbDKq/tVNp8aObtpfIJw9TJJ23N9uY+rSnsqI
	y8OrB7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6ib-0000000EMs2-2Lsi;
	Fri, 27 Jun 2025 10:54:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5dS-0000000E9QZ-2PdI;
	Fri, 27 Jun 2025 09:44:43 +0000
X-UUID: 56ad7b82533b11f09eb0dd999d3936bf-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jreIx6PtT6w4BeFa0dDuav4vW2DugASqzYf5r6DK060=;
	b=U57TunGZD5Y2k+AvAiTKcyNyrC/krbuxptVD+XTIEfT5iFEcIe7Z74u4kP7o8Fo9F2kD/KQF4QID5rIHJxDF/Tf/FMkP7O5q89iiLmYRw3sw08i0b9nuznB+T/L0pJgplDg8W4jC6zg7602ERUi8aQNqdZUhFAsacuFxtYN9mkk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:c3820e30-f935-471d-a6f5-41a915cb1aa7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:224ea273-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 56ad7b82533b11f09eb0dd999d3936bf-20250627
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770681319; Fri, 27 Jun 2025 02:44:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 17:44:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 17:44:32 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Zexin Wang <ot_zexin.wang@mediatek.com>
Subject: [PATCH 0/2] watchdog: mediatek: Add compatible for MT8189
Date: Fri, 27 Jun 2025 17:44:18 +0800
Message-ID: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_024442_618364_983628E4 
X-CRM114-Status: UNSURE (   9.26  )
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

This patch series introduces support for the MT8189 watchdog driver
by add compatible.

Zexin Wang (2):
  watchdog: mediatek: Add compatible for MT8189
  dt-bindings: watchdog: mediatek: Add support for MT8189

 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 drivers/watchdog/mtk_wdt.c                                       | 1 +
 2 files changed, 2 insertions(+)

-- 
2.45.2


