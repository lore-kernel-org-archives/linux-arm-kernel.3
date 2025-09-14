Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB0DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+xJKNk5JY17fob/Z1mGipjlu1Tw15TGNfmIUUFMZBc=; b=OS8e9J/ZSfh7Ocfz+JK00URrx6
	f3/cIM9rGUiyvq1JirIqz+DOba71egHTQSzDWf2+RmJo1dulZbgTrDvWdGLvFDIUA6lz/WSBWofjh
	A5kbQAaEXCrsMOEz+BZE/1lXQ+34X2qFV7NspZEPjhjzpvbOSeV0vhv1J2dBUu1ahVlEShuYylov4
	vWiLZ0y9HGWG8uHIBO2RgOJzrrZnBXKnP+3x4JCEPscuRFURiOUByNPN9z3NMu8At4DgT47VVIhSX
	D6tx38rEq8HT/nrAg3KmiTMfpEDS94hBmO4z0JQ9MEaZdQr9kf0l+/cle6Nu3dwOLx38DdwDT/v2M
	vtiFKahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsSX-000000022yL-3mJw;
	Sun, 14 Sep 2025 19:32:25 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsSV-000000022wk-1xZK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878341; x=1758137541;
	bh=E+xJKNk5JY17fob/Z1mGipjlu1Tw15TGNfmIUUFMZBc=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gXao383xk7fjYBT67g/PLUCf6irVEJ9539qVlupirI0g4wONNTbq60BkmwDmNj9TH
	 QI/pmfrhRjKai5tsdD9cUtUnJIyu+y148wAIUDxpQqQTxTAgQ6xDVCZQfNLTO56Lpk
	 2WCxZs6y85aJgX6XiToWgb5vsgXpVWllkwMRAZCTmS8r6WJorVoC21xBcOLDhWixAP
	 wWznj7+Ef2T+FKfIRc7XqyIupaA5X7pf7iR40sPijMicR9ELuURy3+RIqTUyr2lVPq
	 VmTg2h3BOnBRDOGi4u4q3oJum81esx/4etJZ0pJv+T5PwaTg6YEICzoGbzi2vVRllH
	 UX3l7sQDX7dpA==
Date: Sun, 14 Sep 2025 19:32:15 +0000
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20250914-exynos9610-pinctrl-v1-2-5b877e9bc982@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: a090441a71998982351ba0324502188b33cb6651
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_123223_651257_6A4C98CA 
X-CRM114-Status: UNSURE (   5.72  )
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

Add a dedicated compatible for the exynos9610-wakeup-eint node,
which is compatbile with Exynos850's implementation (and the
Exynos7 fallback).

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | =
2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index 0da6d69f599171b6946992c036f23c5dea17bd0d..fe06c0d2734960d3fe57783c1c5=
28f58fa297c57 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
@@ -123,6 +124,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
     then:
       properties:

--=20
2.47.3



