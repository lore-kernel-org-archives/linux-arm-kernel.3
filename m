Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D9BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juKhpwPkyj+apcj8cVAN3J2Hq3na0QmWLq7Zw6ghI0E=; b=0Ao4QvLXUTU1ETlrK76ADLGgZZ
	edaH8yeK50/6loLTKMtZABATkGY6jk1fuqy1q0O/FRFfa6OZkL5pdHS4Jpbk3E76FZ2wFiCd/Fz4H
	zemXiu0lj6gmcOJI+UMFWeWX6fnJaGjZeZDGf/uI5X6S7r8e81sj+gTK+QRkAKlEgpwAFxHNDx/Jc
	USm6VLrNotrvuF2Fnj8OrgPf1CTnAAtO8VoczpAmXpR4m4fMdbXUw1I1Xd5M7oRWq7L1pXpnOPM7F
	AcaOZAcu5sXNv+xJ8xH+yUW6FvlAM9rDqGRrbJL8DYcZ5NJohM3HXJzDPSTD/02Cyrl1ki4DuYvk1
	oPdb27Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGHK-00000003pa8-3YmN;
	Mon, 17 Mar 2025 19:37:38 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGCS-00000003ovn-2Jt8;
	Mon, 17 Mar 2025 19:32:37 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A691025B04;
	Mon, 17 Mar 2025 20:32:33 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4UYrp3MsgJb; Mon, 17 Mar 2025 20:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1742239953; bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ssw9b4EoFYYLM4IJZFbeNpVc6ZWkqnKj41E+gRdEqCfiX9xJUNWtglC9EKaUDtzV+
	 cEx+7mX8ijTifWJhSZuXnNbPwq7foYYbjfPGkXcDxlPDABaRqQjBkSPUo5RPxGOhLr
	 +QyNas7LFmutPjjZJ5NSxs7ZNOH5jMGlX7TAhqke6Suuw2SB0V4f27PNbqw/TzKnss
	 hhx0IgTnO9DMYVdi/mOBRh5o7mGBuamzuQGUXsuhyvL2Z3/VXcUM66IqDYcwm6Ziio
	 3s51xalbx8g9M0765hJU+lLjYQBlvcNkurzcGZUYeI23/8STvwUwolUWPc1NPdZIAE
	 z0ALRacLmueog==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 18 Mar 2025 01:01:42 +0530
Subject: [PATCH RESEND v2 2/3] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-exynos7870-usbphy-v2-2-551433b1b27c@disroot.org>
References: <20250318-exynos7870-usbphy-v2-0-551433b1b27c@disroot.org>
In-Reply-To: <20250318-exynos7870-usbphy-v2-0-551433b1b27c@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742239924; l=1340;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
 b=KGzHYuNPjdssAqPwyWTyQ84K0J/g3cwuPdpFDLXAzdA5wHg73uQcncHxjkPMB+z87tEBCg4r8
 iiDITp649+uCcZ+AN2mj4K+ElCU8DdRvKmurhDa0iX5V5+nRdnCaQIG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_123236_732120_B5D6B28E 
X-CRM114-Status: UNSURE (   6.76  )
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

Add the compatible string "samsung,exynos7870-usbdrd-phy" to the
documentation. The devicetree node requires two clocks, named "phy" and
"ref" (same as clocks required by Exynos5).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbba7674f6cdc402f18ff4c505bd8760f6..fdddddc7d611364ce17870b5b8963b5a0c0c9668 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
+      - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
 
   clocks:
@@ -184,6 +185,7 @@ allOf:
             enum:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
     then:
       properties:

-- 
2.48.1


