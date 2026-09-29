Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78735CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XCBv3O3B5U/0RI7i7/PfYDk3hpKzkqZDOf+4YfGQmw=; b=0yj1Ob7OWBEmg7Plu26XLtzyqE
	kS6TvP2eCuw4qanooxsYtPu3dF63qYD6VpHCwnSa2NFqLd7n9y2HC7qfj2cahkWc+apeaF784qv+b
	H9UpyKgOGmB/Fcwefm2+nplUNHs4Mgv16UJKTxkGz1ZVugv0gYyqrUa00KdxqdB03eBO+lbJwdzuw
	hy49hz+Pb7FIrrtnxt1A08NJPDKPkZKx8j6vibEK+brKed2oemCA+cOn+cAa/Wa7fsSDVrez4cD09
	KgQnjHArhm3nRHQIxJo174yvbCoJl+BPAU26BxKerGcmz3JhzAyeFyJhWokYTnOaWUNs18hpdoKO+
	FrdkvMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhN-00000004Oko-15eg;
	Tue, 29 Sep 2026 19:41:09 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhH-00000004Ohn-1dz5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:41:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 265A8106C95;
	Tue, 29 Sep 2026 21:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710856; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0XCBv3O3B5U/0RI7i7/PfYDk3hpKzkqZDOf+4YfGQmw=;
	b=IT3x5eyVq2rxZJTC300zmKmC8Go0EtXwiKIEkZOJYaWoLMLm4+RQSJKczSiOGxguUc26vD
	OEGHO6P5I6D4w4+HyfXPKsk1oN4leLVIFFJFCC8/DfduT/HbgHR08r+gpzgKEW8cGN/qzA
	oyrA2YNlWQnG15ww8pbnUX3y4WuJIJKxjyEA63ni2dnBymi7fLu0IF7+qBtqwpACeNzuK8
	bFa+oyY/S+mZ1nMlRmAIt9ibHmNn7esTLN0M0TBBS6pGV+NkNbevxHM3K7TakszOpaMDLz
	pwMdQ3xautJe2jmo1ZecklsQQocW9+wFNsFFs6wHBkepSEhIVrL0i1OOoH/O7w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/5] arm64: dts: st: Fix PF7 AF10 comment
Date: Tue, 29 Sep 2026 21:39:56 +0200
Message-ID: <20260929194035.496244-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929194035.496244-1-marex@nabladev.com>
References: <20260929194035.496244-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124103_580913_39C53AFE 
X-CRM114-Status: GOOD (  10.77  )
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

The PF10 AF10 is ETH_RGMII_GTX_CLK , fix the comment.

Fixes: e2fce4620933 ("arm64: dts: st: Add pinmux nodes for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 75f516b8d6af7..674d30dac4d09 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -244,7 +244,7 @@ pins1 {
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
-				 <STM32_PINMUX('F', 7, AF10)>; /* ETH_MDC */
+				 <STM32_PINMUX('F', 7, AF10)>; /* ETH_RGMII_GTX_CLK */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
-- 
2.53.0


