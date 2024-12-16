Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T34+DtDD0wVqr5IGCJJ2F6eVKGhKWw09EE8E7qNOEug=; b=fAwNrRZprV7lTEh66VNKndVOJh
	imYqI6Z+FBlqIQ8GYyC7EzX6Kwt+wcvgWtxH1GGMtw7fYVyC9IkEMMatzuI+Bf8Idl+AAxJxIn6Pn
	CNn0iRBTexVBEQtF7Bp83NoRy7ShY6hsRYdgoQ1DMByEJEkL2c28E320mFtdkOVfIATg/JrEVgxXm
	yBg+nxW2p8YMDjzzVqWG7Qf+L4ajJQTGGmme4NVR23n/Ob2nuPSZVYnx+U9dQOMN9/de1FlUARliM
	kZ9oq8QVuRH9tX0pf3hh3mhMzc5U7qaLUacZJZmwR91TW2HolBsqS7tr8XBKwSTrUlaIRTUPzrAXU
	B/cGWASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEa0-0000000AigK-0dTd;
	Mon, 16 Dec 2024 17:08:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEYr-0000000AiTP-49OZ;
	Mon, 16 Dec 2024 17:07:15 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7273967f2f0so4595085b3a.1;
        Mon, 16 Dec 2024 09:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734368833; x=1734973633; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T34+DtDD0wVqr5IGCJJ2F6eVKGhKWw09EE8E7qNOEug=;
        b=TqESgqJw2x1aKCzZGZf9ndkdqkuFcmgTna2Uxp1g1EWNSavfES+bTw0PS0I1xAm5Aw
         iFwJqOdVkhogl9ksjMUVXmJpuOYJ4B18+Oijz22Ljnv+Vk2GkNeUBebimzGthg9YFiKi
         Nn4w6KBjzNIDsVMhRKfn8qKZjyOD8prFZ9XZiByrfmKcnz+fecvt2g/AU9zWLrv9yI2k
         KUs4ZHxs2sGEOpkP+/skx/qbEZYTr8uyebr04jYJ6VXn32e43f5hAq+BJ9DmWgyE3/wo
         Oq4wUwPVdEiKK0dRWismA5sdyo3at3fL84OV+HFExHt2z1lxdMWrsBEf7MjNDceLS+ws
         ELDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734368833; x=1734973633;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T34+DtDD0wVqr5IGCJJ2F6eVKGhKWw09EE8E7qNOEug=;
        b=uVZZMqUUkWQUiLjYWTbTKe7uhDNmjqQI+QwSHJSv7ZqA4TArBRIuPY4jm610t1F6XU
         Ph5b8Q7FBtxOFMVu9UG8zq8vYloU8leWqAwee8sfBuf/SkGUzNCbU+96Mi9W8mIfaZ3i
         BJ08fPWJ/ylkbXwt3BKBFVGXTu0E2cxT16flueE5dGHrJ8xJH7y6BAHoQIdjk+M6bifO
         cGxO9haN8zSSuCkRrCDXFKw9gdfc4x94LUSG5VFome8ofC905ya2Va5aZI66g4IwEQ+m
         EgGwD6gIFBj45Fiz2DyCQE47dydTnvC0mdQ56EPsjUQ1/YeGzMSJPgjmAJU2Z5xUUUqU
         ko1w==
X-Forwarded-Encrypted: i=1; AJvYcCVbjxaCwylWF3sgLE9E3Ur8ompUoz8HTczQP7xJlMdYl8onxYZiPo8RcO9QG9EkRg0h7ejj1CCdNxg06tEpAyu6Og==@lists.infradead.org, AJvYcCXEYCT1Td1Udj2z7R+k4y0moDTB9MEHXo1O5M8vLLsu7N9EjaAgRDaZc+QfU898t/8cS+beVDH4MQSzQSgneXcb@lists.infradead.org
X-Gm-Message-State: AOJu0YwopPXdqKwWCwq9LgDb3E1ZOrR4NRDyrsMooGALAoXaXyWhhPzR
	2llE7Q0Wl0m26jTAHXmtSs8yq2GxidCe4osQ77XwHrj1yqhRejRW
X-Gm-Gg: ASbGncsq/+UgdAv+Adno+XdUhN1n3VqQhLss3Ro0CFy5LXoN3IHpeN3ny5iATkXdt4c
	US5SO+wGXs2IADZTsnIZk4p2gSmmQS6WTZZAEtgGXjG++BdRDw72zxEEtkmdf0prgVEApbkFvU1
	ovO+kvEKntuWzLvFglwrY7SfrwZZrEORP3sv0mGGoSq+vo6kTudQKubDXzJSbM//2EDWXR55ebI
	+pSCGvSQOM+vVsMDkN+DaJ3CN9rP8ZgMNjZwe4hv/KiaA9drZ+qLZQ=
X-Google-Smtp-Source: AGHT+IHNWKzG4P2yf8XN1h6ogBXeP9L1IgkZcGt+PLq7zz8qiHMZjIJXiPRDxktgo/QPd+mZGcAxyQ==
X-Received: by 2002:a05:6a21:6d88:b0:1e0:de01:4407 with SMTP id adf61e73a8af0-1e1dfe22fbbmr21873712637.37.1734368832710;
        Mon, 16 Dec 2024 09:07:12 -0800 (PST)
