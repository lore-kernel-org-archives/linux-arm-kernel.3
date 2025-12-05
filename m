Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6F0D2E034
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx417/wSl6uxVgE2y43ExqE3Q8kWEsuBIOU44XgveVU=; b=FlOl9VkznqeUdYFuu0R2Yij7n1
	ffuc91MkEd+w/9mTeVGOPLc/yRCQVEA6V9Se82dfDrmZ9vXGhZWQV7qEsy8AtQ8avYL7fjjok8c12
	3c0n/omNBemtmDgMSEfrpU+Bcg/6i3nhEb9i3O5BeAiiweSBgBdGpeEgO5Owg0436aNRSlAfmLOBl
	RjSrTOrZ7H1Y5YjiglHs39N9xwdKI8EwQsISpJ7vm/bK6pxjy9ZaMzDYCcJ742J+JMgD2VAMZMzUr
	z8Pza0i/Pz/z+G4ax1XAdjhnc3c51p7j488ktEBXVkQoZs+cOXwYFjbmVo8JqMZAOTTB1Nh+yUUM2
	l/4achjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQnl-00000009CFk-1kVX;
	Fri, 05 Dec 2025 08:04:29 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQnh-00000009CDZ-2165
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 08:04:27 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5B6451A3336;
	Fri,  5 Dec 2025 09:04:22 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 257C81A18F7;
	Fri,  5 Dec 2025 09:04:22 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 712B818000AF;
	Fri,  5 Dec 2025 16:04:20 +0800 (+08)
From: "Yanan.Yang" <yanan.yang@nxp.com>
Date: Fri, 05 Dec 2025 17:03:58 +0900
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-imx91s-frdm-v1-1-afd6cd01c299@nxp.com>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
In-Reply-To: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764921858; l=884;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=TkLQNIRC82yp0ynip0gyOhzeM+WBYVNCh0kICDpNKms=;
 b=XdpjCw1NKWOp2CeuUgX8VUc9Al+PphTDV2AvLmtsnVGtGtskurgBARvOa5bWCKENLCu0NoiVa
 joZnRB92KODCfLdwjawkR3fkX8GLTkRCvuVPezvlLqd15NxAaf84vHM
X-Developer-Key: i=yanan.yang@nxp.com; a=ed25519;
 pk=d4hHTp5SW/PyyxexLEo/3c2RAaQDwym0zuYlifH95PI=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_000425_691613_858D5957 
X-CRM114-Status: UNSURE (   6.61  )
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

Add DT compatible string for NXP FRDM-IMX91S board

The FRDM i.MX 91S development board is an low-cost and compact
development board featuring the i.MX 91 applications processor.

Signed-off-by: Yanan.Yang <yanan.yang@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..82f28be401b8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1412,6 +1412,7 @@ properties:
         items:
           - enum:
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
+              - fsl,imx91-11x11-frdm-s    # FRDM-IMX91S Board
           - const: fsl,imx91
 
       - description: i.MX93 based Boards

-- 
2.43.0


