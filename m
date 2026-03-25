Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C85FEA802
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lgdfkt1aEAJFnLfBpu4pkO5ZuUB0UdVAmLAs6to9Vp4=; b=BMi+wpFAJkT9SSIpY20J0yzNJd
	JB689kNzKcm686Va5AA/ATgzZb45Sc/dBpY0brK/fk1rQYdhtiHqa2wjSwFU15Pjy/JBYlQWLr6/o
	BGHuIc5O5hfEGZy28XzAZXjjdzboyeyHrUn4syDA5+1JTdU3tF+PJQUrwgR8ItNmTEaofgz1F1RQW
	5GrzzVu/EG5I4wJF6q9hbvRLsygJmFP07W3y+PfyF3djZpZECqD7fExLMu+PB+lW9x67T08hIAeET
	BowvPYKSINyQhldjTaRcB0Spx9LEeJrJ9b5A1H712Ss8deuWcwgnvBl9HX8XVpWNgQZmeIlWD63r6
	rxUnTslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EmE-00000002aXn-0Nnu;
	Wed, 25 Mar 2026 03:19:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Em4-00000002aRN-2aGl;
	Wed, 25 Mar 2026 03:19:17 +0000
X-UUID: 62c4fe5c27f911f19e7563141e833ce8-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lgdfkt1aEAJFnLfBpu4pkO5ZuUB0UdVAmLAs6to9Vp4=;
	b=ICiN7CSNqyGAAUi2KfR8ARIOEX6WHU6C6RLkhNL80dAZQIeecWCXn3uZ6ZRqDeUgVJ50io01pffzfuF9ssG+Xwi0A1PosCq5cuFnMzOCwzIHBrB/vLHYgYRJFSAW5DDoivhQxxnZtvOfKg0ZNeovwTv24xXOIAv8CxjKaNaqlVg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d8b32d30-de78-497d-a456-c54d02db8a08,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:38cba98e-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62c4fe5c27f911f19e7563141e833ce8-20260324
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1967637238; Tue, 24 Mar 2026 20:19:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:19:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 11:19:05 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH 0/2] Add nor dt-bindings new clock and modify driver.
Date: Wed, 25 Mar 2026 11:18:53 +0800
Message-ID: <20260325031900.2099969-1-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_201916_658796_0FB00172 
X-CRM114-Status: UNSURE (   7.66  )
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

Changs in v2:
 -Modify bindings/spi/mediatek,spi-mtk-nor.yaml,add new clock.
 -Modify nor driver new clock gate need to be added.

Meiker Gao (2):
  dt-bindings: spi: Fix clock-names definition
  spi: spi-mtk-nor: add new clock support

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |  7 ++-
 drivers/spi/spi-mtk-nor.c                     | 48 ++++++++++++-------
 2 files changed, 37 insertions(+), 18 deletions(-)

-- 
2.45.2


