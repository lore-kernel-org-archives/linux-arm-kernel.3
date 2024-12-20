Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF38E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9v/G/FdQXUQUDpsFAAijoy+xRQ9Tm3+wV3VCxxiSK4=; b=w6o63RQc8hD3kUeCTry9XknQoI
	4SBueaV62VITXWMgYcixaP0AyVWHTW28x0p+wvAqu3ghzQKcf9+WEoO9LbyxeG+SryU+xT2Nom99G
	Oc98zNurnW6MpXnXiR3MNXNhQhDgY7GZ2La4oSEI7VVNy7rDN7luhs+5Efr+dKFLvv9gazeUTZQx1
	6otxG07SMACo09kwIRdUE2Egd7BdSDOq3tbw6HY9w+RKx8RxgjMhEJAzDDgk272EHUkN2e9fRlx8q
	Ys/ESTRY8/1KHiavsdvbGv6buSx5PJoNLSBI4oUyf8nuWwoTWxYxHCcbcIpthdAGDFD0j9iuDTiuG
	sNTS6ZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaHk-00000004bN1-1OQ0;
	Fri, 20 Dec 2024 10:31:08 +0000
Received: from mail-m12780.qiye.163.com ([115.236.127.80])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa3C-00000004YUY-21uy;
	Fri, 20 Dec 2024 10:16:08 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 655ee928;
	Fri, 20 Dec 2024 18:16:02 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Chris Morgan <macromorgan@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Tim Lunn <tim@feathertop.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH v2 6/7] dt-bindings: arm: rockchip: Add rk3576 evb1 board
Date: Fri, 20 Dec 2024 18:15:50 +0800
Message-Id: <20241220101551.3505917-7-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220101551.3505917-1-kever.yang@rock-chips.com>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhLTFZOSRhOH05MSxhNGklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e3912c4803afkunm655ee928
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxg6DBw*KjISCAhKMDw4Mj0x
	KhQwCxhVSlVKTEhPTUNCTE1IQ01CVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0tONwY+
DKIM-Signature: a=rsa-sha256;
	b=GLDmHoq2/uuAvUm+eMezXCJLZFmnD4tMkrORT+Ety9+5TOaD7CEjzil2pW4nEojrQaxwtxGe43VTpahC9LuwsKcLp8xhzB0To4/hUvebT99De6Oozc8k23Aqm4OTbC7cFPeXEU7KYtc4nSYORuTeDefpwSeIM5XzKaGTksLHM6M=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=c9v/G/FdQXUQUDpsFAAijoy+xRQ9Tm3+wV3VCxxiSK4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_021606_725619_9EF078BF 
X-CRM114-Status: UNSURE (   6.42  )
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

Add device tree documentation for rk3576-evb1-v10.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v2:
- collect acked-by tag

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 45ee4bf7c80c..b2681a45867b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1016,6 +1016,11 @@ properties:
           - const: rockchip,rk3568-evb1-v10
           - const: rockchip,rk3568
 
+      - description: Rockchip RK3576 Evaluation board
+        items:
+          - const: rockchip,rk3576-evb1-v10
+          - const: rockchip,rk3576
+
       - description: Rockchip RK3588 Evaluation board
         items:
           - const: rockchip,rk3588-evb1-v10
-- 
2.25.1


