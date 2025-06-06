Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CB5C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pNOyorkB3HZlcrxopesU0XyVrnCs6l41UrPOdX2uDUA=; b=LkcfvHG0Sz38TOl+dfS/z9SNnv
	SkAGzGMVMI9SpRhyDTp1bjGhh3cSQJyBAqOm5dNmrB10Uj/5M21J6yplJjMR+rVKTZjEzhS6BWgsX
	uTN+MK375U4npAFnEKwWpo4GcZPRV5ED/8W3THRQK8tJZqPG33wCJ9Mifuql4n1LHhL2A9il1FKsD
	PjROTiMEr0VT0jpRtkfXdG7WDKt38VbTQT6QgTRz31c4syT3xXpq3m2DUJ9/f9PIdk16lC3iYC7Z0
	1rG+YW5RxjxBcmhh5CIBYH2KeVHUHvXcnpQ5GoYbGnDotNTkwUXBM8d3PkqelZclZCSd9PEMVhZlU
	uQhnHLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWw5-00000000Jya-3WqK;
	Fri, 06 Jun 2025 13:16:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWtx-00000000JeW-2s6F;
	Fri, 06 Jun 2025 13:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749215667;
	bh=3NJ+PTFh2Yn3x9J4tEZnxKh27qQe+KeBRZhOB8aY1vI=;
	h=From:Date:Subject:To:Cc:From;
	b=oWPYnJJwa0UyYbR7t6WBXfzzghJ5KN4dDQf0bO7BmlrLmDt14Q5dxUpKutfdfFb6I
	 epijd68Du6aRYLqhaEL7IeBds/ozteeemEYTiMdeBjmbf7MQGOhZbO6qUQSmqi45UD
	 gEGQ4rIAtKQAjWfQ+wI2HYB+nDsqn+EFnD93PWfKbdyzDmq1nPc5nh6T54f8xIP41T
	 3i7+fdDXDMNlYNQfAOnvlma0hjWawzUf+y0NrPYs+MZjQUhkQEuxXOFTwavaiBdvCh
	 1alX+gi+SdZpxByG+xQYXGI9r5sZU8cgE7jUrUjJdGz0tNSkcqmSIcCT9Xys30slz0
	 Tqj9DcuVxKQjg==
Received: from [192.168.1.63] (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DF417E0156;
	Fri,  6 Jun 2025 15:14:25 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 06 Jun 2025 09:14:22 -0400
Subject: [PATCH] media: platform: mtk-mdp3: Add missing MT8188 compatible
 to comp_dt_ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-mt8188-mdp-regression-comp-compat-fix-v1-1-e68772d7a3aa@collabora.com>
X-B4-Tracking: v=1; b=H4sIAK3pQmgC/x2NSwqEMBBEryK9noZEyUevMriQpCfTi2joyDAg3
 t3opuAVvKoDKglThak7QOjHlbe1gX51EL7Lmgg5NoZe9UZZZTHvXnuPORYUSkL1NjBsuTyx7Pj
 hPzprfIjWDaPR0LaKUKufn/d8nhe7LEwbdwAAAA==
X-Change-ID: 20250606-mt8188-mdp-regression-comp-compat-fix-7658cd673951
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_061429_899733_D7231438 
X-CRM114-Status: GOOD (  10.22  )
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

Commit 4a81656c8eaa ("arm64: dts: mediatek: mt8188: Address binding
warnings for MDP3 nodes") caused a regression on the MDP functionality
when it removed the MT8195 compatibles from the MDP3 nodes, since the
MT8188 compatible was not yet listed as a possible MDP component
compatible in mdp_comp_dt_ids. This resulted in an empty output
bitstream when using the MDP from userspace, as well as the following
errors:

  mtk-mdp3 14001000.dma-controller: Uninit component inner id 4
  mtk-mdp3 14001000.dma-controller: mdp_path_ctx_init error 0
  mtk-mdp3 14001000.dma-controller: CMDQ sendtask failed: -22

Add the missing compatible to the array to restore functionality.

Fixes: 4a81656c8eaa ("arm64: dts: mediatek: mt8188: Address binding warnings for MDP3 nodes")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 683c066ed97586a187f7d30191ba0f6c99c83371..7fcb2fbdd64eea18ca0c7e4600bb1f601cf8725e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -1530,6 +1530,9 @@ static const struct of_device_id mdp_comp_dt_ids[] __maybe_unused = {
 	}, {
 		.compatible = "mediatek,mt8195-mdp3-tcc",
 		.data = (void *)MDP_COMP_TYPE_TCC,
+	}, {
+		.compatible = "mediatek,mt8188-mdp3-rdma",
+		.data = (void *)MDP_COMP_TYPE_RDMA,
 	},
 	{}
 };

---
base-commit: 475c850a7fdd0915b856173186d5922899d65686
change-id: 20250606-mt8188-mdp-regression-comp-compat-fix-7658cd673951

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


