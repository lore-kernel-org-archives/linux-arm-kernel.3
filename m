Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA822606EE8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jJ+KZ6TM;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hsS63ZFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=; b=jJ+KZ6TMiJf7k9
	sfbPIYipEC8bNuFgugfUogMVcixxjSUThrdNV+Ej4QSW+7kBOWZOe8XySG44lEYxawX3QNOZNAQuY
	nLsaaYGIAPuLEZi99AJF44tEp751CcMdO9flZ0muCUPsUOshfEVFlGa2/OHGHifiup2GBnAkepgo1
	+dDX4AxU/1bab7htqreI19+vkLOwRrrkr1/ziKAFmZrUNbxeVPshEHS3vyeDnra2tXuzcGQ6MhyDP
	au99aBgwA5yPS4KMiXpqhWrpyz0cFXWr1KFAs3OOXqQQm7awGQIBHbK/bW9ti+ohjx9sIDImBgruJ
	yQp7kWUu7S7LGfKDRhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLP-0000000BZmL-0MR8;
	Fri, 06 Nov 2026 08:30:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLH-0000000BZd9-36Gw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4919a880834so190877f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953834; x=1794558634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=hsS63ZFMYrCsFiZwU8OshiNaKUSMJ3Uc7sLKuEAnmvUX2CTLEzK+oe0NBIi0MXAgwu
         jazpGUTVCbfIXNKQrwJib5zl7wNSj3FakGec499DkNt5CQV0ddaMm8FA4qtZcEU/QTEP
         6yYlAv6K8xm0aBZC0Ky4eNGTWS4LfxpdBV9q80YLsLK96P4EU9RZpLP6WG00UqOavYgh
         6/0zHnVVctRFvcjsm5m3eYpkmtGW5Hn/Tb2LUkIWf2dlM1bVyR1Ww3Tj1vlQUBhAmyMY
         6YlLphsb+60Gf0WBrHhOsoSkm26Y32ZdN9Yb3TDLnUkbJXJpaq3v516KVULwiPnCtET5
         clQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953834; x=1794558634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=skVP143/Ws1WCDCJzro+uYSAPcIjtrCBNH/R3XhRDqo1SOnwDwnA1P2H6KnL30acMx
         AKPRmiVPF3mwHSE195cp+LeM2PpPI3Lme9C7zX6VB4D4jfyWxhTZSERE+flau6WnqJOr
         j659nyiIzptlVJs9+lqET44sai6yJ0zsCIMpq4fn+QKqgcPbJ+cUMGe3Q5BhYpr0LMJC
         FBqpTlQXbHJ+FJcaCt+ofX4sfhzCVs72Rz7TgNkUuYiJ0ENE4BIA43oa+EDhQnp4tndu
         fdcN5nuW8NJZ/KhQn1iCTVyBQdXlxi3X4DvWi0WkpQy8aj9Oe1GsKHgXsGXSAt26rpVw
         iPqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuF6fjFwfiHOz0q9BNv/OH/EVe/LxribtIjnFInXc6yVtGyc1niE5gec1gb2VwZl0d+ch2aqcTTcSWVGZSxpTx@lists.infradead.org
X-Gm-Message-State: APuU4Z/zCaZnJfP1V8KzC+KtfyvckVWMco+N83Tmj7pHHWmcVsXSlNfc
	tNqBmPPe3QuTZOZzk9g2qJ9aDya2/xdc8ASeJi8wIGw0LRlLE2xoUJr+fbIf8ddVtXE=
X-Gm-Gg: AYBFou1/MfvV/aoc6V1uFpYibOqWh/2639OsfEQP7/aJ/waCFZktrNhQ6q69V23H3Y6
	+3cUXzmpaJ1mjU0kR/ZgAJ6ZJALCYmVigIaDD17td6am69tzJjq3tbzFVbb7L8V71UyX4PPIdvA
	i+XMbFVmSuhkjsfZOV8u7TSEq6dA2/DqPhalRoX7Jb/EJSHZkl3TGx67Snb9FBEsShZObS8Z8zd
	gQ6MDFYJI8VgwXX4kNTjJQ5TsBi/qAw9Nyo8laCwnmXJVl3HhUU7GL7L2d/TjDbDLtmKviOkoE8
	/CGBkceXIBmWMl1l9k2yLBTvKOCcBL5Msqd3rRe3bzJS+oeAGBUC+wdfPDRUgsUmtsRu35uJfBC
	MCk0Gf5BNxfMnqDP9iP3GCyP50tHBDKpd0RWpuQAudFy3MrCNvlISQeEa8xNj5D87dlGv0T/prZ
	sv8dNUkW+URiQKwn1CKtoGDdijLneMvPtdV2P9ajtoeNAYqwbBRbtmtYFVUjXvO/7Hgo0zjmNtJ
	wMdLor+eIm40Jo+AG7v8LEEHx7O/PSmmiKVtUKivriEWYER9+Srcdqn/iozVryvZIprq6y/Exns
	0+s9febzt96oCU6di38PNJ7kFED/3LDvgudbSjr1f429+b9t8J5sG1zMV9mk1YisC4SPxc5aTDk
	ayBBJ4qP+JPjekJGzScIm9GPULxOvLE/SmtFuwKUhASQONg==
X-Received: by 2002:a05:600c:34ca:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4b6deb5ff00mr24355375e9.22.1793953833711;
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:24 +0100
Subject: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003035_831824_FE1A45D3 
X-CRM114-Status: GOOD (  11.06  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 firmware exposes clocks through SCMI, including sources needed
by the other clock controllers.

Define their identifiers so devicetree can reference these
firmware-provided clocks.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
new file mode 100644
index 000000000000..10d7caa5d1e2
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __AMLOGIC_S7_SCMI_CLKC_H
+#define __AMLOGIC_S7_SCMI_CLKC_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __AMLOGIC_S7_SCMI_CLKC_H */

-- 
2.56.0


