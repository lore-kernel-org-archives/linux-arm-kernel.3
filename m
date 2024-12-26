Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF9FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUoPGB2ofRkGg6bFBe+sKON64GQupCz5j3eQ7S5zDIs=; b=CWBhkggo+nekkYWWq1vA4BIF8V
	8p8EZifcRanCFKX/4x8nYMx/2Nn4r/NcyP3JAZoOTRr1gNcuLV5DKRhPuu+YuWGbm9mZzL9EVbsw1
	vwpRElF+e8qQlWX2M6QpdKfXi9r1cfsUCJkgYFgB6hPX6Ac2vWw8bBCB9D9/CmdIQhhbs3M9k6hwg
	3T0rF67BJXSU4ScoZofdGzsRzwg00f1bG/BFhSdQ73y+1uiWU+GI2DCGhfH3Cqw7OVQtCK8YdfcAH
	zEaRKIP0oHN6iBAdGM4pPuMWkDnYXl1at9ez2DXEW82fVAz00SMJLQGHi0x7IPUL5BKNqmQEN3rCX
	bEE9wsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhdz-0000000FKxo-1oPu;
	Thu, 26 Dec 2024 06:46:51 +0000
Received: from mail-m12791.qiye.163.com ([115.236.127.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhRO-0000000FIg8-2PLr;
	Thu, 26 Dec 2024 06:33:53 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6dc5117a;
	Thu, 26 Dec 2024 14:33:45 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 10/17] dt-bindings: display: rockchip: analogix-dp: Add support to get panel from the DP AUX bus
Date: Thu, 26 Dec 2024 14:33:06 +0800
Message-Id: <20241226063313.3267515-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpCT1ZITx9NS04ZT08YSxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abd44e03a3kunm6dc5117a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NlE6Qyo5MTISTUxPCTkpKwJP
	TAoKCi1VSlVKTEhOSkJPQ0lMTElJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0hINwY+
DKIM-Signature: a=rsa-sha256;
	b=JFIJFFgVPs6Cx1B22KzFWGq4xm5Gl3WjI+KFpjywZkCsTlnVnQaNJcISBQwA/NkQMw2a65ICbow/Se/vU7xqSId1vruvi29/mqhHMS9smz4B6ooaZ5Vt2u0w/4tn2AhlR2cGnxrFl0LAXo2LOJF6QyfgvaNmJboJsnr8Bi1wDpM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=FUoPGB2ofRkGg6bFBe+sKON64GQupCz5j3eQ7S5zDIs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_223350_791294_687DF66B 
X-CRM114-Status: UNSURE (   6.66  )
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

According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
it is a good way to get panel through the DP AUX bus.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Changes in v4:
- Move the dt-bindings commit before related driver commits
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 200703905b29..e0434cc6e43a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -46,6 +46,9 @@ properties:
     description:
       This SoC makes use of GRF regs.
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
 required:
   - compatible
   - clocks
-- 
2.34.1


