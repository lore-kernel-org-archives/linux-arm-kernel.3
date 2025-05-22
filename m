Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E449C54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1tumSsdxB5rVlaLhQ3GtnGPbyT38MnzhSRbONBT5I0=; b=E3vkMO4hjKaC/BPK6F0wzsML3B
	i5N1b+jAXrqv7U26IKAUZSQOWoNMYEr0sb7fzn3ALlDX/O3eLFkIQOyGHJBjfWelqELznA//slSkM
	GXB/4/icmKnG8Yl2VMzcUGdPKzYx6ERl2VkxalcOQDqe2dZjQslT3NnyJYkz5tZXt0brZRp2+TEt4
	DlcMxtpiWA0nPKJHxpXiBX9u1An2p46EKsjOEBX/viZKBWymGFHpwME2NKE5ZrIO8DQCqWVOB31pU
	0X+nwrNzVo+09HkHGo6wRG+wWEpGL9Xqh99hFksMvwi5w999RafBp66wS44dclEufAHwd7XZtUCAq
	UbclYtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1dq-00000000MXQ-3pBK;
	Thu, 22 May 2025 08:51:07 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1SM-00000000JNp-2Dvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 08:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y1tumSsdxB5rVlaLhQ3GtnGPbyT38MnzhSRbONBT5I0=; b=UgGNWeZAbrXKx832upDTd3kGsK
	tYqgud2bWULbhrUskJAUwwjI191ut1X/EWmTXglWi0B9brije3+dkvFzFzjnsvmNSeBnq5N5Rostv
	DoP4NF8rPsh3r3zY95QzIgUcK/zaTLv57SkhUdgI6SI9zD5gbYDkLJoS30RudJvNUYlTrC75RI6gp
	ew1cadwR7IsVnprnhGp3kCrcsWg1ke4brhjWRP/n93PhwrUb9ZTOdZd3VWXzwJ1L1Sm4Seuqd7I0f
	rhiUf/EiwuLpV4vuR3n8Rkg6/KGd3US/87oE9Y3ELppTGPO8Vr9lgwA6FZCbPLU+MwOrg5vwH8SVJ
	Kvw0eXcQ==;
Received: from [89.212.21.243] (port=51574 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uI1SI-002sBQ-1B;
	Thu, 22 May 2025 10:39:09 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] arm64: dts: freescale: imx93-phycore-som: Move ethernet0 alias to SoM
Date: Thu, 22 May 2025 10:39:08 +0200
Message-Id: <20250522083909.533567-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_013915_031763_FA932CA6 
X-CRM114-Status: UNSURE (   9.78  )
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

Move alias for ethernet0 interface to the phyCORE-i.MX93 SoM include
file. The reason behind it is that the physical location of the PHY chip
connected to FEC interface is on the SoM itself and alias thus belongs
into the SoM device-tree. Consequently, it can be used by all boards
based on the phyCORE-i.MX93 SoM (phyBOARD-Segin and phyBOARD-Nash).

This also enables us to mark FEC interface as the primary / first for
networking in the bootloader and systemd (predictable interface names).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts | 1 -
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi  | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index 7e9d031a2f0e..e1c9aa77c000 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -18,7 +18,6 @@ / {
 		     "fsl,imx93";
 
 	aliases {
-		ethernet0 = &fec;
 		ethernet1 = &eqos;
 		rtc0 = &i2c_rtc;
 		rtc1 = &bbnsm_rtc;
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 22dbcc89e311..0ea61841e591 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -16,6 +16,10 @@ /{
 	model = "PHYTEC phyCORE-i.MX93";
 	compatible = "phytec,imx93-phycore-som", "fsl,imx93";
 
+	aliases {
+		ethernet0 = &fec;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
-- 
2.34.1


