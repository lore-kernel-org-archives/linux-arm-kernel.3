Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3EEC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VprmkKjXDF4WFlHK8vp18iRUV+cCxsqzjwHJPu9bps0=; b=MTYhtIaBfpuvJAUX5QX9G+zAEy
	oJEJYMpLnCv6thzWwcfvm0GPVikEzWcG/hZ9wo/sx2awW4GxgVc0uBblBkqtwJ29Hde60KxaURVF9
	+nBV+4DAfzmqXtpwMDYrm5e+dK5qO7sjs3FFC9atw4Y2A1OB/Fv/uo7/SsMUF3GzEIvGBc0bCd8md
	+iQwQWc/ytVcXhIbZOOM+lJa8On2QZIOJIqG0kL59CiUqQ5TNy/bRMWHHHOnJukZiYLUcZteY7d55
	q4V3Vb36UWYfVDoOHeQkcGz0sx4QuObinjjVX+PEtKWpyurA0b7Yy8yuXLdPdnQcnPoHGa3YKlCq7
	UQSk0mVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6UU-0000000CS6h-2m3h;
	Fri, 28 Feb 2025 19:57:46 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Kc-0000000CPNb-00LE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:47:35 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C28CD20536;
	Fri, 28 Feb 2025 20:47:32 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGyQIZGVotQp; Fri, 28 Feb 2025 20:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740772052; bh=beBhUlHl0wuFADBGaftFUBbt7Uwjjv/r71KtaFB8z1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MAkmFfjbk83jjlVfaV5y43T+h3YaZJrN4Of+CEUF7dx2PZd5lXr5ctGNq994+eHrQ
	 hhCaqf6b074O/VvEIOUUrdGf8tcD/ZjgnQkeTZeOIeYMMrlp1mzHmd9IUGbYHQymW+
	 BnYAd5yjSnWO1AEO3WrFq0M9zc8gOqjhn+jyObKIyv7sNxcuev6iIIB4aUzNYK67Cp
	 HBKTY9oevyCjdMkERrkzo8/YyzM47XnxGYcQAgsIal9MWzTlIXuTMM8wHk/9tndFrN
	 JGpBmTJaSoagWANiXZxIUwJdcE5rmzgGphx4uyo/WdT1FfwC+S9V/52ZcjcNMDUl2N
	 0+NsrNtsns/Og==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:16:49 +0530
Subject: [PATCH v4 1/7] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-v4-1-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740772038; l=1061;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=beBhUlHl0wuFADBGaftFUBbt7Uwjjv/r71KtaFB8z1g=;
 b=eNJrUrkiBb3wTtdij4IU6MnmCdHl1zoHgp3a/nriNvNKRtZoG8qTR0dbwf9ODhjSkIKTivOu3
 Z0h5atWPFy8DCPXuLMpcF909lz+hNyXTkD4BDck7Z/KJagmndDXcZed
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_114734_173736_3B27B0C5 
X-CRM114-Status: UNSURE (   8.53  )
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

Document the compatible string for the Exynos7870 PMU. It's compatible
with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode,
as well as other system control registers (i.e registers for the USB PHY).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 26bdbc3e2cb1c52a5efbc64b18dcc20fdfa6256f..204da6fe458d2d4bfeee1471ebc5c38247477ae2 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -53,6 +53,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos2200-pmu
+              - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu

-- 
2.48.1


