Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4CDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9jOtwj6zr/UlgyzehUvwRXcqVoFIXeaFAL8YGh83i0=; b=ml81gt4vkBTDUOtPX/a/Sf1FFa
	N75voAemWrXUEQWWblw/BAMsiVd2XDj29xy+WTpdynb4hpxZC7cgO52EdjfaHJ+M9sqnR6TZ67w5u
	HAisibENTCqnbHw9bRoyBFuQUMKV37NVwVduRqz5Kn2H471lWODrNS5SNQIS/c/HA/nYEa6ury3eP
	4emjPmkpVDJG9hKBNphdT3uhbyyBiPWD1cbv6WRQZPXIRFN7wxA18yETS3nTJ+Q5Q6F9HC+pa3OY8
	F2qk5j9dmSAadv86A1y3cW78WBkJVRkFdSsOWd0+TG3FENytnLzoRFhIbYCHKVb2AAbusKcWS7etJ
	Flld2/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvqP-0000000D2KF-2phU;
	Thu, 26 Jun 2025 23:17:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4Y-0000000Cp5L-29Ns;
	Thu, 26 Jun 2025 21:23:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so8414015e9.2;
        Thu, 26 Jun 2025 14:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973033; x=1751577833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9jOtwj6zr/UlgyzehUvwRXcqVoFIXeaFAL8YGh83i0=;
        b=ZJqJLrF/Mx98RTI2+b+uMvukSDHja7WqHYpG8CZ8KCXNlUFszTyLOQ9awbtOQTe4mI
         NbtNCcruCU/SyA1gMSCYJD8CEtjgVJ1Xp5tJ4K+4/xMRC11HC9md3sn1YnwaFZmW1G+D
         LWP6MYK16r4ULiAGtU6/+25FYi8JUZq150jxE09zpNy8pGuHLAr37gBQvyIVnvRJ8FxZ
         8kyapo3zYEauxsXlEjXUhkmNWUcK/o82sOY+Qcc3un/dxCv2mLSmShOP/HwYWcNoXRnr
         vgEMI9B4rrsy0FaAxoUJLJ5myJm9OSWktoOGjvL0JWLPqYeYDMiaZQ4uvJBxf4oRNzS2
         9UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973033; x=1751577833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9jOtwj6zr/UlgyzehUvwRXcqVoFIXeaFAL8YGh83i0=;
        b=Kfze3wmu03WBOmQYfkXPqFNpegJG43xNry3/a2w1mfjJk76tKQdyfQ9QiCCVRwFbaG
         xkC9nquHXv1OUBSz7FCftJDYqdUai2sJnAcxaF8xJlzm4cPFHYsos5cNf11Es78MyDoB
         OrB6gWRpg5daDklGu5q4LIHiu6nu0YDvw7bZDw9+Y14McZtA24lyZy8KcFBkR8/kttWP
         CKliYN+xTpisXft1E26MNIv3DfUQyCOk8kxP/ctGx613C51tGTmpMULRMnHiaH+d3Xqf
         34tvA/6h7XIfgN3wJ3zLRMAyipcgCLFhec1RR8Dg0YF2oycRpMpXnipOaVQzxAQXzUdP
         c5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWg2xh5/N3GfRg/yxmBmveGFdAnH4PJoJ66OW3yzGg3Hhx/KWYyY0R503yCoPeKf6uuN6YS3COyMXjTkgmnvqw=@lists.infradead.org, AJvYcCX96sYHTdM4vVlV3IdDx03tIJB4wSoZMReV8zKD31zNgr++RPwXA6NmMqyKkDVJnVvBjwEHvzJ1qREE76C6z69g@lists.infradead.org
X-Gm-Message-State: AOJu0YwZld2WiWDh2SYg83tSvs/s2RgpKv4yCTsSwcbKze4Hmjn/j3re
	GQJoFDlmav18XNa6paaDs2udptUrNhk1Bh4L99TC6y/jR8tT6sDl1boV
