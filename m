Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A43CE8D57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lypS4OCGKHljGBDBOhbks812Bl5TYzzffujcK7lKp1M=; b=Lf3RvnnZ/fhOiDg8PQAQuKNgFF
	+YnAqUEywV1r6UNUkpDcH9RThfIWmR9hyjeGlbd0LKJG0+52PfrASip4g0zElbyjqix7zIyKFVkUD
	HMyV7WluIc2TARk8cN+N6fRQy2E4mahhB0/2zAFv4NPQSMYxn1am29uXJQwMSe5vspEGpouYUvjvm
	MWv1NvQZnZwq5Zmlr+we5eJpYTQgVrVvsRC1iIGx3x9AieMkLfbIu3BNE7HLAyo1e60ocjEm290hr
	gxzHZyG9X3u5PbPHCuWVWqFfV4IYZdba78zFYp2uXasJc+yn+yPY2hn63EwDBwg1bdFdPOG2+AEqq
	y6arnQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4R-0000000Cm8g-1PHJ;
	Fri, 14 Nov 2025 16:54:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4P-0000000Cm4n-0Qit;
	Fri, 14 Nov 2025 16:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lypS4OCGKHljGBDBOhbks812Bl5TYzzffujcK7lKp1M=; b=OmcbYqzReTBYUutRYwS/2u1Nft
	uWR5UkbSFm02JxpjA/Ec0H9QyBMK8l0FZNDdA3JeVHfghR07g71ML/MChILNTweA8O6oaxKg2Hiqu
	POkn3jhnjmobAjd+3xEawvLtD8TTFLk9lMd/JhX1RTjeKcX88959gjS9bTWn0Qpt+HUbAIXSgtkE1
	nw6XtD9IrpDpNDTF4iRQn4m4LYqb3lre5uqnxNWPWPOoC8U5EDAOpyEIc5KjOHChj8ocu3kwG/hLf
	8BdsdkjhLZ6R2sC3rhhmE485Qaa7CpMLTQiAlpLE0l7XisF0iEpSy+pWTojOeLSHfMl2kj/XPHehH
	ulA95Qmg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwCh-000000032gr-1Lkc;
	Fri, 14 Nov 2025 15:59:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139272; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kIsqBtSo/Zatc1ZGc5M4q+Ujt5PykEskH6fTzFxPZ5U0fxFKNGv7LO7A3EZArpB7Lc1I7BNsMIiRKyWUgw00UfvbiGtcjR0hybeuBxIVK7d+EydLENx007HQOEbsuDQhq4zGvw17+auGK6943Lk64ngt9ahK/QHR6H2JzD2ex48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139272; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lypS4OCGKHljGBDBOhbks812Bl5TYzzffujcK7lKp1M=; 
	b=G4p5LYtTtNg2W9DSUAZA0EPkLQsZItbHulevCVmDgNDYOkxBe2pfrAdLNHbaAuXxyZET5JgY3Pc5a6kCzqevgQ/Z9OoyVCUB3+tUDXqP8FfMZrSpcca9OWsuAMOIC5+KNivof6qtgG86RYNtn+eXIrTlmRzigVNabSvbfcd18vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139272;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lypS4OCGKHljGBDBOhbks812Bl5TYzzffujcK7lKp1M=;
	b=gfGecciJzg0sNj1rJEzmpwUVBHoDY+Zz9H/zIw8A3E9qZD2MJHzVpBf3BfZ3hcT9
	szQrYIwODYJatRKSP3Efa2tXVQ74EiJfqIaZdKjUIGWhp/JzllhrNGB6ISjOp2gt3Gl
	f5+sizyoKFcQVsSDxRlTdAzWeUynWs83mXRiW/14=
Received: by mx.zohomail.com with SMTPS id 1763139271219137.1608638744043;
	Fri, 14 Nov 2025 08:54:31 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:54:01 +0100
Subject: [PATCH 07/13] soc: mediatek: mtk-dvfsrc: Write bandwidth to EMI
 DDR if present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-7-b956d4631468@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
In-Reply-To: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_155915_848161_6E413EC4 
X-CRM114-Status: GOOD (  10.90  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding support for DVFSRC Version 4, add a new
`has_emi_ddr` member to struct dvfsrc_soc_data: if true, write the
DRAM bandwidth both to the BW_AVG and to the newly defined EMI_BW
register, present only on DVFSRC v4.

Currently supported SoCs will not use this, as has_emi_ddr is left
out from their platform data, hence reading false.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 3cbccbb7469a..bf0e7b01d255 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -72,6 +72,7 @@ struct mtk_dvfsrc {
 
 struct dvfsrc_soc_data {
 	const int *regs;
+	const bool has_emi_ddr;
 	const struct dvfsrc_opp_desc *opps_desc;
 	u32 (*calc_dram_bw)(struct mtk_dvfsrc *dvfsrc, int type, u64 bw);
 	u32 (*get_target_level)(struct mtk_dvfsrc *dvfsrc);
@@ -107,6 +108,7 @@ enum dvfsrc_regs {
 	DVFSRC_SW_BW,
 	DVFSRC_SW_PEAK_BW,
 	DVFSRC_SW_HRT_BW,
+	DVFSRC_SW_EMI_BW,
 	DVFSRC_VCORE,
 	DVFSRC_REGS_MAX,
 };
@@ -292,6 +294,9 @@ static void __dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u32 reg,
 		new_bw = max(new_bw, min_bw);
 
 	dvfsrc_writel(dvfsrc, reg, new_bw);
+
+	if (type == DVFSRC_BW_AVG && dvfsrc->dvd->has_emi_ddr)
+		dvfsrc_writel(dvfsrc, DVFSRC_SW_EMI_BW, bw);
 }
 
 static void dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u64 bw)

-- 
2.51.2


