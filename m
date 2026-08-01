Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7DC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R2OWFuvWJZb2qYdXdzCQzd8OjIRnCGpSuszfCnMt9g=; b=uPmBLUBX+Azjbn3+iR3YvZw1am
	T8FakGZ39P5Gb1sxfLtd/NKKWid3knW/PLrMXcw6qPqDuk/BPcQ6Qe5r/TYXQEXuKfsUZy8RUtv87
	1fZQ2+YSFEKKpFuTWKWhxsusSA2764b6Img6wGjaLAyQbqtsjpql/s+Mf0MH4zFU+1qc4Z1FroHuc
	4D1A7Kgum2F/kz5naSBuWV7MR/3RA/zGNyW9r3y1ObQE6TNGX4Ivkoqmt1imnjlTiSN3qrId229sl
	wFTkwdIMcGGq5vJc1QwNFSRES9xCJAGITH0LMxwZB0gFyMt1diqSXlQdQ5IHJhCZFgPQYpnOnpSHU
	Ltt9Y0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mo-0000000EE25-0dLr;
	Sat, 01 Aug 2026 11:21:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7ma-0000000EDSP-0lRl;
	Sat, 01 Aug 2026 11:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8R2OWFuvWJZb2qYdXdzCQzd8OjIRnCGpSuszfCnMt9g=; b=DWjEhoXf+5UULr0zxe1AlOclf4
	PKYYiFCpi5gqEqM1rtmP3AdHCtU72erPcJuFgZpTl38JxHvsViXOScWiIf8fTXvWGN6zOubSjJrvB
	6tIy3603BKbZUWSElQqv+xTOiNp6d7tIhnTPWtLOO5BZTDKXr65ju9D2d7TiYCTPXI2lkhF8VXGB8
	mwIajtE6DeGgycXxUrR6C3/f+o4G3fjctgQNBLM1UyOqXgiUyetoKEPcINAA8XY9g6TnhjLLjgkAt
	I5nND7yjVesjEsJv4gywviU8D2PRSxLoBz2wcpQCvt7UIABG80bA6OS7rAQFXuTyq0lq9cpLmu7k3
	e2dgXnaQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wq7mW-000000081MU-2iB3;
	Sat, 01 Aug 2026 11:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785583276;
	bh=NoFwu2xld36Y84LtysJW9LuSu41fCdVWpVU4but4BcM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aptucHBgegXh7JMJkh4TQuFwq6PoM4iZfl8PiDs7ht/EXN6kyGJnARpp+1qY+095b
	 q7EJTeiBJntVEU6kS5lARE3S1JH8W2qeT3IxVdlN6wfp4RRlwjtS34SrtkIeFTHVFe
	 IZMD+XGDixH5mN+BsUiXcnqLnNa5hTPq0RjqUgjJ7F09fxfAHZhdwIc/5ZtXuZOCnq
	 37qgRfPCE87jNN6rSurW8K0qeFvcYsbL/wYOkGcz2O0RZj4f6z+QjZ7T3y54EI86/f
	 QtF+72Qh6EvpTBt9Si3xDR7SoGFt2SB5Ohl+jFg+ICJ3+7lJLvCDm1HCU13bmwmrEk
	 oh+nGq5mNI/4Q==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F06AA17E015B;
	Sat, 01 Aug 2026 13:21:14 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Sat, 01 Aug 2026 13:20:57 +0200
Subject: [PATCH v5 11/25] clk: mediatek: pll: Factorise pll power on/off
 sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-mt8189-clocks-system-base-v5-11-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785583260; l=2013;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=NoFwu2xld36Y84LtysJW9LuSu41fCdVWpVU4but4BcM=;
 b=cgHTWWvxRccS6fe8+EUY7eNiO1kYUcF5l9jWikSXBtIAvfoOyfdRlhq/lVqwgOoJiky2P2zby
 fiiiSsLknqmDYjBqJzSXDFuGmnJhmhinRlMSwSHvoSPKLMni/p3EEx5
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_122132_920874_9E30775C 
X-CRM114-Status: GOOD (  10.35  )
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

In order to prepare the MT8189 SoC support, that requires different
registers to control PLL status and perform reset BAR, and so a
different sets of clock operations, split the pll power on and off
sequences from mtk_pll_prepare/unprepare functions into private
subfunctions.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 4b0f7e2bfc5a..2aaf2871ecf6 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -223,9 +223,8 @@ int mtk_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	return 0;
 }
 
-int mtk_pll_prepare(struct clk_hw *hw)
+static void mtk_pll_power_on(struct mtk_clk_pll *pll)
 {
-	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
 
 	r = readl(pll->pwr_addr) | CON0_PWR_ON;
@@ -235,6 +234,25 @@ int mtk_pll_prepare(struct clk_hw *hw)
 	r = readl(pll->pwr_addr) & ~CON0_ISO_EN;
 	writel(r, pll->pwr_addr);
 	udelay(1);
+}
+
+static void mtk_pll_power_off(struct mtk_clk_pll *pll)
+{
+	u32 r;
+
+	r = readl(pll->pwr_addr) | CON0_ISO_EN;
+	writel(r, pll->pwr_addr);
+
+	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
+	writel(r, pll->pwr_addr);
+}
+
+int mtk_pll_prepare(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 r;
+
+	mtk_pll_power_on(pll);
 
 	r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
 	writel(r, pll->en_addr);
@@ -278,11 +296,7 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
 	writel(r, pll->en_addr);
 
-	r = readl(pll->pwr_addr) | CON0_ISO_EN;
-	writel(r, pll->pwr_addr);
-
-	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
-	writel(r, pll->pwr_addr);
+	mtk_pll_power_off(pll);
 }
 
 static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)

-- 
2.55.0


