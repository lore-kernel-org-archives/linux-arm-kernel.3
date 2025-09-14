Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D037ECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 20:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k2wvUidZXGm9nxO170X/NIchLZbbnseGG9mmcEP+hU=; b=g8QblwM94DJnYsq8ksHeSOcoTN
	xxfAvmMbrYV9tNgaHjiQbtUWzB/M/mAOUN5emI6iZSCjdofmrLFY9U8S5vqlL3gsoHl4rj16U+fRI
	fiUvCXd3gn2ECrkMLVYXD3JOUESJC+g2eVm8RLs5J3EFylNeg9uFhje54dXHXnJu6nSr91zVFIghF
	uRcDfsnOLb1DO0pfZsIL0ZC4a33ecGK22Yk8ClLkY/AF1K44n4z2MYmvMeA+cJCeGqTuAKjggVfrO
	YT3KXG6STkvv1PzZDeQ9B9PhDSiR4dB6kMgZAN9vYr0fCEDZtFDIXEprmcC/SuRYKGAjx88DAWeTG
	Om8h6DTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtZw-00000002B9l-26O9;
	Sun, 14 Sep 2025 20:44:08 +0000
Received: from mail-24422.protonmail.ch ([109.224.244.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtZt-00000002B8h-36lw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 20:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757882643; x=1758141843;
	bh=4k2wvUidZXGm9nxO170X/NIchLZbbnseGG9mmcEP+hU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bFFaJw94g3MktzhyjX0mxxW8xxGJ6ypjvj/EX34xF5UKDEYvGzvc+ctnpdwkArf28
	 +c/uBqggqj7WsGhWli3PvmOd82NAFXGFiRFTvZrFLth6y0okDqbdbCyPh9KlxZ0i9X
	 8K5iLG6g/lBR5yIaGgfhZeX6be1hNpCTUz4j7bDGq05BFhNhdbsW8LG0fTmKxJ5G5P
	 wwGrWFMIVytuihscOFjmr+OaRyDUas58yDqkOo09gDUkseV0mNdR9e83ewHobx1Hiw
	 mAXJZKRQId2Rr4gXBuBsEJI41rKzYueX8Yj2YO/splMYlnX0nuGgohRKWx7dWF1hqt
	 +a12CJlstN51w==
Date: Sun, 14 Sep 2025 20:43:56 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/3] dt-bindings: arm: samsung: Document gta4xl board binding
Message-ID: <20250914-exynos9610-devicetree-v1-1-2000fc3bbe0b@chimac.ro>
In-Reply-To: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
References: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 744824239cd0443819c6a709d341ab1acfd156d6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_134405_932390_CB072765 
X-CRM114-Status: UNSURE (   6.35  )
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

Add binding for the Samsung Galaxy Tab S6 Lite (SM-P610/SM-P615)
board.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++=
++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.y=
aml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index f8e20e602c2059c827ed6a7fab3ac0d8ae4caab7..ae926239f5fa434e409ccc9e302=
66e9a1c9a8546 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -244,6 +244,12 @@ properties:
               - samsung,starlte                 # Samsung Galaxy S9 (SM-G9=
60F)
           - const: samsung,exynos9810
=20
+      - description: Exynos9610 based boards
+        items:
+          - enum:
+            - samsung,gta4xl # Samsung Galaxy Tab S6 Lite (SM-P610/P615)
+          - const: samsung,exynos9610
+
       - description: Exynos990 based boards
         items:
           - enum:

--=20
2.47.3



