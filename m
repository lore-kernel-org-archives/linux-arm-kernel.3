Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C864FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGZMdc52q13yeO94asjBB7hiXHPLQfLBvZpzYqeIrBI=; b=oBTs0tzFognXuba88NzQKYuKZY
	py7puhBIpZl4tScm5SXrTQK8PD0zwQoEAZ9GIij1mAcc/gGJxtE7/7dj4FMddpKQzFOCNhbfMcDuv
	uUHQQqCU/wCWk+JNhtHNT6knswJjz3sspFr63NMcgAZDsR9JsNkCD8blrVGaZmeFXLoZcdlwi1bV9
	BOpApS2+RB18MgelbAgiPVWSwRByRp374Xr4HEzESRsuH40GQYJwHyJFEh2dOZHjZTOmUWU4dMYBH
	NCrGv+NDBFQP3rfUJjnjMPsbmNmlgXERvDAC/FJUOgO+YVt8olAk0FHgxkYH8C1WtNoJGPr3pZeul
	8Qhg8t+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hWk-0000000GPxR-3rdC;
	Sat, 12 Apr 2025 20:32:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRM-0000000GOzS-0Vih;
	Sat, 12 Apr 2025 20:27:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so24848415e9.1;
        Sat, 12 Apr 2025 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489618; x=1745094418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGZMdc52q13yeO94asjBB7hiXHPLQfLBvZpzYqeIrBI=;
        b=ILoaOZaoHasdiev1HqP34NNBIFaZiqFT9hIfhZ53Ayyr3gRpWN0lTonha6W28gAQKG
         0WMKM0bvBovqhewYcz9ASxlxqGobAQVFid5yjrUyICkY/k7zJtyPAKEcTAGZ8MXLtoVP
         Evwd+X7UV6fxx9KsidjkTHKHzEdQ8EpjV8VJ9HJuyBpaPAfQiVPgxabSV14XuWWtcQu/
         V+7489lJxGWbABOQbOt2LCL39IWg5Xkp64lgBjoHHhIU6tqFxVU+UIgIri02Ba3xqHr6
         8M3CWkl9EaN3c5m/FYWf4AoTuJlmQOQlEpafCM9TC2KhLQb2TB3zNuksyK1WvlYNm+wu
         1d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489618; x=1745094418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGZMdc52q13yeO94asjBB7hiXHPLQfLBvZpzYqeIrBI=;
        b=eM8iax3e6oak7xjUTIIVRQWOHgVJkPE9oMzlyJB2Ll8rNrdpKPzA9gGSUU3WlGcd57
         NVadFSBSVFAw1CsbUDQiznuTy/4nuvm8x4wLESA6h8ODliDkM7NK3n6rp7kdoGT3lD+v
         6IvUPMCj88fB0lFRiE9huSbsogbo+pf+AbnmFC0dG+5//OgJZXu2qB/OVQxyP40trSgK
         I8G8C4aV92qwxoIxWLv9Iylga9FmiwrpkxZmez//slDcLCbqUi5gO7jkp+9IEcFZkLyb
         qbCMSpHFqGbcFtzdQe/UXUhNv3CWeY1g8TkZQBWiBqNnvSQ39QMU/TloL7BG/hD0WvQA
         4wkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUizQJqgmOuWv6hGCbL5FxgEEbRhypGKuJ1hgedjnI+mLC7mQXgWnJpWEP0vfYHrL40HxPSKqMFWkBA@lists.infradead.org, AJvYcCV2xQglclYDS8U35+51ehbJ+Mt8//JIcu+hoDWF+nHAus3iSao5VJR/2z5r5+7LV4+Niu9jLmIfiVrLx/tee3DJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxyUK4USACIUjh2L0yfRrMRp7GxEb6CSKt+tbrE9VGWSFBPbQRv
	WZDkVLKcvlNM1rHjeqJ/NLw0ZmuUxJ57HA1MaVBdhjozuO6dtJos
X-Gm-Gg: ASbGncv+0+bUEhrrZ7w/iuIslcG7lui4xrmwbjVIS0hcMBnxrqG5TIDXod1S2k5bPmN
	bYU6vm1UaCeBU0UnziFQ0Yjanv7bS5FK8Wz6AjCsKQUOe+p0qK58eF+Ql5tC4l6RJ3CqymInzGY
	epiAbAhDYPSt1gk6I6GOTuywtuxJmw8lWaZKGIHrVoarYaUkKgcS6MTAuGn+rRcNzW8BaeYQaXA
	9T9ea7qdMnNRjm0GjjefZSGqztYo9ykWha+CaTpGr8e//HBTYdUhg6l3mJxbACefbTlyfyUK5/9
	SDbkwUpu7j3n/kQNA5YKz8/IH6B3GCqYwJoLLQO3wfTbyBRRqO1VZQTIylGY4YRzFqaxUOPQYf0
	pYfguEJUjihB5P0EI
X-Google-Smtp-Source: AGHT+IGx6h+geTf/v9W2DKJjLgpVdgmXIoVjN4mCIjEb6l8h9zRIXZaS88d0GwzNPTfrjVbCyUePFg==
X-Received: by 2002:a05:600c:c06:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-43f3a9b00c2mr60408365e9.28.1744489618240;
        Sat, 12 Apr 2025 13:26:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
Date: Sat, 12 Apr 2025 23:26:12 +0300
Message-ID: <20250412202620.738150-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132700_171138_3E9C92AD 
X-CRM114-Status: GOOD (  10.77  )
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

Document support for Exynos2200. As the USBDRD 3.2 4nm controller
consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
be handled by external drivers, define only the bus clocked used
by the link controller.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbb..4506c5801 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     enum:
       - google,gs101-usb31drd-phy
+      - samsung,exynos2200-usb32drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -33,24 +34,32 @@ properties:
       - samsung,exynos850-usbdrd-phy
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 5
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 5
     description: |
-      At least two clocks::
+      Typically two clocks:
         - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
           for register access.
         - PHY reference clock (usually crystal clock), used for PHY operations,
           associated by phy name. It is used to determine bit values for clock
           settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
-          in the CMU.
+          in the CMU. It's not needed for Exynos2200.
 
   "#phy-cells":
     const: 1
 
+  phys:
+    maxItems: 1
+    description:
+      USBDRD-underlying high-speed PHY
+
+  phy-names:
+    const: hs
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -150,6 +159,27 @@ allOf:
         - vdda-usbdp-supply
         - vddh-usbdp-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-usb32drd-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: phy
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+      required:
+        - phys
+        - phy-names
+
   - if:
       properties:
         compatible:
-- 
2.43.0


