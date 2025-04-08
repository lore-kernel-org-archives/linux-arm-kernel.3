Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38469C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9WVqBNjVDARAuAcOpCm7nO6NK//qFgMIDPPMTwzB9Y=; b=wWxCvI915uoo8i/CPl0LKMl+nX
	tJOy3YUVS9Hll1creFd3hI/9nLBN4cYPZVsa8wjLmIOsRqk/mKYbvutjE+Ei+tO0tIv6VeTpWqEmw
	R+KAQlUbRyxsdHvoFQb5HINmTAKxP6FNEPGviXj22cl0YIbpo8p+JV1E9+RcADMyLzhRtoVILEIhB
	ZvyvPyBWeUnXkalH54o6I5fb6dVImGOFw+x9N08SvJ/kU+GbwYFIwtsPJ0iKU7gDNE3AAqDIze/PM
	vgbF3Shu/UP5mtiALDUFa9aJkTuKLC96FKG0v8LVJkvSAVS83M2aydH9xfbBw8iAR4N0NR8evesAo
	1XUEcJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25hA-00000003XWj-2bMf;
	Tue, 08 Apr 2025 09:56:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25ct-00000003W3K-2vuf;
	Tue, 08 Apr 2025 09:52:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso3054927f8f.1;
        Tue, 08 Apr 2025 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105934; x=1744710734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9WVqBNjVDARAuAcOpCm7nO6NK//qFgMIDPPMTwzB9Y=;
        b=RTZeQi+7U8gS87UZpzyTOAb2/5dDFSADMWQhuFUySRgWqoBrGoK3PDzshH0yOecDCj
         zC+dnySHuaMlkc4Rz2Jm8TjGZ9vsjXdGGXK5CwZzbN5KLaMfVds+S/SrgsZ+BKpwjNEV
         yjCgkOdw6dRxtXJqsXnJ64DybAzoOoH4Jpimvkr3u9G1BYU0dc5lzvQp8XUIpm597kNv
         wTIrGODRuUzskH33NGhyHx8M2VxvDK1fsjQoTdxp2x4P7I5N0GYAM9E++6icz/XesjeU
         SwNkhTWPpfn4WFieY/B9uJ2kKPjsdfvObhoWX+zzJMI9gdE5wL8qBAjYq1q4onuDfqPE
         LohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105934; x=1744710734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9WVqBNjVDARAuAcOpCm7nO6NK//qFgMIDPPMTwzB9Y=;
        b=fmt2gDRbvU8h2jRb5ps6QNztzdepalUuTrt/cr1qivpGITTq9O3EpptTmdbMrWoaeH
         iYNsv5bBjtJW0Nc1y2aI/EiAqTJfc56+m6+fWuVUa9hCIkA1+Fn71xIUMArChE0mfcel
         tORJvDWcIq1ufq6wViWq3rn5zHdFnI/kpDRroFDM80HnZygJmiUUFrsiWB1vMvkxiOfb
         oKxXBYEJvkHd40Tpx0kl4rkp7BKB07NiymWlwwr5BxLPQJOTwERxOKBtvXf4N5842e6R
         CzbYdu+cQWn8sGX+se+80djDNdDSIRVeJiwuRZgYfDuWchTcndOdpclgsUSQTtmWIRuR
         Qv/A==
X-Forwarded-Encrypted: i=1; AJvYcCW47K+2oZizmPLZLZuEFYPMm7n5VtmeTTB15RqpUUX+hqvea3lMnp8/FzeakPW1J7Wz3h+M8SPCGhEEN0HatdNh@lists.infradead.org, AJvYcCXa75NRbuDQEXy6dpVYKgFWwQwcnE9N4vLLIZT2FIzxhr5UT4kI8Xz9VyfDYYhYg0DC0xdCFldToo6KQGSzDXM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi+5+I9CdCLj4hePHCuHUzhCB0292RY4wok2FKbVJBoxyI1yvJ
	kjkExjUPSR5iROH7zMgrK9HybRuY/bNs8CrCO/5oyZ9Dim4SOD5E
X-Gm-Gg: ASbGncvinmPkRMKw2M0h9vRijJADycm0TyJncXXN5T6Gl7s05OP8G9ZHBBCtkHWa0fR
	TAZdjwdvFa+TEiVsaPba6vn9c6bUP7XX6OO7uNzjkPpY69LeDODxttbtEyaKewRujx04JNblKUO
	mCB8DAJPWQJ3oRaRt3t94Qbpt/t9VAd+TVGYdvMW+XUpp0jT2g/cNub3jHzU0wItONDxT8Nycet
	1vYPLhCTAxLDaJPfKq5hdm1AARXAUC5ykgiiN7t31MqHaHj8Qw+ZVgQ1dpodiL17Dw5Xw2FnzP9
	4hSxdscbqMG0U/bHHLAcXpMfkUYN9uEG1sUQvBjbWK6iFZu76u3ZYPmmXG23hzP6fx8BT5mQhoD
	HTB2NXZxK/i2GOQ==
X-Google-Smtp-Source: AGHT+IEVrAoJHAtIp9Eap+mm2qROvOpwdlWe6t15SZ+SKIAaChNthcm1sv/OWGyYjhXa68oUZgPklQ==
X-Received: by 2002:a05:6000:290c:b0:39c:1f02:44d8 with SMTP id ffacd0b85a97d-39d820ab532mr2192973f8f.4.1744105934317;
        Tue, 08 Apr 2025 02:52:14 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:14 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 02/16] dt-bindings: net: Document support for Airoha AN8855 Switch Virtual MDIO
Date: Tue,  8 Apr 2025 11:51:09 +0200
Message-ID: <20250408095139.51659-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025215_741994_EAF1BB0A 
X-CRM114-Status: GOOD (  15.93  )
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

Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed
as AN8855 require special handling as the same address on the MDIO bus is
shared for both Switch and PHY and special handling for the page
configuration is needed to switch accessing to Switch address space
or PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-mdio.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
new file mode 100644
index 000000000000..3078277bf478
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 MDIO Passtrough
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 Virtual MDIO Passtrough. This is needed as AN8855
+  require special handling as the same address on the MDIO bus is
+  shared for both Switch and PHY and special handling for the page
+  configuration is needed to switch accessing to Switch address space
+  or PHY.
+
+$ref: /schemas/net/mdio.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-mdio
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        compatible = "airoha,an8855-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        internal_phy1: phy@1 {
+            reg = <1>;
+        };
+
+        internal_phy2: phy@2 {
+            reg = <2>;
+        };
+
+        internal_phy3: phy@3 {
+            reg = <3>;
+        };
+
+        internal_phy4: phy@4 {
+            reg = <4>;
+        };
+
+        internal_phy5: phy@5 {
+            reg = <5>;
+        };
+    };
-- 
2.48.1


