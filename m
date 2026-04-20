Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C8BF588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atXx1i6ugdfhlTZbLBKY0syT+b6ND7MPQE/ha3qtB0Y=; b=3zQhIVw8qmWvlYSIaqGWBnbSgs
	YmnQ7Utp0FDXECo2IIdAPWvICa5fraEJaLKG/3QJGSIQ9eO0q2eUYyLqWKT8O2lUWGjiaLPnHFi5u
	dzMXUkw8nNAC45vF0jx125rciW1dNB1ZFFkxvKOrz6ZX3jq0s4++D6+ENtXx9aDJ0Vxe+3BQZSyE4
	glWlvYMRonaNovHVQ+YEY26mHHpn0y8QGPmPZT6laKmY5HBCLgHIcQdGpVLnG22zPA4dgWTZl2XsE
	qSkXyu1BK2fnJxrlmuxvpJpyFihlrbSeQV4gklNXCWdj7wrJrEC9YliLqJrMW70SxHYJkyPAaOg8z
	zFtVSmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoU0-00000006y9c-3oPj;
	Mon, 20 Apr 2026 13:16:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoTy-00000006y73-3Uhk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2BC760154;
	Mon, 20 Apr 2026 13:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369C7C2BCB8;
	Mon, 20 Apr 2026 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690969;
	bh=Ay9q0/FUsQz7RmljwSk+IzFgJ1vCF0iwCGHEp+gCZmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/pe2Vsm9qFA926oOcTkVg4ZH7FBXX8LM4A4Mv/denKUs8Zy2D7ZvrA8f21935fJa
	 Bsr80c1LQhaOi2jZNncsiBzg2LvwD23JYIMWWL4kz4LukjRM/RNqOrw5wnZfbR29xt
	 a8IusQ2s71EeMoJ2B6iNVw4W53o5Hj9NF3IFS7QEvMOnoDTiV0rytz0pEMHkAQmQeJ
	 aP3lz7q0Yuqn9qZkAhGE/lJ2EnTDtstKaQ0AnXSG2GbkDloiBoYk8qhIt0lVD/UR9+
	 JR6SWwa2Ry+zP1B6KOBNtRQL6/uUGf0NT2eL9vtITf2HhNMJu/pviJ6U2VMSPlP4Dv
	 4t9ISmqhHVmLA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] arm64: dts: imx93-tqma9352: improve eMMC pad configuration
Date: Mon, 20 Apr 2026 09:08:03 -0400
Message-ID: <20260420131539.986432-17-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

[ Upstream commit b6c94c71f349479b76fcc0ef0dc7147f3f326dff ]

Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK to improve
stability and detection at low temperatures under -25°C.

Fixes: 0b5fdfaa8e45 ("arm64: dts: freescale: imx93-tqma9352: set SION for cmd and data pad of USDHC")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 .../boot/dts/freescale/imx93-tqma9352.dtsi    | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 82914ca148d3a..c095d7f115c21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -270,21 +270,21 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x106
 	/* enable SION for data and cmd pad due to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			/* PD | FSEL 3 | DSE X5 */
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x5be
+			/* PD | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x59e
 			/* HYS | FSEL 0 | no drive */
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1000
-			/* HYS | FSEL 3 | X5 */
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400011be
-			/* HYS | FSEL 3 | X4 */
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000119e
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000119e
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000119e
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000119e
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000119e
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000119e
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000119e
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000119e
+			/* HYS | PU | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
+			/* HYS | PU | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000139e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
 		>;
 	};
 
-- 
2.53.0


