Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69751C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twups/XgyK3FRe6C1XbyaoHfpMTYmCXKsk/HRYaPlIA=; b=gxBvwkItlkn4mrv4LBaHxgzmli
	p+YpHv4jF06cYMdg8SGpL/fHaTvlulPCAmp9hIWt6NIVFpkaf8waMy6AgXBtlQG5evyGrjy4BLohI
	Vk97zjUY/9EP2I1OWzgzfFvfSGXSv+Jrdzv0HFKcpvHp2bAmB1yp887XBV9SWIWijz03XlcFgeSnu
	nHrrJMpihBvOQj4fy+Lr5Ntr4CBO8yHmJevu6JuZGO/0YJbAiXWVRmP+Em5gbIbxsg2y1dr5KUo8a
	LuOOR00PnZLH4t40+S5mNIcK0uohgqxGgpO0qMz1qTmCvzx+YQU6u3YSPlXuuKTH95BAVGQ23Jw/O
	qhD8N9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3FM-0000000GYsU-3tAG;
	Mon, 03 Feb 2025 20:40:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf392-0000000GXXL-3oAe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:34:14 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A044020529;
	Mon,  3 Feb 2025 21:34:10 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDCwkQ1rbqBO; Mon,  3 Feb 2025 21:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614839; bh=4OcKoBLVCswFj8+WyqdYMQe1By0BpxCAengr9aXEi/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZsqcxV2hQqYaMrsKyB6I3XefykRZUY9V1HiLmuy4DfzXSGh7yztuNxtTahML9dPba
	 k4qfPHjaYKJ9UXaOK0+qS27fRIjpDRVxsm2mj7iw2ICzAc4KD2trvGTmjF9TFRAqd5
	 /s2rjC3MstoI5z2Kg9eoCWu+bne+lBAa3V4WvWssktXneI8XTIrrF4mNESn166Ekg6
	 vtL8mFen9l7CA6LVSq6Edv+qaDoBCRTgUHWkmox0Wso71M1eVe3yxwFCrANt3fKfSo
	 JnKUfVGhLjBjs5B0lpmeeZM3qVqXkexLlErrH2Jsc4oE6LQBktwojK9FYlm0kb/Le6
	 xocBRD/wY0Gmg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:03:33 +0530
Subject: [PATCH 2/2] dt-bindings: i2c: exynos5: add exynos7870-hsi2c
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-i2c-v1-2-63d67871ab7e@disroot.org>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
In-Reply-To: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614819; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=4OcKoBLVCswFj8+WyqdYMQe1By0BpxCAengr9aXEi/M=;
 b=7OWgJnwDpMWLJ0RIujPOn4v878zVH0ND7VYLxNRdtoephlHI1ZdX1kDSCWEh9jhZF26NU3/XP
 dSjdIXVTsT/DEgOJSYj58I5Bp3X9DTIG7rJ2QiYRFC8kFfG1XaoUwXS
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123413_079079_091ED106 
X-CRM114-Status: UNSURE (   7.75  )
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

Exynos7870's HS-I2C controllers are entirely compatible with
samsung,exynos7-hsi2c. Document Exynos7870's HS-I2C compatible string
appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 70cc2ee9ee27dd128be10152a0a0c873802f08a2..8d47b290b4ed1c95b7237ce7881b40872cc7ada9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos5433-hsi2c
+              - samsung,exynos7870-hsi2c
               - tesla,fsd-hsi2c
           - const: samsung,exynos7-hsi2c
       - items:

-- 
2.48.1


