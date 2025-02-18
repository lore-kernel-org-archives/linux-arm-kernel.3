Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD211C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/O73Hdpo/o16cF59jBCW8m62osYEpXgS7K8nWpeViw=; b=Mus/eWyYplHdVjMkLUdVQ8eLs2
	oDPaonULGFGQgG+l6kBipJZVX2VEGelNMmfHCZ27QlTQw0/7rXXo5iZJALlTWHAp+OrlN5BxpCD+/
	xcPQ+D5xwyklfxgmROl67NobX4BCJNHZTvx/03iFFH0S5zrAc8CilNjXIbNY1HP3eZcSpSIA9PsG4
	8ft8HOMSRoE/0c3mITB1PCERp3zrg9y7AjvBAG4K9AmS6gdvtIZmPLAlGgdVAIeiSANYG8R2tHUsH
	lcwBLeraIQXHe/v7I+MBV/J/H+hP//XcOVdU96iLB0xjXFvsRYk/v6xa/mcbCYA59WAK4wQPE6MwP
	nHHs45vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTaK-00000009dq3-2jRD;
	Tue, 18 Feb 2025 19:48:49 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSst-00000009USQ-22hs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:03:56 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4D15225FBD;
	Tue, 18 Feb 2025 20:03:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9Gnftup6573; Tue, 18 Feb 2025 20:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905428; bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G+2+bi6MADcNLaytdJ66n+HdZQ2SiD5avdJ4arTNjJOzQAXCvUOB0VulexRS4w/x/
	 5WC2chSPzdCVisfDCOdab9/JWaubF2J7Uchw/1oXdnJhCWy0sD2HIyIok55Qeda9+r
	 QIROk1ZeKNRD4hWIVb83XT0usSF0H+J9vcHxVWwOyFMIc1Z0FOeFqX2e43IeOg+3XO
	 gglDKxYQd10uu0I+FK2EaHy7/iw1oTLJjv1J79GK5nckUqM8dkMhTSPn4Tz/u/UNkO
	 Qshd1GzX1h28An/hmuPfCRqNR9X+D25KXso9p8n2P5xPFjTyH0NX1y+bVpgaUwFdl9
	 c6YyMdV2coE4Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:33:11 +0530
Subject: [PATCH v3 1/7] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=992;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
 b=MhZoQxfIOkbfoArXnAAHVh2wW0jmsogr1O5PtZNQne5jOivUKS6saBPKzIvEz/9Y2BZqrpaVg
 93WHHQpWk1OD6K+qKu/w3lualM9P4qpld9UKxXJe+rugiTZQjRWM+cO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_110355_659634_1548365C 
X-CRM114-Status: UNSURE (   7.98  )
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


