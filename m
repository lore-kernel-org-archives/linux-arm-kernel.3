Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE4AC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbw8xQ6r3piVMAmakyWDIwjPOKwVFsaRkmQ0YOAEGp8=; b=mEYhk7/NuYZw9Y2o7qBE33Uliu
	zpvaiuEOTLKTjGReG8fV9AVGN9rY24yF7bM7TOBGm/BbYi2ERjFbfGmcc/eIsxxcTwTWIjDiRuP0p
	PDLuhpyDnAL4sJDEImgDNWW7fJc5yPn1l1cXL0adMCccqZsd/7+1xIWOzzKypj0CwUI23R2sGVVLZ
	51BKVS0McNwhqq3DhV4nd/fV4qaG3VtP4Ahw3ekRjIsoNuWIRXOfUmR40cxtjwlo524eY+lrIpnvN
	7sCd9Uysnqb0OirT6j0nAMHuIWq04r4DHm3krdjlokog+ePBAhcXG2z9RPqvqxpDLtaP0vPyOhj7l
	rM+5elyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3gM-0000000BguC-0UAU;
	Thu, 20 Aug 2026 14:23:50 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3gK-0000000BgtW-0Eq0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787235827; bh=rbw8xQ6r3piVMAmakyWDIwjPOKwVFsaRkmQ0YOAEGp8=;
 b=RCqYz4+wiANRTTEiNaSkh7hICgiyVzJ6J2BCpVFkKGSPMZMnkAG9rKw5wSzWOfHd7SljmJ5Vb
 uqlLbpXtIQFK19dYYonC/ow3HxZ9bxyif0X5fPXahZEyokbwEfiMuA0ktLJiDqnlv2coULZgheJ
 pRXg3REb+OZRL9mDJ2EQABg=
X-Forward-Email-ID: 6a870def7f958f0d9fc1b812
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH v2 1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
Date: Thu, 20 Aug 2026 15:23:29 +0100
Message-ID: <20260820142330.84514-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_072348_350856_42A54295 
X-CRM114-Status: UNSURE (   8.28  )
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

Exynos850 SoC uses the ARM Mali G52 GPU, document its compatible
string with the appropriate fallback.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9db9f84ad964..ece2b637cd41 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3562-mali
               - rockchip,rk3568-mali
               - rockchip,rk3576-mali
+              - samsung,exynos850-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
-- 
2.47.3


