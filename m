Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AF4C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=; b=ey0uIVgGJKT+BwohF5TttSwtcr
	a6ziG0zt3f5tD4pYLPl698L1Va4dPn26rkdQwQpWvWdSgn8unnt8B2Di/Z12RS3KqMw7TwJCdVpF9
	uv/qul+JptIGtNC8MCe4H2EhncZt/2sIZUiJqXZWwOj3Xki2bv9OjQT9AdNuOq7lPgEF46Rkp/3Po
	HoKXSN1A+jmkwwiYcVe7MneFzXi/AzRy72Vh4Gwuy9GkcIkjM2wYYvvyaNt7Wi228vAKk8J4lMzpc
	DslAHqCFvKLWEEVG66b0IRTTFBN0kQS0zhXVMYGx6AlPEHsoaF6vowtkPA7LgBXhk4ypOSdV625dA
	wu+FPKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlN-00000008VDz-0Lf2;
	Tue, 08 Sep 2026 09:05:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlI-00000008VA6-3RrX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=; b=Zl2bTnY071YERerGmX30hZNjPj
	Lj6rbeH/U1Qkaa8OWmTxTZxgzqOHhHLeroQ+3e1nRQGhiCMSMY0sLkSutGeLGiLUjciAdpT0hhHiW
	wD9rE3ib7I/nW3/ZrSVxzNtEgNszB6lOmfwUBTzz1+qB/PcD826KYV1+Zm7qYqCiH8WfnCN+mgwt/
	9dCFMA5wmw5ScmMcRu3VGvspDZObMnW8XfH5W5IfjFo9EFnWn8QZVnU/HJczeHJxLWhHjqa9ZLNIi
	IwPC116yuSyRS79kKEmeoQITl3OSkxOlhFL87XIT0X92J6nxSWGw3pvvGq+9Y3pxOmCV2EnZoPznX
	ADUFJA1g==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3rlF-0000000HAE0-2MeU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:05:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso5866928a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858300; x=1789463100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=nDcFFDn+6u1ZA+YKoMcE7sShyJCAzGkItV07E90EUX1W2gsE5jZOuWT1XiwdDXkYZy
         8k7x8qkAC0+TkH6bYJtBtqC6BPJx5d3MeI991SeiJhxGU53EVTUh9AH323Q2eHMnUYIH
         KBrJhRrnFexRqL9YG4c6HueEYNxv0NsKU9EPS8er8AGnzZG+piCjdoxXFS4rATTfEaOE
         8HyNDSMLbCO8Pl5iC8ScuX82vQE6w7XdC0Sg7Y9ic/jA2VvPXetLFVqJKElpsyMruzPk
         9z9ZUBFGGogcrECviOMFIuomKKD+lEtznZyB+cIDFm/bNQ+3SaH6UksMvN9im54fnQ3f
         LhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858300; x=1789463100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=DN4OafcF6atuaxnEQWM3V8o4+A3DhHf4FsaSXmxVuqziTU3kEOEKnrm8uRvl8yTDr8
         Kt1pNMz5OtxUMOqetGDnAUcUEGEQ9ZP9nPIbkSrLQKsKzrNhn8wBI9qSavJUQoaY+ka9
         5dxQG6GNlpA2KPiIu7/HWFhsw7+HuCdsyrjdG13cB2sFooqmvdYOrYPpi/Y4LQzJ3dO2
         TsrRv0gvCBC8GMY1GXwYA+YBnkcSPaRkA/nOHjN4o72dUmp9lHMMAKiqy5X0E2H0QvWf
         6dOiim4SnG4QMtBSJ4XYqSPiQdXDE3l8fjSIKlD/OwHSXUUOUnQPhWf6bUKZrYPN7fA0
         UoKg==
X-Forwarded-Encrypted: i=1; AKwUvBwbmOk9eWed8g5QteqI5fUfvxpOGwwlSWc5GTMPeZPBIpEGqq9Layb6S4XhvE9H2X5XJYnO/Y55KlTJYLvUf85n@lists.infradead.org
X-Gm-Message-State: AFuF++ltS7K8ezYV8u/K2O02aVx7viIurkrmzSBb35aSEbvxGZ5M/GML
	65wOJXC1QQDVD116S55pM5wpK0nljF49FOO8if2Qag2Ptvl0nCfHfzB4
X-Gm-Gg: AYBFou1qdh+tnQht4mi9JOZya8ga5JkLUxgZnvev/UUv+FgAuHdTQUjB/ORpyTr17eo
	A282AAzbMMCW9Fim19Hf+8j7Gntukjo4GVBrJmlaH1sECnoJz/eZoajFxqKGeYxDIK62ifG1OZ7
	e7xbZGBlHsMUKXNNY/moIX/v/kjHJsklboiCXKyxACmEuTAvLkCvO0WiijvxwuFg/kEm9qzYcel
	nWlAw6fwGF2L19WL64cYXhPHoul2s63ZjtWt3XBwN/qTAUF9arB7YG+cYw/6R8xyk6lRa+DfILY
	rUmHGkogtVEQEKiZtYaspaabXBo5v+ikawMIyfouOI3vPlZ0psCnt0FSbw2krhUq3NkY66GQTZv
	jUJm/GOedg7QpyOPPSOxT7x5csnGOfFwTBBkaHOA0oqs5DoxcHzt+Lky2+tACM3H4iqy/SwM9rA
	U096aLoMj7ZPW0d6FWqsV12DtJXydWJTYt66aTP6TAu7i1yjqGvK/BkMvFFF+mB9VQALfGrj5Zc
	DyxzWYAkcBAZAQE5j/nixUqZDZvCe0oH6f/qgLpfa9SOb1VC3Py
X-Received: by 2002:a05:6402:3554:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6a7e8d4d131mr18523650a12.6.1788858299489;
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/5] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Tue,  8 Sep 2026 11:04:44 +0200
Message-ID: <20260908090448.3332-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_100501_910905_E0596E27 
X-CRM114-Status: GOOD (  14.62  )
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

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0


