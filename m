Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CF2E7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VgLve+LTHUdmNDjxeJ090s5rUa9P6r5NWos6pRfsmLk=; b=qXulLg1c1MeXxlOWtEBzC/hudn
	f85DG6CPjUA7lZcgdKZNz0N3o6TUtJMryPh6RykAm3F8Y0EBvN/83E6/BMemt6jv+aMW5Z0GKv1Oj
	D9fQ78am1U4nF84FuecHwpjJMfcLjUEy/NlVWi21UuahOdSUV97XLW7cudgEXD05SApQdXdc7A5K0
	ydWEUan2eImH01masa9DN72ZYwoTBehmUMRGu7F9FFNTVquHwptKWbAG7as4PE3wCyfD8kpT6/vR/
	G2W3fCtz6fvF0YDUeu3nnyHobvcNv7wBfJcpmdMP3QkgIywZG31gca7C7kOo8MY+S9yP7bu5nq3G5
	qzdDLwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyNt-00000005PGF-1mBR;
	Mon, 02 Feb 2026 18:10:49 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyNq-00000005PFX-1dhP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:10:47 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1vmyNb-00EkV2-MG;
	Mon, 02 Feb 2026 18:10:31 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add Gateworks GW7906 board
Date: Mon,  2 Feb 2026 10:10:28 -0800
Message-Id: <20260202181029.1832198-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_101046_589710_935968B7 
X-CRM114-Status: UNSURE (   7.48  )
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

Add support for the Gateworks GW7906 board based on the
i.MX8M Mini SoC.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..46a85f8f9e5c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -963,6 +963,7 @@ properties:
               - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
               - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks Board
               - gateworks,imx8mm-gw7904
+              - gateworks,imx8mm-gw7906   # i.MX8MM Gateworks Board
               - gw,imx8mm-gw71xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw72xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw73xx-0x       # i.MX8MM Gateworks Development Kit
-- 
2.25.1


