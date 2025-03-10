Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D5CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pP5AGd49889Z3JFGOGRHgkg7HKkdewQ+Zwhw794fEIw=; b=HRR/KN/DFfDbUk1emytc1P12qo
	tMoZZbqmQrDhipxI14zWc02vfpop6AdNk8VpkJsXD0A+Dc/tt68NFriw2zyiL2elpcZyYZrA60/5T
	EKrgZrAB4J9EuLUgF44uXXqYBo8/UDSQW3dQZKSl1ubU1zo5JvnxjNjsYFcUBfv97fhPuuk1WewuD
	YWLE+nzXzcMVHr+2nODtUJVd04EBMQRRNc/z46ChoPI3uTt6r7dpOkkXFf40emI6k+22LcgKth/Q8
	NwA5ldwURuUxX9zz924+hB+xlleojb5nwmZkbxdPj6ONsK4rPVSMyezP0XmBIuE+Ako+cQ8ydlHBv
	j13A5jnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdBA-00000002nOZ-1Ih1;
	Mon, 10 Mar 2025 13:28:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcEd-00000002cQA-0G0n;
	Mon, 10 Mar 2025 12:27:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bc48ff815so23949455e9.0;
        Mon, 10 Mar 2025 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741609673; x=1742214473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP5AGd49889Z3JFGOGRHgkg7HKkdewQ+Zwhw794fEIw=;
        b=jZTbwgeUvpOCa4KlwQMUljg236k8ppWMpEuxxAiVEIdjKBH0Xk0NSp6dOCHFVAbEtS
         SV4ankkYVrBAFwaA6L4omqOSi/nRuEaJzGwTBR+DE8SQoHEFVsiq6QxYlXREzCAQbDxy
         cyVHapPm4BSyYtcsNY/ypF0Jkv8FBm9pOKJuBzmzBfyxk+r7xIyO2DdQ973mRZYIQxIk
         puuMrx/R/1Fo3lrlOIJqqI7sl+19asXexLJaqIkFiSKR+udDjF7v0XVVIRS7WevyQrhb
         xtIew8RWhms9J405R+7qGrkZwULvf1yi2DCjpnqVi5BfzNaNVXeOmfBbCR664Ocof7wK
         gPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741609673; x=1742214473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pP5AGd49889Z3JFGOGRHgkg7HKkdewQ+Zwhw794fEIw=;
        b=RH+Iq8KHc4kTR/KQUvZaDLn5KwNTjdrAA5HQwZhRiGQnagvvG1tn0Igm0A0JBYz3Ls
         zvY1Rf2uKEuaJxWGiz0bz4ln/Pesg0PXxo9+nQreMdPoDWcqbLNe/hu2T79Xqg5Qb2XL
         VWF5AeBfC9HN98LKhzFXblL2nh3qbX0ap9wxPxu/tOQ/Okja9XKi8XifJujd1xCV4KVO
         ujNvLAXnEpPPhN14T3IQvOBH2oOJavLZMry0yzuW8MDMgtZ6aLzWhcw2drLDuGj3lu7a
         zHycJ29L+MGPv0dYOaouxkKfvORXh43v4LuS63mc33P9f6z62NpMyKo/zayWK3rxEfxf
         oo6w==
X-Forwarded-Encrypted: i=1; AJvYcCVSCSSE3VzW4lj1t8E6hgIUSP2jZh9dBekJvs7z4QOl13QSW7qlzc8WTd0VzueBnK1x2vw4qXajGn49UwvCYKpw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Vd3RzTz2ClFpGwkGMANEBat5KlAndF2AwVkWX4PLm+Qd+xmk
	wIrNPcowzr6arH4Rzte0lhCTIIBaWQkUZ3VmW71CHofGfhYK3StgS8Lcj85B
X-Gm-Gg: ASbGncsIHK12hnwYPsVXItv1npxvsy1LcFn4+kagNm1BZlRbNlhEioD6cVaVJLn1XRt
	YWJ6+9kKd0+vQt1G/n5AoYjE+ONrS5Zsf89YP7wdQFWY3r0OH/PZoBde2lcKCaKUTM8ZiXm+xbj
	iX174tQqsbWsh8oYzaFtq5Iz+HAgUfKes9UZDSsjSiWM8w14c2RFy7Dkkj3hgDQE0N4mtqCqMrH
	5KDh9tg43yTxM8nG1ElRM697roN2KEQawdL38EluCpQenmjW3B/t3Lu5KpW3RfmpFLHeZjXdej0
	CwH6quhli9w/mnw9lphQXysaZZUl7OF0tkqPkI/PpQUv41oyq8BKoaZeYH4Ujeb5gPGBTUIZG5l
	KVuTx42pcdttm4DNJ
X-Google-Smtp-Source: AGHT+IHkdFXutwUlHgJUEeibLtGVxZ9e1BYhqaRmZdU3VrmHHopZkCNH9T65QpbRvqLO+DUNS6Gfbw==
X-Received: by 2002:a05:600c:1e08:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-43cf6805d78mr26252335e9.13.1741609673265;
        Mon, 10 Mar 2025 05:27:53 -0700 (PDT)
Received: from eichest-laptop.toradex.int (85-195-230-40.fiber7.init7.net. [85.195.230.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm171963245e9.4.2025.03.10.05.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:27:52 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	hongxing.zhu@nxp.com,
	tharvey@gateworks.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Date: Mon, 10 Mar 2025 13:27:03 +0100
Message-ID: <20250310122745.34947-2-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310122745.34947-1-eichest@gmail.com>
References: <20250310122745.34947-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052755_104867_0267CC33 
X-CRM114-Status: GOOD (  11.13  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Remove the switch statement for releasing perst and reset since they are
already correctly set at probe and are no-ops for
reset_control_deassert(NULL). Call these unconditionally.

This does not change the behavior of the driver but reduces driver
complexity and allows for easier future modifications.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index e98361dcdeadf..5b505e34ca364 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -141,15 +141,9 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
 	usleep_range(100, 200);
 
-	switch (imx8_phy->drvdata->variant) {
-	case IMX8MP:
-		reset_control_deassert(imx8_phy->perst);
-		fallthrough;
-	case IMX8MM:
-		reset_control_deassert(imx8_phy->reset);
-		usleep_range(200, 500);
-		break;
-	}
+	reset_control_deassert(imx8_phy->perst);
+	reset_control_deassert(imx8_phy->reset);
+	usleep_range(200, 500);
 
 	/* Do the PHY common block reset */
 	regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
-- 
2.45.2


