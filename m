Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2F0C531BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu0m+xAQAt0EQLmRWMyPn4FwJte4pJSptUN/+z4Ekis=; b=jMFP/1XBtr96uwEKJFrQ1XfZtY
	tDCDVcPNVlC1k96Bk5zLcAJQG5tJN7+Wlzw3crnR8jU2lgMr8FUPBRyxZMDY+1la44NQVZK/MVvuO
	1/XkNUn8UvAGEg/aI7XFTp27dqdXspIM13LU37S7ikAG7EpDDRQGKt9jTxRKa6blcnd3UNdBn9nou
	DI85x73S3M3WH1pr+MFgqfcNmjsBq2E7SjIwKO2NJq9MGNZK9MZb6NMdT93oQbMBhLvreW5obL0JV
	Vg+nw2mS1qyw0ZFwrfKHDEPigmLyTIJHQ7xt1jnK/ZNOCJ1tCySSILfPtx17kTJsMsK4qM/LTvV0W
	rQNr/nOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdnf-0000000Ckko-05cR;
	Wed, 22 Jul 2026 20:44:19 +0000
Received: from mail-106113.protonmail.ch ([79.135.106.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdnb-0000000CkjX-1rll
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784753053; x=1785012253;
	bh=Qu0m+xAQAt0EQLmRWMyPn4FwJte4pJSptUN/+z4Ekis=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ode5UeJ5HjsK5Rud7ZUu7Qq+7LjrW8uNG86MpYCDNqhw/71dG3ViAN5PL9wePcn6u
	 K/qM8q5XrSsnPVzXjJjei3GPsipDvgtMoWEcPhpQd5PntUEmDhekQj8WaYE1++9m6T
	 QQmbF6mfFpHKB+Jy7akk4NS5X7sAWzZnQyzpPPMGgs5E/PXeGXlXNR697LscA8UKrG
	 E6H6Mz8bBC47CktU5l+23zM2WmDvVQ+xAGsLQrmKjESWGaqRxp8Ot0lfcEUFVEX2py
	 sxqYzBfqbgI9Z0Gd2y+AuddbAzIA+al2vay3nkBrf7OYPxu8oOvIr+1+cNm0OmVaql
	 45R4xE9XAiDxw==
X-Pm-Submission-Id: 4h55p306d7z1DDp7
From: Alexandru Chimac <alex@chimac.ro>
Date: Wed, 22 Jul 2026 23:44:03 +0300
Subject: [PATCH v3 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784753044; l=2259;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=nBnT0ILRGS71445iQQ/k8sTjno21gC0qcL7Lqu3ZheI=;
 b=KhcjUlCc3EaKNQtUETeJwzjGEcuSogP/LFdwuPO/hcUQlVvT0uMEg7j5ScFX6SbzcUMlFVesD
 D/v6Zbsf6bjD+mtwIojkb7zVkTJeS0el+WlQAktBY0QnOjNEeE90c9G
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_134416_148301_1C68968E 
X-CRM114-Status: UNSURE (   7.25  )
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

Add bindings for SYSREG nodes (required for ACG), compatible with the
standard syscon driver.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..eb4194cadcd7 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -35,6 +35,16 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
+              - samsung,exynos9610-usb-sysreg
               - samsung,exynos990-peric0-sysreg
               - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi0-sysreg
@@ -107,6 +117,16 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
+              - samsung,exynos9610-usb-sysreg
               - samsung,exynos990-peric0-sysreg
               - samsung,exynos990-peric1-sysreg
     then:

-- 
2.54.0


