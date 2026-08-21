Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06D3C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToAljUZzlu8gcq/oteIvjx1BZE2NWA09oNNWZ78nDdI=; b=uCbRYwfOhi+Mz1uN/8rRDeSy5N
	cxENaRRn7qQHJ35youc4Nzu0/rkrXZeXsToqVH1ywhaO7yH8vWOLIfxLeUFiVbnt28cJYXZOV+yyN
	OQ70Bj17zPINNQLGLc19ATaaqTFhMh9Q4TFzcCSjBHV4MX37OgR3+60S4IKK1f60BFYsJAfWcrZ8s
	OdsFEbhUUA/FWstcbxZYZFWz9LGM8nl01QjAYtBwec024bjVQSxuWi9nvZYlRrbbRmXMI+NUSRc9L
	x+HXSgQRdjuNhFuj8rIeThQG2vNiMw/p/mriblVFwqkUO9FM9CJT5ZZ5mZGAPCO8DO/5vWs3C2a6x
	tGyIRgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxF-0000000DFxe-3Ksd;
	Fri, 21 Aug 2026 12:02:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxE-0000000DFvo-03WF;
	Fri, 21 Aug 2026 12:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84E3343FE0;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5736BC2BCF7;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=DWRhVzxI1C3wXkqKVNxNuGCTQI6vLn5Bk41TAuSUgsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OaFpnvMirgQyd1SxUFyhFisLd4c2TdFX2XbF1+VmPfuOvyunqD6bk+sRJ/q4eqWfw
	 PAcT97OvrRXAE0qcvYZnNCllELb0RVL/6JqXbM4t4AimuL58aJBOLqbd3Z05vxDwJJ
	 Sqc4holO2Cy7zZaqUwLFQ7nrRPdWG8FSILrKnwpU0KfG5ynKEgvQg3ROc+RMrwvKuM
	 DqJKtwpzb8MzJ1S6maLZQZQbFEIeWetL26iLQNOMuIM66MWCktT8JZjYkIlGyBicsT
	 325PUCo++k/qEUyGLtHWAnK6t/T/DkHbii7qiS4Je4qPwcOMsOPDiac2P7hkN1hquT
	 CQU2XbRGxoyJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2B7C5DF87;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 20:02:29 +0800
Subject: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and PHY_TYPE_CSI
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=1230;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=QW75aipJ7r+1l1HjnUlKV1E5sUZRB/BcBCVtuuiQvtA=;
 b=bz+eOdVuKzA1nXEkvtCyvOk8VSkT+16IY2otvOlUYef0QPyiVMe96H9WbD/KJDy79VrmZVK/z
 DDmmxdPuGQiDWSGcCqly3/fUJ/0N7C73PqqhpJQwbhtO+Kb5DaGPaRK
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jason Yang <jason98166@gmail.com>

A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
and in some PHY blocks both work at the same time. The existing
PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
the transmitter or the receiver.

Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
D-PHY or C-PHY and transmitter or receiver. They do not replace
PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
binding.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..8ee3f88e6d80 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,8 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_DSI		14
+#define PHY_TYPE_CSI		15
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.43.0



