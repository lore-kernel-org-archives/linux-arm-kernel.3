Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA7606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cuJ/oj+r;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=T5v6jubQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NP2Sc9QfAH27QKUaoXkjp0qHnyNnKKBhYsb0OsmWbM=; b=cuJ/oj+rBZqhFlpsQSmcGK5iPz
	C+SiFJvyT7bIDpZuSDHnQrgaShnADSh5fFCDd3Iy5qvCW/wZmwot68wlpCPtp3Vq4wFis5B6Yh6m9
	MCaOjETDqTFPYfb3D+kdu6k1+mOo63LzxJEK5aC3brRkk/My+LSW0htVIYxotZYfvT7mJ2GHjvbQG
	pD0j9ykXSKcL0Ch3lHFOMHt/eVITbHAPClYJUb2RxfpKKo4a0F2/2YyUNsriLVa8FqaAcVZg2e9HW
	NyCCbDb7dQjNvHVjibH/RKQeSJjOb49DFAFMM7Y2UIq7bpyPLbgaWC54NLj5KtYx0tycprKAPGqgU
	AS6gmWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3c0-00000008x5t-11IB;
	Tue, 20 Oct 2026 06:46:16 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3bv-00000008x3j-3lYV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:46:14 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261020064605epoutp03ddee72d112aef9ebadfbbf394803f0cf~gKfC3eQHR3249432494epoutp03X
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:46:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261020064605epoutp03ddee72d112aef9ebadfbbf394803f0cf~gKfC3eQHR3249432494epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478765;
	bh=+NP2Sc9QfAH27QKUaoXkjp0qHnyNnKKBhYsb0OsmWbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5v6jubQGzQRG7yKQZxGlVS2Jt2bKRFkKRmj/cuR0fiW206MlZ0+lU8xkFOAdMvt9
	 v1gOp2rxL2H72YKeO5BMXh0SEPUgUkfBP5MIumi30rKWb9mMDvat8juCY7GARlt9Wk
	 gWpuMya/UdySkVdNF1RR6CuZd5qzDq1sod+4DPzA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020064605epcas5p19592347b004bc7738bdaaefeb2acc084~gKfCdk5_b3226632266epcas5p1C;
	Tue, 20 Oct 2026 06:46:05 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j82xS36vyz2SSKq; Tue, 20 Oct
	2026 06:46:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882~gKYOCYwVC0054500545epcas5p4G;
	Tue, 20 Oct 2026 06:38:16 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063813epsmtip10952631de719c793aedee8998c965985~gKYLNry0-0259902599epsmtip1W;
	Tue, 20 Oct 2026 06:38:13 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 06/14] clk: samsung: clk-pll: Add support for pll_4313
Date: Tue, 20 Oct 2026 12:25:50 +0530
Message-Id: <20261020065558.1829402-7-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_234612_260524_60DD815D 
X-CRM114-Status: GOOD (  18.21  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alim Akhtar <alim.akhtar@samsung.com>

PLLs 4313 are found in the Exynos8855 SoC and it is similar
to pll_531x except for CON8 offset, so re-using code for
pll_4313

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 3d837bd74355..7b0756127306 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
 	u64 mdiv, fout = parent_rate;
 
 	pll_con0 = readl_relaxed(pll->con_reg);
-	pll_con8 = readl_relaxed(pll->con_reg + 20);
+	if (pll->type == pll_4313) {
+		/* Offset for PLL_CON8 which hold FDIV different for PLL_4313
+		 * which is PLL_LOCKTIME_OFFSET - 0x4
+		 */
+		pll_con8 = readl_relaxed(pll->lock_reg - 4);
+	} else {
+		pll_con8 = readl_relaxed(pll->con_reg + 20);
+	}
+
 	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
 	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
 	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
@@ -1729,6 +1737,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_309:
 	case pll_531x:
 	case pll_4311:
+	case pll_4313:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	case pll_1031x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 2457cf47c109..4825e1f5b9db 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -49,6 +49,7 @@ enum samsung_pll_type {
 	pll_0718x,
 	pll_0732x,
 	pll_4311,
+	pll_4313,
 	pll_1017x,
 	pll_1031x,
 	pll_a9fracm,
-- 
2.34.1


