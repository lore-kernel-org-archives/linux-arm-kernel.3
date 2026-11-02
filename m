Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C06082BDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YmERXVUq;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E8QOmXc4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=; b=YmERXVUq2BRI/X
	8smJWnQ1jo7dRGmT4u7lMZEV/uLWu/SIcV4JqAjfUQN7O45W70P7FUZ6kuTLQQ8HoiuErNBiz0Jz1
	jpdTmW29Kehn9rl9b8orHsVK0yM8SXpZ/ibyCLIrJa4Jay6OQ6m9ZS8zRBtXk20DY+idQskJrFqWa
	CxFoRj8HxSAIWU1YzL2XdIOsMp9ycS4MTLA38a2wJAkZ9UGzNAc1ltJhL5zQ9RwTJyy1ia9fjFs+4
	UgmKmPDoim8Z9JozVgBDGoKOpU2Nid8SKVXC/oy+ZuwGsdbq/dPsacquvk9TWMWkIJADxkcxVmfF3
	kFR6wDYlir+N+D95rlgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy62-00000000DFJ-2p2D;
	Mon, 02 Nov 2026 19:53:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy60-00000000DE9-0tFw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so26352445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649210; x=1794254010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
        b=E8QOmXc4VPEUdwdB29ggVc1lTCUAikFvJpkhWeWsLN8Bu7AVXB1/x/asg2PVwBiKvo
         gmZWNgu6HnaenfLgao8xV9XQwkNPSdkpwrQC+nVURrFW9+VfsYf7/jLTKNinz5sqK5yB
         WqXUQoohTpMQTmNsOpzIhd9x8FganDWH4eIIhWitzODb7qjiI8R4xE/NPzt7+ggNh8Na
         vF8E1reNd61QDh9Vxe7slkJDEOwgKOqt6yAkeLgBc6QnqP4i3b90xXg8MDPfo1zU1aN/
         DqfymP0+z0/oOXo5B1hzvyW6/xGtRzLY5KM3Y091vMCtnqxXzXRMXUJQo8aQL2laOAtT
         b9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649210; x=1794254010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
        b=ZzJj2YFmx6tx0gKrSdgA0XGRKAX5TQV8+R92L8njs1nbSeJ257+j7K93mp+ikNNFZH
         Z/F8LtLbATIyr8GQgxpFsSRIqHLqoA2cE0vyT3sPcWELgweDSdPSiEm1OmjJds45G6Cx
         w2x9QRf0woTjmmS0vVxCKBEeWdJhUTLFyBwtzksV+6M1/I3MSMSdXiZJDIG9pwTg1IEB
         OrAEivvKavjLuUe3svdyxbPubif+Vx1fO+fa97lyRRNkzohziug0GJVAMx5DX/7Ogn/O
         v5u4Utrr9KsHeQ5ncRQXhthMILrQzLv2PzSKOaznRBdIcSPZxCHkWvmiJ5hQvo5Iwbfe
         7u7g==
X-Forwarded-Encrypted: i=1; AKwUvBwt8Ds4ClJSbQoKd+U0YDPuQeDZMeyIdd4x07/H+ekVYEEMpUBcRgQ0TotoQYxaevvBXNjFtHpl0SWeSkVdSst1@lists.infradead.org
X-Gm-Message-State: AFq9FYISwrNePJxJORBHnFgZUtUxiqBSdK9WIHsY4/vi9rlXKYQAur4Z
	Z6qj8zqBygIGHH7n8zAIAYr5acwSZi+D4ZDVE2uYwClCiGoATm8vgHDBuz1JQFuzr5w=
X-Gm-Gg: AYBFou0EPKfQtVoiEu4KoWyIxa6wFQS8LzHLuSDPKHKtuPfxKfbS6z0Y70TwhStsQSL
	LR9QDu5oEZ9YaY1yg+5WWqGjW4N7tdTXDBpHQKmJsBC+a24E7V9czc0ZbDZK7LLujuEJhKLeO6y
	5r3iiRSKYOXN+wubq7FrwFie3N2cFaXrT4q78+sr8E1gpZX49/nVWpI7Cq3fwJ1iqYgey7s0sUS
	KMPTdj2PfFjlxsfAxu+uDapy3i0NceKvtH9cgqhxVR5hHoS+its6beogOZ+JvFEpHQTPHW7KerD
	3eQVeflHR46xfZP3cFrOKjaDyDqJZbuEqC/B3TS+oFoCM25mtm7MIY6/2FDkIgBIrYZaOQBEFwy
	I6Ejgjapii9Nr7eP8llqRxSQzzO4llR3hz4gQBP8k7LQ4HybVs/FklFwq2LZjGblovv8/NIWoD5
	P+BWMoLjPy1gWSy5bUTETCo/wqqhY04rhG8u9do7/D6XjD9V9NRksxiD4NCguPk+MkPoSzu5fcK
	qcVUJNcGZWs99BYvfnZbCNiCtg7WpSKkvB+Y0GllZvPjHNoww5+zw++fBNbJ+8TBCzrmupdHmw+
	C9AQcFZLrOLrAKSFa2xC1Tw5qJ9n5/rU2pGvINIJoc7hFR2rnJsEe4dCFut8ERLFBmWaIDnbZYB
	vcdi9rIwRAT+ACIZe+bBZjCvSbw==
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr254361025e9.3.1793649210359;
        Mon, 02 Nov 2026 11:53:30 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:30 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:47 +0100
Subject: [PATCH v3 1/9] ARM: dts: omap: dm816x: Add specific pinctrl config
 defines
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-1-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1087;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=pNEg8PM8cIp8ox2y+p3fYgoghPcp69Vhurs3Xww0fMA=;
 b=7FEE9qKpkZS4TmJ0ng4j0OyfENMQ/VSbQvaLIHzr2DP8dPlCjEE33M8B+fZIJoj3KWBfvUBSq
 4UVr7SVq73QC7TRJsvkn9TnNlTt03EMZoDO3ZrKgov02XeVPMcF8afM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115332_271582_C44CD471 
X-CRM114-Status: GOOD (  12.31  )
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

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
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


