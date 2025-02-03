Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AB2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj+Hd6qHAd02Eraile0qsk3YHfE0Titpbw0RVullaG8=; b=YVlgFPBKaWEaQAhasToIJtifMW
	4o9WMsU9QML5SsHKyASyM6OsoUtTs/gaqaWKxqOSeNHXDmZJxe9/cSx7qrQLXFgchJCQha6OB7D15
	L2LJBTIVRxr2HM5UNCtJXL5XZNqUJZ9Y1yJoh5V1TFY6oBOHO/RJxQ6/E1vNKCpmmZmedoFSAAIGw
	cRnWXPO6d5cJSD+X1DGcEdxrFRyt5bPPXnOY0MIlO6RTNla/gozkaw3b0Sg+m40yv1w6aDqH4bmYv
	ZwJfHgTyvOGya5ADd68u2W2WtLAcyfhfKrdU3/Gsx8BdeywIc9jvDLNNulLb0Qn4s9Q1eD+PbS9nJ
	wIBOeFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4GR-0000000GiJV-2CzY;
	Mon, 03 Feb 2025 21:45:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf38x-0000000GXWb-1q5i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:34:08 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8A9DD25C13;
	Mon,  3 Feb 2025 21:34:04 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMYPy9vqYCm0; Mon,  3 Feb 2025 21:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614833; bh=1I9Wdu1ijHTqdP+YNCWicSgLuWPmphWfGZGAkOEBPuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kp4wPSX/JOfTPnSJIfDtZhkouaVLxgLESLPKibsGkUjB1ksCS4EIzAEvILwCbZ7Ou
	 tNOIG+72y4wckgfB8k41Uk2NVqNGZ3FVBGBJ7W4iNhGScTOyIoLeXgDCMHcW+Wwhrv
	 /KBeD2s6V/3qOsL72VKJA/bGnLFV+EmqFGvhTWGOyIkT9IKRp4Uwyxl8P3U4cxjKZR
	 SpdtMb8fDeD6K9ANEJiaU+aqK4aLGPuKSYn7d8UWvhqXxXn90hWMVPtyFwmBuuo+NZ
	 ebwdbpahM191kvPV4Lg25nWOWQ7nE+pB+MMi21giTBdtOYfHRD4CsV8be7qdaz9JIG
	 TI3OSZmTOtAxQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:03:32 +0530
Subject: [PATCH 1/2] dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-i2c-v1-1-63d67871ab7e@disroot.org>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
In-Reply-To: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614819; l=989;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=1I9Wdu1ijHTqdP+YNCWicSgLuWPmphWfGZGAkOEBPuQ=;
 b=X96D5MsTJBeUFySAa/G1bSu5VuELN8KjWD+sQ8UIgvan4jxn51Qo6bBOTpTsnAklvvrWboGgi
 BbPtOLJTpy/CC7fMCmEaHFtX12s38j5bvEUDIsrRb5kyVVk7VJ4SNs1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123407_617677_0EF288ED 
X-CRM114-Status: UNSURE (   7.96  )
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

Exynos7870's (non-HS) I2C controllers are entirely compatible with
samsung,s3c2440-i2c. Document Exynos7870's compatible string
appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index bbc56848562721d206fe4d72c7c103487d11f7bd..6ba7d793504c8cc3322c65ef4aae5ee720e8baba 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -22,6 +22,7 @@ properties:
           - samsung,exynos5-sata-phy-i2c
       - items:
           - enum:
+              - samsung,exynos7870-i2c
               - samsung,exynos7885-i2c
               - samsung,exynos850-i2c
           - const: samsung,s3c2440-i2c

-- 
2.48.1


