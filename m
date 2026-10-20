Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22528606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rW0JN7YD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rx5uyr1x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=; b=rW0JN7YD3rt9b3vk43VmbNyT5R
	SlkCcnxRFswogO+3oBtr15EN/88fakoZ51YdPf/IPuddWQ1GEEcgPwEfkIzZb38u/rahtKrHaCBes
	WM2g7DD2ik5+CBG9eQPMnBx5S3ffGxaUomnAIIVti8am4wcAX+CaHLNmCs7XNxBT9uX6X1mFKUu6G
	Y0Ts/N/rar+uceuDzVFfV+x3jKRE7hDGZjL9wxbWlDORO4LPx8kKECqnwbtpj4XSbCYkQzkwvXufe
	9r0dANC1O6y8ORwb+SZ36ARrVJbjPE3/iQJR6/N2uCmq5pbXMqZ9oL6Dizcq7sRWQqR+y/hZTzKEv
	Ryke4VDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDln-0000000AM1d-0O1Z;
	Tue, 20 Oct 2026 17:37:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDlZ-0000000ALwI-3UR3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:36:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso35373075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517808; x=1793122608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=Rx5uyr1xreySAgfQ1kfc3sWqS1eW8NGLwNznV3rkkBY2+KyPawI0S3K5ngoPUx7Dk3
         c/HII4sNnn8+g4T44YPJybuznRdmfWXkGpEwv4KXA9WqF/eyUgKzHwa3TSJVgIAkfeRr
         jZQkYuliHwIB+gGkgggq7x2p/9k521TWZgonJcHOu6c7UdjJF+2IVbn+LYQLmNqYtDb+
         CrcTzjJVtzInbR2fwowVojPnUKGrk19naUtsIkDgS9gAwB6/Z7Z1jqUjG3Nlwm3LTx6A
         NfLV2Yh/Rr0piaDQ027smcv+RJJLzFfg+mUZ6DJxsQ9KW68BWjzj3wtbQSPMx6N2ktXG
         +XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517808; x=1793122608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=QQD9I1BMyB5+QIKOy7mZ5Hu4RQWND37AVJvsN2rwAlu2Kc/ZaW6meT7+Ia61m4l6k/
         wgOmnwbUXtOz24sbyqLq5hdRW/8/B62dUTQ89usIOo6nWG9MvdXOgF04uNkoZUPcz0NQ
         lNsvcuSuuDkD4f2IfCdV4ggRPVelAY3Cnt+BOLOih0BklnUtcump0lWWmPQeIBxTtQb4
         OxaoNx65f5DWiDyHQTB1mLXi5WkLd7+WrzG4U9EgxJ3WP3PlJ2W/K6QE+oipz2/NiqY0
         WTJfwGaohxcaeo1yQtROBD9iiya7gfB5ukowou13QKuD7XXnac9EqcdwQLhJ6EV7yXKJ
         sgyA==
X-Forwarded-Encrypted: i=1; AKwUvBwdtq0F0KYkDVW2fUi1/fxGE/yudhvJd/mb3a4ubmw3gBRnpV1ojynEgcnmvNi5j+9Agvs0tCaypVU22puy8aOs@lists.infradead.org
X-Gm-Message-State: AFq9FYKbOEMCuz6gILVfS7nUAV1tN9A9ku7FbjfmILirSUo2DjXq6n7w
	4SAUeAHPafr6Zg15qTwV4moEmObWKNLGWLC1Cj6bM0gLIfFOVx/qoHpV
X-Gm-Gg: AYBFou3z71epywheeRwFAKmUuspctLGDOWiLGfiETk39cAtl4PxrC3LZM5W6s9c4AKh
	21LwS5DvIaSeUmFMp3oSl6pGL4yi98sI6awOE/fRReBTgh4VErRcbW+iawgOYnw9mMUhEECttUZ
	RBL61vLb2Ml73KMDmzzgO9ZrlweZjayKU/tedrJddCLA9PIKkQ2NcMEte78Tp0IqG8yb94tVKv0
	WGuGXeDLCyEqEpS2rIDCU2UDndzJU+sLdp9iHdbZnq5L1fOqmA18JVxYtiNr2f3NOD5x2rPY606
	Ezb51itBOLL0Q2uODgXY/L5l1OXWezz8GWuhwyKgTUEy8ITZoHG4ugtlqTKkawFG9Rf+tcSRtdn
	B4Ggx01olJPxT/hBxTQqG2CD+ocUOU3futG2mwxd9BS4aUZzAJ9B8EY3CS1yECJKb/jNrW/acv9
	dqq8j/1DrbWJ47Qeg/yYy1XMROoBKiBoguGfgMePDYSe6AqHEtwlsNtAA0IRTisoZXNA==
X-Received: by 2002:a05:600c:19c7:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1d761b90dmr248715685e9.30.1792517807739;
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Tue, 20 Oct 2026 19:33:22 +0200
Message-ID: <20261020173556.632798-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_103649_909189_7E2F7939 
X-CRM114-Status: GOOD (  11.77  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0


