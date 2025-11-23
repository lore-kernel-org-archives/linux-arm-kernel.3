Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F1FCFD318
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoUUUrQ8wcmmFDENOj400g9IQXP7mLrUg+4sDN+njqQ=; b=TcJoNmbYgQL5Tl/wRCEshSy+ma
	DvMduNZYjoJWw8Mzk0oAghXfXenhG8zoGgEaw2mA87qjEAqYa6s7UOirTTsXjHHxwgJqamV5jlqt6
	birNC4BXNu83BODGOvabyMkmB2sqmGBLiQwkuCwevQrinGc2TVXBqiy9TxJvZFSlwW4JzgBNqpmh3
	Azp/beOO4mWIL2SVXQKCqnOz52OKbYSMABrs+6UzFkHrqdUxVA1Bn27hKHg8MiHiLig47xcdKbrF0
	m+G4lXRGSKw5KhzzvGK/ioMAQg75afNKBCEW4P2CS9qS481hnfU68ND+k2nmkRcUvm+CsiPQcHqke
	Se1YeqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5aN-0000000AFnJ-0ya6;
	Sun, 23 Nov 2025 08:36:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a6-0000000AFho-1a0L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 08:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F37D443AD;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60A5CC16AAE;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763886984;
	bh=xwynRUzExlilQidqzDcuAEaxh+WE2LV+Vnfe/saj5Lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k4iKB3oN5fOEL369rVx86C3CoZmNft0LMRQRM7SrCy8TKUl9y13i/I/BZZXaXPDk5
	 ijAYq3x4admrQ5+oJCs+7BDo3hsE0Yomq3e2TiByycVOJWtGISTMobWgypI2+EFQzA
	 R3ZfXMrCkMhMVjP0Tv0hJP/8BkFiE8CT+UJsH6HKPPmAiExKGe49dRe8Y4pJu9Y5iW
	 lr3+j3RYo7iT7H0jjSfmMs6UnvDeUKAqs3/C559CDOqcPIMaMFEOktqo1X37Cz+iqV
	 GhRaCmBv9tbZwRfayjk3gwntC8y7hZq5X0tZ6qjBv/VrjAwZt/o81NzAwKCFv8/53t
	 GVB77+X7+8feA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D82CCFD313;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 23 Nov 2025 08:35:48 +0000
Subject: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759 charger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
In-Reply-To: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763886983; l=1642;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=7bFNW9hXhJq5LkheOx7QT7tuIMKAsDDQ1dSnkeZc7ig=;
 b=1aO4U9DUYtJHenszVku1+O2T8S0nKCzm7caOTnUbbR7qLLHyk8/pXvsmaDh9xS/wwoHBFtI1i
 5FyzzbHT56JAG1hlMR9W/gfQN/Zrra9GnRBfHBL0jK6C45CtkvlFvmg
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_003626_488563_977574EA 
X-CRM114-Status: GOOD (  10.33  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Add bindings for Maxim max77759 charger device.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
new file mode 100644
index 000000000000..71f866419774
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 Battery charger
+
+maintainers:
+  - Amit Sunil Dhamne <amitsd@google.com>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The Maxim MAX77759 is a dual input switch mode battery charger for portable
+  applications. It supports wired and wireless charging and can operate in buck
+  and boost mode.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: maxim,max77759-charger
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: Provides Boost for sourcing VBUS.
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+unevaluatedProperties: false

-- 
2.52.0.rc2.455.g230fcf2819-goog



