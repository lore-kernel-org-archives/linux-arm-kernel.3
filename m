Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA3EF532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fTb3ytmu88frSKY6/byD6L0sRJa4aARZkpJoC5b6WIc=; b=jAGS57AdZ+STIrk3CF2gLNXoxN
	88xxPGql+UMXT7798q6OlZ4U4USh49lhnPNBK4heSB2yeKtLEI3wzPppss16RQuJ4pRjCeGgcHMca
	K+qPCpmTpmQc/2LXsVS7wnxV5eKJSqjm3W4P0Ky7LGDV0/RGqjvPfl9iC1g5oIt8ZT747OiDfSA2v
	ctJF3PkS58fqxs1X9MN2TVwzAw3KBk1vGc6gxB9EnM1iFrq38pzd+j5ERCD09K3lR6QBedBanawXg
	SGwudy3jG2O+MT552wdVOOvtCpDBqII2XdFbiAccIU5GEClD8Fdwwh2zZ0pqH3VK+ArMd+yXtUtFf
	5twtLpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vUx-00000000o8T-3ZsA;
	Tue, 24 Mar 2026 06:44:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vUr-00000000o3g-2pKF;
	Tue, 24 Mar 2026 06:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fTb3ytmu88frSKY6/byD6L0sRJa4aARZkpJoC5b6WIc=; b=ST4Aw1zm19MQpJOjO9vYvFHYSv
	IzxxiRggpv+NW82noDW2ozHrSvw9bX7Ukh9xPUN1oI+MfXq6wbpFE66v7GnWj7Xp4xVOmN+Ch5jJ+
	YP+LtD3klzNP9X6j1axwIPZtExdM6PhmqkO5xKew8CAlrACAl1sIVKqfNN5Y+IrfDymAH4Y0ceFZw
	mvlVtDlJR+XdDt8UnorvtFS69hR1JxivK23LNBjNnucHoE0qRVPOrTAN9J9v+7ezv2kGaEzl2AHSt
	hD+fStFwAk9O38pPT2G18UpMs2vujNw5z/LZkaIVs8iqcqKmm84b1GfPMhOo3Evds6eidDDuNs/Es
	gsSEv8bg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vUo-0000000DZYC-0O9i;
	Tue, 24 Mar 2026 06:44:12 +0000
X-UUID: b3498ef6274a11f1a6de359d7043e138-20260323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fTb3ytmu88frSKY6/byD6L0sRJa4aARZkpJoC5b6WIc=;
	b=AfTtnAwEI2zGmScY2TDsf2XLDo+vUGmodU1psJm32DCifRDxvknzL8YQm2ffTyNR3XpMeIaWAurmTDTI07JBOykAU3+mhyEwQc+HlQwq9XNJAagK28mvfUFmML3RpqD04Zc8yDf6cTchWhz2IOjS3NmAGCIMO9Dnz418SDdOlmo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1ac21f9d-c946-4f6c-8b87-a54fb5e0a6a8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:89a210d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b3498ef6274a11f1a6de359d7043e138-20260323
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1771618246; Mon, 23 Mar 2026 23:28:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 14:28:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 14:28:38 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH 0/2] Add clock to dt-bindings and Modify nor driver.
Date: Tue, 24 Mar 2026 14:28:23 +0800
Message-ID: <20260324062835.1747943-1-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_064410_725715_FD74E6E3 
X-CRM114-Status: UNSURE (   8.80  )
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

This patch series refactors the clock management for the Mediatek SPI NOR driver,
making it more flexible and compatible with different platforms.

Patch 1 updates the device tree binding to support variable clock-names.
Patch 2 migrates the driver to use clk_bulk API and optimizes error handling.

Changes in v1:
  - dt-bindings add clock for mt8196.
  - Dynamically allocate clk_bulk_data array.
  - Simplify error handling.
  - Code cleanup and style improvements.

Meiker Gao (2):
  dt-bindings: spi: Fix clock-names definition
  [v3] spi: spi-mtk-nor: Modify and optimization the SNFC.

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |  6 ++++++
 drivers/spi/spi-mtk-nor.c                     | 19 ++++++++-----------
 2 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.45.2


