Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71849606D839
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Axp2p4sX;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=lEdvJLsu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vLIUtL4Xr1f0AzzVPwVtBtZX/qzPi+fLoa0ubdM8I/0=; b=Axp2p4sXyGnkwQlaXWugnKNEws
	PDt6qh5790pXe+Z6i+YWeHL7rx5ijwCsYqqMz7w+6MGkbIy1d5U8yWJJBBY/EwKn0Hrt6dtdn4g2b
	FI5Gjgpc6zZ01VZHMN3dHe6Fkr+STEpm0wYxScbshk9KGrPby/GeAhaivsL/2Gdm4F4T9fNWAgkLM
	DYvNnKpVykE2P/sOL40pmwiD8PhFWvprIuSc15Ff3TZwKpeXksik0nKu7euRxj8McmX/kbKjV0PrX
	tQ87LRECIhxkTM7Fic7rE9MSzhvmn6BiYXMZAIxea3DrlpWOsampExjWrMoJx0dh0W2FJLwexITT4
	li5hckPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHT7-0000000BzrN-31n1;
	Fri, 06 Nov 2026 10:46:49 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHT4-0000000BzpC-2u0V;
	Fri, 06 Nov 2026 10:46:48 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AkYPC1953082
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:46:36 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AkYPC1953082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793961996;
	bh=vLIUtL4Xr1f0AzzVPwVtBtZX/qzPi+fLoa0ubdM8I/0=;
	h=From:To:Cc:Subject:Date;
	b=lEdvJLsuhqp1rYBqP/fHpIoWbBWw6vFYe1sKWY/sz09eVlro/MRtqV4ww1f0OWI01
	 9W2Y4EEE5siqjvN63cc664O2oxyubc9W9RC22AgENL6kYRzcWvmt76/Le2qtscJL63
	 vulL84EStzMnFE51xJLGxowN5AgBp4d6yw5gfvLQ=
From: christian.koever-draxl@student.uibk.ac.at
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
Date: Fri,  6 Nov 2026 11:46:32 +0100
Message-ID: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024647_069147_D581F599 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The S4 USB glue is the G12A one, but it fronts an xHCI host controller
instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
compatible with the G12A one as fallback, and allow a generic xHCI
child node.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index da757c1155d4..186390f930f8 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -27,14 +27,21 @@ description: |
 
   The Amlogic GXL, GXM & AXG SoCs doesn't embed an USB3 PHY.
 
+  The Amlogic S4 uses the G12A glue in front of an xHCI host controller
+  instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY.
+
 properties:
   compatible:
-    enum:
-      - amlogic,meson-gxl-usb-ctrl
-      - amlogic,meson-gxm-usb-ctrl
-      - amlogic,meson-axg-usb-ctrl
-      - amlogic,meson-g12a-usb-ctrl
-      - amlogic,meson-a1-usb-ctrl
+    oneOf:
+      - enum:
+          - amlogic,meson-gxl-usb-ctrl
+          - amlogic,meson-gxm-usb-ctrl
+          - amlogic,meson-axg-usb-ctrl
+          - amlogic,meson-g12a-usb-ctrl
+          - amlogic,meson-a1-usb-ctrl
+      - items:
+          - const: amlogic,meson-s4-usb-ctrl
+          - const: amlogic,meson-g12a-usb-ctrl
 
   ranges: true
 
@@ -82,6 +89,7 @@ patternProperties:
     oneOf:
       - $ref: dwc2.yaml#
       - $ref: snps,dwc3.yaml#
+      - $ref: generic-xhci.yaml#
 
 additionalProperties: false
 
@@ -102,8 +110,8 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - amlogic,meson-g12a-usb-ctrl
+          contains:
+            const: amlogic,meson-g12a-usb-ctrl
 
     then:
       properties:

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


