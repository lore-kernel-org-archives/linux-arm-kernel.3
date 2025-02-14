Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FAFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgEyqFY0ggO1m5tJDRWEGWeR4vjBMYw3yKlVCYNni50=; b=UNzSxcalZS0SiS08uop5P8f+Jl
	YNNRbIrdU8xYnsO/+7wMP53MuFo1XaI3bPmJKyioDClMx+q88LL6/lAIjpVcyOgPPJDOq4Ph89y0Q
	XltlkPmTIs/A1mlkkc4uGUfzgdZ0NG70YIe4EVtEld7HvxmDtMzE/OZC4P/kg+9zjUqa+/CzLqJ7z
	CGhSH24igFcXyM68Az2OYj8LANrL6SF315VXDC42SVt4xx4fHog/SH+Qt844TEHSWKsZjb0/IfNOw
	hIb1SxvdGidgG+Yo4F5K8jkCfR527Wzf6arR7drNw0/XY8PezxJbHsjUBmsY8F22MwPOvZJuGiwdu
	xYxRSNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0A8-0000000FpdE-3IeP;
	Fri, 14 Feb 2025 18:11:40 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizS7-0000000FheB-2jzP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:26:12 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=QkbdHz1QdCgSpPWTSSzdDhcQ12Mpzb59utA6h91owRHnT2MAWOnphp8Z3LIoLu79ypGbRkbZ910EeX7iKFLePZ9wWOayYNhdXZMDajXAJrJtDC7t4jJDAF4T+1BAlVasLG6DBkUfS0eYu+2P+w9tHQr/jhBz6zsK+zxwEqxPGiAPTdp34w7/MhfpL/epyVP2sOrkBqPmRIaQD5ge8DSUjUcRY7lg9qA/p/Waihfgj1ocELz2xrXYA8W3R3O8Q+2xBuhLgnKvbBWa34sEJkLFK18nh/Emnza3P8BzyIz8TTNlubGctmnaOglQgZ7jM0ScsVWsJfwI5Nuyuyki9AhG6Q==; s=purelymail3; d=purelymail.com; v=1; bh=iDXXbPWbID8m8JbMx1nJgBGgKzWTYtFCC6JsMVbw3I4=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1457029256;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 14 Feb 2025 17:25:51 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 14 Feb 2025 18:21:07 +0100
Subject: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-exynos990-dwusb-v1-1-d68282c51ba8@mentallysanemainliners.org>
References: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
In-Reply-To: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739553946; l=1219;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=iDXXbPWbID8m8JbMx1nJgBGgKzWTYtFCC6JsMVbw3I4=;
 b=0CiJOuWyRSYcOvfmqT1w7uVi/46ykMVj0zRaUAklcpxVMoDlW9I9IdOuFpfRff+c4Z+DMXIob
 vBNio8EOCWBD6N76A5sGD2D0J0u2lDqr8AnWPzsaJgdg07rIrYlN5gY
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_092611_776390_1DA6CDAA 
X-CRM114-Status: UNSURE (   8.24  )
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

Add a compatible for the exynos990-usbdrd-phy. The PHY is compatible
with the older exynos5420 design (two clocks) when running in highspeed mode.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbba7674f6cdc402f18ff4c505bd8760f6..b9ba92b8975d3e88162b938624558b3fca9f4faf 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos990-usbdrd-phy
 
   clocks:
     minItems: 2
@@ -185,6 +186,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynos990-usbdrd-phy
     then:
       properties:
         clocks:

-- 
2.47.2


