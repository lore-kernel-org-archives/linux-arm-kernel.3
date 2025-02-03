Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141C9C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/O73Hdpo/o16cF59jBCW8m62osYEpXgS7K8nWpeViw=; b=AJ9fiUK81HYUoYjeqqAN9YYiSn
	B8/l+10RvOhCyibUcKU56tzedUZQMld1SCFBQ7KZZvim5zWegS60cH/flaxGBHkfKrxro3GDByUp4
	kOXmpW0WOkQ6No6dxDUZbHHehoBelgc9BZD/u/b02GQZn/AGMDMGxrheMoYx9vWt6uk23hEYIuzm8
	pgQFtNGGdhfMWfBWJxKSmPBvTezzlZTje+GocxuzPV4R2aT71RLv1C2oJeQFnfdAXHjnL8gP01N2K
	M5ofx8d8g12/+Ck08bA2SHXgzRlEF63G7y1rfSbFjZWqjv9z86RLkodxKBVCEep3/dBsiDlNQRAGg
	WdHm9yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3AB-0000000GXmd-32Jx;
	Mon, 03 Feb 2025 20:35:23 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf37g-0000000GXIY-1USy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:32:49 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6734125BF2;
	Mon,  3 Feb 2025 21:32:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMAJ8vHInC3W; Mon,  3 Feb 2025 21:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614760; bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i6zW8Oie9CpulE+0qQwJK1MfFkCVQGCNPCKDUAGFk7RmIJfhXGHgc/MyVK7b5XnpC
	 6PZyyzOcr32g5ybqODJEqBA4wb0xQQjJS4d3Gtg2MXzjpkknR0WyYcTScDsSKYWqMD
	 aOb+DyscDIJinu71Qi4U37rz/Wgmh0ihf7VdK1lgAm+dN4mE60LiG3FMlbCXTO1uNE
	 977LbdGdC93RYI9oe8jqueNudFkUybEf7JGDMQPpVRiuk7Zv3n078X7604aKFFkFT7
	 WUdbS//j2JscS8rT699b2i4RxJJmsbZGMg4NfGvXmWQqy9GGgl/91/LfgEmH3JMXcI
	 S3JsOyIBDToqQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:02:19 +0530
Subject: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-chipid-v1-1-0bf2db08e621@disroot.org>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
In-Reply-To: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614748; l=992;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
 b=HpLDq1EjNxJtOco0JipxcK8+SICDVTUYAnsZuGhx9L0rgkxWC0XVb+/lyhIU1rwI+y5YRuxO1
 +Jn++oczCMWAMArS5rEcB26YUYuIUFUXHYrs8P/YkAZSjvG3k+B7LKG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123248_528727_649F96D4 
X-CRM114-Status: UNSURE (   7.94  )
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

Document the compatible string "samsung,exynos7870-chipid". The
registers are entirely compatible with "samsung,exynos4210-chipid".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac7161a0db9334a92d78a57a125f23ca1920..9105ad48563a42ecaeb3dbca37df734d5b93f52c 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
+              - samsung,exynos7870-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:

-- 
2.48.1


