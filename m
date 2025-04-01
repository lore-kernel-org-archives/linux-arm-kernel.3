Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E93BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmVkK/gfdipXDVNsg6imHFJQEJ2vSjpgXev01IupIdU=; b=3Lb2B+p0xR0GyuXEYZJD2bX/Jv
	hKWPL992hy+XJjI+WDr57HwGxpD/OmWv5E1QsfV3n6INn0hchzAEZQ+W9cgixEeIkPgw4xs4gqAsI
	L6uN2SC/rggcvoaRJd4zPNmW4doaQaQ1VymIkpAXIYZ+Meo4VJDaagl8O8TF1tl3/BXQQatHEhH45
	Wb5AxbvLWsWoY1TXToXtdCCCM3aDeXl+cVxpTBvwgqXL1HjorpSC02cx6Tv1Cvm647Pd+Pdd9XyJu
	HTUCBxhsbwlhkMj9hmkc8ATZOEJdNMFd4IOSbUqjoIs6QMpnztljrH/DNIjRtnEroGLLMix0FC0wI
	rWlVeYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzR4k-00000001lhn-3RV1;
	Tue, 01 Apr 2025 02:10:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzR1E-00000001lE5-1Wdf;
	Tue, 01 Apr 2025 02:06:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0E7761161;
	Tue,  1 Apr 2025 02:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03CC5C4CEEA;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743473183;
	bh=mzchwkYo8Cop0lyIAFbQzmQzlnagfFBZUWy82TqnAgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mgJUkT2mJn3PijYyDielrwg0coWbTgJZcQQsXx/i9URNKo4uc28aWCCBDE0cESPXw
	 kAZQl4es5CLzOVI709ICNvokM/5sPuDNB8mt0dAy47xs9u5WLclSZ/13pT/ujtVnpf
	 o1TFGoR6es9WJPNHUBHl/okuctAcAtlqb7wG3P/8tTmhyJF8qkQqk9Zw1o60hdDDVp
	 58VCXMj256/hz+rg1Sz44g5UUhK5BdZVaqI0fFQnP0ROZZNNWY5JPI3lxwCLWyBS9e
	 tbc+8HVvRCA0hMZk+W198A+QM6yTzKTA3GdgdYovpSOfvlgc67RHenPahB4OtG53gO
	 PtGQNBzzfKpFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55E1C36017;
	Tue,  1 Apr 2025 02:06:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 01 Apr 2025 10:06:21 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-a5-pinctrl-v2-1-a136c1058379@amlogic.com>
References: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
In-Reply-To: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743473181; l=1067;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Pz16Z/QIM4IDWi5UYrztmMtclbTkct1CDyubtK9KYn4=;
 b=tIqYXqlrL3cEMBuUkhDpDT5x01qWCw09VqlUKfVE39cA28tUMi3sre+NqfzZ/BF1MsNdR5Y+x
 JnrhDuK6GLjDEIESc2nkxjj654ABNisplxGeYWxPACxP6Q7yX2w4EQd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
no need for an extra compatible line in the driver, but add A5
compatible line for documentation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..3bebccaf0c9f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -14,8 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,pinctrl-a4
-
+    oneOf:
+      - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-a5
+          - const: amlogic,pinctrl-a4
   "#address-cells":
     const: 2
 

-- 
2.37.1



