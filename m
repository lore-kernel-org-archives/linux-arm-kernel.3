Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC5606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oVkm1NBl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoSOPc50
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=; b=oVkm1NBlQz1Nid
	SWXCmMk3Y4HAmm3NrEtRnu3QZ1M83tKy4CCIVbYTbnD7NBiFp2OdETBLec49DykvKta7gxw+S0LVH
	JY6pqWRsxBL+xdp43Xe7GqcnQ4HIds9mU03jHxLj0z5CQ3ctoUVTV8a1MKr4BbkX8HCKc70Lo7wUc
	iHj+DNnpwLesfYe3hEl1cUByk2lr5Okoys2r1xSHsOXzWBo5nE1ZSDLVFfWCmnbcFsWjZUzrCV/ml
	P7v3xXKXMhshPzBFZtWpkCiqVZ9k6rrORP72hSvM5QQGuCYaD/y9E7qHaUUvyPjRn7i7h6ia/RKGy
	YUHL/WAHc/EXj1RuGfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQdN-0000000DxwZ-2LBu;
	Sun, 01 Nov 2026 08:09:45 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQdL-0000000Dxuv-0eQi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 08:09:44 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36a2551d7b5so4015259eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520582; x=1794125382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=FoSOPc5032DEi8I2vJEmVj+NNtM2mXhYoKnRkncYL4U1xnRTAjxILDA4aqLsSRuVCd
         FeEVfozzTa/wxhR94WZbJGZUKGJheqKk3SWMAjXj7EzHnYcaIt7L8BXyi6p86+arckIU
         gGzBg7jvXmg+BCIVNIwkfy5JM76J0BRdyZ1HlwS7ogmqKqFqWQzIA5E1j3jjcfLA6G+h
         /+ULggteCrFRqncOeIsl0kGkByFVTrM4S6DJlK6wV1zeiFxSUCsu4b0hpgYKGwZDfuik
         fxA932fZRz7C3FzySWgsBms7KL5kJXiZ0uY9zbIh2sDEsLpKhOu9/BDglr+ZwfhiA+Pv
         oxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520582; x=1794125382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=f7+ll7cmaSC7LjgU0ye7RcmTjubX6Lut+PzB4YpSZg85jr5x56ZRfsFzkh8IFtaDFw
         moKOyh2elKUeFOP/Q0rn9D3f9Km5x+fsRJcl9Ecbc8B/H4R59EDZSna8w601S+QeFK6/
         bxtOLJj1n/H5l/4/WdcJ4CuHrDL3kXCt4iRFULvrw35NDCzklWcNd3FIlJ0FlLleTk9v
         LxaU/Dxk8Ap+LgBtWBcWz6RZL24ex3/WfCz2v4avk1fp+GCYY9mxPqE1eB+6skapwzJn
         wtjOhYxidMWkWMm+vsV/8LFqfHsHpYMEruLN8+eSVj0PbGDRjFwRZwi0kRbcWGCsvTSY
         GKSg==
X-Forwarded-Encrypted: i=1; AKwUvBxig/sScAXKT8sa5l0CixhJb7VZPt/tRHYAtIjYKV6g6Im7PWcWUbEs8icqr9/hdIuA9W1lmBWufo2HuIDEhn99@lists.infradead.org
X-Gm-Message-State: APuU4Z9FVk9v1apqln1Z2l2x1tUps4HCtCc0IHMtel/XyZQxTCkMPxhv
	1bq3KNiT0WLANCZ5X1DMvxwIoMwvsSnPML/m5dtQ/15g4m56ZvHa8RYR
X-Gm-Gg: AYBFou2YuFAIdZEHhV28HCz8CUl+uBApT2Q8dAD3fhk1SaDet+UtVyMpDT0lRUTlOZI
	+0Y7+t1iz1pxBS4VnRCRXjf7GmDRFx3Js6Fsdj+YO0WIdVxwolqV+EhkNvq5FWq67fgIkZQE6qX
	rCXgU+4J0lbyLKlOCR9oU9rE0XKE5ycUsc9YQd4CfH5k+ULjRWrNV5o7oV9G4wty0mz2LlMii+E
	Q0T2EfVh+rLUeKufivjikBpJCE3APf7CQd9fCS/JcvJ7r+3IUkx8opvJNgSHOqrgMQ74u7Qk5cQ
	FLbP1wjLsiAoAuTk/9VgUlknGWTIDGHyUE0fkpLKXz8D6f1CezJvPWWDtJ3ID+yvG+4PL7wyoei
	sUw8s+6doQQZpTApBjkgYEMyyFi8BQsnizB1d14U9KdT4pPgYfVfVuJ8f1Gs3YpoqboTa8fHKEJ
	2JSfAaoVaFzrt4rEf51BTKO/i0IRe3x2DBcnyBS6BxnZ7+F4o2UtTldA/2s9nqqL5cF6RwhVZhO
	sn1qUy5xh3F5XOku813ZnAiz/YWZB/XRVxhB2lXrhXImZXZsAq5gJdEj8/Gm1jBBRLiR9WatsfQ
	zDMypP8ehA42cGJ40JKMmfCMIALFLv+9658P7Ab1
X-Received: by 2002:a05:693c:6304:b0:36a:60f:3e9c with SMTP id 5a478bee46e88-36a420595aemr10215792eec.0.1793520582159;
        Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:41 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: sound: add Everest ES7202
Date: Sun,  1 Nov 2026 16:09:25 +0800
Message-ID: <20261101080926.267041-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101080926.267041-1-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_010943_256594_E4E000D6 
X-CRM114-Status: GOOD (  14.59  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0


