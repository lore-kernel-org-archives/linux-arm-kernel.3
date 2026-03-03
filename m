Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D277EC0489
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+lrtQVQWmgjYr6Xwseu/E/ekhX+nvU40jV9XwiokRw=; b=pmhm+Vvslk7KqvwuzGANzj2cFh
	8YNP9ZRFC6Ivb7JVQVA4/IrtD8Je3KpbD09gHC0DakG/RVifZbyodgG2vh3raOO0SQCT8pnVYxTCu
	9pTdnhZM9ebBi8XcDDbFT6QLy29/ICKLg2fmz+H3td1Q/RWdpklk8bvzaPKM6V2CsYkMr0ZyuORig
	qnd2q+MGizr4cUDL43eetTwmZGWkIF9UO46EMqnyNizWDNT6hGMo2uYRArjmIQx6ZeN1A8MlwC73L
	/0sGwAhqikDzpCiaCfjIQYUvwoyUCsrBz5pnHlbHjMfIVbPof73+vK3EQiNH9TSo1Kqvo7gYQZ+fy
	7QZCWLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMdB-0000000Evb9-0qCw;
	Tue, 03 Mar 2026 10:05:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMd7-0000000EvZq-2ibd;
	Tue, 03 Mar 2026 10:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 967C940561;
	Tue,  3 Mar 2026 10:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FCEDC116C6;
	Tue,  3 Mar 2026 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772532327;
	bh=9dJ8qLLYIZAO2CG6AxPuvLdbo0/KEzaLIw6AaTJMJd4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tNqIhFGyv+8lZVoVDvwE8QvojLMCyfL2tmt84dEhbczmoEsco9rI+RloW/K61AoPY
	 6sf8b+59/9p6RLFKXl07xEJFLWUKPWBHUY9I0KSJ/Gy9CII0tdTm6BFSIrSqeifhfE
	 mOxZjcTAml3uhF+Hm+Ypjmvh8IKDOF+obV8bdNbWlrYziyaK3Zp4BGmzFb+LdWHLGu
	 u+jmEtA579IQ+hwWvWRaqQhgMqBL5HBtT2UaY4JqCZrnHkYqhrK0k99fBo16gRHDv+
	 p2zxJQOxQhCYbck+uGo/726uW4MMoBz9k8jgyNZrx9q0t4AyD+DQCEDPyHAGbex55s
	 H8IXvpS+PjfmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63220EC048B;
	Tue,  3 Mar 2026 10:05:27 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 03 Mar 2026 10:05:24 +0000
Subject: [PATCH] dt-bindings: serial: amlogic,meson-uart: Add compatible
 string for A9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-serial-binding-v1-1-c3df2a8f6fa3@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAGOypmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNjXZD6xBzdpMy8lMy8dN20FEtDEwsTE3NDczMloKaCotS0zAqwgdG
 xtbUAB4QGzmAAAAA=
X-Change-ID: 20260303-serial-binding-fd9148447176
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772532325; l=1431;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=9mURwWMNKHKPj5DQwkxO2/oc3KhRCoTzoGeBobWkQYM=;
 b=JymmJL57wfD3WRuexnCQrwj4gWarkh2+sQtMISQ+nJ1d184MWywv+CAUTFEJ+63gky+C2/16m
 Q8gP9fwsZgFDGeltyP3ZIJJ6/77WPI0Z0i/jNaphv5N1Ab//xjCNCEa
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_020529_753782_52A581B1 
X-CRM114-Status: UNSURE (   8.62  )
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

Amlogic A9 SoCs uses the same UART controller as S4 SoCs.
There is no need for an extra compatible line in the driver,
but add A9 compatible line for documentation.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
This patch is from the submission below(patch 2/3).
https://lore.kernel.org/all/20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com/

It is just sent again separately since it goes via the tty tree
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index d8ad1bb6172d..a2702319685d 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -56,6 +56,7 @@ properties:
         items:
           - enum:
               - amlogic,a4-uart
+              - amlogic,a9-uart
               - amlogic,s6-uart
               - amlogic,s7-uart
               - amlogic,s7d-uart

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260303-serial-binding-fd9148447176

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



