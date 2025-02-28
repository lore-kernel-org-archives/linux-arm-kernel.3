Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88601C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YDy7kumdgOz2ZcL3FicebUivXTpp2oncj1wRUB1MyI=; b=twQIYMUoUeUTGEAt37XgNbmnMK
	9t08zrgsyo8eKmKCi09d3XrP+NWZuUfF/Tze2Uh7jLqiyEwdtV/xCrJ8ZkpE2v/DO2qEuioAXIPg4
	vQBpwkk5TbwzwlUUJbK3NunnSsP7F1csWY20Ua+OTtT9CBeP8Y/a/PvoAKf3+MtZFXaHeA2sMZi0l
	EhFw7thlG1vE+Jspe1Qyg9By1/EyJTYDDWdYLJXEnAXgD0mKc//u0fYQRyLLQtxe/LU73ghzRW2o4
	Mc1BKXgA+v892yjCBKKdzyMOu2eOCE/uBiogb4lUdFXMNI+U57r+jUnAjjRIVvFaFHeT9FcxbtwfZ
	qo1PSlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Dn-0000000CODS-14E0;
	Fri, 28 Feb 2025 19:40:31 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to69H-0000000CNFS-0hng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:35:52 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C98A623CBE;
	Fri, 28 Feb 2025 20:35:49 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAI5XJyzXteh; Fri, 28 Feb 2025 20:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771349; bh=3KuArGVEvNRiF+Sx4ok5DbT4miGuSlGV6XyWmQsYKeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R2j3qscTbNqtSJnrV1lwH8SSe/BOYhBxDSoX63lygNzOetFdWbcRbYVTtvLJDlnVi
	 859WKy2u9CJOgQiST14jg/R/pjGnYjkAntWMbm7gVtDCIz1hE11r+9bAWVs5hpPow5
	 RQq1UE3PAV/go6h+Do0HKBxLAklDLF3IX5Fq4zJjaYoIl1slQ6Xg6MlS8Rsl97lVs+
	 qtDVE6uljRnHQo34kWFeeqVDWmAkdpf5bM1TTDfC/hBDR1UCEoM1lFNq1PLiJRfUkZ
	 4U2aYqAOKTuu6WNpe4NtCHjzBcLoyhNNkG8vxjjifBKHXEZyV8pZUIJoSbsM/StAj8
	 F7Qoa9ssLo84A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:05:18 +0530
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: samsung: add
 exynos7870-wakeup-eint compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-pinctrl-v3-2-ba1da9d3cd2f@disroot.org>
References: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
In-Reply-To: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771331; l=1398;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=3KuArGVEvNRiF+Sx4ok5DbT4miGuSlGV6XyWmQsYKeI=;
 b=E75whbAQuAAqa+a1e5qsB15H8Ie3vBI9VrEVwpXU40NAwmVSSPny0ws5uwOVa8Nq6u+bQD+hF
 1eC/Uxj3pzSBMz64kZmB0ouoz8T1ZbUIO7Vce2Q2qn0RdcvSamQZzjx
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_113551_342146_5A824014 
X-CRM114-Status: UNSURE (   8.83  )
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

Exynos7870's wakeup pin controller is entirely register-compatible with
Exynos7, thus document the node for Exynos7870 appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 64db551d89da6290b7ae9d089f941c905e0e5b16..0da6d69f599171b6946992c036f23c5dea17bd0d 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos5433-wakeup-eint
+              - samsung,exynos7870-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
               - samsung,exynos8895-wakeup-eint
@@ -105,6 +106,7 @@ allOf:
             - contains:
                 enum:
                   - samsung,exynos5433-wakeup-eint
+                  - samsung,exynos7870-wakeup-eint
                   - samsung,exynos7885-wakeup-eint
                   - samsung,exynos8895-wakeup-eint
     then:

-- 
2.48.1


