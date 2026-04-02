Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C03D3940D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LftVk3p+D1lpNfbkKE4+KpyUeAmiTsBUQjaiRU8yqnw=; b=v77weGbl2ld/pkjY9P7eu+Q6bb
	ig/KK3u/BBVB33xb6aRDX0duDEQA9aC0C6ggB5GItWrdKPO6ATNhGYlxULtnt81GCU2r9xq9WPgFk
	n2W0nGXze08daKayEWobM7n5agsTY5lojXdZKh1yefKwMWmKyFuRdc8g//TQBVwELRbvX8kxbejTK
	JEDcVm4H9f5PMXDtTRor1CvXlcHL+yjpszxju+ui2H2Zhhmg/AmWVD8IekyyGklfluoVDBP84DkoO
	dFMAkuBWFv4jwrDUj5nQv3YzZ1LWSecPDuIomGzTp2AsfgrQmDywDz8FjQrvFX6bzfxtAy5Tn8LBX
	rC3nWGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjR-0000000HSbV-1XMD;
	Thu, 02 Apr 2026 10:57:01 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjO-0000000HRir-31Us
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LftVk3p+D1lpNfbkKE4+KpyUeAmiTsBUQjaiRU8yqnw=; b=a35zriNzqF4F5VQ4nKIZhr2URy
	fWXHFkdz6aQg6BoTWFEjt1/VNjhyATDc69e/UPvPNv0rA0gTVTxyQJFlSyDes1M8jfluU6GRs8gvW
	sp8y641h7dZcNHzHiGJXrAjkOIWZLua53kEaCDonL4jrwSauxbqfKXkbW7O4ciN3TzB7LHkJTp5KA
	5cfCFa4oMMkuB8ObZ777K6msb66My2QamtC8S+sYZVyKxsWl+PFCgqGmhzqHdpVvLs8LkCYDpabDX
	JsRoNyY8abCkzeORiFHD628JJk3jQZHyyAV07ymP9c/GOO1LpRE7Y6hibt30g+v/pdVtYCmyJIrfw
	n+1EyOWQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-2Q1h;
	Thu, 02 Apr 2026 12:56:13 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/5] arm64: dts: freescale: imx91-phycore-som: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:09 +0200
Message-ID: <20260402105613.1303871-1-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_035659_232866_1A1344EB 
X-CRM114-Status: UNSURE (   4.92  )
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

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyCORE-i.MX91 SoM.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../boot/dts/freescale/imx91-phycore-som.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 29a428a052b0..b9a453f6b290 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -88,6 +88,28 @@ ethphy1: ethernet-phy@1 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "I2C3_SDA", "I2C3_SCL";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "", "PMIC_IRQ_B";
+};
+
 /* I2C3 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-- 
2.43.0


