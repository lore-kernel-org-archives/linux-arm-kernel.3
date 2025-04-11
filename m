Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12715C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8Et5eWZEtefk528OTt+njhJWf2f+nt/4/VZsysfgUI=; b=pxJ61LY0UShMxA9DgKiVCaj/X8
	aJsbrpGySvkdmBwOSHuMjd4ZMuT03wvE+m+FEsGihjCaYSWa5R1vVkWFMnuV70sw0aFXRsOvnWTo8
	gFLFDzuK9S1dUpJwKjRAKswMrSKeP+mTEQpHCJJtNkZbYESuC6d+BgQeSofFmQ6Vg0ykPSLg7jsJj
	GT7nCDnVs8akJvBb1bvWXIxVwlbD1LidNL7d8WDPNCh2CqwFLdKWOus73BRW8l/Rg56bpQsLgP8I0
	USOOR53VaYqEBP+tGh24G2zr6xKJYh3/wP1PkFJ9bwX4vvXywsh5xz85D71b46ugVlZriu+yPsN1Z
	gV5c+zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Hpa-0000000EScO-17eV;
	Fri, 11 Apr 2025 17:06:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Hm2-0000000ES08-3Tms
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:02:40 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EDF6B25EF5;
	Fri, 11 Apr 2025 19:02:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uj5Ld-3HANVK; Fri, 11 Apr 2025 19:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744390956; bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F5vPahNg/nAYYi1lVowWzm4EjJ0fnt0pPdSfACZCfyOZ74ZjHqF+ZmA/cdi2m4Qtf
	 Kp1ih0QCLg5cRmbJz5/QSPpXqs19k/9Mi3Vc9kFtyvnJvj1QD4OAi+X9aADtiArdqb
	 OlgUWQtlnhC9YV+qM3oCeeW7bGNY+64VfYQF5C+eA0YZ4d79TKde06oex5/eL4cQke
	 xzfRfOtmrciuYJ4wMNQSiSn0oYpkFTYVb2NCiOgksMdormhBQmSxy/uX2GapZ1NxyU
	 uBn8DVyLKUthP9q5lS6+MaT2MUi9SmYWMtqItZtSxUGHvBBLyHNKfcJiVa+hnfcZrb
	 2XnWb4x0XA9fA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 11 Apr 2025 22:32:15 +0530
Subject: [PATCH RESEND v5 1/5] dt-bindings: arm: samsung: add compatibles
 for exynos7870 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-exynos7870-v5-1-fa297a7ce41a@disroot.org>
References: <20250411-exynos7870-v5-0-fa297a7ce41a@disroot.org>
In-Reply-To: <20250411-exynos7870-v5-0-fa297a7ce41a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744390944; l=1423;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
 b=n3DVVdTxLcOTPgeGPZDGzqWPHizT6+up66cJ7p48g5MmqPz0kcKuLTLB3I73LdCZdUkcJpJJG
 4Nok1mGLQREBXL4/Bznaj7+k9zj+a73SoqMiXtJvPmR8atgTJpj+QK0
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_100238_995845_B02D045D 
X-CRM114-Status: UNSURE (   6.90  )
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

Document the compatible string for Exynos7870 - "samsung,exynos7870".

The following devices are also added:
 - Galaxy A2 Core       ("samsung,a2corelte")
 - Galaxy J6            ("samsung,j6lte")
 - Galaxy J7 Prime      ("samsung,on7xelte")

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d8e62f5ea75bb0819a9d514e54f88d3c..b3be184c7e563478aa37eb16a69c08ff7f70af29 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -212,6 +212,14 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos7870 based boards
+        items:
+          - enum:
+              - samsung,a2corelte               # Samsung Galaxy A2 Core
+              - samsung,j6lte                   # Samsung Galaxy J6
+              - samsung,on7xelte                # Samsung Galaxy J7 Prime
+          - const: samsung,exynos7870
+
       - description: Exynos7885 based boards
         items:
           - enum:

-- 
2.49.0


