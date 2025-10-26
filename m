Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7E5CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R2tCKCi4ORJ59XWU2sD83ougJ8yNdBwsd2TK1e0IV4w=; b=jIStiugWB3yqNLtMzi9axHiziN
	k9JBFSMZHfYh3K7V+ga7acWYrh188AbKN7QvfW8z6cNj+J7DyZUv5MtK88KoAArQr11waaNLeH81X
	5hqn58DnWuK57ZBI4R4GRmzLdYjqSS3eW/8Psk/X4lVY1CIzeX3AYh03oRGiqo+RBQCtJxKbjghvn
	YXGNcUg40WHGoVvimchh7Wrg0HvGjRXy+hbYCnFdIEiAcMnt1Zwk5kF/nT/r27tgNhMxbc+/6rij3
	2m3u2MUxQI5HL5XaaKieBZDlYK4dh5qtArzgckYgGdg+tVJRzhP/9eT8YFvmzkKABhTUZAGWr1ktb
	Pqd2N83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzh2-0000000CIxN-236A;
	Sun, 26 Oct 2025 12:17:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzh0-0000000CIwX-0QOW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 12:17:51 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 89E40AB4;
	Sun, 26 Oct 2025 13:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761480957;
	bh=pHvVW51hUAo2aNW/gQRr/0MjdLTqCw0S3nlYseOuy+s=;
	h=From:To:Cc:Subject:Date:From;
	b=sspobyoCwiECwCsLChzGMnceyt/ZBkjgTq795NxsuiqU436Q32dlAoRnsDk3lXGup
	 3TwotcpVaEDAwPO5+dDkp0uHAk02WQPCg1Pb5moBX5nJpV8JA9BZkqm8NyZDT0QdOR
	 sXOw+5zgrGzzDipOaxfxzGGgNvyY6r7i6NMeRdl8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY address
Date: Sun, 26 Oct 2025 14:17:29 +0200
Message-ID: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_051750_588304_40AA737E 
X-CRM114-Status: GOOD (  10.92  )
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

The RTL8211E ethernet PHY on the Debix Model A board it located at
address 1. Replace the broadcast address with the correct unicast
address.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index af02af9e5334..9422beee30b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -96,9 +96,9 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethphy0: ethernet-phy@0 { /* RTL8211E */
+		ethphy0: ethernet-phy@1 { /* RTL8211E */
 			compatible = "ethernet-phy-ieee802.3-c22";
-			reg = <0>;
+			reg = <1>;
 			reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <20>;
 			reset-deassert-us = <200000>;

base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
-- 
Regards,

Laurent Pinchart


