Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5774C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B76ftX13Xu8+4uKnRatAGj2SpzZ/zBohSz1v+xBf9Kw=; b=wHOevFoKs/6WYh5KkMG5yZPMeD
	/HSBrtFtHk31T1kS2Oc+pbiSA3MxvEoO5d6l8/4PmyaTg2Oi2iJ9qp/dIsbfdXlL3Lwn7Dy2+3I9I
	Lch2wETKUPlCtucHoQngGqii900yJcsEO9Ec23135HoCOoa7JoflDWoU/RDx23JR5u5tIbOcFJCJS
	ycH6GQzZ4teCFXeiUVA1Wl5FuUL9W+yMXfu6vEUMwhCMErjW9VWMX7dOrlxcE1ILnhYCJ28UdBwbP
	sR5/MwqWbbUWm3SGB7V1yYSBlbp9B5JgAy269Ayd/fkHJkEftzMFqSuwcUgosSlzUBNx5sUZyMAj7
	/yuexktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADNA-0000000ETxq-2uSS;
	Fri, 25 Sep 2026 21:22:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADN9-0000000ETxN-2fVz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3607440B8;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE091C2BCF5;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790371342;
	bh=GoyLU2U3ppXbJU9VRV2KKSjfBJtgMQqJ586u/SdHnow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E6Tt6HN6dDVsoSQ9s7/R/C5uG/20efuDuoui5xfBmxKuopsKOVMSW7o3Ea0GnFS8d
	 nrHGiplAi1QJXgizemJPopFXCSunX9eLLks43SWZE3vRTlFisTFroOVRCdeups6YAe
	 psFQscgHyCv2cgs2VdZsCF6buhzmuLabB5BZHxlj9TOsQ6Z7VI1OX2jQmn79cs0uGZ
	 nh7HJwRLNENR+7L98lhnts1SJNC9hrAXTT9WUdq/BaGgxxg9zVrAyKz6dVbRWOl8ZV
	 NBZ3sKBWQ582ZApTvxm7h4gmQ4OmI00T3zXUN6EcOCfkhAZS20egjx9dndVcLvkiXi
	 HQESCYtEuJMXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC45C9830E;
	Fri, 25 Sep 2026 21:22:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 25 Sep 2026 23:22:20 +0200
Subject: [PATCH v8 2/5] dt-bindings: input: touchscreen: st,stmfts: Improve
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-stmfts5-v8-2-0fcf49e2c85f@ixit.cz>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
In-Reply-To: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8hrNriBZ9r5NUpjg2ye3gjvx8mrHqp+97D+QCG0V3A8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtuYMItkEShhRrfUYkEQkLKY95RkKZ9aBK821r
 KzsaRioKoeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarbmDAAKCRBgAj/E00kg
 cgUwD/0fup7gi4EPXq8XUj2gTbqngr8fFCroIEUBSk69EYJYBEP3euvVnv7BWAb1FueivXZz8Qy
 VcRY+on9bUdVD28j9oP8q3bYjsQwtlI4CkBJYYPxRqT0kdkLWlfyWWWqFR6d6IcB2kdzeuuGnYd
 zTsdPPhrNH2D61G35Z5ajlLItQ1asun/oSGNOZNlMdFwSD7JGxidOVWh19i3Bgx6/8vyWpZO3s2
 OmESlUJIexP0O4l19baYbTmUb08kbQONDEvDJBPBz74fcb/aPG0uOhzpczCT3r65QLUkCxncM2a
 xYMYoqHN61vTJrWl8W4hCFswqPPG3Yf7VNDoXL3AHpjqDpNo40DdHY+YbdcFkUWHKJhNTzgegiB
 ftN0w+ZnWgZZsiRqyUmK6hMRkKyKRU1ifRGU10K4rjq3kby5BXjtyGPKf3CrEz8BlKgx29ZaOz8
 hoPrmMzkk/dxle3kgDwwlAP1dEzVhe5va21gj2EX1UIVWUcyu0mz2nboz4sx+9NtG94PRav5btm
 XgNlDQjkoGyBLkQTMUUVw+7EkTAJiW7FcmXyyhgAUeaaMUI90AY3d+lKYsRfNyuGST3cdWXxqtA
 q9TAzHZVMhNhKIa7qJai5FkT9o9H8FJ0BWN2TpK0syQqrWLorz8sg0HdydidnDnbG/tB349J6/b
 zgKF1caJjGptipw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

The touchscreen-size-{x,y} is exact number, the -1 deduction is done on
driver side.

Example now use interrupts-extended and size obviously not deducted by
one.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..6eb1ad6582d82 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -59,18 +59,17 @@ examples:
 
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
 
         touchscreen@49 {
             compatible = "st,stmfts";
             reg = <0x49>;
-            interrupt-parent = <&gpa1>;
-            interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
-            touchscreen-size-x = <1599>;
-            touchscreen-size-y = <2559>;
+            interrupts-extended = <&gpa1 1 IRQ_TYPE_LEVEL_LOW>;
+            touchscreen-size-x = <1600>;
+            touchscreen-size-y = <2560>;
             touch-key-connected;
             avdd-supply = <&ldo30_reg>;
             vdd-supply = <&ldo31_reg>;
             ledvdd-supply = <&ldo33_reg>;
         };
     };

-- 
2.55.0



