Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F45C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jL/nquXJOtsyOHwId91Jt8y1FMZRc7Fx/1tni3T25FY=; b=in0YglPC8BiBD1D7Eg4bYFlToa
	51W3/pJqW2mrUQRK+i0LZoh3fanx1qtrEHcOhxoTfHaU++XyoUhEw1y1aSHcgLKSclo/F/z6YJOO1
	WRUQXVRwDMyV9oa6C8sRR/jBfYfjon971QNeLQTxzZm9xjrvnO+QDTRbPbV80lnVt/6z2jQtkPJIR
	80HFbQ0CfzcrQU1dRSVgWkWtRhsTgvI/qSk0yMMk6n7us2zxzvPlig+iRC6Tq52mA34a2AWGi2ksG
	bbB3yh1eiNtPJo+Q1uuJjgpG3mvLSxLM/t9Cy7ENAb65REwa4zNe9l24LMhKtxE6VrP+OvYxGqZxm
	PCfjXcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB32-0000000AUnE-0bFW;
	Tue, 06 May 2025 05:40:56 +0000
Received: from mail-m3282.qiye.163.com ([220.197.32.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8Ut-00000009sAh-33jq;
	Tue, 06 May 2025 02:57:33 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 140c6eb04;
	Tue, 6 May 2025 10:57:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Junhao Xie <bigfoot@classfun.cn>,
	Rob Herring <robh@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	linux-kernel@vger.kernel.org,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/6] dt-bindings: arm: rockchip: Add rk3562 evb2 board
Date: Tue,  6 May 2025 10:57:13 +0800
Message-Id: <20250506025715.33595-5-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506025715.33595-1-kever.yang@rock-chips.com>
References: <20250506025715.33595-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx1IHlZKHkweHRpMSEpCGElWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a96a386dcf703afkunm140c6eb04
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTY6Mjo5FjJIMxE#ST0xMC8I
	LBIKFBFVSlVKTE9NTktLSU9DSE5NVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSkxNNwY+
DKIM-Signature: a=rsa-sha256;
	b=ibLWCwO+DvQPJ54po1wn0YdKD1BIipl6ONpjcncz9hdT1nV10V5c069xTyL9AZJflIUti0rqLIyzf86BTLyeprgyqweb4rVAQu8VW3qrPIa1wlA/MX+IqO5l9woKWQtOk3X+frsIwrprpRRCzwCLMuUeabHX1bY38BFHp759H5A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=jL/nquXJOtsyOHwId91Jt8y1FMZRc7Fx/1tni3T25FY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_195731_924625_0FF54E3E 
X-CRM114-Status: UNSURE (   6.97  )
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

Add device tree documentation for rk3562-evb2-v10.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Collect the Acked-by tag

Changes in v2:
- Update in sort order

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..3372aff63e4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1057,6 +1057,11 @@ properties:
           - const: rockchip,rk3399-sapphire-excavator
           - const: rockchip,rk3399
 
+      - description: Rockchip RK3562 Evaluation board 2
+        items:
+          - const: rockchip,rk3562-evb2-v10
+          - const: rockchip,rk3562
+
       - description: Rockchip RK3566 BOX Evaluation Demo board
         items:
           - const: rockchip,rk3566-box-demo
-- 
2.25.1


