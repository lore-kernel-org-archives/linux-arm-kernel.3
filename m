Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7432CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFNbDSvonN4WFxLQJWdjYrryM43PzgDIWe34eUj0cVg=; b=XCNt3tsu4ofLvb6nEYRkWRCvBG
	3s3ksRA619GIASJygc1kCC6DcBDddU0lV7ydMYCSVn6NzLrQirJ3/fV3a7fxZbODySOcbgjEZta3O
	Tf5DY8l5jyr8oJnFGk5qP7Jo6KV2grmL8CXj2lRoHxkkZV+yyLWs4P7LG1GIBujoRqahxA1pjfedi
	3KHF4AgIhQiqZkRIRqhAkWZfb1cwvTG2hkv4ppWc7pAaJK19+ao3QEODVND//jJusnAoUWT2L21IE
	WFQt5ePScS9KYmQp4nh3oQYUvlGVJj8s8Vpze7FvOyu1oFZGpXnfy7YjaMv0YaXswIs5N6DlLCN5v
	HwPfQadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3N7-0000000GaNH-1luV;
	Mon, 03 Feb 2025 20:48:45 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Ap-0000000GXwj-2Pco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:36:04 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 349A225BA2;
	Mon,  3 Feb 2025 21:36:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY7WUBvz-TSF; Mon,  3 Feb 2025 21:36:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614961; bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Eu3xLt+Ie8n8/VAoXLQYQA16ehOHiV97RnZOhbWSMmqcTCDP6491piXY56+UYrB97
	 HMQehOMQylHqRMnlfWoJGMd67L6uOzkSuZWw/C85tP6CpgxX30/XgX80OAVPITcT9I
	 S69drDop9L/DMWd08LILVnb2WTmpGaPMGN4HbHtBwG50+/YpoF8UQF0rFxxDMNFI6G
	 h+kJri3xfsp/uWom/s+liATh6rQJKtTl6uUMmsWzC2IHtH18Jckd87VD0S5/h3sP/T
	 FRl0O+rrREqKn5JKk4vUeNW+5vG9bNVThVuQUoH0e0Bxyp+pamP+mpfWw66RLmutjM
	 +CD+P5ynaPxmA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:05:43 +0530
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: add exynos7870-pinctrl
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pinctrl-v1-1-77b9800749b7@disroot.org>
References: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
In-Reply-To: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614951; l=955;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
 b=NWAuP1IB3NJ/GHXlWqRoK1gI7/0dpwKwcGdirIJLX90VccapCbSzYHKuxt9oHkjxDXT6LyuKO
 ISnWvJxs0t1B7ZiiKT97fQqRg+3Rlk8vI/v/okuwsO8yu8mYJTLNwZU
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123603_750630_19DC388E 
X-CRM114-Status: UNSURE (   8.05  )
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