X-Gm-Gg: ASbGncsK61XuCpALZ/jnSSp6m5tBQftBKUcjoV0G1ELhCUpNCeO8CylmFpqV9vmmxHy
	UPuyJHc85ZldzLeLjvnP95mGazhRzpo1I7x0GWgH4vvgySc8npwckTcsbkvrwC4Ngm13UJIgdU/
	r/SYcvN5WnBb1qIrjx12KWSSWAzUp+C3maI5ZhLdPNRBTicyj61BlzI0Bs6A5/miBK424CFGJX/
	zH71VBNOUdqcIWEaiLMyL+qA4b1YM1o3SvyNA/fPhLEOcguiI1vFIYrMWzXbSOY/kC1j2oNI7EE
	HMxhEyVVED5MiI8R/OZ0ReHAYqjaC2iCu5GSO1b38wfwgdVeJOV74ghLR9PkRf35gW8QUQ5jbW7
	35uOJd4qdqsbjnjt186udDjCRi1bSM88=
X-Google-Smtp-Source: AGHT+IGDm5p4AvWVcr/tRWVfaBImDogqux+W5zqeZhlGIcThn/cb4rbmaTZF7QOp026vECvdHQ1fMw==
X-Received: by 2002:a05:600c:502c:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-4538ee709e9mr6059055e9.25.1750973032660;
        Thu, 26 Jun 2025 14:23:52 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:23:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v15 01/12] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
Date: Thu, 26 Jun 2025 23:23:00 +0200
Message-ID: <20250626212321.28114-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142354_929904_32971CBC 
X-CRM114-Status: GOOD (  13.35  )
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

Document support for Airoha AN8855 Switch EFUSE used to calibrate
internal PHYs and store additional configuration info.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/nvmem/airoha,an8855-efuse.yaml   | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
new file mode 100644
index 000000000000..9802d9ea2176
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch EFUSE
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 EFUSE used to calibrate internal PHYs and store additional
+  configuration info.
+
+$ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-efuse
+
+  '#nvmem-cell-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#nvmem-cell-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse {
+        compatible = "airoha,an8855-efuse";
+
+        #nvmem-cell-cells = <0>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+               reg = <0xc 0x4>;
+            };
+
+            shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                reg = <0x10 0x4>;
+            };
+
+            shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                reg = <0x14 0x4>;
+            };
+
+            shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+               reg = <0x18 0x4>;
+            };
+
+            shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+               reg = <0x1c 0x4>;
+            };
+
+            shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+               reg = <0x20 0x4>;
+            };
+
+            shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+               reg = <0x24 0x4>;
+            };
+
+            shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+               reg = <0x28 0x4>;
+            };
+
+            shift_sel_port2_tx_a: shift-sel-port2-tx-a@2c {
+                reg = <0x2c 0x4>;
+            };
+
+            shift_sel_port2_tx_b: shift-sel-port2-tx-b@30 {
+                reg = <0x30 0x4>;
+            };
+
+            shift_sel_port2_tx_c: shift-sel-port2-tx-c@34 {
+                reg = <0x34 0x4>;
+            };
+
+            shift_sel_port2_tx_d: shift-sel-port2-tx-d@38 {
+                reg = <0x38 0x4>;
+            };
+
+            shift_sel_port3_tx_a: shift-sel-port3-tx-a@4c {
+                reg = <0x4c 0x4>;
+            };
+
+            shift_sel_port3_tx_b: shift-sel-port3-tx-b@50 {
+                reg = <0x50 0x4>;
+            };
+
+            shift_sel_port3_tx_c: shift-sel-port3-tx-c@54 {
+               reg = <0x54 0x4>;
+            };
+
+            shift_sel_port3_tx_d: shift-sel-port3-tx-d@58 {
+               reg = <0x58 0x4>;
+            };
+
+            shift_sel_port4_tx_a: shift-sel-port4-tx-a@5c {
+                reg = <0x5c 0x4>;
+            };
+
+            shift_sel_port4_tx_b: shift-sel-port4-tx-b@60 {
+                reg = <0x60 0x4>;
+            };
+
+            shift_sel_port4_tx_c: shift-sel-port4-tx-c@64 {
+                reg = <0x64 0x4>;
+            };
+
+            shift_sel_port4_tx_d: shift-sel-port4-tx-d@68 {
+                reg = <0x68 0x4>;
+            };
+        };
+    };
-- 
2.48.1


