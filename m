Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A99C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWtGuJsSnA6q09a1WdY7USh/zxzDAqnc0W6q2GxteG0=; b=wRMWjDpXrR+Em+0cv2LD80yAyf
	jAhZ/x5UEHeJW3/ZPerX8hizoKxSsVT5OmlvY7TndIXr2l+WU3a19xV2ccRTnP4PglAMGeofsuoHx
	GbV7+k1Gs8qstPDs8NqyvXvMA3nLBIlLVfSGSLQKEF5YylhJ9L/dQ27AVERovHC1OXGK0NwmSzkEd
	w4nPKl7VP6Ghgs9OjRXKbq0KuvdYWgLi26o+dp9f45rysGl4DicYsxDuQxfz5R6z/CSVN8vc2RBrV
	laPJdqM0Q5GNc4pPVdJvjJVHE02wUqzu/beMQ+K1QxFOBOaA/9lN7R/DRyeMYpf3G7/w0Y5V8bSM3
	j8TFrRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zZd-00000005IaE-2nh3;
	Tue, 22 Sep 2026 12:26:13 +0000
Received: from mout-y-209.mailbox.org ([2001:67c:2050:103:465::209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zZb-00000005IYa-0clp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:26:12 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hpzbB66Vhz7t7d;
	Tue, 22 Sep 2026 14:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790079366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TWtGuJsSnA6q09a1WdY7USh/zxzDAqnc0W6q2GxteG0=;
	b=1sXIa/iNpsllNyxwkMqBMBw2hr9u8Pp3ChUwD3OE9mw+HbBoo3L2xitGuyqF9Jo65+Dhn3
	QggpkO9IzXmQ1pzDuxM2GLL4KrkbBD+goQeKf6fwuJPIo0AaWWQmBAYpkRaEHsmz3FcwJ+
	OKl8GjYCIwSavNikyt2wJXW1b4G682ig23SP7dBGTeR5+XxWHD5Acugr7VGXRiAwf1Qzkb
	hxX16r89t70Aalzrx+eaj3Jg14ElzUlwjIyZJ5O5Irs2CTXNjpb/KSnq/3fo1VjbJCmDCp
	gC0tJXUp6TEnqvmB7R9Ewxw7n73pt5kITWY66EHd7qVHzJW+vO0CRXobfEbz9g==
From: Alexandru Chimac <alex@chimac.ro>
Date: Tue, 22 Sep 2026 15:15:13 +0300
Subject: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7Zi2JCBcxbAowyhjpGBbCIZwd
 6u4fMn7728Q2AsHqLMNPC8SZHQJ9CkD6q27M0qXGIwyhaqMQV7fbgxVoRVO4ij6J042Uo+siEq
 tLx1VJaT55Pkm6y99bQ4Oc/tgit/e3/D8mtNnPDRobWCkcRgk1tlSnnP0lEOz7x87AquXqAAAA
 A==
X-Change-ID: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790079314; l=1196;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=FIDOhx16bKTnLhDsEzKck56HBIFnn9qu9WN0aTyG/g8=;
 b=+yXOurx997N4Jd5a4koBFSR5j4JT4+C0xfTJcebVE2TZYaDznrzmZicOMCcbKqIsfB1XCg+pz
 RY2i4KOLPrjAG53adnbI3g+b4UEwVuKXxMijPYG3jywtUZUGWWboAGs
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_052611_359968_992F4E7C 
X-CRM114-Status: UNSURE (   8.54  )
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

All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
to them, so force the nodes to have clocks assigned to them.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Most Samsung Exynos9610 pin controllers (except TOP) have clocks
designated for them, so allow the device tree node to include clock
information for the driver.
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 1feb6a6fc690..e4fdedb29631 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -140,6 +140,7 @@ allOf:
             enum:
               - google,gs101-pinctrl
               - samsung,exynos8890-pinctrl
+              - samsung,exynos9610-pinctrl
     then:
       required:
         - clocks

---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97

Best regards,
--  
Alexandru Chimac <alex@chimac.ro>


