Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4568C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKWhkgKAW7K2xN5UikLAh1DgReROglkwCWmBrEJ0oTE=; b=xj2K3/VS7hiDsCG9905Gk0mzLM
	2buI0v7zUflVa6uxd3Dz5VN5uMA9QzUa/aOpyr4rtVs4pZWUdXv6WSTqBhXq680i0Uf6gkMQ3dYWI
	+2oD3nP+TTcld5OFtGE4LHlaYN/au9mihRYnScj7EVTZ8ZAYrYsjnhtnfQP+avo/Hm21qaf7dswm3
	tKTXx+LRH0JzMRcws8/KEWM3ula5SHNjVjORTJEjf9VASikg+Ghud66OWdieyyRyoPblECFnyyKd2
	V0vV8OATadnoCjGBxgafZmw7NOTTCLG5p0RhgiHmsisYz705k1JSFSTRY6vyOFEXBgYKG/FfcIAIh
	lMvtHxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TZZ-00000006p9h-1kLa;
	Tue, 15 Sep 2026 13:51:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TY5-00000006nfI-15G4;
	Tue, 15 Sep 2026 13:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YKWhkgKAW7K2xN5UikLAh1DgReROglkwCWmBrEJ0oTE=; b=bBOqtcOKKOopl9Vt2iak+ZGfiL
	jkNHYpVWpqFLsNw/BaJzYDYmPyZtFqA1m4zF4n8PftU3VOmubf8PS9VkE9Z11V8RMgZAzM3pFldzl
	BxGYdtlRR+QLH/Px91FvOwtb6Ymm2bHMHHFRn1fAz5rV2V21NvhvuRQZbbr5ahLVpcHH27UqsA5Jx
	O2VAZK8yOxItCw/F+3sfKZBJ9ShGO5kxNERDkald8fn4uep+hD1KXO0xK2EwVzm8vW/cYw41dN6fn
	yTLK3wrctPQEVuaZj/s9yWQMNWSV94NUkn+FEbdKC6MLqiYrkK2nOC8iI1YpncyxTYOEG7kZGWGYy
	xhTXT81g==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6TY2-00000006qaI-1ugP;
	Tue, 15 Sep 2026 13:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=9VMQh39CWRjHT3gfwr1EesYUI9gwspmu8UF0atDN+3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=atbBGLW1t4S36gylapB2P2U6aILW7hv77CwOVYl0htHMy5aAfwAmQLCj4Uk1lDrqc
	 6fEkzW8adbfMdtRsKZ1ix4daOeynfAxtFNXZzRFfztqVstPNUtTL7AuqbRsFjsXi1r
	 dRkP0gWtfpOod0XsirxdAofhlTgl+IGlMK5y+7Wc0CfXHqImOzrhL5XSrZLWfBjIO3
	 RFElF4crcVM7hJYIt8+oI0zCR1GpgnMSaHFyz4llxumIbmhqhFSHkpJKJF2dh9hD4H
	 r74oMp1vL19pgqmfuDy+6Jwz1+k6hWlur7t4Ac0HjheMi12FXXGF1cpMMzhZXlRxbC
	 ApdljWPSaAu8w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0650817E0E71;
	Tue, 15 Sep 2026 15:49:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3FC2B480055; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:50:01 +0200
Subject: [PATCH v15 14/16] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-14-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9VMQh39CWRjHT3gfwr1EesYUI9gwspmu8UF0atDN+3c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQYznBMDL+f0+xGlt5Gypk8LaeHM/t2WF
 Uf9FQw1hlZ4TokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0GAAoJENju1/PI
 O/qaQUAP/2+pgTDfnaN04Meq97fi3/xKN78cLmIA7pRVhe50d1hY5kxyy2i12qVfAA4NUv2/F/E
 XDYBIDv2/IfYxxqDUh0SUkwYJLMKo9X9pA/rLEzDFX9GoslqYC+QuLb/VBN6AJahH9/D+9YhFon
 xyt5bQZNGyMy3yjUwu9esnAn2PkjQmf8xLTQlWndQy/eY2XS6rj5CE6x0gu7i7mECe6NkZMz8dP
 /feKWnEFa6VH6ArNCFROAg+PPKfqex6x1B6AIlF5nl2djmk3953f6aZe5FgUU4E/ebZqgcm7baV
 2nrGLCJOxuBBXQYtTbxsNPfrOgLGVU5TKwYpVVHS9wgaMqdDHfJiEFuOuXra6PgFiNQV8EnHi1Z
 SIKeWknkrQXFmLrDIjUBGNHEnX2jaDNOXIIeLKFj7oVTlRMKNm+foPxktZWtcWMTic4OFpxfnxQ
 H02Li3Q/Pb+c3RNjzaTQHWknhAB/jSt4GDTRuFhFNt/lycGScIITI7O92Y3c+2DGMaGp7hQcKu2
 i5O7VCkjwd+E/kf5WnfxbYUMKQfFJNjgItbT9986wENyxXdql/9evSnoAd9qR/lKCfs4XOmEnTR
 FERlxnk9OemE3WLVDS+6p3lJYJi8Xyicp0PIqAP5MQEbAVT1gbRhsrN4G4uOLNTZEVO5qMnM4bz
 56ARRD+BSHebhHrrOtlwrYg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_145010_588466_E8708147 
X-CRM114-Status: GOOD (  11.77  )
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

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9dae41239e48..d95a44835caf 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -74,7 +75,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -103,8 +103,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0


