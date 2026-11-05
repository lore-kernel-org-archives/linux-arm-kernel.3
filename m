Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17AF606B9F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hqoan9Bb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mDcjKIzy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=; b=hqoan9BbBSl0pIxk4Lv46mhe0s
	WQAmtHDYJuXxqHUh06c8Sr6QYJoKe+3fdYGH7pVRVRXem9+pNJEP3v8ws8Ax6umm1uvdN/2MwHt4v
	LFj9XuDzanuMvo+pBRpKFgdVZdBG/L7Aic7LxlTFoCtPdsvga2PC7M/7nTQ/w3A58NBlBORkCAYFj
	Dz89Q9kLy8C56yQXcbU8v3gSKfij8ge9Vg0fcOQRFWvBCfCBg2rgBtuEAB1diYmBuQSVgbfTyNiGv
	oMN/u7lC0CINqIIzGrVirqksh5vdeQIxqCV9PySc5FL/9V4gIkNG4q+PI0J8TxAgFozgdMkNOb1N9
	QW0pYKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3XQ-0000000ARO5-2GxE;
	Thu, 05 Nov 2026 19:54:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3XN-0000000ARMH-1tNT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:54:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so22346145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908455; x=1794513255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=mDcjKIzyGaV0yB5vB89xUkoHnhqjau2zb4okRPB2aBJJaylI2zx5hCOFI4MF1sgf0x
         kWjVzGbtagd8mCHvUecAWIvMLpn0/VullLYsoU28ybt446h+NhR/czf2rUutE0KOUW+n
         eqcgOzjqIWfpl/wotjCCbKJS2qC3pCAz97G9O0L3pAnhVaJ8gaUKQOPz2EtxbHsSU+xY
         DieKlvINg9q/8HudbqeiqbVgiU4d2V70HK3HocniQk4phaG9jRyn3vpAKbYCug0wl37T
         XtUV19nlwlL2dkR1w0R/vc2nxsbmqe15CZJDkw+qzVZ8K8gXkfagi4KB7vPC90LqsIOQ
         ojZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908455; x=1794513255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=xlcR5PEmGz95M8k5JrxKwcKHAUj1dHrXT3RDO0PGL4Dnp/7jmJqk4b33BN3bnPUW3O
         t/i9G7gJWBPqlgdGFGDtcOst39/KDg8BXWOyQ8cEM5fIWxoMaNFuBYhfJwmYXnmha3/8
         tTRZPXZ8YfQLqPKAXlIgr9sX2O4VygsdXY1f2pTqIk8twrSXpi9wjNkC+uu/9swz+R3y
         lygRIdSHXZkkgx/LNSIEHKOu8wLWuwfCl2Q9vWx88Ihh6x2XhUOTif+/3gE88whkuY7J
         mqm02IEQbP1pXbQNY7awj5R1+1pAnehoXqk2IgAkEML99NUvD1zj853rMvF4eGEyidHN
         QonA==
X-Forwarded-Encrypted: i=1; AKwUvByNXQqLoCaFKhjE0OjpzpwfvKbBALWIo1/SqnXvVw3z0r+OIisBM9LVdF2/axdT5yg94NFF/C6OrksLMIA37Bcm@lists.infradead.org
X-Gm-Message-State: APuU4Z9Xm8dk/YdOumK6cQDFPak9mbjtSQVThhxNzvmFcy5dvWRwOD+k
	4ipgr/QHrOMwsn0gwr7gEcrflE7cQWRA0VxHD4AXmrOM3Y8zflObCkBB
X-Gm-Gg: AYBFou0j+6Ho55Ho70fH1DDSgcvXgYjN13KE6ExHQnOj0+POzcGfljq88xkpJVTCxd5
	DVTurqw+PzI6shpgrhpxFBkzn2Z1COZb36sJvjttE/BXVFuvYTNyQ1aSgEmcUkz8zsZgcq+EBj2
	XRsa2SpRzAzeC4eVeuIbPGV6GzJ9E2Y+3dWp3jjWxjUHMcq2Yb0U9bWmG6IQ7xhSeZ1Y0famyJS
	jtTiGC2qvETj7FdIcSbNOQWXxiX9SP9utyzZrwGgaZ0Vd1s/ftEzJauLOw1PnBOZtn07vLSEylN
	UsSTxx5lK/ds9hj918r+XNRB90npCZP4J0sYQI6DyowuS5s7paf1JREqltvjzv9wnv0ZUI+J0C/
	8sbredVYOnsn1/0xc8Q99TqMYF09EgjY6LxazoA/DMnWpCcms/DFk+kQugql7W/OQRdXSnYNO1L
	3xdzL7p/wz8Xgp/+A53j3gA4FIBetZVn3r6YEtcd6zgRnAmw8v1j+aRAvbTtj7mEJxx6a9s2LVt
	E8qCHdO4jpHG8LLBCr232fhqm8bIa4XKO4iTU3VUNFoJQS4Q+S1x45vFbg+xhgtS6k5rDEsPkYe
	4TxYJyTUOyFLHzGL1Eu3KX1AuA+g2ySTcZk5khh93r4bjQ==
X-Received: by 2002:a05:600c:3f10:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4b6dea69280mr3035835e9.14.1793908455226;
        Thu, 05 Nov 2026 11:54:15 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 3/8] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Thu,  5 Nov 2026 20:50:23 +0100
Message-ID: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115417_523524_4FEA8C6F 
X-CRM114-Status: GOOD (  16.36  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..d74721d8f2ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 1]
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+  "^v(cama|dig18|rtc)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0


