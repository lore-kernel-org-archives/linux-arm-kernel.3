Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDA7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVSwUzYyCuH/0EmC09Tuh6m4O6FbPIf1eRFL1KmeQ8U=; b=k+3f6c2VbJGJwNdP85vCyIwwB8
	UjNYdCOWEiPic9TPQCJOxmZrS8d1KDibTjCL1Xw8ziuRZqs+buK9Ro4fOneaR/svkQBXua+UF0Q37
	MHXHB7s3D2LhLayWA1MpybHPgx9JuKCJ1Yp1mmXdW8eXcLFuCkPY0xLOwpJzsqG/uTosuDCy/B12s
	N/7IhlV31tzCAXb85RriEyjGLse8RW6vzQ89RQyG/Vkxs+QaxtYzt2FpUJ/QK9VMjmv74UNX94/2R
	8K0fEhkKGOCeiXA3f3JGSDHlLjMUTo9hzkaJEAwunDjN4kzHWdKjSs9TCh1ZaqDlHZ7SeCl4ckocu
	lL6+VD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFdB-0000000FgPR-3O7h;
	Sun, 09 Feb 2025 22:18:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSL-0000000Fehh-0gPw;
	Sun, 09 Feb 2025 22:07:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso24682375e9.0;
        Sun, 09 Feb 2025 14:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138831; x=1739743631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVSwUzYyCuH/0EmC09Tuh6m4O6FbPIf1eRFL1KmeQ8U=;
        b=Ka/ukJZ8zVtFWZP4TvdPJIfw/bHCryF0ANmP4ttGMVw/vAWrdbxZXmFnHrztQJppXr
         HWYmjahCKYbuAC9nU801YBR2FSMf0Lcccx+EYvrrsV2xLVMgoBlO1oeNfgpB8MVc2u0H
         aFvqGxgetcuibUryyZ51TFVr0qyDWWq5zgUIB5x8qNNo5RnWbCvR0rYNzBZTKCmaR2Vj
         DKFu+vMvZi8WG8qx2FNeLXA49bDnemUMONkS22SiFwnQS3VNQok6TMPgxIkO9Q5kxoPF
         ktwJqM81M/AD7kTI61JdyBivKtLMAADXm1xWd+QKzkM+WLvwCPVDpV+kXA+esey5nKch
         PniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138831; x=1739743631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVSwUzYyCuH/0EmC09Tuh6m4O6FbPIf1eRFL1KmeQ8U=;
        b=J95r649Pbe1ELujlpeux5fuLeDl2S4qaoSuYOz/RTIjmXvFTo7HLLzv5FCjtM0LP8M
         M2EhEkupWDoXWXtt3bSee/0vRsuHYFzaGkSYai+jpP+zi01qNjWOf0bnNDuACJiI48l6
         3efSp5E5s+Pt/R52qqi/dgqcNqYl5lvlwkkOx2aGkzxxdVu0V8tbFummtbnmGnbDA3a5
         OrHkT750Hlm1gteX1dcKADJa/nedPh8gDwA/FWIditypXePgDVWUEogv1tTzK2K/22Ar
         o6d9x2xuxO+dlR5hxLWNsr1nmDUyR8dp9cxnW4fI53yCnIaT+RdpSjT0Tjuk3Qwo4Qt6
         Qf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuZOlvEl/owXNNuEPskqF9+P/rcmH6+hkJd8MPsgIxi8OKS2+v9/cs+kXNK8yGlS9yewstQO8gCqhNsCQ=@lists.infradead.org, AJvYcCXwiB85f6TVycAZjEGZM/yW9HxDYJfi7bFuDJl4UhEzOfpw+82z+koWOTI5Lc3M1esNxp1cmHj1mCxfKp2J9Nnw@lists.infradead.org
X-Gm-Message-State: AOJu0YzbeAPCDQ83P+HwQlZW+m+aGsZ7putXc6gWhf2GLEVsBsPDmmY6
	PfnuYfYMtw3Plazu5bDjZtohLxFIGnOtBAjDDHkXv/1uKjYlisP4
X-Gm-Gg: ASbGncvKv+RV6+OdgTd/YtXKhF2qOhQuyHMXWptM+I5x3UKQVx90OWckyagbHH6m4rh
	xCQG4rTgNrE1YwkSrEb3ZBmRlWT8QUh3/B38Pt3DS7/MEdf5+ImK3zcTnHp/DxBWswn8cMfnF2B
	1VX+kp+z1GjdG8xKdQ1jjZXCXGGHTh/j0RSubH0eKM21AFYp0BtHlrwdwpbVXQVfKZxZG24zzY4
	6KtA697sxuAlAcYeB0D5/6R4GZuhvEj33FYnCMemfNRwHMYP/VVpAT4OLezm2DzvpW+TvYTVW/h
	vciNo6Y4jyak34KS7VenmtEKZQtI
X-Google-Smtp-Source: AGHT+IH5vVna5qsuNt4fQZwckiVpOEaiuCCrF2lXcmMmNlYOm+Z+9AtnNGM3IMnM6VxBlfyTkVsF/Q==
X-Received: by 2002:a05:600c:8705:b0:439:41dd:c061 with SMTP id 5b1f17b1804b1-43941ddc2a4mr22063795e9.31.1739138831167;
        Sun, 09 Feb 2025 14:07:11 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:10 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 07/10] dt-bindings: reset: sophgo: Add CV18xx reset controller
Date: Sun,  9 Feb 2025 23:06:32 +0100
Message-ID: <20250209220646.1090868-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140713_214315_8EED9BD5 
X-CRM114-Status: GOOD (  13.26  )
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

Add DT bindings for CV18xx reset controller. The power/reboot driver is
going to use only 4 bits from two different MMIO regions which can be
potentially used by other subsystems/drivers, therefore the resources
are not being claimed directly by the device/driver, but via syscons
instead.

Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/reset/sophgo,cv1800-reset.yaml   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
new file mode 100644
index 000000000000..4f058f99df5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/sophgo,cv1800-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cvitek CV18xx/Sophgo SG2000 Reset Controller
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+properties:
+  compatible:
+    const: sophgo,cv1800-reset
+
+  sophgo,rtcsys-ctrl:
+    description: phandle of the "RTCSYS_CTRL" syscon block
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  sophgo,rtcsys-core:
+    description: phandle of the "RTCSYS_CORE" syscon block
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - sophgo,rtcsys-ctrl
+  - sophgo,rtcsys-core
+
+additionalProperties: false
+
+examples:
+  - |
+    soc-reset {
+        compatible = "sophgo,cv1800-reset";
+        sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
+        sophgo,rtcsys-core = <&rtcsys_core>;
+    };
+...
-- 
2.48.1


