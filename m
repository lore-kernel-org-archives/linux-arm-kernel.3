Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CD3FEA803
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 04:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ejEhStdJVkaQdrxX1r/SaODVVa3XH11oPyK5ntd+5k=; b=gpq9O3ySqR+3yaWyeZRg1pH0+I
	DmMpLzyDpLZYle3g0N+UdamncIGJEoTHXP+2Zp8dLDgSVRYAKbuhe77xrEbuVTRPlGZRIWigAg29j
	6DoDYel/iGMmSo8SaX1I3ceLn7FB7Eu7MQPL9PSJ7+0YqAaPNLshfTIQYTs+qjcluzekryDTLwnUN
	lxk9emCnzw8Tl8EguhRZ/L/NDyxjI9yDTLGbZMlhOoJU0ACMx8AKqKwcic2RnIDSangE4gdmadh62
	0J8n3xJ3B91IrEpGnSp0A76aQuES3CoOapvg5gSPX/DS4EqN+055qAFJ2NtPnojlrRXh9AFZZ38O4
	r1Jefn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FUP-00000002e3s-2emy;
	Wed, 25 Mar 2026 04:05:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FUN-00000002e3F-3iMj;
	Wed, 25 Mar 2026 04:05:05 +0000
X-UUID: cb323c1027ff11f1a6de359d7043e138-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1ejEhStdJVkaQdrxX1r/SaODVVa3XH11oPyK5ntd+5k=;
	b=jPCkH/+1/gi7Y0csf5L6wRAjCi3kRha05UuxITueNlRYx9Yd3sHRQLFMBTNuhUqOzs3Uu4u5oGeVa/i1b2pRDF0lKplKNBEMHNDug/H0fB5JpIDA4jHkXtIxidrw60WUiTYNhEF7CJX1CEMt5EA20qEU+TBCTEPTkPWasNNWNLo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7e9b2659-b68a-4e62-bb0c-a2a1bc551756,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:274c1ad5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cb323c1027ff11f1a6de359d7043e138-20260324
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 119969236; Tue, 24 Mar 2026 21:05:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:04:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 12:04:57 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 0/3] Remove deprecated CMDQ APIs (series 4/4)
Date: Wed, 25 Mar 2026 12:04:19 +0800
Message-ID: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_210503_935210_4215A515 
X-CRM114-Status: UNSURE (   9.12  )
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

This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
CMDQ APIs introduced for MT8196.

Series application order:
  1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this series)
    - https://lore.kernel.org/all/20260325035836.2110757-1-jason-jh.lin@mediatek.com/
  2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
    - https://lore.kernel.org/all/20260325040239.2112517-1-jason-jh.lin@mediatek.com/
  3. [Series V2 4/4] Remove deprecated CMDQ APIs

Please apply this series after the MT8196 GCE support series,
and before the following series.

---

Change in v2:
1. Rebase on linux-next 20260324

---

Jason-JH Lin (3):
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

 drivers/mailbox/mtk-cmdq-mailbox.c       |  8 ---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 49 +++++++-----------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 12 -----
 include/linux/soc/mediatek/mtk-cmdq.h    | 65 ------------------------
 4 files changed, 18 insertions(+), 116 deletions(-)

-- 
2.43.0


