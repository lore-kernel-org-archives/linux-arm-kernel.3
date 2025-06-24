Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53EBC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyY5ljMskxr82K9O1ET7uOZmkbfKFJzswvv4yBYB6e4=; b=dtHJJzu8MTncrHT39ijIb8CCko
	94tMZaKlbWdpiMVL3k8N7onjiR0LGU9sSAUuwWNAL4sR0Ur6F9PQ0Pd1hWaPQVHJuQ5JVutLjXROg
	KCcLaP5iHCKeOA9JBTqlQPO6HgFv6muxpTER7jsVXD7t8s6hTyU9rFzYOIF7Opppvd0s/i8mkHPZ1
	r7cPfe5JaS9Ie7z5Z6yP3bhsJUZZePxci2JNW6v0xh2PByOzh67z9vlyaW3INjwGtO4fNqdcQ9xiQ
	MfoKRZc2N/+8L7sI6bnM9XL6sWUm3XZ4OGJtyB6eg7k8lRRcyYz74fEW9lwXaiknteYR+kzIMlf4o
	ci1BBE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6Iz-00000006FXy-20JA;
	Tue, 24 Jun 2025 16:15:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iU-00000005vZF-3YDb;
	Tue, 24 Jun 2025 14:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QyY5ljMskxr82K9O1ET7uOZmkbfKFJzswvv4yBYB6e4=; b=N0Pf0t6l02kOCEuJooowy5mNqJ
	sHDJa4/QdVSsGnYBEbazc6FuZWkZWaxQ6iNIQ6d7DgA1UkdRGzdZeLv/MImHbKO4p2FEY80HlNAc4
	8bXF4kki9tY6blVC7HWhN9MWGuT7mGTyEi/06DfIPrUiXMNbTzWrzacceOd57KCbJRV3AVxE+4FKW
	TGEGudGuVCqFGT4HvDRi+MtnBzFAVhwyxpP0lXJog0dmyontlaJsbBPNieBUhMQRydLHkRRqSAWWO
	x2fk1sjBGaKvoYLLRZERU/Nb8+E7Cy/LOXSwDrr2A7QvCNNzmjRxCfn6gBedocyYB28znwtvHddyy
	V4Bb19OA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iR-00000005SqU-0zJ5;
	Tue, 24 Jun 2025 14:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750775614;
	bh=geyhvCei0SmiCre+eQ4yT7bZiIXgjL7onCumLFW0naQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CaGzDM+owBuxvmUSDVSXybps672Xcu64e5UJ49vuKP6plwMyqWFF8ooBv1V/Q5U1t
	 MO1o8otGyz3jYp9l3fJIjs8mongjxzLlMr/BvbTgYqCSQX77dOTWu6OtgMzvR+Z1ma
	 qHeF8HYPHowk7e42P1aoM0JDDRPURSToExt4UieLcbgtPtSfW5TYgIpExlpBl24z8p
	 4o5IHbLDQ7UWLOzxVwnO/2RuzQ+hqtz+juXfWEj84vYTmvNjSY4InApCniCkbPi+FJ
	 kNMIhvE69WUspHQrAYgMt9pOJzAv3w0Ry9ABGtAf8QRBIf7V7sgOqqKbGZ2LOJeqLq
	 UOXkkp+1nwGJA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:d2c7:2075:2c3c:38e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04D4517E1067;
	Tue, 24 Jun 2025 16:33:32 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 02/29] clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and FENC
Date: Tue, 24 Jun 2025 16:31:53 +0200
Message-Id: <20250624143220.244549-3-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624143220.244549-1-laura.nao@collabora.com>
References: <20250624143220.244549-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_153339_485766_A95E5A0A 
X-CRM114-Status: GOOD (  15.16  )
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

MT8196 uses a combination of set/clr registers to control the PLL
enable state, along with a FENC bit to check the preparation status.
Add new set of PLL clock operations with support for set/clr enable and
FENC status logic.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 42 +++++++++++++++++++++++++++++++++-
 drivers/clk/mediatek/clk-pll.h |  5 ++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 49ca25dd5418..8f46de77f42d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -37,6 +37,13 @@ int mtk_pll_is_prepared(struct clk_hw *hw)
 	return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
 }
 
+static int mtk_pll_fenc_is_prepared(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	return readl(pll->fenc_addr) & pll->fenc_mask;
+}
+
 static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
 		u32 pcw, int postdiv)
 {
@@ -274,6 +281,25 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 }
 
+static int mtk_pll_prepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
+
+	/* Wait 20us after enable for the PLL to stabilize */
+	udelay(20);
+
+	return 0;
+}
+
+static void mtk_pll_unprepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	writel(BIT(pll->data->pll_en_bit), pll->en_clr_addr);
+}
+
 const struct clk_ops mtk_pll_ops = {
 	.is_prepared	= mtk_pll_is_prepared,
 	.prepare	= mtk_pll_prepare,
@@ -283,6 +309,16 @@ const struct clk_ops mtk_pll_ops = {
 	.set_rate	= mtk_pll_set_rate,
 };
 
+const struct clk_ops mtk_pll_fenc_clr_set_ops = {
+	.is_prepared	= mtk_pll_fenc_is_prepared,
+	.prepare	= mtk_pll_prepare_setclr,
+	.unprepare	= mtk_pll_unprepare_setclr,
+	.recalc_rate	= mtk_pll_recalc_rate,
+	.round_rate	= mtk_pll_round_rate,
+	.set_rate	= mtk_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(mtk_pll_fenc_clr_set_ops);
+
 struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 					const struct mtk_pll_data *data,
 					void __iomem *base,
@@ -315,6 +351,9 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 	pll->hw.init = &init;
 	pll->data = data;
 
+	pll->fenc_addr = base + data->fenc_sta_ofs;
+	pll->fenc_mask = BIT(data->fenc_sta_bit);
+
 	init.name = data->name;
 	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
 	init.ops = pll_ops;
@@ -337,12 +376,13 @@ struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 {
 	struct mtk_clk_pll *pll;
 	struct clk_hw *hw;
+	const struct clk_ops *pll_ops = data->ops ? data->ops : &mtk_pll_ops;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
 
-	hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
+	hw = mtk_clk_register_pll_ops(pll, data, base, pll_ops);
 	if (IS_ERR(hw))
 		kfree(pll);
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index c4d06bb11516..7fdc5267a2b5 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -29,6 +29,7 @@ struct mtk_pll_data {
 	u32 reg;
 	u32 pwr_reg;
 	u32 en_mask;
+	u32 fenc_sta_ofs;
 	u32 pd_reg;
 	u32 tuner_reg;
 	u32 tuner_en_reg;
@@ -51,6 +52,7 @@ struct mtk_pll_data {
 	u32 en_clr_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 	u8 pcw_chg_bit;
+	u8 fenc_sta_bit;
 };
 
 /*
@@ -72,6 +74,8 @@ struct mtk_clk_pll {
 	void __iomem	*en_addr;
 	void __iomem	*en_set_addr;
 	void __iomem	*en_clr_addr;
+	void __iomem	*fenc_addr;
+	u32		fenc_mask;
 	const struct mtk_pll_data *data;
 };
 
@@ -82,6 +86,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_hw_onecell_data *clk_data);
 
 extern const struct clk_ops mtk_pll_ops;
+extern const struct clk_ops mtk_pll_fenc_clr_set_ops;
 
 static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
 {
-- 
2.39.5


