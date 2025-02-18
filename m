Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DE2C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJjPK0tN3y+9vhXNfyjtQWGkK3Y7za2zYQeMFAfDNKo=; b=kmIOOKREmjDy+tNy2CSOfZrPOG
	50C05gphpPxa4HtqDq6L9Ot0J5vFDs/1hcmp4OHBI/qx/Fwon7ADH/SujuMnbzERUpBCl2eC4uCQP
	MXMnUlJJj0UzXMO4AUBJYgNlcx5Cfs0e+o7SpIrIYsE/mq3rnvHIy80Nj5+oz0WdDvgQ8MsuUrnT8
	vO/PFLUq9si/aH8y/AqxiKeYuOj/tSjN05ahVTN4EVEZFNbYlMsBTYBSlV1WEZIvj3lmjMPLyhbq7
	LHKIGh355S9NCoVNIbyM5yqpCx2NLPbEHfNsvY6DRXdchT21qETC5Hdg0+9xjB0PDEy/RLabJAQW3
	XPAgzHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkT4Y-00000009XJd-0lgY;
	Tue, 18 Feb 2025 19:15:58 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSgc-00000009R3f-2kGL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:51:16 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 72E1E25BD1;
	Tue, 18 Feb 2025 19:51:13 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gd3XAxjpVBLr; Tue, 18 Feb 2025 19:51:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904672; bh=1WS4+GviouC1J7JzCrhTc/LONd41x5XcXEa643Stixo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Od/hBAAx4k3+bWeyIenQkqHS2d9Blp/dFronRqNJg6whhW8w+4LhHyD1C6DMQRUmh
	 lPfha3y5VZx1iLwvfunEFI9k4J6PTK7pZWwFTxMl0mxObw9ClDSs3s7PtzCdrIQJGM
	 1G5OFawG/PPuS8H7J2Oz1FUMuuRIxSy2oW+uOgZY+sb0JLTQLrQJNFGOycfRhvXGA4
	 x1Pr0wzonnQIWqpoRlygSiprD7stjt3OvwO/bbuFH11SfYiDAXXbMVTI9zRiwHxRA/
	 HNCbyrB/gQ9WN+HEbsZTG3KxAYXwisrKi01rbqtZ+InzkMIpdoOY3If8Jk5wCP8V2w
	 Cv2UiY4nYX6Bg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:20:30 +0530
Subject: [PATCH v3 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pmu-clocks-v3-3-0d1e415e9e3a@disroot.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904648; l=1048;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=1WS4+GviouC1J7JzCrhTc/LONd41x5XcXEa643Stixo=;
 b=0Jk3yZOiVUzbTp40QcwxIwlR+GKr0fq6g/ug6VgxiAlHVH4MpQOQZZ2kz0hZh7Bk1X+aFFRx1
 EybV5mGxaqoBdokWRaVvscbYZNFCMK0n693lzb1CaApYki0przIrEBO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105114_831520_D4B0ECA3 
X-CRM114-Status: UNSURE (   9.14  )
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

Document the compatible string for the Exynos7870 PMU. It's compatible
with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode,
as well as other system control registers (i.e registers for the USB PHY).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 8e6d051d8c97de0c843a91350a5cb9c332b2d6ce..3baee81df54981cb4c6502c1ddf5be3d5e3184c3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu

-- 
2.48.1


