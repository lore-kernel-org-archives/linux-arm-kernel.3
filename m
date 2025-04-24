Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FAFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4hlowPqRz9yE7E75g5DHQBXIYkuBiGsUO5rjyhJzlck=; b=GW2/2qcoe99YsDbXvBVG2CuqHV
	N7G2jmq33DaKflfKZalGjtagBIdXSNc0orPCnVWJszisJBVfHrzd1vJF85U3p6caT5jC9Fz+W72YJ
	iEleSQzqLGvLwLd+RF2K9G99Yh8JtxK2KasbO78G5wXJ8M1FU9ukESdddRGmFoaiUJFil1LgtCFQJ
	vHXP9T9tGLe8gK8GZ9V1mXySL1AXBqB2q7Z7gp6br8Xil4kE84h3HuWncFNGkqbtwvY6wV9X/FT5R
	CGzgC9dpvOCU0gx6tRj4yuYHosiMMhHNqT5E1e98f5wrxe/7UNwFluRtOFO7uXq/KrU036OXk6q0X
	o54ilZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sei-0000000DT4X-1Cuk;
	Thu, 24 Apr 2025 09:14:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sAz-0000000DNuh-0Pjy;
	Thu, 24 Apr 2025 08:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D59F1A4BAAD;
	Thu, 24 Apr 2025 08:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82930C4CEEE;
	Thu, 24 Apr 2025 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745484198;
	bh=qitYgmPxxCo3FYyxOlWXx5b1n6QsJzbiVsLU1I11C2I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BqDagzhfxpxhTIAPo1k+X1t7OG/Mgp9aJifaYQyIjaXpGWBbIV/gNUOBSqFht0TJt
	 yMzDihEVZe9ldVEVit0OJcPQrAMuLrr90ODRJjXsUHjZRNt9voEsHP9eI1BArr2uQ8
	 +wT0u1mPGewodycnOWEq9nIFGmiP2pqkmixImz1y0sqoOmip8gKvjJxS3ekDvoYVCH
	 lPfjRXEbXf+QG7L4WT0F1aMMUjNClPwd6WyEybqCS8Xx148YG1F3oVSHykOgbGJxPt
	 DmbUK+lIFfPyDoHyQHdJYnATFbtmNnxYv46FO7At/WXf8nPaqz0fadCt+PUlL+Qjf4
	 qDYic5OV5cKwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701F5C369AB;
	Thu, 24 Apr 2025 08:43:18 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 24 Apr 2025 16:43:17 +0800
Subject: [PATCH] dt-bindings: serial: amlogic,meson-uart: Add compatible
 string for S6/S7/S7D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-uart-binding-v1-1-eb0f6d97a654@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAKT5CWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3dLEohLdpMy8lMy8dF0Dc2MTY6OkZBMLAxMloJaCotS0zAqwcdG
 xtbUAPfJZZV4AAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484197; l=1533;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=3DWwMa+7PjWV5QLyMZHNnOjU4vTv3C9jBSh+V9Rd7Tc=;
 b=Cb+so7K1Vu9uCfUtZiKOmxmz+Rqy5dDfuSxj7i+QuK/vA1royFFeEHl+Gmww/XaVucyPTJ1jc
 PwTh+xUr8OZCFNmRPfd/IIlGjdZ6HaPruf8ONbvi7L6kW1aevm3Kt6+
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014321_287501_677D94CC 
X-CRM114-Status: UNSURE (   8.07  )
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

Amlogic S6/S7/7D SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add S6/S7/S7D compatible line for documentation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
This patch has been reviewed in the submission below(patch 4/7).
https://lore.kernel.org/all/20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com/

It is just sent again separately since it goes via the tty tree

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 0565fb7649c5..d8ad1bb6172d 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -56,6 +56,9 @@ properties:
         items:
           - enum:
               - amlogic,a4-uart
+              - amlogic,s6-uart
+              - amlogic,s7-uart
+              - amlogic,s7d-uart
               - amlogic,t7-uart
           - const: amlogic,meson-s4-uart
 

---
base-commit: 8f5f9fc2ee8cd65fa0e8062885d4ffa0688fe7c6
change-id: 20250423-uart-binding-073432bc4804

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



