Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0679CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EYmoCYPdwrIiDvkXBVlYW7h5hQR6wXJyMHWL+Q5bWQ=; b=hQQ9eODJntQUTXqUBkJpBGmfPo
	QSlYR5Ykij8TRTlXeKYoKckNaErZE2daCI/51tS3jseDUhK2aqCIVlpUSlO0whHXvlor4rFoM9pim
	JzVNx4ydNiqzguSBEvy2L2QDlGN/LE1dC5a40mrUD74nAS6AYBjrpickp/27xv2757CkQSPg4iWN7
	USQ0mMrPBDFZSErOmey5c0Us1la9id7xUPrkahh4ac1x7MAB2dot599ZSAh8NW8ss0OMds5al6mDz
	JbwpquG5FOhuuk6taTV8eHPW53IRLRIT5Kbsnmse5EI53um8IPh1F0D7qlLZfsIFCsxvWxCVQwtWp
	szzvLQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTdC-00000009eH3-2Cne;
	Tue, 18 Feb 2025 19:51:46 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSsx-00000009UUK-1Pqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:04:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3151725F0C;
	Tue, 18 Feb 2025 20:03:58 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FH0AztNAEVIX; Tue, 18 Feb 2025 20:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905432; bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=k01g4yoQ4hYZVvxqE/vfYpcVpJ+Plk1iKI7hHz/gD3wbUlU43AfQXlOT5LXPzqUck
	 faYhsAEWj0YitGoa3cT8UFQ34IZ2Y/BbNMLdslktxA3mw7kNH1qHg7IFa/VxR1sMG7
	 NtZAmChqrHLqIRYM4UMjB02fD3EwsAhd/jvrUgFV0cKcGr5xryJ77OGS/hiA/kmpaw
	 kHFvG485BR3oPajS0dmjIaBbYLtOp2/uYAUmFNdwja2sKumdqxhX8xV40cXce8ps9c
	 ifihKIIEacg1Yd172NE9179/3uZLXDBOIh9n3TtwGs5hduRLHTlFeFVLhe7jyX6+iX
	 9WAAQjzAwtADg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:33:12 +0530
Subject: [PATCH v3 2/7] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-v3-2-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=1423;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
 b=ZomranXZKYALnG6J/QaNVuGlIwaT3myYXLshEsI3IljEC082ErbTPZTuB4633rSeGNKgL/Bih
 Pi9Gqu0lvLqD03KpgC0/cZZ462rJJC9VliU6JTT3hvVpkm60491PtDK
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_110359_513633_80C5EBFB 
X-CRM114-Status: UNSURE (   8.29  )
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
2.48.1


