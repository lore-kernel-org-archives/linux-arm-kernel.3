Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2555D10C06
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fIA9fyOJQl8Gu0sByK4pSmQgiops8sit5rWYrUHittM=; b=hWzuomgYYmwNl6rJsCXkB8oJvL
	Mmsc2XMFMc8ny5NTwm+Doz3AUWUVrnPR2Vjn02Z3DvAXr5Gnk5pbeobUY68pbeeKOwMHLtQfYv0Kl
	/g1aSgulRHSrXvMT0L1svHfOhWq0LiRgmOML6EutoqnAudf4fhwKlPiRDcWir2Wqn5PTwLKM/9/PC
	ZyDYpYUNGP7uvyaJaRjBO62QdtAwDUv8DSfGCEHkPcWwSWFqaRZFORN1a+Oai+WX7A6gITihSq+nf
	iZQ7Aki9Td72fCQQeimRnVh9QBtc3WPxF/sG4qhAj6l6ldBq7RtphYbPPtQ6ewCv3QbTUfw7dqeyU
	+zGeNqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4npS-00000007Eo6-2cHz;
	Sat, 26 Oct 2024 20:56:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nht-00000007E7f-0G3r;
	Sat, 26 Oct 2024 20:48:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c805a0753so30101335ad.0;
        Sat, 26 Oct 2024 13:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729975699; x=1730580499; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIA9fyOJQl8Gu0sByK4pSmQgiops8sit5rWYrUHittM=;
        b=FdKnAwIKS/BXQ285umPJy9KNfx/zvr6nVQ/0nhOhCvjQZUC6zZOQmncS1N1jt7ixVp
         x1qeWvlv+MLqvxo5uNT4CxPtPCL2CYEhJFenvisdu90AdPxFdhUqJvEINQlDbHpd6z+o
         XGzRJTdX2SqVBNp8H8Y9kymAynFEHafHUhqbXRlXcNLffAUrVyE1l4bjxn3SJX5zMKT6
         OMF85mVl2t3oFIkUmA3RpkZ15O5TbfjJQuP+pneRNVBPxrfaBhQ5/BQo01/mi8jRvCYy
         ldvMGjnstzRVjHmiDrR030WB3TmI1QrtwwQIljgLHm+qYoWJNxtTTlrN7N0z4jvlYnrH
         ZVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729975699; x=1730580499;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIA9fyOJQl8Gu0sByK4pSmQgiops8sit5rWYrUHittM=;
        b=keigGTgDxs/j4pdaIKVfUepil4G9LPEii3X+KhJrA5XNpT7rzsyBTio8YWac8FMraN
         Obi2tZdygEzl1vUOnTgRkoUCUQ7+7EjOsuIp61bffGEeh8qUdvZjBRh7TpZ3WP/O0G9T
         qt6FZIx57EHQUPOhvIwDlIO7r5V6ufB79Tpm6mGbWZuNwRduFUbdP+1ygivFGe2PSk+F
         HtLdKvWqinmKFPUOPqRrs62FCHpCVd2rlDXJzhkuDSgwGaf8r/4yuhTSVakwVOY1H1xp
         3EjwKLqKKWIQ/fCp0S1x4FUanp2v89ROntzxner43u6XJrZoz+G6Xj4J4lRf/efxO7HY
         0t6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeO1C5PF/0c1pSsXG/g2gBAz5RiCOpAlA9BDqQOzPSy9zktXy3p+lZwp+5HupVSM9aefgJja0XmLWqjHuNYsgA@lists.infradead.org, AJvYcCWHFEwH8mbjCnYxgQYnD8MnupY/P46T4NZDy3GMLz7BOJpubZlC2WxKqOb8V57RjIY/ZKR/3/2vMO7f0TsH/mGPxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFGAkcsIKitv6otLjFD7Wo4jM5/R1hFGLjzNVlh3AXa8HuVzT8
	xzZELd6KzhxweqqWK0KF2nh4X+DqKyjrAj7ygoKY//WzL8OSGEgs
X-Google-Smtp-Source: AGHT+IE333gdRW0oUHBCkmGDWZSQHfGYaDKn0tETw4Z0mGu0t3ZLNT8/4M/o2OAIEjGXwv5NgOXKVw==
X-Received: by 2002:a17:903:2b08:b0:20b:bad4:5b6e with SMTP id d9443c01a7336-210c6c3ec62mr43945645ad.38.1729975699387;
        Sat, 26 Oct 2024 13:48:19 -0700 (PDT)
Received: from Emma ([2401:4900:1c96:f151:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf4499esm27634295ad.8.2024.10.26.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:48:18 -0700 (PDT)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Sat, 26 Oct 2024 13:59:13 +0000
Subject: [PATCH v3] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com>
X-B4-Tracking: v=1; b=H4sIALD1HGcC/43NwQ6DIAyA4VcxnMciBYLstPdYdkDslGQKgYXNG
 N996MnTsvT0N+nXhSSMDhO5VAuJmF1yfirBTxWxg5l6pK4rTaAGwWqmaTQptBjjHBxt7QgNlzT
 4N0YqjQDOWmy01KTch4gP99nt27304NLLx3l/ldm2/UfNjDKqJGoQneVKyGs/Gvc8Wz+STc1wk
 AB+SVAkZoRpykjF1VFa1/UL011ntwwBAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Alexander Aring <alex.aring@gmail.com>, Eric Anholt <eric@anholt.net>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729951167; l=3906;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=LBHA8axdDgptLK0Z/drDDMkxSR3k9NMloOsHzw0RFbI=;
 b=QNVj74pVLjwDeuupmFKqLDUzJPtmv+LaSfOiza5lgdVnLkNwuzLzZs5U6tBlWbzEBHHFh8p/w
 EpBzzhM2MhNAkO3dYdYfkZh0qkrSS6QFZK2rCIZcxRGqCt0XKL6+gUC
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_134821_140068_C6F00281 
X-CRM114-Status: GOOD (  14.63  )
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

Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
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
 .../bindings/power/raspberrypi,bcm2835-power.yaml  | 44 ++++++++++++++++++++
 .../bindings/soc/bcm/raspberrypi,bcm2835-power.txt | 47 ----------------------
 2 files changed, 44 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml b/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml
new file mode 100644
index 000000000000..71b3fa41c495
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+
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
+      };
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


