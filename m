Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A411F60A3836
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CDI+9Eko;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PRBVP6qO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=; b=CDI+9EkoRJpnS6
	yaUHaG+TmZLlN6qoHEDujfn9dUfMGQXepaN2uu+vHl+1rWUzJtmfKWpZfnA3Dg6a78FcL9V8PrtZs
	KnIxN6luPXr9h9/2ijMxOWSA2MimG/xsN48YevRV3N2Cyxxx9MJRvPgfgEvyzwxnHLQKETRhd+6fj
	EooaHY+cfmf++M1oipnc1jdr9XKDGi9Ov0CbqiVNDnvMxpeWF/MheXSGDcanuUdviOc4ZHxQRIKUP
	BJQo0Epfp81w6gFBveJ9LIZBbmV+f0WvrJV4Z9ZRmtiHUM4eCL9Hh+fL13ZjqgRQcRFZrIZyx/iyy
	aVd59oBmSyJ7zqsyRV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6AX-00000007UNG-2OFd;
	Wed, 28 Oct 2026 16:06:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6AV-00000007UM7-2UlV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so11187275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203585; x=1793808385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
        b=PRBVP6qOUiWKyQyvs1yvWhB9ZAzJRy/kgwpaBEYGzebhvquEP8nXjhOb0KZ0x2NTy3
         qTKzb+JIa18IWELrMdJgBKZsttv6YLZpcmv+PFPEbPYVtUqj6M4X6J0HXv37uaMctSN7
         mtwbfuKVuJui+wvNMo5Ym3Kn1pIJjrhMQtKZw/873FavpU/FadoNSJ06ns26uMx2R3/J
         tjfx+i80Gai2pPUIpmaC5fSeZqmQFD1CV0oBXqNZw2xlhdfjGUNczizRY1TzWPwAwDzE
         b7BIAmFw9X1kVdGYH/CjXEcgcJM8s66EnMYVlzaIGh2RRkyoFPtYoR2tWwi9aIeZTA+X
         GSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203585; x=1793808385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
        b=BnwvRP/TuPx+nahGJxN8w7TyWVDG2aROm/qed6NubbWs0XdHGsQ9klW2cTjyijbUeV
         cjIvcV1aBXd+DPCCN/hMuXJ4f6C8wglO5KntLlWi3kNLPJ27sLKhF1P/vJ/U8tZyprUt
         hZ3JOoqhp6gLQM5l38Zu+8N5WsRZd4Tr0y2+kt8KMb0XFOo1lAYn5wGW92XNj6g3Yubm
         T1Q2qUkoBmBraJKatWA3j8be1Mpol5iJNSEPIWrr4DQVFLV98jZb4v0DVd+fw3oSFdXN
         lOOPyyKj0zEhj+dDGeJuojHtRGfkAC7ryc7jTKqaYI1LlNmfu3gC2/B+cRi8OQQ/yBo0
         YCPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZv3B58ef3CMlaAfTqicMSTBshcjwOO0uwvjSoqfD43pdJVO/k9fq/cWeHaKmfHys5puhqqvdf0zx6MntdEwnR@lists.infradead.org
X-Gm-Message-State: AFq9FYKjHpNB7tZtmalbse6u+dr0Qj4Wl2PMtlH2TLxXeD8TBEPjs5zU
	/+CSFIWPr/HM0YSSpcfkOu86UsspVo6dNB8ZMY5WFHyiJ3yJZ1GTPfn+2NEtmQjZe2k=
X-Gm-Gg: AYBFou3ZGkC2pLK4nvE6SrAIMTiLIwdXzz90g9Rhfr55vf7FC88qv7hqArK+VsA+VZi
	7J1Ex8u5/Y2iuhM10ExxGmSL6PgPhEjqOe2kJgtXWg4+3hTPAbBLCfTnmczKJ8fDtOAqhOL2PeV
	ggKi4sASaWVH7NqWYmp+CzINmtHmHfDn/h6kSpRTIALqeWBIbajwVhLdw4agzBU839SCN76emCF
	9HZ+3J874lya+RVQ0APlBUFVenILjp/aTB8ZOpohf52a9j9JImlrSKl+pGEMtrWxhcmzbn+DgbB
	mMSvDq9jpjP5v0tEVkj6DAU8xnFRZPwovGxhX7s+FxU4j+xCBiWoP6aMTXqd1OqcIWh+e1KkWQp
	nKw1v4/fhAD7jgFxOsaIDKLFHAq/Rf1bPRY3z4MwiFlKRggAhRTqZnYCmE5ZaJTXfak6OWfgnQS
	OA7UIq63OqbrCtmKNhQ27ANBgPje6ZcD/PuIQPVO31Gj0wOFOK4tfS32B7TuskW26DWiWOlZvh0
	dqibwjw/4Ey+L4EuxULW2Px3209iJxv3u3j0yDO5CyzqUwnvxoMILYR6O4IPqFgTBcITxbE1VS4
	QNMekDmRsqtBDuQI4KlKJ2aUdhmDwHCYC22FfQDytaiLhS+X6ogajGzjQ9fpJQ545dxrROg1jPZ
	JyJA20e80e8Jpf8YRnS+FsoHaQ8x7WogNEsO7nqV031SLvE7Z
X-Received: by 2002:a05:600c:4e42:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a9678c276dmr60643465e9.30.1793203585194;
        Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:24 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:02 +0100
Subject: [PATCH v2 1/9] ARM: dts: omap: dm816x: Add specific pinctrl config
 defines
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-1-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1034;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=hmVSe81lrJ4EvLkYlczyhL6zv7IwzxLZV9wv/8nR9Ag=;
 b=LTKHuS4ke5N8E/7u8UBcMaws7grXO2Ccr8ynEVKSNxQOMV5oIM2lSk9PHFNQu6TahHNKaLFkw
 0Gq9UnU3vJnA2IHmEV5Itg5FF1w42ztMv/0Oa5jHnoCCzbkIUYNsqWA
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090627_654622_EA5FE2B7 
X-CRM114-Status: GOOD (  12.30  )
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

Add pinctrl config defines for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted for this SoC.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
new file mode 100644
index 000000000000..b93f971cbe95
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants specific to DM816X pinctrl defines.
+ */
+
+#ifndef _PINCTRL_DM816X_H
+#define _PINCTRL_DM816X_H
+
+#include <dt-bindings/pinctrl/omap.h>
+
+#undef PULL_UP
+#undef PULL_ENA
+
+/* DM816x mux bit defines */
+#define PULL_ENA		(0 << 3)
+#define PULL_DIS		(1 << 3)
+#define PULL_DN			(0 << 4)
+#define PULL_UP			(1 << 4)
+
+#endif

-- 
2.56.0


