Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79975CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=; b=efTzQ/1CQp4ujHmgUq0/mBh5z/
	V7ImTUT9uFLIDwR2k6xx7aFd4WE7ca1u1sA1HUM5+PA3CHwA9bhoEgmr19UEIlCWmYfqsZ/OgA9Tk
	Sn0vIj6FYRoDlJog2omf3FhUc/oPHr42MJIHwVMEyA8IGSG8gDknXXNV7hc8NbSdkkRGVTdcT12QM
	+4PVV1c5dQry1MenXQhfaU1Niih2ZfNuaazKhgt9s2I/dqUAvCIAvSDI62xH5pIyuntQubdBxYTfl
	TyKJFXBJyTNLxSRjPTTEVxUP3P5bJPRrbnBWfb0MmT7lskCc+xfokk2F/EHtvv6Y3PNZJ43Z8GXav
	nvkOJ+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHX-0000000DGu1-19CZ;
	Tue, 13 Oct 2026 15:19:11 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHR-0000000DGlh-20xK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-89a595332c7so1579916b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904745; x=1792509545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=o1sypVLq2NaPomA+2f1+pYUkP4jlGk/ng27z7INE8ZjcJSdq+xdGf6SaC7ca2emB/6
         bOugQRB1exe7+gqKOlfbPAxdivwB4RrRMmG6CtYHmK1zRCXZNDoxOEAy7Mlt3gqggaqU
         xLOCd4ugcnag3iDoSB+O2LdrGEker87mW/Z+CkQyX8wnw/nRy6sqveXuUs6SuA7CQkub
         83lHXfwKfHirCcVWxWWtA+lig0eGFycd185bzPFDFN8qyM8C06uRFn1gFe+W454YoRc8
         t3UIZsamZzLwVQD/HUcrE2GHjTen5cc15IHClNaXLe7vfHh5vKWkNK981TKHXLFDoN++
         fChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904745; x=1792509545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=ma+PDiCL3iQY+SxoWxVQK0WVyEZLLZ0YaXLdKbDJXy30emTKH9yYD7opC03i0OGpYE
         vb6nGBB9oD6P10qIR3ctZJmXuo6TTVWvbiiHXEDeMSWgwMIpqQfsiiv347OAWRuH1dEn
         Vqg0uFylEarIc8BgluS4Q0Vt1AJQrEJrbk6NQEwap1TkeErry7ISGL03IkSHbV9HQxTt
         aC5Hd5Y645le4d+vUlOra4zw6ddgMv1Gv+U713AHEvhWnpMgeQ1SH5rIcAYMxuPaQTI1
         k7EOJ2jlcvovJAh3+a9TYVFzbnK8yNDwTWzJsKW0vCiwIlv6F+u5AzLzDjX3+YbcvB9f
         y1OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz7htz5JdR8aeJb63ZSarSg/Gz1+auQlXfkBcLtxROG0ZEkEAARxBN6vKB1+Tt+xbhKQ9Xi1lX1eiiGYah10jQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJRYryd38qbciQ8i8zLeNIdg5VQulVQp7nIEwOHvUSoINDZaS5s
	JZcC7Mh85u95K+2m6p7JOS5qErhSdSUVx7oCFexZEvEZ6aASETC+iXYp
X-Gm-Gg: AYBFou0wfc/UGR2ygjuaf+KcM2dw/+nnWPN7WnLLgZAIR91NWH4zu0zCY/CbsxL/hZu
	6QU/exSNMKQIlqqvfHF9gyOZ/oWoLZUO7HoP3r2FvCnxXov/ZSE5MvrYcJgu8hHKwBPxmabYt2S
	d+JV+h9wHhVqQKm+IRaHIkohqgEwOQx8/J3qAzkzsIeMwHl2pL9pde3FwDfWwrxrrBQNm3ND6zT
	MBZbznZNNs/HcAoWl5Lh0+cb5vouyl6OA12vE1sANVa9uCniFaLOvNJrcuTfZrLMttuTHnSczdY
	K2NIQMOoM5AYelzzKAhpjHwZhOvsI35CIYKjZxp54PK0O760aznv8w72m1BVNkWrMB0CfRyKGE7
	7M+cx8iwRgqkfATdQ57OHDUUzW4L1hvfFJVYwh40W6EHx+xzHcmjDEgV0DPBzv9PA9LcUl6FHpQ
	aQeh515on0U+gXNOkWX30plUuAM21wtxgv5ghzthdcBw1aEIqnniruoNkScxzZdDnTzmlSyyvBS
	+5mcifr3secZJxKJLkPh6uBp7oW
X-Received: by 2002:a05:6a20:1455:b0:3e0:e349:f672 with SMTP id adf61e73a8af0-3e16bf5d17dmr6698639637.82.1791904744725;
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 12/35] clk: mediatek: Add cpumux support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:11 +0900
Message-ID: <20261013151734.3177690-13-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081905_554077_E115191F 
X-CRM114-Status: GOOD (  16.49  )
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support cpumux clocks. This reduces boilerplate code in drivers for
SoCs that require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 11741cc6ccc7..004098a839b2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -19,6 +19,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 #include "clk-mux.h"
+#include "clk-cpumux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -513,6 +514,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
+	num_clks += mcd->num_cpumuxes;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -542,6 +544,13 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_factors;
 	}
 
+	if (mcd->cpumuxes) {
+		r = mtk_clk_register_cpumuxes(&pdev->dev, node, mcd->cpumuxes,
+					      mcd->num_cpumuxes, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
 		r = mtk_clk_register_composites(&pdev->dev,
@@ -549,7 +558,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 						mcd->num_composite_clks,
 						base, mcd->clk_lock, clk_data);
 		if (r)
-			goto unregister_muxes;
+			goto unregister_cpumuxes;
 	}
 
 	if (mcd->divider_clks) {
@@ -605,6 +614,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+unregister_cpumuxes:
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 unregister_muxes:
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
@@ -643,6 +656,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
 					 mcd->num_mux_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..02fab4b166f2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -252,6 +252,8 @@ struct mtk_clk_desc {
 	size_t num_factor_clks;
 	const struct mtk_mux *mux_clks;
 	size_t num_mux_clks;
+	const struct mtk_composite *cpumuxes;
+	size_t num_cpumuxes;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.56.0


