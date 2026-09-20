Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B71DC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIvcTPFYE3aQ9Nymg3YXBN3gmsQHf70bigE3TOQ8foc=; b=dvBphWRFoGoq/7t/ZFcJEcxWIG
	2nvYCctfwjfmMBBCTGqiVsQyFq3OPBkcJS4Ux/Yj9A19M38wtxXL8NkXbbxmp1L74D4oxiVv7136g
	SgdHgvbGmq81aPPrMFHaIoHkertWymbQofOy2ck2R1PigEKPFgDu379htJ+Jtgvl+DVR3zhxwKeSu
	TNtevS/tXb6F0bHpujLrj8FiFUNgszSLp524TieHQNfD6n9fysC9X675mUVPyHwM5Sl3tj4+Tfmd7
	O9kv+xOI7ggce7qxUBkAJShCBzLhB00QtwLoBgctjeikELKHSuapzZ9RZvodqGAVtO6wJkYgyXFTT
	U+LTQl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88On-0000000GowI-2NP3;
	Sun, 20 Sep 2026 03:39:29 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Oj-0000000Gotv-0xeG;
	Sun, 20 Sep 2026 03:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RI
	vcTPFYE3aQ9Nymg3YXBN3gmsQHf70bigE3TOQ8foc=; b=DvI0d0lEKat1le90R+
	2fDnn4bjph2PG9JOkoD5t/U6s1AvDc7ieGZC47UdVEzgFF5PWCycMNrHH3Nw+GTq
	G8ddSBeqsX8mKqQh3b25Q4aD+aBFSGc1uT9seQzEYFnnXhGZRxEWcbog0bIP2C/j
	ov0Ro68xyEZaeCD9dPJM9Nh/Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBnL+9RVa9qow10Bg--.3374S2;
	Sun, 20 Sep 2026 11:38:58 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sam.shih@mediatek.com,
	daniel@makrotopia.org,
	hppiscas@163.com
Subject: [PATCH v2] clk: mediatek: mt7988-apmixed: publish the OF module alias
Date: Sun, 20 Sep 2026 11:38:56 +0800
Message-ID: <20260920033856.14518-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnL+9RVa9qow10Bg--.3374S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWDuF13XFyDurykGw1UGFg_yoW8Xr1DpF
	WktryUCFW5tw4fKFWxC3Z3ua4akan3ua4rGr13Xw1UZas0vFWxtFyFya4qgw1UArW5G34x
	tr12grWxAr4rJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zitrchUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hPvuGqvVVOPTQAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_203925_620815_EA3E74D2 
X-CRM114-Status: GOOD (  10.36  )
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

COMMON_CLK_MT7988 permits a module build, and the apmixed driver matches
mediatek,mt7988-apmixedsys through its OF table. The table is not
exported, so the module does not publish the corresponding autoload
alias.

Add MODULE_DEVICE_TABLE() for that existing table.

The issue was found by our static-analysis tool.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260905133417.64373-1-hppiscas@163.com/
Use the full author name in the submission identity; retain the code
reviewed by Daniel.

 drivers/clk/mediatek/clk-mt7988-apmixed.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 416a4b88d100..24f4e7b87a31 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
 	{ .compatible = "mediatek,mt7988-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
 {

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)


