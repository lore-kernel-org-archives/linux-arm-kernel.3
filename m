Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12CCC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=am4z/No/mdLaVVpb2IfyuKKwsktBihNgzxIYGGIRm1A=; b=IPsNHobB7IkrobyZYMxgT3TyhK
	p0fbXHN7nb6hCJmAUlID5i7wsuXbAK+mSw5sRXjLwRe97j9SE3kJVfcG6qnQ8oh5vQpwxbccXl9MM
	IgCog8Ve+TexBfDotBLrxc77r8t79dppr+Xz910PAdCyC8Equv1bZtW4owWDz2+tSi6Z9ZbeAL3LQ
	7D0B9dns8LtUiVHLu7L52efXGEEpEmmVph8SPqtl76rVGYbwL5SRSIlXwJiAvE/Pip+X5W8Oukcva
	8K2Breh/ouxShFE4rjct5lWt1RLjRAMLIHC573mrhOapnjoYdjZA5ZoTMSUO4fuYqHK4Z6cASlHEO
	K3f+1/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjag-0000000Aa7T-2YTm;
	Thu, 27 Mar 2025 09:31:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjVX-0000000AZAl-15cB;
	Thu, 27 Mar 2025 09:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2562DA41D83;
	Thu, 27 Mar 2025 09:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 934ADC4CEEA;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743067597;
	bh=8Ex/Jr8diQ1IbTbGBwunvR8qirt4YXrZ6QekMoJwqYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LwqAx+UFVtSRdaxDke/l+hloA54FxureH7JeUEX5UpfByUqHG5JBGktFKkic5u47b
	 EzDaeYewZ/aYfzX2WpuGpHnVcP81O/GadIglwMeKbugvFd5HU474B8wR8i3qRHUsvv
	 XaDXqbLnpt9198w2/lVzFYxTWcGQx2pnaO8um4io72ZnxARQN7oNdZ7qYRwFDeAViB
	 CkZKQAUEVx10l/4gVpUxY9GWs2SU+sB7+t1JpgE2uGzzuSOn352CXzW6RSFUixtyny
	 ztzQzqHpSJscgAxJKUv4iFcozIz7wP8zM9jyQti3ENH8DANmV/0hrVH0wQRrkFqlKr
	 6qQ82VWELPinw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C11C3600C;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Mar 2025 17:26:35 +0800
Subject: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-a5-pinctrl-v1-1-49320349c463@amlogic.com>
References: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
In-Reply-To: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743067595; l=1027;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=e5E9HFKA/8VjQVYFNbNKCkIxF4wUBI+C617RgTKcAFA=;
 b=pfftSA0ow6ohkIHTU+RWjU9yarMrpHvElbzsyk2KJTNSA9+b8jmLlFm29TCzBbghYrNou4Tb2
 v9QUnNPCRC3DmidQRzDZVEGIb+eTMSyJmT+46B5tBYSl8VXShJGvkKa
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_022639_373692_66AF533B 
X-CRM114-Status: UNSURE (   8.75  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
no need for an extra compatible line in the driver, but add A5
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..a94f4dfb9a7f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -14,8 +14,13 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,pinctrl-a4
-
+    oneOf:
+      - enum:
+          - amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-a5
+          - const: amlogic,pinctrl-a4
   "#address-cells":
     const: 2
 

-- 
2.37.1