Received: from Emma ([2401:4900:1c94:5875:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac53cdsm5144550b3a.23.2024.12.16.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:07:12 -0800 (PST)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Mon, 16 Dec 2024 17:07:00 +0000
Subject: [PATCH v5] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-raspberrypi-bcm2835-power-v5-1-222fc244132b@gmail.com>
X-B4-Tracking: v=1; b=H4sIADNeYGcC/43NwQ6CMAyA4VcxOzvDupaBJ9/DeBij4BIRshnUG
 N7d6Qk5ENPT36RfXyJy8BzFfvMSgUcffX9NQduNcGd7bVn6OrWADFBlqpTBxqHiEJ6Dl5XroNA
 kh/7OQZJF0KrioqRSpPshcOMfX/t4Sn328daH5/fVqD7bf9RRSSUNcQlYO22QDm1n/WXn+k581
 BFmEsCaBElSFm2Rhow2S0nPpXxN0knKc1CcGaq1bpYSzqViTcIkWdcg2qpGan6kaZre0u8yD6A
 BAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Alexander Aring <alex.aring@gmail.com>, Eric Anholt <eric@anholt.net>, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734368828; l=4303;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=nqa0yKrGVipzt1i8ai3QnkH5EdsUmx2Gx1mXizMu/eo=;
 b=XMdBfFMw2Ua7oi8W6VLKMIB+O3aFeyg/K8cbMgxL7pMjxHQSjqMAJnxjkKYkce0fExwSdJBcx
 mj5a4OY3uycB7bZpU01/VAxC97jTIucxQJMNCPKxMib3mU6cSHQzac0
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_090714_036911_282F1C3A 
X-CRM114-Status: GOOD (  14.54  )
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

Convert the raspberrypi,bcm2835-power binding to Dt schema

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
Changes in v5:
- Added maintainers for the power domain
- Link to v4: https://lore.kernel.org/r/20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com

Changes in v4:
- Corrected misindentations and random differences.
- Link to v3: https://lore.kernel.org/r/20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com

Changes in v3:
- Applied changes as per the feedback received for title and description
- Removed power label and renamed node to power-controller	
- Moved the file from bindings/soc/bcm to bindings/power
- Link to v2: https://lore.kernel.org/r/20241022-raspberrypi-bcm2835-power-v2-1-1a4a8a8a5737@gmail.com

Changes in v2:
- Added original file maintainers
- Removed unnecessary headers from example and formating from description 
- Link to v1: https://lore.kernel.org/r/20241019-raspberrypi-bcm2835-power-v1-1-75e924dc3745@gmail.com
---
 .../bindings/power/raspberrypi,bcm2835-power.yaml  | 42 +++++++++++++++++++
 .../bindings/soc/bcm/raspberrypi,bcm2835-power.txt | 47 ----------------------
 2 files changed, 42 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml b/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml
new file mode 100644
index 000000000000..259e1d9b3fab
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/raspberrypi,bcm2835-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 power domain
+
+maintainers:
+  - Alexander Aring <alex.aring@gmail.com>
+  - Eric Anholt <eric@anholt.net>
+
+description:
+  The Raspberry Pi power domain manages power for various subsystems
+  in the Raspberry Pi BCM2835 SoC.
+
+properties:
+  compatible:
+    enum:
+      - raspberrypi,bcm2835-power
+
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the RPi firmware device node
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - firmware
+  - "#power-domain-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    power-controller {
+      compatible = "raspberrypi,bcm2835-power";
+      firmware = <&firmware>;
+      #power-domain-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/bcm/raspberrypi,bcm2835-power.txt b/Documentation/devicetree/bindings/soc/bcm/raspberrypi,bcm2835-power.txt
deleted file mode 100644
index 30942cf7992b..000000000000
--- a/Documentation/devicetree/bindings/soc/bcm/raspberrypi,bcm2835-power.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-Raspberry Pi power domain driver
-
-Required properties:
-
-- compatible:		Should be "raspberrypi,bcm2835-power".
-- firmware:		Reference to the RPi firmware device node.
-- #power-domain-cells:	Should be <1>, we providing multiple power domains.
-
-The valid defines for power domain are:
-
- RPI_POWER_DOMAIN_I2C0
- RPI_POWER_DOMAIN_I2C1
- RPI_POWER_DOMAIN_I2C2
- RPI_POWER_DOMAIN_VIDEO_SCALER
- RPI_POWER_DOMAIN_VPU1
- RPI_POWER_DOMAIN_HDMI
- RPI_POWER_DOMAIN_USB
- RPI_POWER_DOMAIN_VEC
- RPI_POWER_DOMAIN_JPEG
- RPI_POWER_DOMAIN_H264
- RPI_POWER_DOMAIN_V3D
- RPI_POWER_DOMAIN_ISP
- RPI_POWER_DOMAIN_UNICAM0
- RPI_POWER_DOMAIN_UNICAM1
- RPI_POWER_DOMAIN_CCP2RX
- RPI_POWER_DOMAIN_CSI2
- RPI_POWER_DOMAIN_CPI
- RPI_POWER_DOMAIN_DSI0
- RPI_POWER_DOMAIN_DSI1
- RPI_POWER_DOMAIN_TRANSPOSER
- RPI_POWER_DOMAIN_CCP2TX
- RPI_POWER_DOMAIN_CDP
- RPI_POWER_DOMAIN_ARM
-
-Example:
-
-power: power {
-	compatible = "raspberrypi,bcm2835-power";
-	firmware = <&firmware>;
-	#power-domain-cells = <1>;
-};
-
-Example for using power domain:
-
-&usb {
-       power-domains = <&power RPI_POWER_DOMAIN_USB>;
-};

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241019-raspberrypi-bcm2835-power-5a4231be8959

Best regards,
-- 
Karan Sanghavi <karansanghvi98@gmail.com>


