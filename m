Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEF4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4sS4jdc6mI0+Llv9QtpAg8NbLOEBMveI73kPmorKsY=; b=gtjp1tDnT35PzkpLHlbQnYBOza
	IoY1SlNQlomS/MgfpmIXTbdnTBtTxqlAG13xF1jT2lMvkv9iCNjunMnlEBwQkzU5OWf7bT6TYlkjF
	MFMzOdHqOxaDn7VWksRpyMgT8f3fBqW7P+nDw/Ahx6mpTPOvoByrjxpsxqu0o+F+LTFw8HlBsJNAy
	WMAaxvNsAYJj39x7wijzSLvzTFUYOUvJplrFiYTcIb7dCOABAgngttHwyAS2L0Dy2xvCV0lIp1oB1
	qFLMBpBUAFzoPkAAmywJs9bZS4BPqHbAjICnhCTFIpCSZLvN6E/kSWHYyGFY2TMoyb0mkm9j1Y9Mu
	dxWZNYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1ey-0000000BfPW-1D7F;
	Tue, 24 Dec 2024 09:57:04 +0000
Received: from mail-m127208.xmail.ntesmail.com ([115.236.127.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1R7-0000000Bcqo-28YZ;
	Tue, 24 Dec 2024 09:42:46 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aaa2d19;
	Tue, 24 Dec 2024 17:42:41 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: phy: rockchip,inno-usb2phy: add rk3562
Date: Tue, 24 Dec 2024 17:42:39 +0800
Message-Id: <20241224094240.3817261-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0gZH1ZJTU9PSh1CTBoeTUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f80c153603afkunm6aaa2d19
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nyo6Ezo*CzIINkozPCpCExFD
	TioaCilVSlVKTEhOS0hISE1IS0hPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSExPNwY+
DKIM-Signature: a=rsa-sha256;
	b=Ol9pehjQY5ZO9Hb1Je/xHCCbv7adtbAUQlDUYe3f6o3uNDmh5K/jYQYjz90jmlmCwAw7yYd1fVmnEDOR1QpalOlEJaB+H0JTrcKVXgEhmF6VA4hEzU8xYzjjvBG9uX2dGJlPS/VqytqcTOATwsYjqqSCFMV2Z8E+x6rgriHJ5CE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=l4sS4jdc6mI0+Llv9QtpAg8NbLOEBMveI73kPmorKsY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014245_716443_F490D863 
X-CRM114-Status: UNSURE (   6.27  )
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

Add compatible for the USB2 phy in the Rockchip RK3562 SoC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 .../devicetree/bindings/phy/rockchip,inno-usb2phy.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 6a7ef556414c..367297f6f8b5 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
       - rockchip,rk3399-usb2phy
+      - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
       - rockchip,rk3576-usb2phy
       - rockchip,rk3588-usb2phy
@@ -150,7 +151,6 @@ allOf:
             enum:
               - rockchip,rk3568-usb2phy
               - rockchip,rk3588-usb2phy
-
     then:
       properties:
         host-port:
@@ -190,6 +190,7 @@ allOf:
               - rockchip,rk3328-usb2phy
               - rockchip,rk3366-usb2phy
               - rockchip,rk3399-usb2phy
+              - rockchip,rk3562-usb2phy
               - rockchip,rk3568-usb2phy
               - rockchip,rk3588-usb2phy
               - rockchip,rv1108-usb2phy
-- 
2.25.1


