Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B714E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q6BdkQMdj09o03ihlV4EVZ1rDVGa/oO7ynJUc37C9ZI=; b=eF1gASAhszk+KA/cUdQWhIk3jm
	G4CrBm1GEszOfhBoRAx8l564RNsOuenRyi1F6i8v+eQM6Tdpm0ystyJQJnqmMYatpgFBsbkr+EM5Y
	9c4bg5W2ih043e3xKpL7vhbCPsSaH3qMeH5BSME1a6q9ypBuhrlVWCJwfB7fP5kDc0QdHA/9vPxEa
	P9zylAqD6XBWPWsbG9ORMZBR7XVkLdm3EXV0Echp5POLAM234FB5LY+IVG2iBYN8FwGKAo35OoNfm
	YbLuHor1I+Lg17EMDn2mI4libw/Jipnh8RM5Uf5sSyRcjxGJ4+yXDZOeHaS/hrooGsTEmz/JRdGMM
	9XHd6z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Vj-0000000BdZd-1FP4;
	Tue, 24 Dec 2024 09:47:31 +0000
Received: from mail-m49245.qiye.163.com ([45.254.49.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Pu-0000000BcYt-2tfU;
	Tue, 24 Dec 2024 09:41:31 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aaa2b8d;
	Tue, 24 Dec 2024 17:41:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Wu <david.wu@rock-chips.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH 1/3] dt-bindings: net: Add support for rk3562 dwmac
Date: Tue, 24 Dec 2024 17:41:22 +0800
Message-Id: <20241224094124.3816698-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhhNGVZOS0JMQhgZShlOS0pWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f80af00403afkunm6aaa2b8d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjY6Vio5CjIUHEpCSzEwNyoT
	PDMaCgtVSlVKTEhOS0hISUNDSElCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKT09JNwY+
DKIM-Signature: a=rsa-sha256;
	b=XY/0N3M5A6L7642T0X1zwP6OTOLoD6VvWemimNXCabm7r4P44RY7mOp0LvHRdplIG9giWyaP95yNkvkJcgKLd04CD0e5/ueCTZsVS5J5MUspKt9LE+gAlEGfXdtfyc4tlYrXy/ZT1/YDS22uzpuB6kxcDTxOl69V4QnTECVmjFE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=q6BdkQMdj09o03ihlV4EVZ1rDVGa/oO7ynJUc37C9ZI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014130_888026_ECDC9D0E 
X-CRM114-Status: UNSURE (   9.08  )
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

Add a rockchip,rk3562-gmac compatible for supporting the 2 gmac
devices on the rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index f8a576611d6c..02b7d9e78c40 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -24,6 +24,7 @@ select:
           - rockchip,rk3366-gmac
           - rockchip,rk3368-gmac
           - rockchip,rk3399-gmac
+          - rockchip,rk3562-gmac
           - rockchip,rk3568-gmac
           - rockchip,rk3576-gmac
           - rockchip,rk3588-gmac
@@ -49,9 +50,11 @@ properties:
               - rockchip,rk3366-gmac
               - rockchip,rk3368-gmac
               - rockchip,rk3399-gmac
+              - rockchip,rk3562-gmac
               - rockchip,rv1108-gmac
       - items:
           - enum:
+              - rockchip,rk3562-gmac
               - rockchip,rk3568-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
@@ -59,7 +62,7 @@ properties:
           - const: snps,dwmac-4.20a
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 8
 
   clock-names:
-- 
2.25.1


