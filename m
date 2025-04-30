Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF924C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67GVbn8v+Aat7A9f88pD3XUMhZlnrRNaXl+Zw0hEn0w=; b=UqETLMmWBlD0Ez24Uieczr0TFW
	LXrYs/lI6aNxttdb80MVXqyqnFVuGxwJaP5KRzdKZHUYFx7P9wjiKnzdGBhC4SrmLwyYYpVZGhJ1p
	6Ou/HBNSe3ksdnCVkReIjmAOyAYj1HbPO/Elizf8RyqCOtdeSW6dd0NU0lXzz1/kFtG7Sl8gE3Rg5
	si2pdy+OCNCX2RjJEKUwhHskzoe7YktgFQmgfEsHARKNUi3duNm+/yZ4inZgQkQDTfkJ0IEhTlUG+
	70lRgUlXOT1FhvQPBG73G7r1KM5R7me54n4bJUuEPlW8Md+b1BJC8qw2V7JOUdSbEjRqfj9U2KRgQ
	gmyA44JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4UV-0000000CV6b-23v0;
	Wed, 30 Apr 2025 10:16:35 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3x5-0000000CPKa-1Ows
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:42:04 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F14A1F918;
	Wed, 30 Apr 2025 11:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006122;
	bh=67GVbn8v+Aat7A9f88pD3XUMhZlnrRNaXl+Zw0hEn0w=; h=From:To:Subject;
	b=jY81Mv2Izus9srgofcJ+JLTlzd+7JoWzKRLELU5z+EvosNVFGAxtml3gpXO3LtdyO
	 YLNM1PrINC1JAc5+BWagf25NeR8P4VJVtIdtUsDV7D4+oLZOlKpW4QzV1Ljh5ZfmFm
	 pwu6+n9VMYNFBWG4kssm2fdYVJvzyVoOPZe4IaJetduMgHwu/gPsNkND3RaLQZl91e
	 /bju1Q/jOSTvaI0RMTaF4Nkq6iQPUsE1dUKWjC2+6pnK9ukHx5xhKgTr7WAP2lVXO4
	 0wN14IVef8lHEUL89USAbHom0vx6RIcK3CgSwYahW0bzg4ylnSbOgYQG9vuSbwjohd
	 cQGFIEaz7NsVg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 5/5] arm64: defconfig: Add Toradex Embedded Controller config
Date: Wed, 30 Apr 2025 11:41:51 +0200
Message-Id: <20250430094151.98079-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024203_526865_A4B9F6A7 
X-CRM114-Status: UNSURE (   6.79  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Enable config for Toradex SMARC Embedded Controller, this is required
for proper reset and power-off functionalities on Toradex SMARC iMX8M
Plus.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a92c4122a8b9..d4f1230250fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -680,6 +680,7 @@ CONFIG_GPIO_SL28CPLD=m
 CONFIG_GPIO_AGGREGATOR=m
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
+CONFIG_POWER_RESET_TORADEX_EC=m
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-- 
2.39.5


