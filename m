Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A4AC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmqwpJz1YR/PMEdcKcKn2Qlhrf4Rxe9bCB0GGb/49Ys=; b=Zm71Uphc+zTdSv1m2H6le6poFg
	G/Ot2DpvLnEcIkRa/ZJDG5QrNtr3FW7geGt2YywQe8oKnsnoipKKctO241jxZWprNSESAzR+e3Fa/
	FWGP39Ia0qmave5pjssF5ZI+VXgClarB5WFNVi85+DixtI8JNHf+VxQvGpwlo4IbbRQiYeJLAA8wh
	suVMAb81OhIZSQp0h0cwJnAwIPYAxjtgPO51mrboefwsbts50i11FN647h3edWm7JkE5eAIgmC2cp
	aCtzo0PZ+lp/mXBaUcLGC/Z6TvUmb7BXQUDqirSSoO7ZNzs7H+xKNNT2x2Dz8GGanz1RUElwqXhoh
	Hm9FnVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdns-0000000CkqS-0sjp;
	Wed, 22 Jul 2026 20:44:32 +0000
Received: from mail-43171.protonmail.ch ([185.70.43.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdnj-0000000CkmC-20Ig
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784753061; x=1785012261;
	bh=EmqwpJz1YR/PMEdcKcKn2Qlhrf4Rxe9bCB0GGb/49Ys=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bH2OrSXHygKcQ3sOnemglt0ujK+OS4/SuZ71ZRBUeOwYrX/MeWDQ6ZeDdKM5JU3gN
	 Q4iwPacX0eLYlgmmbDfpssxbeomMRJRtXENn/F9399vFIvLHJ1kbxXBXWOUbBwU8nT
	 Y9DqNPaU5TcEwWtLbfitiRipPYYIop1dJd/G5XrwelTWsZ57F4UpX2tvsaXv4f4wtc
	 3s+ZfTwsfWe7QXPFBn8qp+LGswzSSKeabJexFHjCdZUMxGbLM0OWq+kLat2s4fCkKg
	 GQbon8I08YgVIcUTjXkmpKg2QwiE+tt/TRV5QBpR0QKOpXu6Iq4ZSv35/J/VKTGvcs
	 35SrjURk2ZCYQ==
X-Pm-Submission-Id: 4h55pC0Kw7z1DDXJ
From: Alexandru Chimac <alex@chimac.ro>
Date: Wed, 22 Jul 2026 23:44:06 +0300
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for Exynos9610
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-exynos9610-clocks-v3-5-c672a2a30889@chimac.ro>
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784753044; l=938;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=L0Y6Q2/mXax8wLebsU0Uf7PpUrBnWwEaQFaeO3rTmCs=;
 b=POl1ASevPmwdHD2e8TBn1/5zX0JKPNQzZQ5abz87692gNcJHarFOJ54PnQuwL3+eSEx91xxky
 akbLENe/kuqAebc0VS2fNt/69hfLAcjvrgVM0G8v20MgZVDng/YeJAf
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_134423_820417_C367CA0F 
X-CRM114-Status: UNSURE (   8.10  )
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

Add maintainers entry for Samsung Exynos9610-based platforms.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index be843bf82036..68f3c4fe2913 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24000,6 +24000,15 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	arch/arm64/boot/dts/exynos/exynos8855*
 
+SAMSUNG EXYNOS9610 SoC SUPPORT
+M:	Alexandru Chimac <alex@chimac.ro>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.yaml
+F:	drivers/clk/samsung/clk-exynos9610.c
+F:	include/dt-bindings/clock/samsung,exynos9610-cmu.h
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0


