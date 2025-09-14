Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D2CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+xJKNk5JY17fob/Z1mGipjlu1Tw15TGNfmIUUFMZBc=; b=4myD8CSseWbbe2WQx4hncUm75N
	EX65SQ+7sDQrXz/GLK+Vb61l/Pt0lpAPN1p3iHlM+Svd0wGlftYI6lJ0EEyo73cTCpMsEG9/kzOks
	4mIrT5f0zosJ+WoD0GmTyjCdXkKHn/xCPrvcY8OQ2kZdzbWmEL9Qa+mpOLJDDkm9YfH57ZM/zNBuc
	tB4GenjEUK2gOBgFFFbK+bNQ8fuu/MTE/I+h3JWKYxCrsjHO6LXEIlrIt0iJeF+hAnJDjQt/Yrz77
	F6+Id+Btt9icCIe7HnmV2nrLMg1jDq6wFnBMWQ4a2hsMT0sM+0cffwFZlpe8NJdd6LDHRLsljr/pV
	SrJv7EUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsUo-000000023Zs-0IP5;
	Sun, 14 Sep 2025 19:34:46 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsUm-000000023Yr-07QR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878481; x=1758137681;
	bh=E+xJKNk5JY17fob/Z1mGipjlu1Tw15TGNfmIUUFMZBc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XZN50oF8Qh12FYWKXsXrL1uoywEBL24DVU8/X/BPINIvJe4Lk+x9aM2GrpD+Efqag
	 A+jW9jPemMx3yzWUtaNdRWq6doD9DII1t6XUbwtK/8D4WBOXxb2m1mE7aj463b+0B2
	 SzI/TpkdegotG9aB/YS9PSFep1rZeIah+SapcJ38B0SthBRqudCvbJZ521dDlYKcTg
	 2s3rBoX9yUi7LS8TrftiN4SCDMclS1OWhjUw8tsCL0qAZu0FTU53RKvbhxws5Dowcr
	 ghjiKWtbPocHyhtS9QxPWvcj6TaxQ7+fCtv4Mik4/Q2+qySm4BOORddn3HoIbu6Z8+
	 2lQvt7aVeQ72g==
Date: Sun, 14 Sep 2025 19:34:37 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20250914-exynos9610-pinctrl-v1-2-90eda0c8fa03@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 3c75b62b02e9849df976c000fd5158f746a985f1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_123444_214870_92AB1DFE 
X-CRM114-Status: UNSURE (   6.59  )
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

Add a dedicated compatible for the exynos9610-wakeup-eint node,
which is compatbile with Exynos850's implementation (and the
Exynos7 fallback).

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | =
2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index 0da6d69f599171b6946992c036f23c5dea17bd0d..fe06c0d2734960d3fe57783c1c5=
28f58fa297c57 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
@@ -123,6 +124,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
     then:
       properties:

--=20
2.47.3



