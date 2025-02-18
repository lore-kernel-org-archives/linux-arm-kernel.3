Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7647C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFNbDSvonN4WFxLQJWdjYrryM43PzgDIWe34eUj0cVg=; b=jm1FRxtvqeEClbmqrgX+zIuDzC
	5DX4o9UYHpc6qlt10EqJBkc9vEvgVHNURyVoGgVgaistJugmL0RfT95QQZd4qwaB/H6pG18Mg2T5d
	9Jm/Selahm8RO5B3xQlEORusXwIiMESUBUXePTaVkkOM6+grn2zq9EhRKV627kZSsFc+XFesr4jAg
	r8KsQigt+/onbLZrjiIWV9UllomVMzBUf+71JMpe1dhJoCDDMXjHfCRm91r8UjUOi/qN/Ksrrv9a4
	fq6ly0CAIqobjyZLYeUqkH2PQR7udMSFabbcZFkuVYIKJUm/erj8EuoHVkt/eBzTDJI5uht2qSLYG
	w1TlJH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSvr-00000009VAF-3YO0;
	Tue, 18 Feb 2025 19:06:59 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSeq-00000009QaW-0V5e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:49:25 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DDC0A25238;
	Tue, 18 Feb 2025 19:49:22 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqiXdv9AIdxT; Tue, 18 Feb 2025 19:49:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904562; bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IlJMKq4Yf7gYetl44r0zibkUyXH9Wryp6hje63EkHTi3r38a33rGCyqns3iZfmzhM
	 ew1O4nEr2F4xI2ToZhpjeymaAhU/viEPAWG75jiMpmxocnGLncDzM/2GdJFNYP6O9H
	 GFm7TrJSPOH0ydvENhDEq8/AtVxtraV6qC3cdk5D8AEoYbwonNxz0wliVn2lAXHNOQ
	 NTr15U4D0WY8B1f17hOCtC4PYyS99ndQZiE+rcVxI7dqYuFG89qESqSOL4bo4tg2Bu
	 N/jPzY+3kjbCy5/klZibE2GCebAoxllskI1ilPFOLs4UqeRpveV0AGGtugyaBdnj1e
	 tLlserLvTCfoQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:18:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: samsung: add
 exynos7870-pinctrl compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pinctrl-v2-1-1ff9b10bf913@disroot.org>
References: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
In-Reply-To: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904552; l=955;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
 b=QTyjf6f7xy381oruV4xUh8JPcNi6jnDJi9b2QyosU1Si6+CJYGOyWKAOwNgT0e8laUX0ljYbX
 twch9RwoB4iCD0WpJPf1EeWrHwduKmsBiFtFOifqpafKZ5JoCvWLuYw
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_104924_294400_23C74909 
X-CRM114-Status: UNSURE (   8.12  )
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

Document a dedicated compatible string for Exynos7870's pin controllers,
having 8 GPIO pin banks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 5296a9e4faaec691994cd567bc3805f870aaebf8..bd7e04a108ce03a86f062b515306dd785189a537 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - samsung,exynos5420-pinctrl
       - samsung,exynos5433-pinctrl
       - samsung,exynos7-pinctrl
+      - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl

-- 
2.48.1


