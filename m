Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6C0C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pA7q+XZNlB1YQVOnT7TUGwgWCDVG7QzZZ3GWNOAa5W0=; b=UF2+E2RfiXUCX8RKQEMsxD5yX3
	weAJEqK4Fg+FIzMIl5+Bq0Puh4Xp76dMnS1jDTy+d8a3/GYhzK5qxtWHO9KjKbpZwVinqzjyJyr5F
	vDsQPBg5qdmb2Ce9WEm0x94aXSoURHlgMwHd86qyw2z/rnEVaC14yiG5IUI31bkGU3O/p3Hh7oXyR
	QIsy6LtRXPmN+qWLgdbtVo5mS6M1khSygVOv5hECvxdv7HMr9Ne+Y4mS37xdklNkpP49Q9e1gEzbX
	f3WtXoCUDsJ4rexRYnRTE1KeMxXTMvZraMIl6jke9yvVcEJTgIrLBJR7hGcaxjmbsNKLkxI6Oo/5M
	j7+6Ei4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMDb-00000009uRx-0V5f;
	Thu, 17 Jul 2025 10:52:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL4d-00000009kWX-1SXa;
	Thu, 17 Jul 2025 09:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEFF045F79;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E5C5C4CEED;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752745122;
	bh=4Ndj+Oe3t4mjo/gbKEf4uPrZCwLkmNZnl7NIMzr58ME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I2UQV1iijEu9OWq1nik7oCNThnCHBzy6i3OTEuMdW0p0c1gy4KR27ihBfVwZ3Mr2n
	 BR90YQFf3ZgxnZm6NolBb6Kyc3TEWTvJ0lM29+siL4RXGocYVMQgwuiBkZ8wlHeQDo
	 YeL4ObS4v66vPSLvI2mj1VzvVzzHHnOEhr+7fR0Zb8v/o7/AQUbEvjc5bULQtC6TZx
	 PqlfwJ585q6MqycUUL9IKhar4oKV/n+Xldd6KHYWCMltAb/I9mi4d3hOXC0oYS+l/D
	 /zJrzlZ7H3nf7bZ5c8qsqPJH9ee3S3RxkaOdTVHOVjFozFvVXbz3TkI2ZV4oh7QssH
	 DzizjT82R2hKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD4CC83F1A;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 17:38:37 +0800
Subject: [PATCH 1/2] dt-bindings: rtc: amlogic,a4-rtc: Add compatible
 string for C3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
In-Reply-To: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745121; l=1022;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=hzR0ZCHlhb6lBSnaSo2wyYzPsJkwt/jiH2b4zUOXQGs=;
 b=V19qxhXEYCFJdcPhLmr3zFhQT7TnOpLv6c6lf32Vyc9pC8x2fbEg0uajlnV9BYMTjc7yPC5kI
 DU6TCgBiRRNCenfVJMYxDrLudHQU9RYjt/AcrE38bnYfmN6uoVPzWxb
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_023843_421701_E5EC68C3 
X-CRM114-Status: UNSURE (   7.99  )
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

Amlogic C3 SoCs uses the same rtc controller as A5 SoCs. There is
no need for an extra compatible line in the driver, but add C3
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
index 5d3ac737abcb..e61f22eca85b 100644
--- a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
@@ -16,9 +16,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - amlogic,a4-rtc
-      - amlogic,a5-rtc
+    oneOf:
+      - enum:
+          - amlogic,a4-rtc
+          - amlogic,a5-rtc
+      - items:
+          - enum:
+              - amlogic,c3-rtc
+          - const: amlogic,a5-rtc
 
   reg:
     maxItems: 1

-- 
2.37.1



