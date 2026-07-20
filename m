Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161AAC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FE5GvtIGuiFBiS5pyTEFAw3eOvG7kdwa6OmAIr52E4=; b=IVeNWbOBIEtPV26bZk7fS4zEtX
	LbQfsPqnnugbP9/luaxoa4+zz6lH9LY/wAv3vut+l6xa5IIU4uFjam2WYUZYIfwjzQldF1qdeW7Vg
	NgDYi9wYD7usauzrtwgXUHPvvFRbhv1rGkaLsa4t1w6RP0r7beic4TC53luFX4gbtDU7+/DXBPbDm
	D1HOGx75rooOiWB/WIuvM/7Ccmp/+yZ+IGlw56MQOsoNhpDT8oeznVBwyxrgZ+hoa7n+F/oNalwnz
	bJSjjanBBLG/rvpbEMv3Z84kKc+AVCKMbTG2+QqVEF4mcYQQmLcQ7A5S9nluHjsMXCzC/fsr78Uuo
	DSrsbcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhV8-00000005xbq-3Cus;
	Mon, 20 Jul 2026 06:29:18 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhUs-00000005xNZ-05nn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 06:29:03 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0792F1A000C;
	Mon, 20 Jul 2026 08:28:59 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C2DA31A0013;
	Mon, 20 Jul 2026 08:28:58 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B33F11800088;
	Mon, 20 Jul 2026 14:28:56 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Mon, 20 Jul 2026 15:28:53 +0900
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX952 FRDM board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx952_frdm-v1-1-6d145eaaa5c4@nxp.com>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
In-Reply-To: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 qijian.guo@oss.nxp.com, justin.jiang@nxp.com, joy.zou@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784528934; l=821;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=yfsVzJZoxKOmotRG5Co7zwd3WiizVX7Adnc8AZ4LkfI=;
 b=bh9r0oonXiQwzq4N8pCtHqD4SmdNvYW7CA9YV9fwVPR0jZ2h3EtLBSd7ICXVGnur0axEhfFIp
 6GFamEanO9xCo+8rfwuP25l9Aiu9ZEsBuQr+LfCgPETiVSIi3RQR/e2
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_232902_204240_08A0DAF5 
X-CRM114-Status: UNSURE (   7.04  )
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

Add DT compatible string for NXP i.MX952 FRDM board.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7b57a6ee1b50dc22ece292d6d9b53b5aa834ee96..f67b3f6d57d3623d41364f852a64802ad2217560 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
         items:
           - enum:
               - fsl,imx952-evk            # i.MX952 EVK Board
+              - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
       - description: PHYTEC i.MX 95 FPSC based Boards

-- 
2.34.1


