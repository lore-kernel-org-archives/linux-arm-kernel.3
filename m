Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477E2E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 22:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSJe5G8mVw+IN5YG9KG5pI7+KI7yc1CFdLZ3B95MpSA=; b=ZmWioTLTuVwasP7UiXOPvzT/G1
	3C6uP77r1M5dmWADJhJads2FwxMmHxRbvuJVRdoH1W06F1GeVyuPgdrKIqjsrvaBB/wjiU3B5AlE0
	uqHOToaVk++Ga68Fg27uHHtqJ4EFTiOZsQZXienz2m9YybQ8hnOibNduAkihOcHyfL5rPrI/KhtG3
	VmgSvGFyplbQ2WVI458Am9bIrtFkQY9YCkUGyjhYCD8EpNLArmo3a0ZAILUkfMO2BE0GoIoP/1gw3
	GA4BoO1gls41QWjDqT9CObNGyYKThJflWToHIqOcAZyyTQqIVVnI7en8eBX/q6LeeYxiHW+Zh3R5q
	u70lEKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwwW-00000008Yem-1WJZ;
	Sun, 15 Dec 2024 22:18:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwss-00000008Y8t-2ffk;
	Sun, 15 Dec 2024 22:14:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tMwso-000000002sF-15x3;
	Sun, 15 Dec 2024 22:14:38 +0000
Date: Sun, 15 Dec 2024 22:14:34 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Golle <daniel@makrotopia.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	John Crispin <john@phrozen.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH 4/5] clk: mediatek: mt2701-mm: add missing dummy clk
Message-ID: <9de23440fcba1ffef9e77d58c9f505105e57a250.1734300668.git.daniel@makrotopia.org>
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_141442_671502_1CBD90AA 
X-CRM114-Status: UNSURE (   8.22  )
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

Add dummy clk which was missed during the conversion to
mtk_clk_pdev_probe() and is required for the existing DT bindings to
keep working.

Fixes: 65c10c50c9c7 ("clk: mediatek: Migrate to mtk_clk_pdev_probe() for multimedia clocks")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt2701-mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
index bc68fa718878..474d87d62e83 100644
--- a/drivers/clk/mediatek/clk-mt2701-mm.c
+++ b/drivers/clk/mediatek/clk-mt2701-mm.c
@@ -31,6 +31,7 @@ static const struct mtk_gate_regs disp1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &disp1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mm_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mm_dummy"),
 	GATE_DISP0(CLK_MM_SMI_COMMON, "mm_smi_comm", "mm_sel", 0),
 	GATE_DISP0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
 	GATE_DISP0(CLK_MM_CMDQ, "mm_cmdq", "mm_sel", 2),
-- 
2.47.1

