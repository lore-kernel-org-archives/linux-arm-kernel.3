Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68510C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTM2HVKt/CMCMrc7BB+S2gBowOOTm+4FPOvtVNSaNm4=; b=1Y116/anQG2bmIm7a8VzUYoACA
	l078VxjAnGxNm4ngCVEeEVYz7v/Vt43O10TALpNIKp4VIYwmnmyAuQ4l/SycFo7rDj/+1sIpBHCuB
	6PLUaK6dZAZ1w4Zm2Xk/MRpQylMYOuIFh4NtiaiaieVO+dW0ldktBla692hJw7PwSAFipxx9kfT1b
	DRm8CiMWkvUAWKZKWFtzYjGzEATunuLKAWxb0h6IxfGLdDjBScBf+Yb+MfM9clt8R45YiFC0MCmxv
	OJqMpYe1nME9wMLLxUsdV1LNSrsG/J46wLfjrgFvngUEia2m3OjxaaGWZqfXCEBP17YbqxmwaJEcg
	ZurdVfyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvBv-0000000CwsV-3Tri;
	Thu, 26 Jun 2025 22:35:35 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsyu-0000000CimA-1w6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:14:01 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4DF6F25EA4;
	Thu, 26 Jun 2025 22:13:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNnH-FmTAf7Y; Thu, 26 Jun 2025 22:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968836; bh=gjEFaLNCD4Q/uxrCQrUhVRAihTFl2wmUByUbpt+ZPn4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F+duhJkGxECvHlUORxgFZV01C4v5hXH0YXlqFXf28/l7ejzf+ETGCltrQzskNCrSn
	 8jvVkX4RPrROESwDoNKOHJBhWBjm0vubqKvotOReRXYHCTznc2qo1CXUi4PAOUspQQ
	 N06tWIDRRRzQMoPitG2xytLAS3GC6XIU8yUZ96CvzZNQstpalil0s/PSoL7uvlFP4i
	 CtzA/ca3E17f2LBdKtWmiMP4JaDztYLJaLhH2iUbrzXV+hd5EMyIH01Bzl53xfq76/
	 14P/MS+geMDVk17ODHSeW3cgjxcMQI9cGsSPpMdZPHauL/JecMUWK/XxR0fOBnCOd0
	 fNH6EUebynH/A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:24 +0530
Subject: [PATCH v2 1/6] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-1-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1152;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gjEFaLNCD4Q/uxrCQrUhVRAihTFl2wmUByUbpt+ZPn4=;
 b=IByNO/8Qpqp/KSOFZB9ZAbFhx/C/12GSTLV5bpcMNyxRRfVDvL0fsev7+KY123njNzwxxyvNP
 Gao+iT5Sr7rAtqJkU3gViWphuhgKUVu4OsfI58Ci39UF2FuZZpjccQl
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_131400_638537_662DBDA4 
X-CRM114-Status: UNSURE (   7.11  )
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

Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
added, used for the SoC MIPI PHY's CSIS and DSIM blocks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..546b450dc3e10a642b289f4b152bcd299ae65b22 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -26,6 +26,8 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos7870-cam0-sysreg
+              - samsung,exynos7870-disp-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg

-- 
2.49.0


